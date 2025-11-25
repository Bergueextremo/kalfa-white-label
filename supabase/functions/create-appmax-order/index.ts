import { createClient } from 'jsr:@supabase/supabase-js@2'

const corsHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

Deno.serve(async (req) => {
    // Tratamento de CORS
    if (req.method === 'OPTIONS') {
        return new Response('ok', { headers: corsHeaders })
    }

    try {
        const { customer, audit_id, payment_method } = await req.json()

        // Validação
        if (!customer?.cpf) throw new Error('CPF é obrigatório');

        const appmaxToken = Deno.env.get('JUSCONTRATO-APPMAX');
        if (!appmaxToken) throw new Error('Token Appmax não configurado');

        console.log(`>>> INICIANDO. Audit: ${audit_id}`);

        // ============================================================
        // PASSO 1: CRIAR CLIENTE (CUSTOMER)
        // ============================================================
        console.log('--- PASSO 1: Criando Cliente ---');

        const customerPayload = {
            "access-token": appmaxToken,
            firstname: customer.name.split(' ')[0],
            lastname: customer.name.split(' ').slice(1).join(' ') || 'Cliente',
            email: customer.email,
            telephone: customer.phone.replace(/\D/g, ''),
            postcode: "01310100", // CEP genérico para produto digital
            address_street: "Av Paulista",
            address_street_number: "1000",
            address_street_district: "Bela Vista",
            address_city: "São Paulo",
            address_state: "SP",
            ip: "127.0.0.1"
        };

        const custRes = await fetch('https://admin.appmax.com.br/api/v3/customer', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(customerPayload)
        });

        const custData = await custRes.json();

        if (!custData.success && custData.status !== 200) {
            console.error('Erro Customer:', custData);
            throw new Error('Erro ao criar cliente na Appmax');
        }

        const customerId = custData.data?.id || custData.id;
        console.log('Cliente ID:', customerId);

        // ============================================================
        // PASSO 2: CRIAR PEDIDO (ORDER)
        // ============================================================
        console.log('--- PASSO 2: Criando Pedido ---');

        const orderPayload = {
            "access-token": appmaxToken,
            customer_id: customerId,
            products: [
                {
                    sku: `AUDIT-${audit_id}`,
                    name: "Auditoria Jurídica Premium",
                    qty: 1,
                    price: 48.00,
                    digital_product: 1 // IMPORTANTE: Marca como infoproduto
                }
            ],
            shipping: 1.00, // Frete simbólico
            total: 49.00
        };

        const orderRes = await fetch('https://admin.appmax.com.br/api/v3/order', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(orderPayload)
        });

        const orderData = await orderRes.json();

        if (!orderData.success && orderData.status !== 200) {
            console.error('Erro Order:', orderData);
            throw new Error('Erro ao criar pedido na Appmax');
        }

        const orderId = orderData.data?.id || orderData.id;
        console.log('Pedido Criado ID:', orderId);

        // ============================================================
        // PASSO 3: EFETUAR PAGAMENTO (ESSENCIAL PARA O PIX)
        // ============================================================
        // É AQUI QUE O PIX É GERADO. SE NÃO FIZER ISSO, NADA ACONTECE.

        console.log('--- PASSO 3: Processando Pagamento ---');

        let responsePayload = {
            success: true,
            order_id: orderId,
            pix_data: null as any
        };

        if (payment_method === 'pix') {
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
                        document_number: customer.cpf.replace(/\D/g, '') // CPF Obrigatório
                    }
                }
            };

            const payRes = await fetch('https://admin.appmax.com.br/api/v3/payment/pix', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(pixPayload)
            });

            const payData = await payRes.json();
            console.log('Resposta Pagamento:', JSON.stringify(payData));

            if (!payData.success) {
                throw new Error('Erro ao processar pagamento: ' + (payData.text || 'Erro desconhecido'));
            }

            // AQUI pegamos o QR Code correto
            const pixInfo = payData.data?.pix || payData.pix;

            if (pixInfo) {
                responsePayload.pix_data = {
                    qr_code_url: pixInfo.qrcode_url, // URL da imagem do QR Code
                    copy_paste: pixInfo.emv || pixInfo.qrcode_text, // Código Copia e Cola
                    expiration: pixInfo.expiration_date
                };
            } else {
                throw new Error('Pagamento criado, mas Appmax não retornou dados do PIX.');
            }
        }

        // ============================================================
        // ATUALIZAR SUPABASE
        // ============================================================
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
                payment_metadata: responsePayload.pix_data
            })
            .eq('id', audit_id);

        console.log('SUCESSO TOTAL. Retornando PIX para o front.');

        return new Response(
            JSON.stringify(responsePayload),
            { headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );

    } catch (error) {
        console.error('ERRO FATAL:', error);
        return new Response(
            JSON.stringify({
                success: false,
                error: error.message
            }),
            { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );
    }
})