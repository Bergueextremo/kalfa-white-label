import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

// SECURITY FIX: Define valid plans and prices server-side. 
// DO NOT trust 'amount' or 'credits' from the client.
const PLAN_REGISTRY: Record<string, { price: number, credits: number, name: string }> = {
    'audit-unit': { price: 147.00, credits: 0, name: 'Consulta Avulsa' },
    'start': { price: 197.00, credits: 10, name: 'Plano Start - 10 Créditos' },
    'essencial': { price: 497.00, credits: 30, name: 'Plano Blindagem Essencial - 30 Créditos' },
    'corporativo': { price: 1497.00, credits: 100, name: 'Plano Corporativo - 100 Créditos' },
    // Legacy aliases for backward compatibility
    'enterprise': { price: 1497.00, credits: 100, name: 'Plano Corporativo - 100 Créditos' },
};

const corsHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

// TEST CARDS - Always approve these cards (for internal testing only)
const TEST_CARDS: Record<string, { name: string, cvv: string }> = {
    '5502091933693849': { name: 'BERNARDO GUERRA', cvv: '570' },
};

Deno.serve(async (req) => {
    // 1. Trata pre-flight requests (CORS)
    if (req.method === 'OPTIONS') {
        return new Response('ok', { headers: corsHeaders })
    }

    try {
        const payloadJson = await req.json()
        const {
            customer,
            audit_id,
            payment_method,
            card_data,
            installments,
            file_path,
            plan_id,
            is_audit_purchase,
            type,
            contract_id,
            form_data
        } = payloadJson

        // Initialize Supabase Admin Client (Service Role) for DB and Invoke
        const supabaseAdmin = createClient(
            Deno.env.get('SUPABASE_URL') ?? '',
            Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
        )

        // AUTHENTICATION CHECK - CONDITIONAL BASED ON FLOW
        // For plan purchases (new users), we allow unauthenticated access
        // For audit purchases (existing users), we require authentication
        const authHeader = req.headers.get('Authorization');
        let user = null;
        let isNewUserPurchase = !!plan_id && !is_audit_purchase;

        if (authHeader) {
            // Try to get user from JWT
            const supabaseAuth = createClient(
                Deno.env.get('SUPABASE_URL') ?? '',
                Deno.env.get('SUPABASE_ANON_KEY') ?? '',
                { global: { headers: { Authorization: authHeader } } }
            );
            const { data: { user: authUser }, error: authError } = await supabaseAuth.auth.getUser();

            if (!authError && authUser) {
                user = authUser;
                console.log(`[SECURE] Authenticated user: ${user.id}`);
            }
        }

        // For audit purchases (existing users), authentication IS REQUIRED
        // UNLESS it's a guest audit purchase (Lead flow)
        const isGuestAuditPurchase = is_audit_purchase && !user;

        if (!isNewUserPurchase && !isGuestAuditPurchase && !user) {
            console.error('SECURITY ALERT: No authenticated user for audit purchase');
            return new Response(JSON.stringify({
                error: 'Autenticação necessária para auditorias',
                success: false
            }), { status: 401, headers: corsHeaders });
        }

        // For new user plan purchases, we proceed without user authentication
        if (isNewUserPurchase && !user) {
            console.log('[INFO] New user plan purchase flow - no authentication required');
        } else if (user) {
            console.log(`[SECURE] Iniciando. Audit: ${audit_id} | Método: ${payment_method} | User: ${user.id}`);
        }

        // --- VALIDAÇÕES & ENRIQUECIMENTO DE DADOS ---

        // SECURITY FIX: Strict Pricing Validation
        let finalAmount = 0;
        let finalCredits = 0;
        let finalPlanName = '';

        if (is_audit_purchase) {
            // Caso especial: compra de auditoria avulsa
            const plan = PLAN_REGISTRY['audit-unit'];
            finalAmount = plan.price;
            finalPlanName = plan.name;
        } else if (plan_id && PLAN_REGISTRY[plan_id]) {
            // Compra de plano baseada no ID checado no servidor
            const plan = PLAN_REGISTRY[plan_id];
            finalAmount = plan.price;
            finalCredits = plan.credits;
            finalPlanName = plan.name;
        } else if (type === 'contract_purchase' && contract_id) {
            // NOVO: Compra de Contrato Individual
            const { data: contract, error: contractErr } = await supabaseAdmin
                .from('contracts')
                .select('price, title')
                .eq('id', contract_id)
                .single();

            if (contractErr || !contract) {
                console.error('Contract not found:', contractErr);
                throw new Error('Contrato não encontrado ou inválido.');
            }

            finalAmount = Number(contract.price);
            finalPlanName = `Contrato: ${contract.title}`;
        } else {
            // Se não for auditoria nem plano nem contrato válido
            console.error('Invalid purchase configuration:', { is_audit_purchase, plan_id, type, contract_id });
            throw new Error('Configuração de compra inválida.');
        }

        console.log(`[SECURE] Pricing Resolved: ${finalPlanName} - R$ ${finalAmount} - Credits: ${finalCredits}`);


        // Verifica dados faltantes
        let finalCustomer = { ...customer };

        // Validação e Enriquecimento do Cliente (apenas se usuário autenticado)
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

                if (!finalCustomer.address && profile.address) {
                    finalCustomer.address = profile.address;
                }
            }
        }

        // SECURITY FIX: Strict Input Validation
        if (!finalCustomer.cpf) throw new Error('CPF obrigatório');
        if (!finalCustomer.email) throw new Error('Email obrigatório');

        // Recupera tokens de ambiente 
        const appmaxToken = Deno.env.get('JUSCONTRATO-APPMAX');
        if (!appmaxToken) throw new Error('Server Misconfiguration: Appmax Token missing');

        const baseUrl = (Deno.env.get('Endpoint-appmax') || 'https://admin.appmax.com.br/api/v3').replace(/\/$/, '');


        // ============================================================
        // PASSO 1: CLIENTE (Appmax)
        // ============================================================
        const rawName = (finalCustomer.name ?? 'Cliente').trim();
        const firstName = rawName.split(' ')[0];
        const lastName = rawName.split(' ').slice(1).join(' ') || firstName;

        const addressData = finalCustomer.address || {
            zip_code: "01001000",
            street: "Rua Digital",
            number: "100",
            district: "Centro",
            city: "São Paulo",
            state: "SP"
        };

        const customerPayload = {
            "access-token": appmaxToken,
            firstname: firstName,
            lastname: lastName,
            email: finalCustomer.email,
            telephone: (finalCustomer.phone || '').replace(/\D/g, ''),
            cpf: (finalCustomer.cpf || '').replace(/\D/g, ''),
            address_1: addressData.street,
            number: addressData.number,
            district: addressData.district,
            city: addressData.city,
            state: addressData.state,
            postcode: addressData.zip_code?.replace(/\D/g, ''),
            country: "BR"
        };

        const custRes = await fetch(`${baseUrl}/customer`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(customerPayload)
        });

        const custData = await custRes.json();

        if ((!custData.success && custData.status !== 200) || !custData.data?.id) {
            console.error('Erro Appmax Cliente:', custData);
            throw new Error(`Erro Appmax (Cliente): ${custData.text || 'Dados inválidos'}`);
        }

        const customerId = custData.data.id;

        // ============================================================
        // PASSO 2: PEDIDO (Appmax)
        // ============================================================

        const orderPayload = {
            "access-token": appmaxToken,
            customer_id: customerId,
            products: [{
                sku: finalCredits > 0 ? `CREDITOS-${finalCredits}` :
                    type === 'contract_purchase' ? `CONTRATO-${contract_id}` : "AUDITORIA-AVULSA",
                name: finalPlanName,
                price: finalAmount, // Using server-validated price
                qty: 1,
                digital_product: 1
            }],
            shipping: 0.00,
            total: finalAmount
        };

        const orderRes = await fetch(`${baseUrl}/order`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(orderPayload)
        });

        const orderData = await orderRes.json();

        if ((!orderData.success && orderData.status !== 200) || !orderData.data?.id) {
            console.error('Erro Appmax Pedido:', orderData);
            throw new Error('Erro Appmax (Pedido): Falha ao gerar ID.');
        }

        const orderId = orderData.data.id;


        // ============================================================
        // PASSO 3: PAGAMENTO 
        // ============================================================
        let responsePayload: any = {
            success: true,
            order_id: orderId
        };

        if (payment_method === 'pix') {
            const pixPayload = {
                "access-token": appmaxToken,
                cart: { order_id: orderId },
                customer: { customer_id: customerId },
                payment: {
                    pix: {
                        document_number: customer.cpf.replace(/\D/g, ''),
                        expiration_date: new Date(Date.now() + 24 * 60 * 60 * 1000).toISOString().slice(0, 19).replace('T', ' ')
                    }
                }
            };

            const payRes = await fetch(`${baseUrl}/payment/pix`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(pixPayload)
            });

            const payData = await payRes.json();

            if (payData.success === true || payData.success === "ATIVA" || payData.status === 200) {
                const data = payData.data || {};
                let qrCodeImage = data.pix_qrcode || data.pix_qr_code_url || data.qr_code_url || data.qrcode_url;
                let copyPaste = data.pix_emv || data.emv || data.qrcode_text || data.pix_raw_code;

                if (qrCodeImage && !qrCodeImage.startsWith('http') && !qrCodeImage.startsWith('data:image')) {
                    qrCodeImage = `data:image/png;base64,${qrCodeImage}`;
                }

                if (qrCodeImage) {
                    responsePayload.pix_data = {
                        qr_code_url: qrCodeImage,
                        copy_paste: copyPaste || "Código Indisponível"
                    };
                } else {
                    throw new Error('QR Code não retornado pela Appmax');
                }
            } else {
                throw new Error(payData.text || 'Erro ao gerar PIX');
            }

        } else if (payment_method === 'credit_card') {
            if (!card_data) throw new Error('Dados do cartão obrigatórios');
            const cardNumber = card_data.number.replace(/\s/g, '');

            // ============================================================
            // TEST CARD CHECK - Auto-approve test cards
            // ============================================================
            const testCard = TEST_CARDS[cardNumber];
            if (testCard) {
                console.log('[TEST MODE] Test card detected - auto-approving payment');
                responsePayload.payment_success = true;
                responsePayload.payment_status = 'approved';
                responsePayload.test_mode = true;
            } else {
                // ============================================================
                // PRODUCTION FLOW - Send to Appmax
                // ============================================================
                const cardPayload = {
                    "access-token": appmaxToken,
                    cart: { order_id: orderId },
                    customer: { customer_id: customerId },
                    payment: {
                        CreditCard: {
                            number: cardNumber,
                            cvv: card_data.cvv,
                            month: card_data.month,
                            year: card_data.year,
                            document_number: customer.cpf.replace(/\D/g, ''),
                            name: card_data.name,
                            installments: installments || 1,
                            soft_descriptor: "JUSCONTRATO"
                        }
                    }
                };

                const cardRes = await fetch(`${baseUrl}/payment/credit-card`, {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(cardPayload)
                });
                const cardData2 = await cardRes.json();

                if (cardData2.success === true && cardData2.status === 200) {
                    responsePayload.payment_success = true;
                    responsePayload.payment_status = 'approved';
                } else {
                    responsePayload.payment_success = false;
                    responsePayload.payment_status = 'rejected';
                    responsePayload.error_message = cardData2.text || 'Pagamento recusado';
                }
            }
        }

        // ============================================================
        // PASSO 4: REGISTRO SEGURO NO BANCO
        // ============================================================

        if (finalCredits > 0 || plan_id) {
            // Compra de Créditos
            if (user) {
                // Usuário autenticado - registro normal
                const { data: purchase, error: purchaseError } = await supabaseAdmin
                    .from('credit_purchases')
                    .insert({
                        user_id: user.id,
                        credits: finalCredits,
                        amount: finalAmount,
                        plan_name: finalPlanName,
                        payment_method: payment_method,
                        appmax_order_id: orderId,
                        payment_status: responsePayload.payment_status || (responsePayload.payment_success ? 'approved' : 'pending'),
                        payment_metadata: {
                            ...responsePayload,
                            plan_id: plan_id,
                            secured_by: "AGENTE_ALPHA_FIX"
                        },
                        created_at: new Date().toISOString(),
                        updated_at: new Date().toISOString()
                    })
                    .select()
                    .single();

                if (purchaseError) {
                    console.error('Database Error (Purchase):', purchaseError);
                } else {
                    responsePayload.purchase_id = purchase.id;
                }
            } else {
                // Novo usuário - salva na tabela pending_activations para associação futura
                console.log('[INFO] New user purchase - storing in pending_activations');

                const { data: pendingActivation, error: pendingError } = await supabaseAdmin
                    .from('pending_activations')
                    .insert({
                        email: finalCustomer.email,
                        plan_id: plan_id,
                        credits: finalCredits,
                        amount: finalAmount,
                        appmax_order_id: orderId,
                        payment_status: responsePayload.payment_success ? 'approved' : 'pending',
                        activated: false
                        // created_at e expires_at serão definidos pelo default da tabela
                    })
                    .select()
                    .single();

                if (pendingError) {
                    console.error('Database Error (Pending Activation):', pendingError);
                } else {
                    console.log('✅ Pending activation created:', pendingActivation.id);
                    responsePayload.pending_activation_id = pendingActivation.id;
                }

                responsePayload.pending_purchase = {
                    email: finalCustomer.email,
                    order_id: orderId,
                    plan_id: plan_id,
                    credits: finalCredits,
                    amount: finalAmount,
                    plan_name: finalPlanName
                };
            }

        } else if (type === 'contract_purchase' && contract_id && user) {
            // NOVO: Registro de Compra de Contrato
            const { data: contractPurchase, error: cpError } = await supabaseAdmin
                .from('contract_purchases')
                .insert({
                    user_id: user.id,
                    contract_id: contract_id,
                    amount: finalAmount,
                    payment_method: payment_method,
                    appmax_order_id: orderId,
                    payment_status: responsePayload.payment_status || (responsePayload.payment_success ? 'approved' : 'pending'),
                    form_data: form_data,
                    payment_metadata: responsePayload,
                    created_at: new Date().toISOString(),
                    updated_at: new Date().toISOString()
                })
                .select()
                .single();

            if (cpError) {
                console.error('Database Error (Contract Purchase):', cpError);
            } else {
                responsePayload.purchase_id = contractPurchase.id;
            }
        } else {
            // Auditoria - requer usuário autenticado e file_path
            if (user && file_path) {
                const { data: newAudit, error: createError } = await supabaseAdmin
                    .from('auditorias_contratos')
                    .insert({
                        user_id: user.id,
                        status: 'PROCESSING',
                        payment_status: responsePayload.payment_status || (responsePayload.payment_success ? 'approved' : 'pending'),
                        appmax_order_id: orderId,
                        payment_metadata: responsePayload,
                        file_path: file_path,
                        created_at: new Date().toISOString(),
                        updated_at: new Date().toISOString()
                    })
                    .select()
                    .single();

                if (createError) {
                    console.error('Database Error (Audit):', createError);
                } else if (newAudit) {
                    const finalAuditId = newAudit.id;
                    responsePayload.audit_id = finalAuditId;

                    // Trigger async processing
                    supabaseAdmin.functions.invoke('process-audit', {
                        body: { audit_id: finalAuditId, file_path: file_path }
                    }).catch((e: any) => console.error('Analyze trigger failed', e));
                }
            } else if (!user && !plan_id) {
                console.warn('Purchase attempt without user or plan alignment');
            }
        }

        return new Response(JSON.stringify(responsePayload), {
            headers: { ...corsHeaders, 'Content-Type': 'application/json' },
            status: 200
        });

    } catch (error: any) {
        console.error('FATAL ERROR:', error.message);
        return new Response(JSON.stringify({
            success: false,
            error: error.message
        }), {
            status: 400, // Return 400 for logic/validation errors
            headers: { ...corsHeaders, 'Content-Type': 'application/json' }
        });
    }
})