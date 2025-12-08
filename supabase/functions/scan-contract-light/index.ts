import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

const corsHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

Deno.serve(async (req) => {
    if (req.method === 'OPTIONS') {
        return new Response('ok', { headers: corsHeaders })
    }

    try {
        const { file_path, contract_type } = await req.json()
        console.log(`Starting scan for: ${file_path}, type: ${contract_type}`);

        if (!file_path) {
            throw new Error('file_path is required')
        }

        // 1. Init Supabase Client
        const supabase = createClient(
            Deno.env.get('SUPABASE_URL') ?? '',
            Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
        )

        // 2. Download File
        console.log('Downloading file...');
        const { data: fileData, error: downloadError } = await supabase.storage
            .from('contracts')
            .download(file_path);

        if (downloadError) {
            console.error('Download error:', downloadError);
            throw new Error(`Failed to download file: ${downloadError.message}`);
        }
        console.log('File downloaded successfully, size:', fileData.size);

        // 3. Prepare Lovable AI Gateway
        const apiKey = Deno.env.get('LOVABLE_API_KEY');
        if (!apiKey) {
            throw new Error('LOVABLE_API_KEY not found in environment variables');
        }
        console.log('Using Lovable AI Gateway for light scan...');

        // 4. Generate Content via Lovable AI Gateway
        console.log('Generating content...');
        const prompt = `
        Analise este contrato de ${contract_type || 'geral'} e identifique APENAS os nomes das cláusulas ou termos que parecem perigosos ou abusivos.
        
        Foque em detectar:
        - IGP-M ou índices de reajuste abusivos
        - Multas acima de 2 salários mínimos ou 10%
        - Taxas de abertura, administração ou seguros obrigatórios
        - Capitalização de juros (anatocismo)
        - Venda casada
        - Cláusulas de rescisão unilateral
        - Foro de eleição abusivo
        
        NÃO explique, NÃO cite leis, NÃO forneça detalhes. Apenas liste os riscos detectados.
        
        Retorne um JSON no seguinte formato:
        {
          "detected_risks": ["Risco 1", "Risco 2", "Risco 3"],
          "risk_count": Number,
          "estimated_savings_hint": Number // Estimativa conservadora em R$ (pode ser 0 se não houver dados)
        }
        `;

        console.log('Sending to Lovable AI Gateway for light scan...')

        // Convert Blob to base64
        const arrayBuffer = await fileData.arrayBuffer();
        const base64 = btoa(
            new Uint8Array(arrayBuffer)
                .reduce((data, byte) => data + String.fromCharCode(byte), '')
        );

        // Determine mime type
        const mimeType = fileData.type || 'application/pdf';
        const base64DataUrl = `data:${mimeType};base64,${base64}`;

        const response = await fetch('https://ai.gateway.lovable.dev/v1/chat/completions', {
            method: 'POST',
            headers: {
                'Authorization': `Bearer ${apiKey}`,
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                model: 'google/gemini-2.5-flash',
                messages: [
                    {
                        role: 'user',
                        content: [
                            { type: 'text', text: prompt },
                            { 
                                type: 'image_url', 
                                image_url: { 
                                    url: base64DataUrl
                                } 
                            }
                        ]
                    }
                ]
            })
        });

        if (!response.ok) {
            const errorText = await response.text();
            console.error('Lovable AI Gateway Error:', errorText);
            
            if (response.status === 429) {
                throw new Error('Rate limit exceeded. Please try again in a few moments.');
            }
            if (response.status === 402) {
                throw new Error('AI credits exhausted. Please add credits to continue.');
            }
            throw new Error(`AI Gateway Error: ${response.status} - ${errorText}`);
        }

        const result = await response.json();
        const responseText = result.choices?.[0]?.message?.content;

        if (!responseText) {
            console.error('No response content from AI:', result);
            throw new Error('No response content from AI');
        }

        let scanResult;
        try {
            scanResult = JSON.parse(responseText);
        } catch (e) {
            const jsonMatch = responseText.match(/\{[\s\S]*\}/)
            if (!jsonMatch) throw new Error('Invalid JSON response from AI')
            scanResult = JSON.parse(jsonMatch[0])
        }

        console.log('Light scan completed:', scanResult)

        return new Response(
            JSON.stringify({ success: true, data: scanResult }),
            { headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        )

    } catch (error) {
        console.error('Error in light scan:', error)
        // Log specific details if available
        if (error instanceof Error) {
            console.error('Stack trace:', error.stack);
        }
        // Return 200 with error details to bypass generic client errors
        return new Response(
            JSON.stringify({ success: false, error: error instanceof Error ? error.message : 'Unknown error' }),
            { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        )
    }
})
