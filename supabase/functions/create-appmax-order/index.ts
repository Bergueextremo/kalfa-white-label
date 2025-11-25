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
        console.log('Step 1: Creating customer in Appmax. Payload:', {
            firstname: customer.name.split(' ')[0],
            lastname: customer.name.split(' ').slice(1).join(' ') || 'Cliente',
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
            firstname: customer.name.split(' ')[0],
            lastname: customer.name.split(' ').slice(1).join(' ') || 'Cliente',
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
        // STEP 2: CREATE ORDER
        // ============================================================
        console.log('Step 2: Creating order in Appmax. Payload:', {
            customer_id: customerId,
            product: [{
                name: "Auditoria Jurídica Premium",
                price: "48.00",
                qty: "1",
                digital_product: 1
            }],
            shipping: "1.00",
            payment_type: payment_method
        });

        const orderPayload = {
            "access-token": appmaxToken,
            customer_id: customerId,
            product: [{
                name: "Auditoria Jurídica Premium",
                price: "48.00",
                qty: "1",
                digital_product: 1
            }],
            shipping: "1.00",
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
        // STEP 3: PROCESS PIX PAYMENT
        // ============================================================
        console.log('Processing PIX payment. Checking for PIX data...');
        
        let responsePayload: any = {
            success: true,
            order_id: orderId
        };

        // Check if PIX data is already in the order response
        const orderDataObj = orderData.data || orderData;
        
        if (orderDataObj.pix_qrcode || orderDataObj.pix_emv) {
            console.log('PIX data found in order response!');
            responsePayload.pix_data = {
                qr_code_url: orderDataObj.pix_qrcode,
                copy_paste: orderDataObj.pix_emv,
                expiration: orderDataObj.pix_expiration_date
            };
        } else {
            console.log('No PIX data found in response. Full response:', JSON.stringify(orderDataObj, null, 2));
            console.log('Using checkout URL as fallback:', orderDataObj.pix_payment_link || `https://pay.appmax.com.br/checkout/${orderId}`);
            responsePayload.checkout_url = orderDataObj.pix_payment_link || `https://pay.appmax.com.br/checkout/${orderId}`;
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
