import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

const corsHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

Deno.serve(async (req) => {
    if (req.method === 'OPTIONS') {
        return new Response('ok', { headers: corsHeaders })
    }

    try {
        const { order_id } = await req.json()

        if (!order_id) {
            throw new Error('order_id é obrigatório')
        }

        // Initialize Supabase Admin
        const supabaseAdmin = createClient(
            Deno.env.get('SUPABASE_URL') ?? '',
            Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
        )

        // Get user from auth header
        const supabaseAuth = createClient(
            Deno.env.get('SUPABASE_URL') ?? '',
            Deno.env.get('SUPABASE_ANON_KEY') ?? '',
            { global: { headers: { Authorization: req.headers.get('Authorization')! } } }
        )

        const { data: { user } } = await supabaseAuth.auth.getUser()
        if (!user) throw new Error('Usuário não autenticado')

        console.log('[Check Payment] Verificando status do pedido:', order_id);

        // Check in credit_purchases table
        const { data: purchase, error } = await supabaseAdmin
            .from('credit_purchases')
            .select('*')
            .eq('appmax_order_id', order_id)
            .eq('user_id', user.id)
            .single()

        if (error) {
            console.error('[Check Payment] Erro ao buscar compra:', error);
            throw new Error('Compra não encontrada')
        }

        console.log('[Check Payment] Status atual:', purchase.payment_status);

        // If already approved, add credits if not done yet
        if (purchase.payment_status === 'approved') {
            // Check if credits were already added
            const { data: profile } = await supabaseAdmin
                .from('profiles')
                .select('credits')
                .eq('id', user.id)
                .single()

            // This is a simple check - in production you'd want a more robust system
            // to track if credits were already added for this purchase
            console.log('[Check Payment] Créditos atuais do usuário:', profile?.credits);
        }

        return new Response(
            JSON.stringify({
                success: true,
                status: purchase.payment_status,
                order_id: purchase.appmax_order_id,
                credits: purchase.credits,
                amount: purchase.amount
            }),
            { headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        )

    } catch (error) {
        console.error('[Check Payment] Erro:', error);
        return new Response(
            JSON.stringify({
                success: false,
                error: error instanceof Error ? error.message : 'Erro desconhecido'
            }),
            {
                headers: { ...corsHeaders, 'Content-Type': 'application/json' },
                status: 400
            }
        )
    }
})
