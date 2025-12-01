import { createClient } from 'npm:@supabase/supabase-js@2'

const corsHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

Deno.serve(async (req) => {
    if (req.method === 'OPTIONS') {
        return new Response('ok', { headers: corsHeaders })
    }

    try {
        const { customer, audit_id, payment_method } = await req.json()

        console.log(`Creating Appmax order for audit: ${audit_id} Payment method: ${payment_method}`);

        if (!customer?.cpf) {
            throw new Error('CPF é obrigatório');
        }

        const appmaxToken = Deno.env.get('JUSCONTRATO-APPMAX');
        if (!appmaxToken) {
            throw new Error('Token Appmax não configurado');
        }

        // ============================================================
        // STEP 1: CREATE CUSTOMER
        // ============================================================
        const rawName = (customer.name ?? '').trim();
        const normalizedName = rawName.replace(/\s+/g, ' ');
        const [firstNameFromCustomer, ...lastNamePartsFromCustomer] = normalizedName.split(' ');
        const appmaxFirstname = firstNameFromCustomer || 'Cliente';
        const appmaxLastname = lastNamePartsFromCustomer.join(' ') || (firstNameFromCustomer ? '' : 'JusContratos');

        console.log('Step 1: Creating customer in Appmax. Payload:', {
            firstname: appmaxFirstname,
            lastname: appmaxLastname,
            email: customer.email,
            telephone: customer.phone.replace(/\D/g, ''),
            cpf: customer.cpf.replace(/\D/g, ''),
            zipcode: "01310100",
            address: "Avenida Paulista",
            number: "1000",
            neighborhood: "Bela Vista",
            city: "São Paulo",
            state: "SP"
        });

        const customerPayload = {
            "access-token": appmaxToken,
            firstname: appmaxFirstname,
            lastname: appmaxLastname,
            email: customer.email,
            telephone: customer.phone.replace(/\D/g, ''),
            cpf: customer.cpf.replace(/\D/g, ''),
            zipcode: "01310100",
            address: "Avenida Paulista",
            number: "1000",
            neighborhood: "Bela Vista",
            city: "São Paulo",
            state: "SP"
        };

        const custRes = await fetch('https://admin.appmax.com.br/api/v3/customer', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(customerPayload)
        });

        const custData = await custRes.json();
        console.log('Customer creation response status:', custRes.status);
        console.log('Customer creation raw response:', JSON.stringify(custData));

        if (!custData.success && custData.status !== 200) {
            console.error('Error creating customer:', custData);
            throw new Error('Erro ao criar cliente na Appmax: ' + (custData.text || 'Unknown error'));
        }

        const customerId = custData.data?.id || custData.id;
        console.log('Customer created successfully. ID:', customerId);

        // ============================================================
        // STEP 2: CREATE ORDER WITH BUNDLE
        // ============================================================
        console.log('Step 2: Creating order in Appmax. Payload:', {
            customer_id: customerId,
            products: [{
                sku: "AUDIT-PREMIUM",
                name: "Auditoria Jurídica Premium",
                price: 49.90,
                qty: 1,
                digital_product: 1
            }],
            shipping: 0.00,
            payment_type: payment_method
        });

        const orderPayload = {
            "access-token": appmaxToken,
            customer_id: customerId,
            products: [{
                sku: "AUDIT-PREMIUM",
                name: "Auditoria Jurídica Premium",
                price: 49.90,
                qty: 1,
                digital_product: 1
            }],
            shipping: 0.00,
            payment_type: payment_method
        };

        const orderRes = await fetch('https://admin.appmax.com.br/api/v3/order', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(orderPayload)
        });

        const orderData = await orderRes.json();
        console.log('Appmax response status:', orderRes.status);
        console.log('Appmax order created successfully. Full response:', JSON.stringify(orderData, null, 2));
        console.log('Appmax raw response:', JSON.stringify(orderData));
        console.log('Appmax response headers:', Object.fromEntries(orderRes.headers.entries()));

        if (!orderData.success && orderData.status !== 200) {
            console.error('Error creating order:', orderData);
            throw new Error('Erro ao criar pedido na Appmax: ' + (orderData.text || 'Unknown error'));
        }

        const orderId = orderData.data?.id || orderData.id;
        console.log('Extracted order ID:', orderId);

        // ============================================================
        // STEP 3: PROCESS PAYMENT
        // ============================================================
        let responsePayload: any = {
            success: true,
            order_id: orderId
        };

        // PIX flow: gerar QR Code via endpoint de pagamento
        if (payment_method === 'pix') {
            console.log('Processing PIX via /payment/pix endpoint...');

            const pixPayload = {
                "access-token": appmaxToken,
                cart: {
                    order_id: orderId
                },
                customer: {
                    customer_id: customerId
                },
                payment: {
                    pix: {
                        document_number: customer.cpf.replace(/\D/g, '')
                    }
                }
            };

            const payRes = await fetch('https://admin.appmax.com.br/api/v3/payment/pix', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(pixPayload)
            });

            const payData = await payRes.json();
            console.log('PIX payment raw response:', JSON.stringify(payData));

            if (!payData?.success) {
                console.error('Error processing PIX payment:', payData);
                throw new Error('Erro ao gerar PIX na Appmax: ' + (payData.text || 'Unknown error'));
            }

            const pixInfo = payData.data?.pix || payData.pix;

            if (pixInfo) {
                responsePayload.pix_data = {
                    qr_code_url: pixInfo.qrcode_url || pixInfo.qrcode || pixInfo.qr_code_url,
                    copy_paste: pixInfo.emv || pixInfo.qrcode_text || pixInfo.qr_code_text,
                    expiration: pixInfo.expiration_date || pixInfo.expires_at
                };
            } else {
                console.warn('PIX payment response without direct pix data. Attempting fallback...');

                // Tentar buscar detalhes do pagamento se houver pay_reference
                const payReference = payData.data?.pay_reference || payData.pay_reference;

                if (payReference) {
                    console.log(`Fetching payment details for reference: ${payReference}`);
                    try {
                        const checkPayRes = await fetch(`https://admin.appmax.com.br/api/v3/payment/${payReference}?access-token=${appmaxToken}`);
                        if (checkPayRes.ok) {
                            const checkPayData = await checkPayRes.json();
                            console.log('Payment details response:', JSON.stringify(checkPayData));

                            const checkPixInfo = checkPayData.data?.pix || checkPayData.pix;
                            if (checkPixInfo) {
                                responsePayload.pix_data = {
                                    qr_code_url: checkPixInfo.qrcode_url || checkPixInfo.qrcode || checkPixInfo.qr_code_url,
                                    copy_paste: checkPixInfo.emv || checkPixInfo.qrcode_text || checkPixInfo.qr_code_text,
                                    expiration: checkPixInfo.expiration_date || checkPixInfo.expires_at
                                };
                            }
                        }
                    } catch (err) {
                        console.error('Error fetching payment details:', err);
                    }
                }

                // Se ainda não temos pix_data, fallback para checkout URL
                if (!responsePayload.pix_data) {
                    console.log('Could not retrieve QR Code directly. Falling back to Checkout URL.');
                    const orderDataObj = orderData.data || orderData;
                    const checkoutUrl =
                        orderDataObj.pix_payment_link ||
                        orderDataObj.payment_link ||
                        orderDataObj.checkout_url ||
                        `https://pay.appmax.com.br/checkout/${orderId}`;

                    responsePayload.checkout_url = checkoutUrl;
                }
            }

        } else {
            console.log('Non-PIX payment. Using checkout URL if available...');
            const orderDataObj = orderData.data || orderData;
            const checkoutUrl =
                orderDataObj.pix_payment_link ||
                orderDataObj.payment_link ||
                orderDataObj.checkout_url ||
                `https://pay.appmax.com.br/checkout/${orderId}`;

            responsePayload.checkout_url = checkoutUrl;
        }

        // Update Supabase
        const supabase = createClient(
            Deno.env.get('SUPABASE_URL') ?? '',
            Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
        );

        await supabase
            .from('auditorias_contratos')
            .update({
                appmax_order_id: orderId,
                payment_status: 'pending',
                payment_method: payment_method,
                payment_metadata: responsePayload.pix_data || { checkout_url: responsePayload.checkout_url }
            })
            .eq('id', audit_id);

        console.log('Final response to frontend:', JSON.stringify(responsePayload, null, 2));

        return new Response(
            JSON.stringify(responsePayload),
            { headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );

    } catch (error) {
        console.error('FATAL ERROR:', error);
        return new Response(
            JSON.stringify({
                success: false,
                error: error instanceof Error ? error.message : 'Unknown error'
            }),
            { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );
    }
})
