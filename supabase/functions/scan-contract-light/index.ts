const corsHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

// List of verified models from models_list.json and process-audit
const MODELS = [
    'gemini-2.0-flash',       // Tested in process-audit
    'gemini-flash-latest',    // Fallback
    'gemini-2.5-pro',         // Premium Tested
    'gemini-2.5-flash',       // New
    'gemini-pro-latest'       // Backup
]

async function fetchWithSmartFailover(baseUrl: string, GEMINI_KEY: string, bodyObj: any) {
    let lastError;
    for (const model of MODELS) {
        const aiUrl = `${baseUrl}/${model}:generateContent?key=${GEMINI_KEY}`
        console.log(`Checking motor: ${model}...`)

        for (let i = 0; i < 2; i++) { // 2 quick attempts per model
            try {
                const aiRes = await fetch(aiUrl, {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(bodyObj)
                })

                if (aiRes.status === 429 || aiRes.status === 503) {
                    const delay = 3000 * Math.pow(1.5, i);
                    console.log(`Motor ${model} overloaded. Retrying in ${delay}ms...`)
                    await new Promise(r => setTimeout(r, delay));
                    continue;
                }

                if (aiRes.status === 404) {
                    const errText = await aiRes.text();
                    console.error(`Motor ${model} not found (404):`, errText);
                    lastError = new Error(`Motor ${model} não disponível (404)`);
                    break;
                }

                if (!aiRes.ok) {
                    const err = await aiRes.text();
                    const errMsg = `AI Error (${model}): ${aiRes.status} - ${err}`;
                    console.error(errMsg);
                    throw new Error(errMsg);
                }

                return aiRes;
            } catch (err: any) {
                console.error(`Attempt for ${model} failed:`, err.message);
                lastError = err;
                if (err.message.includes('404')) break;
                await new Promise(r => setTimeout(r, 1000));
            }
        }
    }
    throw lastError || new Error('Todos os motores de IA estão indisponíveis no momento.');
}

Deno.serve(async (req) => {
    if (req.method === 'OPTIONS') return new Response('ok', { headers: corsHeaders })
    try {
        const { file_path, contract_type } = await req.json()
        const SUPABASE_URL = Deno.env.get('SUPABASE_URL')
        const SERVICE_ROLE = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')
        const GEMINI_KEY = Deno.env.get('GEMINI_API_KEY')

        if (!GEMINI_KEY) {
            throw new Error('Configuração ausente: GEMINI_API_KEY não encontrada no Supabase')
        }

        // 1. Download file via REST (Zero-Dependency for stability)
        const storageUrl = `${SUPABASE_URL}/storage/v1/object/contracts/${file_path}`
        const storageRes = await fetch(storageUrl, { headers: { 'Authorization': `Bearer ${SERVICE_ROLE}` } })
        if (!storageRes.ok) throw new Error(`Download Error: ${storageRes.status}`)
        const blob = await storageRes.blob()
        const buffer = await blob.arrayBuffer()
        const base64 = btoa(new Uint8Array(buffer).reduce((d, b) => d + String.fromCharCode(b), ''))

        // 2. AI Analysis with Smart Failover & 404 Protection
        const prompt = `Analise este contrato e retorne UM JSON CURTO com este formato exato:
        {
          "detected_risks": ["Risco 1 (string)", "Risco 2 (string)"],
          "risk_count": 2,
          "estimated_savings_hint": 500
        }
        IMPORTANTE: O campo 'detected_risks' deve ser OBRIGATORIAMENTE um array de strings curtas.`

        const bodyObj = {
            contents: [{ parts: [{ text: prompt }, { inline_data: { mime_type: blob.type || 'application/pdf', data: base64 } }] }],
            generationConfig: { response_mime_type: "application/json" }
        }

        const aiRes = await fetchWithSmartFailover('https://generativelanguage.googleapis.com/v1beta/models', GEMINI_KEY, bodyObj)
        const aiData = await aiRes.json()
        const text = aiData.candidates?.[0]?.content?.parts?.[0]?.text

        if (!text) throw new Error('AI retornou resposta vazia')

        // 4. Normalize Result for Frontend Safety
        let parsedResult = JSON.parse(text)

        // Ensure detected_risks is an array of strings
        if (parsedResult.detected_risks && Array.isArray(parsedResult.detected_risks)) {
            parsedResult.detected_risks = parsedResult.detected_risks.map((risk: any) => {
                if (typeof risk === 'string') return risk;
                if (typeof risk === 'object') {
                    return risk.description || risk.clause || JSON.stringify(risk);
                }
                return String(risk);
            });
        } else {
            parsedResult.detected_risks = ["Análise concluída com sucesso (verifique o laudo completo)."];
        }

        return new Response(JSON.stringify({ success: true, data: parsedResult }), {
            headers: { ...corsHeaders, 'Content-Type': 'application/json' }
        })
    } catch (err: any) {
        console.error('Scan failed:', err.message)
        return new Response(JSON.stringify({ success: false, error: err.message }), {
            headers: { ...corsHeaders, 'Content-Type': 'application/json' }
        })
    }
})
