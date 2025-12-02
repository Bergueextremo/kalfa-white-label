import { createClient } from 'npm:@supabase/supabase-js@2'

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
        const { customer, audit_id, payment_method, card_data, installments } = await req.json()

        console.log(`[Nova Versão] Iniciando. Audit: ${audit_id} | Método: ${payment_method}`);

        // --- VALIDAÇÕES ---
        if (!customer?.cpf) throw new Error('CPF é obrigatório');

        // Recupera tokens
        const appmaxToken = Deno.env.get('JUSCONTRATO-APPMAX') || '4B90F0B1-93FC472E-BF63BE63-97577F90';
        const baseUrl = (Deno.env.get('Endpoint-appmax') || 'https://admin.appmax.com.br/api/v3').replace(/\/$/, '');

        // ============================================================
        // PASSO 1: CLIENTE
        // ============================================================
        const rawName = (customer.name ?? '').trim();
        const firstName = rawName.split(' ')[0];
        const lastName = rawName.split(' ').slice(1).join(' ') || firstName;

        // Endereço (Usa o do front ou fallback seguro)
        const addressData = customer.address || {
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
            email: customer.email,
            telephone: customer.phone.replace(/\D/g, ''),
            cpf: customer.cpf.replace(/\D/g, ''),
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
        const orderPayload = {
            "access-token": appmaxToken,
            customer_id: customerId,
            products: [{
                sku: "AUDITORIA-JUS-01",
                name: "Auditoria Jurídica Premium",
                price: 49.00,
                qty: 1,
                digital_product: 1
            }],
            shipping: 0.00,
            total: 49.00
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

            const cardPayload = {
                "access-token": appmaxToken,
                cart: { order_id: orderId },
                customer: { customer_id: customerId },
                payment: {
                    CreditCard: {
                        number: card_data.number.replace(/\s/g, ''),
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
                        number: '****' + card_data.number.slice(-4),
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

            if (cardData.success === true || cardData.status === 200) {
                responsePayload.payment_success = true;
            } else {
                throw new Error(cardData.text || 'Cartão recusado');
            }
        }

        // --- ATUALIZA BANCO (Opcional, não trava o fluxo) ---
        if (audit_id && !audit_id.toString().startsWith('temp-')) {
            try {
                const supabase = createClient(
                    Deno.env.get('SUPABASE_URL') ?? '',
                    Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
                );
                await supabase.from('auditorias_contratos')
                    .update({
                        appmax_order_id: orderId,
                        payment_status: responsePayload.payment_success ? 'approved' : 'pending',
                        payment_metadata: responsePayload
                    })
                    .eq('id', audit_id);
            } catch (e) { console.error('Erro DB:', e); }
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
            status: 400,
            headers: { ...corsHeaders, 'Content-Type': 'application/json' }
        });
    }
})