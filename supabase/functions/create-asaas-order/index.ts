import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

const PLAN_REGISTRY: Record<string, { price: number, credits: number, name: string }> = {
    'audit-unit': { price: 197.00, credits: 0, name: 'Consulta Avulsa' },
    'start': { price: 197.00, credits: 10, name: 'Plano Start - 10 Créditos' },
    'essencial': { price: 497.00, credits: 30, name: 'Plano Blindagem Essencial - 30 Créditos' },
    'corporativo': { price: 1497.00, credits: 100, name: 'Plano Corporativo - 100 Créditos' },
    'enterprise': { price: 1497.00, credits: 100, name: 'Plano Corporativo - 100 Créditos' },
};

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
        const payloadJson = await req.json()
        console.log('--- NEW ORDER REQUEST ---');
        console.log('Payload:', JSON.stringify(payloadJson, null, 2));

        const {
            customer,
            payment_method,
            card_data,
            installments,
            file_path,
            plan_id,
            is_audit_purchase,
            type,
            contract_id,
            form_data,
            coupon_code
        } = payloadJson

        const supabaseAdmin = createClient(
            Deno.env.get('SUPABASE_URL') ?? '',
            Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
        )

        const authHeader = req.headers.get('Authorization');
        let user = null;

        if (authHeader) {
            const supabaseAuth = createClient(
                Deno.env.get('SUPABASE_URL') ?? '',
                Deno.env.get('SUPABASE_ANON_KEY') ?? '',
                { global: { headers: { Authorization: authHeader } } }
            );
            const { data: { user: authUser }, error: authError } = await supabaseAuth.auth.getUser();
            if (!authError && authUser) user = authUser;
        }

        let finalAmount = 0;
        let finalCredits = 0;
        let finalPlanName = '';

        if (is_audit_purchase) {
            const plan = PLAN_REGISTRY['audit-unit'];
            finalAmount = plan.price;
            finalPlanName = plan.name;
        } else if (plan_id && PLAN_REGISTRY[plan_id]) {
            const plan = PLAN_REGISTRY[plan_id];
            finalAmount = plan.price;
            finalCredits = plan.credits;
            finalPlanName = plan.name;
        } else if (type === 'contract_purchase' && contract_id) {
            const { data: contract, error: contractErr } = await supabaseAdmin
                .from('contracts')
                .select('price, title')
                .eq('id', contract_id)
                .single();

            if (contractErr || !contract) throw new Error('Contrato não encontrado.');
            finalAmount = Number(contract.price);
            finalPlanName = `Contrato: ${contract.title}`;
        } else {
            console.error('Invalid purchase config:', { plan_id, is_audit_purchase, type, contract_id });
            throw new Error('Configuração de compra inválida.');
        }

        let partner_id = null;
        if (coupon_code) {
            console.log('Validating coupon:', coupon_code);
            const { data: partnerData } = await supabaseAdmin
                .from('partners')
                .select('id')
                .eq('code', coupon_code.trim().toUpperCase())
                .maybeSingle();

            if (partnerData) {
                partner_id = partnerData.id;
                console.log('Partner found:', partner_id);
            } else {
                console.log('Partner not found for coupon:', coupon_code);
            }
        }

        console.log('Final Order Details:', { finalAmount, finalCredits, finalPlanName });

        let finalCustomer = { ...customer };
        if (user && (!finalCustomer.cpf || !finalCustomer.phone || !finalCustomer.name)) {
            const { data: profile } = await supabaseAdmin
                .from('profiles')
                .select('*')
                .eq('id', user.id)
                .single();

            if (profile) {
                finalCustomer.name = finalCustomer.name || profile.name || user.user_metadata?.name || '';
                finalCustomer.email = finalCustomer.email || profile.email || user.email || '';
                finalCustomer.cpf = finalCustomer.cpf || profile.cpf || '';
                finalCustomer.phone = finalCustomer.phone || profile.phone || '';
            }
        }

        if (!finalCustomer.cpf) throw new Error('CPF obrigatório');
        if (!finalCustomer.email) throw new Error('Email obrigatório');

        const asaasApiKey = Deno.env.get('ASAAS_API_KEY');
        if (!asaasApiKey || asaasApiKey === 'your_key_here') {
            throw new Error('Server Misconfiguration: Asaas API Key is missing or invalid placeholder.');
        }

        const asaasBaseUrl = 'https://api.asaas.com/v3';

        // 1. Create/Get Customer in Asaas
        console.log('Searching for customer in Asaas...');
        const customerSearchRes = await fetch(`${asaasBaseUrl}/customers?email=${finalCustomer.email}&cpfCnpj=${finalCustomer.cpf.replace(/\D/g, '')}`, {
            headers: { 'access_token': asaasApiKey }
        });

        if (!customerSearchRes.ok) {
            const errorText = await customerSearchRes.text();
            console.error('Asaas Customer Search Error:', errorText);
            throw new Error(`Asaas Customer Search Failed: ${customerSearchRes.status}`);
        }

        const customerSearchData = await customerSearchRes.json();

        let asaasCustomerId;
        if (customerSearchData.data && customerSearchData.data.length > 0) {
            asaasCustomerId = customerSearchData.data[0].id;
            console.log('Found existing customer:', asaasCustomerId);
        } else {
            console.log('Creating new customer in Asaas...');
            const customerPayload = {
                name: finalCustomer.name,
                email: finalCustomer.email,
                phone: finalCustomer.phone.replace(/\D/g, ''),
                cpfCnpj: finalCustomer.cpf.replace(/\D/g, ''),
                notificationDisabled: true
            };
            const createCustRes = await fetch(`${asaasBaseUrl}/customers`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'access_token': asaasApiKey
                },
                body: JSON.stringify(customerPayload)
            });
            const createCustData = await createCustRes.json();
            if (createCustData.id) {
                asaasCustomerId = createCustData.id;
                console.log('Created new customer:', asaasCustomerId);
            } else {
                console.error('Asaas Customer Create Error:', createCustData);
                throw new Error(createCustData.errors?.[0]?.description || 'Erro ao criar cliente no Asaas');
            }
        }

        // 2. Create Payment
        console.log('Creating payment in Asaas...');
        const paymentPayload: any = {
            customer: asaasCustomerId,
            billingType: payment_method === 'pix' ? 'PIX' : 'CREDIT_CARD',
            value: finalAmount,
            dueDate: new Date(Date.now() + 24 * 60 * 60 * 1000).toISOString().split('T')[0],
            description: finalPlanName,
            externalReference: `order_${Date.now()}`
        };

        if (payment_method === 'credit_card' && card_data) {
            paymentPayload.creditCard = {
                holderName: card_data.name,
                number: card_data.number.replace(/\s/g, ''),
                expiryMonth: card_data.month,
                expiryYear: card_data.year.length === 2 ? `20${card_data.year}` : card_data.year,
                ccv: card_data.cvv
            };
            // Alguns wrappers ou versões antigas podem esperar 'cvv'
            (paymentPayload.creditCard as any).cvv = card_data.cvv;

            paymentPayload.creditCardHolderInfo = {
                name: card_data.name,
                email: finalCustomer.email,
                cpfCnpj: (card_data.document_number || finalCustomer.cpf).replace(/\D/g, ''),
                postalCode: (customer?.address?.zip_code || '00000000').replace(/\D/g, ''),
                addressNumber: customer?.address?.number || 'SN',
                phone: finalCustomer.phone.replace(/\D/g, '')
            };
        }

        console.log('Final Asaas Payment Payload:', JSON.stringify(paymentPayload, null, 2));

        const createPayRes = await fetch(`${asaasBaseUrl}/payments`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'access_token': asaasApiKey
            },
            body: JSON.stringify(paymentPayload)
        });

        const createPayData = await createPayRes.json();

        if (createPayData.errors) {
            console.error('Asaas Payment Error:', JSON.stringify(createPayData.errors, null, 2));
            const errorMsg = createPayData.errors[0].description || 'Erro ao criar pagamento no Asaas';
            throw new Error(errorMsg);
        }

        console.log('Payment created successfully:', createPayData.id);

        let responsePayload: any = {
            success: true,
            order_id: createPayData.id,
            payment_status: createPayData.status === 'CONFIRMED' || createPayData.status === 'RECEIVED' ? 'approved' : 'pending'
        };

        // 3. Get PIX QR Code if needed
        if (payment_method === 'pix') {
            console.log('Fetching PIX QR Code...');
            const pixRes = await fetch(`${asaasBaseUrl}/payments/${createPayData.id}/pixQrCode`, {
                headers: { 'access_token': asaasApiKey }
            });
            const pixData = await pixRes.json();
            if (pixData.encodedImage) {
                responsePayload.pix_data = {
                    qr_code_url: `data:image/png;base64,${pixData.encodedImage}`,
                    copy_paste: pixData.payload
                };
            } else {
                console.error('Asaas PIX Error:', pixData);
                throw new Error('QR Code não retornado pelo Asaas');
            }
        }

        // 4. Record in DB (Legacy fields kept for compatibility, using asaas prefix where applicable)
        if (finalCredits > 0 || plan_id) {
            if (user) {
                const { data: purchase } = await supabaseAdmin.from('credit_purchases').insert({
                    user_id: user.id,
                    credits: finalCredits,
                    amount: finalAmount,
                    plan_name: finalPlanName,
                    payment_method: payment_method,
                    appmax_order_id: createPayData.id, // Reused field for consistency
                    payment_status: responsePayload.payment_status,
                    payment_metadata: { ...responsePayload, plan_id: plan_id },
                    partner_id: partner_id,
                    coupon_code: coupon_code,
                    created_at: new Date().toISOString(),
                    updated_at: new Date().toISOString()
                }).select().single();
                if (purchase) responsePayload.purchase_id = purchase.id;
            } else {
                await supabaseAdmin.from('pending_activations').insert({
                    email: finalCustomer.email,
                    plan_id: plan_id,
                    credits: finalCredits,
                    amount: finalAmount,
                    appmax_order_id: createPayData.id,
                    payment_status: responsePayload.payment_status === 'approved' ? 'approved' : 'pending',
                    partner_id: partner_id,
                    coupon_code: coupon_code,
                    activated: false
                });
            }
        } else if (type === 'contract_purchase' && contract_id && user) {
            await supabaseAdmin.from('contract_purchases').insert({
                user_id: user.id,
                contract_id: contract_id,
                amount: finalAmount,
                payment_method: payment_method,
                appmax_order_id: createPayData.id,
                payment_status: responsePayload.payment_status,
                form_data: form_data,
                payment_metadata: responsePayload,
                partner_id: partner_id,
                coupon_code: coupon_code,
                created_at: new Date().toISOString(),
                updated_at: new Date().toISOString()
            });
        } else if (user && file_path) {
            const { data: newAudit } = await supabaseAdmin.from('auditorias_contratos').insert({
                user_id: user.id,
                status: 'PROCESSING',
                payment_status: responsePayload.payment_status,
                appmax_order_id: createPayData.id,
                payment_metadata: responsePayload,
                file_path: file_path,
                partner_id: partner_id,
                coupon_code: coupon_code,
                created_at: new Date().toISOString(),
                updated_at: new Date().toISOString()
            }).select().single();

            if (newAudit) {
                responsePayload.audit_id = newAudit.id;
                if (responsePayload.payment_status === 'approved') {
                    supabaseAdmin.functions.invoke('process-audit', {
                        body: { audit_id: newAudit.id, file_path: file_path }
                    }).catch((e: any) => console.error('Analyze trigger failed', e));
                }
            }
        }

        return new Response(JSON.stringify(responsePayload), {
            headers: { ...corsHeaders, 'Content-Type': 'application/json' },
            status: 200
        });

    } catch (error: any) {
        console.error('FATAL ERROR:', error.message);
        // Retornamos 200 mesmo em erro para que o invoke do frontend consiga ler o corpo da mensagem
        return new Response(JSON.stringify({ success: false, error: error.message, is_business_error: true }), {
            status: 200,
            headers: { ...corsHeaders, 'Content-Type': 'application/json' }
        });
    }
})
