import { createClient } from 'npm:@supabase/supabase-js@2'

const corsHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

Deno.serve(async (req) => {
    // Handle CORS preflight
    if (req.method === 'OPTIONS') {
        return new Response('ok', { headers: corsHeaders })
    }

    try {
        const { audit_id, order_id } = await req.json();

        if (!audit_id && !order_id) {
            throw new Error('audit_id ou order_id é obrigatório');
        }

        // Se for ID temporário e não tiver order_id, retorna pendente sem erro
        if (audit_id && String(audit_id).startsWith('temp-') && !order_id) {
            console.log('ID temporário detectado, retornando pending');
            return new Response(JSON.stringify({
                success: true,
                payment_status: 'pending',
                audit_id: audit_id
            }), {
                headers: { ...corsHeaders, 'Content-Type': 'application/json' },
                status: 200
            });
        }

        console.log('Verificando status do pagamento:', { audit_id, order_id });

        // Initialize Supabase client
        const supabase = createClient(
            Deno.env.get('SUPABASE_URL') ?? '',
            Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
        );

        // Query the database
        const isTempAuditId = audit_id && String(audit_id).startsWith('temp-');

        // Se for ID temporário e não tiver order_id, retorna pendente sem erro
        if (isTempAuditId && !order_id) {
            console.log('ID temporário detectado sem Order ID, retornando pending');
            return new Response(JSON.stringify({
                success: true,
                payment_status: 'pending',
                audit_id: audit_id
            }), {
                headers: { ...corsHeaders, 'Content-Type': 'application/json' },
                status: 200
            });
        }

        // Query the database
        let query = supabase
            .from('auditorias_contratos')
            .select('id, payment_status, payment_metadata, appmax_order_id, user_id');

        if (audit_id && !isTempAuditId) {
            // Só busca por ID se for um UUID válido
            query = query.eq('id', audit_id);
        } else if (order_id) {
            // Se não tiver audit_id válido, busca pelo order_id
            query = query.eq('appmax_order_id', order_id);
        } else {
            throw new Error('Nenhum ID válido fornecido para busca');
        }

        const { data, error } = await query.single();

        if (error) {
            // Se não encontrou o registro (PGRST116), retorna pendente em vez de erro 400
            if (error.code === 'PGRST116') {
                console.log('Registro não encontrado, retornando pending');
                return new Response(JSON.stringify({
                    success: true,
                    payment_status: 'pending'
                }), {
                    headers: { ...corsHeaders, 'Content-Type': 'application/json' },
                    status: 200
                });
            }

            console.error('Erro ao buscar status:', error);
            throw error;
        }

        console.log('Status encontrado:', data?.payment_status);

        return new Response(JSON.stringify({
            success: true,
            payment_status: data?.payment_status || 'pending',
            audit_id: data?.id,
            order_id: data?.appmax_order_id,
            metadata: data?.payment_metadata
        }), {
            headers: { ...corsHeaders, 'Content-Type': 'application/json' },
            status: 200
        });

    } catch (error: any) {
        console.error('ERRO:', error.message);

        return new Response(JSON.stringify({
            success: false,
            error: error.message,
            payment_status: 'pending'
        }), {
            status: 400,
            headers: { ...corsHeaders, 'Content-Type': 'application/json' }
        });
    }
})
