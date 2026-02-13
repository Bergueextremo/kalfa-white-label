import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

const corsHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
    'Access-Control-Allow-Methods': 'POST, OPTIONS',
}

Deno.serve(async (req) => {
    // Handle CORS preflight
    if (req.method === 'OPTIONS') {
        return new Response('ok', { headers: corsHeaders })
    }

    try {
        const { order_id } = await req.json();

        if (!order_id) {
            throw new Error('Order ID is required');
        }

        const asaasApiKey = Deno.env.get('ASAAS_API_KEY');
        if (!asaasApiKey) throw new Error('Server Misconfiguration: Asaas API Key missing');

        const asaasBaseUrl = 'https://api.asaas.com/v3';

        const res = await fetch(`${asaasBaseUrl}/payments/${order_id}`, {
            headers: { 'access_token': asaasApiKey }
        });

        const data = await res.json();

        if (data.errors) {
            console.error('Asaas Status Error:', data.errors);
            throw new Error('Erro ao consultar status no Asaas');
        }

        let status = 'pending';
        if (data.status === 'RECEIVED' || data.status === 'CONFIRMED' || data.status === 'RECEIVED_IN_CASH') {
            status = 'approved';
        } else if (data.status === 'OVERDUE' || data.status === 'REFUNDED' || data.status === 'CHARGEBACK_REQUESTED') {
            status = 'failed';
        }

        return new Response(JSON.stringify({ status }), {
            headers: { ...corsHeaders, 'Content-Type': 'application/json' },
            status: 200
        });

    } catch (error: any) {
        console.error('Check Status Error:', error.message);
        return new Response(JSON.stringify({ success: false, error: error.message }), {
            status: 400,
            headers: { ...corsHeaders, 'Content-Type': 'application/json' }
        });
    }
})
