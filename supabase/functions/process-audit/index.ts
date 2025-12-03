import { createClient } from 'npm:@supabase/supabase-js@2'
import { GoogleGenerativeAI } from "npm:@google/generative-ai";

const corsHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

// Credentials retrieved from Supabase Secrets
const SERVICE_EMAIL = Deno.env.get('SERVICE_EMAIL');
const SERVICE_PASSWORD = Deno.env.get('SERVICE_PASSWORD');

Deno.serve(async (req) => {
    if (req.method === 'OPTIONS') {
        return new Response('ok', { headers: corsHeaders })
    }

    try {
        let { audit_id, file_path } = await req.json()

        // 1. Init Supabase Admin Client (Service Role)
        const supabaseAdmin = createClient(
            Deno.env.get('SUPABASE_URL') ?? '',
            Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? '',
            { auth: { autoRefreshToken: false, persistSession: false } }
        )

        let userId = null;
        let session = null;

        // 2. Authenticate as Service User (Self-Healing)
        if (!SERVICE_EMAIL || !SERVICE_PASSWORD) {
            throw new Error('Service credentials not configured in secrets');
        }

        // Attempt 1: Sign In
        const { data: authData, error: authError } = await supabaseAdmin.auth.signInWithPassword({
            email: SERVICE_EMAIL,
            password: SERVICE_PASSWORD,
        });

        if (!authError && authData.session) {
            userId = authData.user.id;
            session = authData.session;
            console.log("Service User authenticated successfully.");
        } else {
            console.log("Auth failed, attempting to heal Service User...");

            // Attempt 2: Create User
            const { data: newUser, error: createError } = await supabaseAdmin.auth.admin.createUser({
                email: SERVICE_EMAIL,
                password: SERVICE_PASSWORD,
                email_confirm: true
            });

            if (createError) {
                // If user exists, update password
                console.log("Create failed (likely exists), updating password...");
                const { data: usersData, error: listError } = await supabaseAdmin.auth.admin.listUsers();
                if (listError) throw listError;

                const existingUser = usersData.users.find(u => u.email === SERVICE_EMAIL);
                if (!existingUser) throw new Error("Could not find user to update");

                const { error: updateError } = await supabaseAdmin.auth.admin.updateUserById(
                    existingUser.id,
                    { password: SERVICE_PASSWORD }
                );
                if (updateError) throw updateError;
                console.log("Service User password updated.");
            } else {
                console.log("Service User created.");
            }

            // Attempt 3: Retry Sign In
            const { data: retryAuth, error: retryError } = await supabaseAdmin.auth.signInWithPassword({
                email: SERVICE_EMAIL,
                password: SERVICE_PASSWORD,
            });

            if (retryError || !retryAuth.session) {
                throw new Error("Final auth attempt failed: " + (retryError?.message || "No session"));
            }
            userId = retryAuth.user.id;
            session = retryAuth.session;
        }

        // 3. Create Audit Record if not provided
        if (!audit_id) {
            if (!file_path) throw new Error('file_path is required when creating a new audit');

            const { data: newAudit, error: createError } = await supabaseAdmin
                .from('auditorias_contratos')
                .insert({
                    user_id: userId,
                    file_path: file_path,
                    status: 'PROCESSING',
                    contract_type: 'Analisando...'
                })
                .select()
                .single();

            if (createError) {
                console.error('Create audit error:', createError);
                throw new Error('Failed to create audit record');
            }
            audit_id = newAudit.id;
            console.log(`Created new audit record: ${audit_id}`);
        }

        // 4. Fetch Audit Details (including type for model selection)
        let targetPath = file_path;
        let isPremium = false; // Default to free

        const { data: audit, error: fetchError } = await supabaseAdmin
            .from('auditorias_contratos')
            .select('file_path, is_premium')
            .eq('id', audit_id)
            .single();

        if (fetchError) throw new Error('Audit not found');

        if (!targetPath) {
            targetPath = audit.file_path;
        }
        isPremium = audit.is_premium || false;


        console.log(`Audit type: ${isPremium ? 'PREMIUM' : 'FREE'}`);
        const modelName = isPremium ? 'gemini-2.5-pro' : 'gemini-2.5-flash';

        // 5. Download File
        const { data: fileData, error: fileError } = await supabaseAdmin
            .storage
            .from('contracts')
            .download(targetPath)

        if (fileError || !fileData) {
            console.error('File download error:', fileError)
            throw new Error('Failed to download file')
        }

        // 6. Prepare Gemini
        const apiKey = Deno.env.get('GEMINI_API_KEY');
        if (!apiKey) {
            throw new Error('GEMINI_API_KEY not configured');
        }
        console.log(`Using API Key starting with: ${apiKey.substring(0, 5)}...`);

        const arrayBuffer = await fileData.arrayBuffer()
        const base64 = btoa(
            new Uint8Array(arrayBuffer)
                .reduce((data, byte) => data + String.fromCharCode(byte), '')
        )

        // 6. Construct PROMPT OTIMIZADO (Auditor Jurídico Sênior)
        const prompt = `
      🎯 Instrução de Função e Persona: Auditoria Jurídica de Alta Precisão (B2B/Enterprise)
      
      "Atue como um Auditor Jurídico Sênior e Especialista em Análise Forense de Contratos. Sua missão é realizar uma auditoria técnica, imparcial e rigorosa.

      O tom de voz deve ser: PROFISSIONAL, SÓBRIO, ANALÍTICO e DIRETO.
      O objetivo é transmitir segurança jurídica absoluta. Evite gírias, metáforas de guerra ('batalha', 'comandante') ou linguagem motivacional."

      ⚖️ Diretrizes de Análise (Compliance & Legal)
      "Analise o documento anexo confrontando-o com a legislação brasileira vigente. A análise deve cobrir:
      1. Código de Defesa do Consumidor (CDC): Identificação de abusividade, venda casada e falta de transparência.
      2. Normativas Financeiras: Verificação de indícios de juros acima da média de mercado (faça uma estimativa conservadora se não houver taxa explícita) e anatocismo não pactuado.
      3. Jurisprudência (STJ/STF): Aplicação de Súmulas e Teses firmadas.
      4. Legalidade Geral: Código Civil, CLT e Leis Específicas.

      CRITÉRIO DE RIGOR: Apenas classifique como ABUSIVA ou IRREGULAR se houver base legal sólida. Cite o Artigo ou Súmula na justificativa."

      💰 Instrução de Quantificação (Estimativa Técnica)
      "Para a quantificação financeira:
      1. Realize uma estimativa lógica baseada nas cláusulas anuláveis.
      2. Se não houver dados exatos para cálculo, use uma estimativa conservadora de mercado e baseie-se na diferença entre o cobrado e o legalmente aceitável.
      3. Score de Risco (0 a 100): Avalie a probabilidade técnica de êxito em uma revisão judicial. (100 = Altíssima probabilidade de êxito/Causa ganha)."

      🛡️ Instrução de Correção (Blindagem)
      "No campo 'texto_corrigido_sugerido', forneça a redação da cláusula reescrita de forma a torná-la 100% legal e segura, mantendo o equilíbrio contratual."

      📝 Formato de Saída Obrigatório (JSON Estruturado)
      
      IMPORTANTE: Mantenha as chaves do JSON exatamente como solicitado abaixo.

      {
        "status_analise": "COMPLETED",
        "tipo_contrato_identificado": "String (Ex: Contrato de Mútuo Feneratício / Prestação de Serviços PJ)",
        "score_risco_contrato": Number (0-100), // Score de Viabilidade Jurídica
        "diagnostico_caixa_e_risco": {
          "valor_total_original_R$": Number, // Extrair do contrato
          "valor_legal_reestimado_R$": Number, // Valor após remover ilegalidades
          "economia_potencial_R$": Number, // Diferença (Economia gerada)
          "risco_percentual": Number (0-100)
        },
        "clausulas_analisadas": [
          {
            "nome_clausula": "String (Ex: Cláusula 5ª - Da Venda Casada)",
            "status": "ABUSIVA" | "IRREGULAR" | "VÁLIDA",
            "dominio": "FINANCEIRO" | "CONSUMIDOR" | "TRABALHISTA" | "CONTRATUAL" | "LGPD",
            "categoria_multa_risco_original": "String (Resumo técnico do vício legal)",
            "justificativa_legal": "String (Citar Artigo de Lei, Súmula ou Jurisprudência específica. Ex: 'Viola o Art. 39, I do CDC e Súmula 473 do STJ')",
            "texto_original_vulneravel": "String (Cópia fiel do trecho do contrato)",
            "texto_corrigido_sugerido": "String (Redação da cláusula corrigida e blindada juridicamente)",
            "economia_estimada_R$": Number
          }
        ],
        "sumario_conversao_g4": "String" // Resumo Executivo da auditoria. Destaque os principais riscos e o valor total recuperável de forma sóbria e conclusiva.
      }
    `

        console.log(`Sending to ${modelName} via REST API (v1)...`)

        const response = await fetch(
            `https://generativelanguage.googleapis.com/v1/models/${modelName}:generateContent?key=${apiKey}`,
            {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    contents: [{
                        parts: [
                            { text: prompt },
                            {
                                inline_data: {
                                    mime_type: fileData.type || 'application/pdf',
                                    data: base64
                                }
                            }
                        ]
                    }]
                })
            }
        );

        if (!response.ok) {
            const errorText = await response.text();
            console.error('Gemini API Error Status:', response.status);
            console.error('Gemini API Error Body:', errorText);
            throw new Error(`Gemini API Error: ${response.status} - ${errorText}`);
        }

        const result = await response.json();
        const responseText = result.candidates[0].content.parts[0].text;

        // Com generationConfig JSON, não precisamos de Regex agressivo, mas mantemos por segurança
        let aiResult;
        try {
            aiResult = JSON.parse(responseText);
        } catch (e) {
            const jsonMatch = responseText.match(/\{[\s\S]*\}/)
            if (!jsonMatch) throw new Error('Invalid JSON response from AI')
            aiResult = JSON.parse(jsonMatch[0])
        }

        console.log(`Processing audit_id: ${audit_id}`);

        // 7. Update Database
        const { data: updatedData, error: updateError } = await supabaseAdmin
            .from('auditorias_contratos')
            .update({
                status: 'COMPLETED',
                ai_result_json: aiResult,
                potential_savings: aiResult.diagnostico_caixa_e_risco?.economia_potencial_R$ || 0,
                score_vantagem: aiResult.score_risco_contrato || 0
            })
            .eq('id', audit_id)
            .select();

        if (updateError) {
            console.error('Update error:', updateError)
            throw new Error('Failed to update audit record')
        }

        if (!updatedData || updatedData.length === 0) {
            console.error(`Update failed: No record found for id ${audit_id}`);
            const { data: checkData } = await supabaseAdmin.from('auditorias_contratos').select('id').eq('id', audit_id).single();
            console.log(`Check record existence: ${JSON.stringify(checkData)}`);
        } else {
            console.log(`Successfully updated record ${audit_id}`);
        }

        return new Response(
            JSON.stringify({ success: true, data: aiResult }),
            { headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        )

    } catch (error) {
        console.error('Error processing audit:', error)
        const apiKey = Deno.env.get('GEMINI_API_KEY');
        const keyPrefix = apiKey ? apiKey.substring(0, 5) : 'NONE';

        return new Response(
            JSON.stringify({
                error: error instanceof Error ? error.message : 'Unknown error',
                debug_key_prefix: keyPrefix,
                model_tried: "gemini-2.5-flash (v1 REST - default)"
            }),
            { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        )
    }
})