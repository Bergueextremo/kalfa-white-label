import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

const corsHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

Deno.serve(async (req) => {
    console.log('=== PURCHASE CREDITS CALLED ===');

    if (req.method === 'OPTIONS') {
        console.log('OPTIONS request');
        return new Response('ok', { headers: corsHeaders })
    }

    try {
        console.log('POST request received');

        const body = await req.json();
        console.log('Body:', JSON.stringify(body, null, 2));

        const { payment_method } = body;

        // Return mock response based on payment method
        if (payment_method === 'pix') {
            return new Response(
                JSON.stringify({
                    success: true,
                    order_id: 'test-order-123',
                    qr_code: 'https://api.qrserver.com/v1/create-qr-code/?size=300x300&data=TEST-PIX-CODE',
                    pix_code: 'test-pix-code-123'
                }),
                { headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
            );
        } else {
            return new Response(
                JSON.stringify({
                    success: true,
                    status: 'approved',
                    order_id: 'test-order-456',
                    credits_added: body.credits
                }),
                { headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
            );
        }

    } catch (error) {
        console.error('Error:', error);
        return new Response(
            JSON.stringify({
                success: false,
                error: String(error)
            }),
            {
                headers: { ...corsHeaders, 'Content-Type': 'application/json' },
                status: 400
            }
        );
    }
})
