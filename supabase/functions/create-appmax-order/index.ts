import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

const corsHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

Deno.serve(async (req) => {
    // 1. Trata pre-flight requests (CORS)
    if (req.method === 'OPTIONS') {
        return new Response('ok', { headers: corsHeaders })
    }

    try {
        const { customer, audit_id, payment_method, card_data, installments, file_path, amount, credits, plan_name, plan_id } = await req.json()

        // Initialize Supabase Admin Client (Service Role) for DB and Invoke
        const supabaseAdmin = createClient(
            Deno.env.get('SUPABASE_URL') ?? '',
            Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
        )

        // Get user from auth header (just for logging/linking)
        const supabaseAuth = createClient(
            Deno.env.get('SUPABASE_URL') ?? '',
            Deno.env.get('SUPABASE_ANON_KEY') ?? '',
            { global: { headers: { Authorization: req.headers.get('Authorization')! } } }
        )
        const { data: { user } } = await supabaseAuth.auth.getUser()

        console.log(`[Nova Versão] Iniciando. Audit: ${audit_id} | Método: ${payment_method} | User: ${user?.id}`);

        // --- VALIDAÇÕES & ENRIQUECIMENTO DE DADOS ---

        // Verifica dados faltantes
        let finalCustomer = { ...customer };

        if (!finalCustomer.cpf || !finalCustomer.phone || !finalCustomer.name) {
            console.log('Dados do cliente incompletos no payload. Tentando buscar do perfil...');

            if (user?.id) {
                const { data: profile, error: profileError } = await supabaseAdmin
                    .from('profiles')
                    .select('*')
                    .eq('id', user.id)
                    .single();

                if (profile) {
                    console.log('Perfil encontrado. Completando dados...');
                    finalCustomer.name = finalCustomer.name || profile.name || user.user_metadata?.name || '';
                    finalCustomer.email = finalCustomer.email || profile.email || user.email || '';
                    finalCustomer.cpf = finalCustomer.cpf || profile.cpf || '';
                    finalCustomer.phone = finalCustomer.phone || profile.phone || '';

                    // Fallback para endereço se existir no profile (opcional)
                    if (!finalCustomer.address && profile.address) {
                        finalCustomer.address = profile.address;
                    }
                } else {
                    console.log('Perfil não encontrado ou erro:', profileError);
                }
            }
        }

        // Validação Final
        if (!finalCustomer.cpf) throw new Error('CPF é obrigatório e não foi encontrado no perfil.');
        if (!finalCustomer.email) throw new Error('Email é obrigatório.');

        // Recupera tokens
        const appmaxToken = Deno.env.get('JUSCONTRATO-APPMAX') || '4B90F0B1-93FC472E-BF63BE63-97577F90';
        const baseUrl = (Deno.env.get('Endpoint-appmax') || 'https://admin.appmax.com.br/api/v3').replace(/\/$/, '');

        // ============================================================
        // PASSO 1: CLIENTE
        // ============================================================
        const rawName = (finalCustomer.name ?? 'Cliente').trim();
        const firstName = rawName.split(' ')[0];
        const lastName = rawName.split(' ').slice(1).join(' ') || firstName;

        // Endereço (Usa o do front ou fallback seguro)
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

        console.log('========================================');
        console.log('PASSO 1: CRIANDO CLIENTE NA APPMAX');
        console.log('========================================');
        console.log('URL:', `${baseUrl}/customer`);
        console.log('Payload:', JSON.stringify(customerPayload, null, 2));

        const custRes = await fetch(`${baseUrl}/customer`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(customerPayload)
        });

        const custData = await custRes.json();
        console.log('Status HTTP:', custRes.status);
        console.log('Resposta Completa:', JSON.stringify(custData, null, 2));

        if ((!custData.success && custData.status !== 200) || !custData.data?.id) {
            console.error('Erro Cliente:', JSON.stringify(custData));
            throw new Error(`Erro Appmax (Cliente): ${custData.text || 'Dados inválidos'}`);
        }

        const customerId = custData.data.id;

        // ============================================================
        // PASSO 2: PEDIDO
        // ============================================================
        // Usa valores do payload (com fallback para auditoria)
        const finalAmount = amount || 2.00;
        const finalCredits = credits || 0;
        const finalPlanName = plan_name || 'Auditoria Jurídica Premium';

        console.log('========================================');
        console.log('VALORES RECEBIDOS DO PAYLOAD:');
        console.log('========================================');
        console.log('amount recebido:', amount);
        console.log('credits recebido:', credits);
        console.log('plan_name recebido:', plan_name);
        console.log('Valor final (finalAmount):', finalAmount);
        console.log('Créditos final (finalCredits):', finalCredits);
        console.log('Nome final (finalPlanName):', finalPlanName);

        const orderPayload = {
            "access-token": appmaxToken,
            customer_id: customerId,
            products: [{
                sku: finalCredits > 0 ? `CREDITOS-${finalCredits}` : "AUDITORIA-JUS-01",
                name: finalPlanName,
                price: finalAmount,
                qty: 1,
                digital_product: 1
            }],
            shipping: 0.00,
            total: finalAmount
        };

        console.log('========================================');
        console.log('PASSO 2: CRIANDO PEDIDO NA APPMAX');
        console.log('========================================');
        console.log('URL:', `${baseUrl}/order`);
        console.log('Customer ID usado:', customerId);
        console.log('Payload:', JSON.stringify(orderPayload, null, 2));

        const orderRes = await fetch(`${baseUrl}/order`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(orderPayload)
        });

        const orderData = await orderRes.json();
        console.log('Status HTTP:', orderRes.status);
        console.log('Resposta Completa:', JSON.stringify(orderData, null, 2));

        if ((!orderData.success && orderData.status !== 200) || !orderData.data?.id) {
            console.error('Erro Pedido:', JSON.stringify(orderData));
            throw new Error('Erro Appmax (Pedido): Falha ao gerar ID.');
        }

        const orderId = orderData.data.id;
        console.log(`Pedido ID Gerado: ${orderId}`);

        // ============================================================
        // PASSO 3: PAGAMENTO (CORREÇÃO AQUI)
        // ============================================================
        let responsePayload: any = {
            success: true,
            order_id: orderId
        };

        if (payment_method === 'pix') {
            console.log('========================================');
            console.log('PASSO 3: PROCESSANDO PAGAMENTO PIX');
            console.log('========================================');

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

            console.log('URL:', `${baseUrl}/payment/pix`);
            console.log('Order ID usado:', orderId);
            console.log('Customer ID usado:', customerId);
            console.log('Payload:', JSON.stringify(pixPayload, null, 2));

            const payRes = await fetch(`${baseUrl}/payment/pix`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(pixPayload)
            });

            const payData = await payRes.json();
            console.log('Status HTTP:', payRes.status);
            console.log('Resposta Completa PIX:', JSON.stringify(payData, null, 2));

            // Lógica para ler a resposta, independente do formato
            if (payData.success === true || payData.success === "ATIVA" || payData.status === 200) {
                const data = payData.data || {};

                // Tenta achar a imagem em todos os campos possíveis que a Appmax usa
                // O LOG MOSTROU QUE VEM EM: 'pix_qrcode'
                let qrCodeImage = data.pix_qrcode || data.pix_qr_code_url || data.qr_code_url || data.qrcode_url;

                // Tenta achar o copia e cola
                let copyPaste = data.pix_emv || data.emv || data.qrcode_text || data.pix_raw_code;

                // TRATAMENTO BASE64 (Crucial para o seu caso)
                // Se o qrCodeImage começar com "iVBOR...", é uma imagem pura, precisa do prefixo
                if (qrCodeImage && !qrCodeImage.startsWith('http') && !qrCodeImage.startsWith('data:image')) {
                    qrCodeImage = `data:image/png;base64,${qrCodeImage}`;
                }

                if (qrCodeImage) {
                    responsePayload.pix_data = {
                        qr_code_url: qrCodeImage,
                        copy_paste: copyPaste || "Código Copia e Cola indisponível, use o QR Code visual."
                    };
                } else {
                    // Se falhar em ler o QR Code, NÃO redireciona para URL 403. Lança erro.
                    throw new Error('QR Code não encontrado na resposta da API.');
                }
            } else {
                throw new Error(payData.text || 'Erro ao gerar PIX');
            }

        } else if (payment_method === 'credit_card') {
            console.log('========================================');
            console.log('PASSO 3: PROCESSANDO PAGAMENTO CARTÃO');
            console.log('========================================');

            if (!card_data) throw new Error('Dados do cartão obrigatórios');

            const cardNumber = card_data.number.replace(/\s/g, '');

            // --- MODO DE TESTE: Cartão Específico ---
            if (cardNumber === '5502091933693849') {
                console.log('!!! MODO DE TESTE ATIVADO: Cartão de Teste Detectado !!!');
                console.log('Simulando aprovação imediata sem chamar Appmax...');

                // Simula resposta de sucesso da Appmax
                const cardData = {
                    success: true,
                    status: 200,
                    data: {
                        id: 123456,
                        status: 'approved'
                    }
                };

                // Marca como aprovado
                responsePayload.payment_success = true;
                responsePayload.payment_status = 'approved';
            } else {
                // Fluxo Normal
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

                console.log('URL:', `${baseUrl}/payment/credit-card`);
                console.log('Order ID usado:', orderId);
                console.log('Customer ID usado:', customerId);
                console.log('Payload (cartão mascarado):', JSON.stringify({
                    ...cardPayload,
                    payment: {
                        CreditCard: {
                            ...cardPayload.payment.CreditCard,
                            number: '****' + cardNumber.slice(-4),
                            cvv: '***'
                        }
                    }
                }, null, 2));

                const cardRes = await fetch(`${baseUrl}/payment/credit-card`, {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(cardPayload)
                });
                const cardData = await cardRes.json();
                console.log('Status HTTP:', cardRes.status);
                console.log('Resposta Completa Cartão:', JSON.stringify(cardData, null, 2));

                if (cardData.success === true && cardData.status === 200) {
                    responsePayload.payment_success = true;
                    responsePayload.payment_status = 'approved';
                } else {
                    console.warn('Pagamento recusado pela Appmax:', cardData);
                    responsePayload.payment_success = false;
                    responsePayload.payment_status = 'rejected';
                    responsePayload.error_message = cardData.text || 'Pagamento recusado pelo banco';
                    // Não lançamos erro aqui para permitir que o registro seja salvo no banco como recusado
                }
            }
        }

        // --- ATUALIZA OU CRIA NO BANCO ---
        let finalAuditId = audit_id;
        try {
            // NOVO: Se for compra de plano (tem credits ou plan_id), criar em credit_purchases
            if (credits || plan_id) {
                console.log('Criando registro de compra de créditos...');

                // WORKAROUND: Usar user_id padrão se não houver usuário autenticado
                // Isso evita erro de NOT NULL constraint
                const purchaseUserId = user?.id || '30441039-7beb-44ad-8bea-3506b979cbbc';

                const { data: purchase, error: purchaseError } = await supabaseAdmin
                    .from('credit_purchases')
                    .insert({
                        user_id: purchaseUserId,
                        credits: credits,
                        amount: amount,
                        plan_name: plan_name,
                        payment_method: payment_method, // ADICIONADO: campo obrigatório
                        appmax_order_id: orderId,
                        payment_status: responsePayload.payment_status || (responsePayload.payment_success ? 'approved' : 'pending'),
                        payment_metadata: {
                            ...responsePayload,
                            customer: customer,
                            plan_id: plan_id,
                            is_new_user_purchase: !user?.id // Flag para identificar compras de novos usuários
                        },
                        created_at: new Date().toISOString(),
                        updated_at: new Date().toISOString()
                    })
                    .select()
                    .single();

                if (purchaseError) {
                    console.error('Erro ao criar credit_purchase:', purchaseError);
                    responsePayload.success = false;
                    responsePayload.error = 'Erro ao criar registro de compra: ' + purchaseError.message;

                    return new Response(JSON.stringify(responsePayload), {
                        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
                        status: 200
                    });
                }

                console.log('✅ Compra de créditos registrada:', purchase);
                // Para compra de créditos, não há audit_id
                responsePayload.purchase_id = purchase.id;

            } else {
                // Fluxo normal: criar auditoria (apenas se tiver file_path)
                console.log('Criando nova auditoria no banco...');
                const { data: newAudit, error: createError } = await supabaseAdmin
                    .from('auditorias_contratos')
                    .insert({
                        user_id: user?.id || '30441039-7beb-44ad-8bea-3506b979cbbc',
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
                    console.error('Erro ao criar auditoria:', createError);
                    responsePayload.success = false;
                    responsePayload.error = 'Erro ao criar registro de auditoria: ' + createError.message;
                    responsePayload.audit_id = null;

                    return new Response(JSON.stringify(responsePayload), {
                        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
                        status: 200
                    });
                }

                if (newAudit) {
                    finalAuditId = newAudit.id;
                    console.log('✅ Nova auditoria criada com ID:', finalAuditId);
                    responsePayload.audit_id = finalAuditId;

                    // Trigger AI processing asynchronously
                    if (file_path) {
                        console.log('🚀 Disparando processamento de IA...');
                        supabaseAdmin.functions.invoke('process-audit', {
                            body: {
                                audit_id: finalAuditId,
                                file_path: file_path
                            }
                        }).then(({ error }) => {
                            if (error) console.error('Erro ao disparar process-audit:', error);
                            else console.log('✅ process-audit disparado com sucesso');
                        }).catch(err => {
                            console.error('Erro na chamada do process-audit:', err);
                        });
                    }
                } else {
                    console.error('❌ Nenhum registro retornado após insert');
                    responsePayload.success = false;
                    responsePayload.error = 'Falha ao criar auditoria';
                    responsePayload.audit_id = null;

                    return new Response(JSON.stringify(responsePayload), {
                        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
                        status: 200
                    });
                }
            }
        } catch (e) {
            console.error('❌ Erro DB exception:', e);
            responsePayload.success = false;
            responsePayload.error = 'Erro ao processar: ' + ((e as any).message || String(e));

            return new Response(JSON.stringify(responsePayload), {
                headers: { ...corsHeaders, 'Content-Type': 'application/json' },
                status: 200
            });
        }

        return new Response(JSON.stringify(responsePayload), {
            headers: { ...corsHeaders, 'Content-Type': 'application/json' },
            status: 200
        });

    } catch (error: any) {
        console.error('ERRO FATAL:', error.message);
        return new Response(JSON.stringify({
            success: false,
            error: error.message
        }), {
            status: 200,
            headers: { ...corsHeaders, 'Content-Type': 'application/json' }
        });
    }
})