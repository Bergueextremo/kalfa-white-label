import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

const corsHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type, asaas-access-token',
    'Access-Control-Allow-Methods': 'POST, OPTIONS',
}

Deno.serve(async (req) => {
    // Handle CORS preflight
    if (req.method === 'OPTIONS') {
        return new Response('ok', { headers: corsHeaders })
    }

    try {
        const authHeader = req.headers.get('asaas-access-token');
        const webhookToken = Deno.env.get('ASAAS_WEBHOOK_TOKEN');

        if (!authHeader || authHeader !== webhookToken) {
            console.error('Webhook signature verification failed');
            return new Response(JSON.stringify({ success: false, error: 'Unauthorized' }), {
                status: 401,
                headers: { ...corsHeaders, 'Content-Type': 'application/json' }
            });
        }

        const payload = await req.json();
        const { event, payment } = payload;

        if (!payment || !payment.id) {
            return new Response(JSON.stringify({ success: false, error: 'Invalid payload' }), {
                status: 400,
                headers: { ...corsHeaders, 'Content-Type': 'application/json' }
            });
        }

        console.log(`Webhook received: ${event} for payment ${payment.id}`);

        const asaasOrderId = payment.id;
        let internalStatus = 'pending';

        if (event === 'PAYMENT_RECEIVED' || event === 'PAYMENT_CONFIRMED') {
            internalStatus = 'approved';
        } else if (event === 'PAYMENT_DUNNING_RECEIVED' || event === 'PAYMENT_CHARGEBACK_REQUESTED') {
            internalStatus = 'cancelled';
        } else if (event === 'PAYMENT_REFUNDED') {
            internalStatus = 'refunded';
        } else if (event === 'PAYMENT_DELETED') {
            internalStatus = 'cancelled';
        }

        const supabase = createClient(
            Deno.env.get('SUPABASE_URL') ?? '',
            Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
        );

        // Update auditorias_contratos
        const { data: auditData } = await supabase
            .from('auditorias_contratos')
            .update({
                payment_status: internalStatus,
                status: internalStatus === 'approved' ? 'PROCESSING' : 'UPLOADING',
                updated_at: new Date().toISOString()
            })
            .eq('appmax_order_id', asaasOrderId)
            .select();

        // Update credit_purchases
        const { data: creditPurchaseData } = await supabase
            .from('credit_purchases')
            .update({
                payment_status: internalStatus,
                updated_at: new Date().toISOString()
            })
            .eq('appmax_order_id', asaasOrderId)
            .select();

        // Handle credit approval
        if (internalStatus === 'approved') {
            // 1. Credit Purchases flow
            if (creditPurchaseData && creditPurchaseData.length > 0) {
                for (const purchase of creditPurchaseData) {
                    if (purchase.user_id && purchase.credits) {
                        const { data: profile } = await supabase
                            .from('profiles')
                            .select('credits')
                            .eq('id', purchase.user_id)
                            .single();
                        if (profile) {
                            const newCredits = (profile.credits || 0) + purchase.credits;
                            await supabase.from('profiles').update({ credits: newCredits }).eq('id', purchase.user_id);
                            console.log(`Credits updated for user ${purchase.user_id}: ${newCredits}`);
                        }
                    }
                }
            }

            // 2. Audit flow (Single purchase or Plan association)
            if (auditData && auditData.length > 0) {
                for (const audit of auditData) {
                    if (audit.user_id) {
                        const { data: profile } = await supabase
                            .from('profiles')
                            .select('credits')
                            .eq('id', audit.user_id)
                            .single();
                        if (profile) {
                            const newCredits = (profile.credits || 0) + 1;
                            await supabase.from('profiles').update({ credits: newCredits }).eq('id', audit.user_id);
                        }
                    }

                    if (audit.file_path) {
                        supabase.functions.invoke('process-audit', {
                            body: { audit_id: audit.id, file_path: audit.file_path }
                        }).catch(e => console.error('Audit trigger failed', e));
                    }
                }
            }

            // 3. Pending Activations (New users)
            const { data: pendingData } = await supabase
                .from('pending_activations')
                .update({ payment_status: 'approved' })
                .eq('appmax_order_id', asaasOrderId)
                .select();

            if (pendingData && pendingData.length > 0) {
                console.log(`Pending activation approved for order ${asaasOrderId}`);
            }
        }

        return new Response(JSON.stringify({ success: true }), {
            headers: { ...corsHeaders, 'Content-Type': 'application/json' },
            status: 200
        });

    } catch (error: any) {
        console.error('Webhook Error:', error.message);
        return new Response(JSON.stringify({ success: false, error: error.message }), {
            status: 500,
            headers: { ...corsHeaders, 'Content-Type': 'application/json' }
        });
    }
})
