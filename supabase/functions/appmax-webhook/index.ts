import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'
import { crypto } from "https://deno.land/std@0.177.0/crypto/mod.ts";
import { encode } from "https://deno.land/std@0.177.0/encoding/hex.ts";

const corsHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type, x-appmax-signature',
}

// Verify webhook signature using HMAC-SHA256
async function verifyWebhookSignature(payload: string, signature: string | null, secret: string): Promise<boolean> {
    if (!signature || !secret) {
        console.error('Missing signature or secret for verification');
        return false;
    }

    try {
        // Create HMAC-SHA256 hash of the payload
        const encoder = new TextEncoder();
        const key = await crypto.subtle.importKey(
            "raw",
            encoder.encode(secret),
            { name: "HMAC", hash: "SHA-256" },
            false,
            ["sign"]
        );
        
        const signatureBuffer = await crypto.subtle.sign("HMAC", key, encoder.encode(payload));
        const computedSignature = new TextDecoder().decode(encode(new Uint8Array(signatureBuffer)));
        
        // Compare signatures (timing-safe comparison)
        const expectedLength = computedSignature.length;
        const receivedLength = signature.length;
        
        if (expectedLength !== receivedLength) {
            console.error('Signature length mismatch');
            return false;
        }
        
        let result = 0;
        for (let i = 0; i < expectedLength; i++) {
            result |= computedSignature.charCodeAt(i) ^ signature.charCodeAt(i);
        }
        
        const isValid = result === 0;
        if (!isValid) {
            console.error('Signature verification failed - signatures do not match');
        }
        
        return isValid;
    } catch (error) {
        console.error('Error verifying signature:', error);
        return false;
    }
}

Deno.serve(async (req) => {
    // Handle CORS preflight
    if (req.method === 'OPTIONS') {
        return new Response('ok', { headers: corsHeaders })
    }

    try {
        console.log('========================================');
        console.log('WEBHOOK APPMAX RECEBIDO');
        console.log('========================================');

        // Get the raw body for signature verification
        const rawBody = await req.text();
        
        // Verify webhook signature
        const webhookSecret = Deno.env.get('APPMAX_WEBHOOK_SECRET');
        const signature = req.headers.get('x-appmax-signature') || req.headers.get('X-Appmax-Signature');
        
        if (!webhookSecret) {
            console.error('APPMAX_WEBHOOK_SECRET not configured');
            return new Response(JSON.stringify({
                success: false,
                error: 'Webhook verification not configured'
            }), {
                status: 500,
                headers: { ...corsHeaders, 'Content-Type': 'application/json' }
            });
        }

        const isValidSignature = await verifyWebhookSignature(rawBody, signature, webhookSecret);
        
        if (!isValidSignature) {
            console.error('========================================');
            console.error('WEBHOOK SIGNATURE VERIFICATION FAILED');
            console.error('Received signature:', signature);
            console.error('========================================');
            return new Response(JSON.stringify({
                success: false,
                error: 'Invalid webhook signature'
            }), {
                status: 401,
                headers: { ...corsHeaders, 'Content-Type': 'application/json' }
            });
        }
        
        console.log('✅ Webhook signature verified successfully');

        const payload = JSON.parse(rawBody);
        console.log('Payload completo:', JSON.stringify(payload, null, 2));

        // Extract data based on Appmax documentation structure
        const data = payload.data || payload;
        const event = payload.event;

        // Appmax sends ID inside the data object
        const appmaxOrderId = data.id || data.order_id || payload.id;
        const appmaxStatus = data.status || payload.status;

        console.log('Event:', event);
        console.log('Order ID extracted:', appmaxOrderId);
        console.log('Appmax Status:', appmaxStatus);

        if (!appmaxOrderId) {
            console.error('Order ID não encontrado no webhook');
            return new Response(JSON.stringify({
                success: false,
                error: 'Order ID missing'
            }), {
                status: 400,
                headers: { ...corsHeaders, 'Content-Type': 'application/json' }
            });
        }

        // Map Appmax status to our internal status
        let internalStatus = 'pending';
        if (appmaxStatus === 'completed' || appmaxStatus === 'approved' || appmaxStatus === 'paid') {
            internalStatus = 'approved';
        } else if (appmaxStatus === 'cancelled' || appmaxStatus === 'canceled' || appmaxStatus === 'rejected') {
            internalStatus = 'cancelled';
        } else if (appmaxStatus === 'refunded') {
            internalStatus = 'refunded';
        }

        console.log('Status convertido:', internalStatus);

        // Update Database
        const supabase = createClient(
            Deno.env.get('SUPABASE_URL') ?? '',
            Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
        );

        console.log('Atualizando banco com Order ID:', appmaxOrderId);

        // Try to update auditorias_contratos first
        const { data: updateData, error: updateError } = await supabase
            .from('auditorias_contratos')
            .update({
                payment_status: internalStatus,
                status: internalStatus === 'approved' ? 'PROCESSING' : 'UPLOADING',
                updated_at: new Date().toISOString()
            })
            .eq('appmax_order_id', appmaxOrderId)
            .select();

        // Also try to update credit_purchases table
        const { data: creditPurchaseData, error: creditPurchaseError } = await supabase
            .from('credit_purchases')
            .update({
                payment_status: internalStatus,
                updated_at: new Date().toISOString()
            })
            .eq('appmax_order_id', appmaxOrderId)
            .select();

        if (updateError && creditPurchaseError) {
            console.error('Erro ao atualizar banco (auditorias):', updateError);
            console.error('Erro ao atualizar banco (credit_purchases):', creditPurchaseError);
            throw new Error('Pedido não encontrado em nenhuma tabela');
        }

        console.log('Registros atualizados (auditorias):', updateData?.length || 0);
        console.log('Registros atualizados (credit_purchases):', creditPurchaseData?.length || 0);

        // Handle credit purchase approval
        if (internalStatus === 'approved' && creditPurchaseData && creditPurchaseData.length > 0) {
            const purchase = creditPurchaseData[0];
            console.log('Processando compra de créditos aprovada:', purchase);

            if (purchase.user_id && purchase.credits) {
                console.log('Adicionando créditos ao usuário:', purchase.user_id);

                // Get current credits
                const { data: profile } = await supabase
                    .from('profiles')
                    .select('credits')
                    .eq('id', purchase.user_id)
                    .single();

                if (profile) {
                    const newCredits = (profile.credits || 0) + purchase.credits;

                    await supabase
                        .from('profiles')
                        .update({ credits: newCredits })
                        .eq('id', purchase.user_id);

                    console.log(`Créditos atualizados: ${profile.credits} → ${newCredits} (+${purchase.credits})`);
                }
            }
        }

        // NOVO: Handle new user payment (create pending_activation)
        if (internalStatus === 'approved' && updateData && updateData.length > 0) {
            const audit = updateData[0];

            // Verificar se é um novo usuário (sem user_id) e tem metadata de pagamento
            if (!audit.user_id && audit.payment_metadata) {
                const metadata = audit.payment_metadata;
                const customerEmail = metadata.customer?.email;
                const planId = metadata.plan_id;
                const credits = metadata.credits;
                const amount = metadata.amount;

                if (customerEmail && planId && credits) {
                    console.log('========================================');
                    console.log('NOVO USUÁRIO DETECTADO - CRIANDO PENDING_ACTIVATION');
                    console.log('Email:', customerEmail);
                    console.log('Plan ID:', planId);
                    console.log('Credits:', credits);
                    console.log('Amount:', amount);
                    console.log('========================================');

                    try {
                        const { data: pendingActivation, error: activationError } = await supabase
                            .from('pending_activations')
                            .insert({
                                email: customerEmail,
                                plan_id: planId,
                                credits: credits,
                                amount: amount,
                                appmax_order_id: appmaxOrderId,
                                payment_status: 'approved'
                            })
                            .select()
                            .single();

                        if (activationError) {
                            console.error('Erro ao criar pending_activation:', activationError);
                        } else {
                            console.log('✅ Pending activation criada:', pendingActivation);
                        }
                    } catch (error) {
                        console.error('Erro ao processar pending_activation:', error);
                    }
                }
            }
        }

        // If payment is approved for audit, update credits AND trigger audit processing
        if (internalStatus === 'approved' && updateData && updateData.length > 0) {
            const audit = updateData[0];

            if (audit.user_id) {
                console.log('Atualizando créditos do usuário:', audit.user_id);

                // Get current credits
                const { data: profile } = await supabase
                    .from('profiles')
                    .select('credits')
                    .eq('id', audit.user_id)
                    .single();

                if (profile) {
                    const newCredits = (profile.credits || 0) + 1;

                    await supabase
                        .from('profiles')
                        .update({ credits: newCredits })
                        .eq('id', audit.user_id);

                    console.log(`Créditos atualizados: ${profile.credits} → ${newCredits}`);
                }
            }

            // Trigger premium audit processing if file_path exists
            if (audit.file_path) {
                console.log('========================================');
                console.log('INICIANDO PROCESSAMENTO DA AUDITORIA PREMIUM');
                console.log('Audit ID:', audit.id);
                console.log('File Path:', audit.file_path);
                console.log('========================================');

                try {
                    // Call process-audit edge function
                    const { data: auditResult, error: auditError } = await supabase.functions.invoke('process-audit', {
                        body: {
                            audit_id: audit.id,
                            file_path: audit.file_path
                        }
                    });

                    if (auditError) {
                        console.error('Erro ao processar auditoria:', auditError);
                    } else {
                        console.log('Auditoria processada com sucesso:', auditResult);
                    }
                } catch (auditProcessError) {
                    console.error('Erro fatal ao processar auditoria:', auditProcessError);
                    // Não lançamos o erro aqui para não bloquear a confirmação do webhook
                }
            } else {
                console.warn('File path não encontrado na auditoria. Auditoria premium não será processada.');
            }
        }

        return new Response(JSON.stringify({
            success: true,
            message: 'Webhook processed successfully',
            status: internalStatus
        }), {
            headers: { ...corsHeaders, 'Content-Type': 'application/json' },
            status: 200
        });

    } catch (error: any) {
        console.error('ERRO NO WEBHOOK:', error.message);
        console.error('Stack:', error.stack);

        return new Response(JSON.stringify({
            success: false,
            error: error.message
        }), {
            status: 500,
            headers: { ...corsHeaders, 'Content-Type': 'application/json' }
        });
    }
})