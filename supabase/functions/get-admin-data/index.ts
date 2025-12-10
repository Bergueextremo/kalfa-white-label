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
        // Create Supabase client with Service Role Key to bypass RLS and access auth.users
        const supabaseAdmin = createClient(
            Deno.env.get('SUPABASE_URL') ?? '',
            Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? '',
            { auth: { autoRefreshToken: false, persistSession: false } }
        )

        // ============ SERVER-SIDE AUTHORIZATION CHECK ============
        const authHeader = req.headers.get('Authorization')
        if (!authHeader) {
            console.error('No authorization header provided')
            return new Response(
                JSON.stringify({ error: 'Unauthorized' }),
                { headers: { ...corsHeaders, 'Content-Type': 'application/json' }, status: 401 }
            )
        }

        const token = authHeader.replace('Bearer ', '')
        const { data: { user }, error: authError } = await supabaseAdmin.auth.getUser(token)
        
        if (authError || !user) {
            console.error('Invalid token or user not found:', authError)
            return new Response(
                JSON.stringify({ error: 'Unauthorized' }),
                { headers: { ...corsHeaders, 'Content-Type': 'application/json' }, status: 401 }
            )
        }

        // Check if user has admin role using the has_role function
        const { data: isAdmin, error: roleError } = await supabaseAdmin
            .rpc('has_role', { _user_id: user.id, _role: 'admin' })

        if (roleError || !isAdmin) {
            console.error('User is not admin:', user.email, roleError)
            return new Response(
                JSON.stringify({ error: 'Forbidden - Admin access required' }),
                { headers: { ...corsHeaders, 'Content-Type': 'application/json' }, status: 403 }
            )
        }

        console.log('Admin access verified for:', user.email)
        // ============ END AUTHORIZATION CHECK ============

        const { action, userId, page = 1, limit = 50 } = await req.json()

        if (action === 'list_users') {
            const { data: { users }, error: usersError } = await supabaseAdmin.auth.admin.listUsers({
                page: page,
                perPage: limit
            })

            if (usersError) throw usersError

            // Map users to a friendlier format
            const formattedUsers = users.map(u => ({
                id: u.id,
                email: u.email,
                name: u.user_metadata?.name || u.email?.split('@')[0] || 'Sem Nome',
                created_at: u.created_at,
                last_sign_in_at: u.last_sign_in_at,
                status: (u as any).banned_until ? 'Banned' : 'Active',
                type: u.user_metadata?.user_type || u.user_metadata?.type || 'PF',
                cpf: u.user_metadata?.cpf,
                cnpj: u.user_metadata?.cnpj
            }))

            return new Response(
                JSON.stringify({ users: formattedUsers }),
                { headers: { ...corsHeaders, 'Content-Type': 'application/json' }, status: 200 }
            )
        }

        if (action === 'list_sales') {
            // Fetch audits that are approved (sales)
            const { data: sales, error: salesError } = await supabaseAdmin
                .from('auditorias_contratos')
                .select('id, created_at, user_id, contract_type, payment_status')
                .eq('payment_status', 'approved')
                .order('created_at', { ascending: false })
                .range((page - 1) * limit, page * limit - 1)

            if (salesError) throw salesError

            // We need user emails for the sales report
            const userIds = [...new Set(sales.map(s => s.user_id))]
            const usersMap = new Map()

            for (const uid of userIds) {
                if (uid) {
                    const { data: { user } } = await supabaseAdmin.auth.admin.getUserById(uid)
                    if (user) {
                        usersMap.set(uid, user.email)
                    }
                }
            }

            const formattedSales = sales.map(s => ({
                id: s.id,
                date: s.created_at,
                user: usersMap.get(s.user_id) || 'Usuário Desconhecido',
                item: s.contract_type || 'Auditoria Avulsa',
                amount: 49.90, // Fixed price for now
                status: 'Approved'
            }))

            return new Response(
                JSON.stringify({ sales: formattedSales }),
                { headers: { ...corsHeaders, 'Content-Type': 'application/json' }, status: 200 }
            )
        }

        if (action === 'get_user_details') {
            if (!userId) throw new Error('UserId is required')

            // Get User Profile
            const { data: { user: targetUser }, error: userError } = await supabaseAdmin.auth.admin.getUserById(userId)
            if (userError) throw userError
            if (!targetUser) throw new Error('User not found')

            // Get User Activity (Audits)
            const { data: activity, error: activityError } = await supabaseAdmin
                .from('auditorias_contratos')
                .select('*')
                .eq('user_id', userId)
                .order('created_at', { ascending: false })

            if (activityError) throw activityError

            const userDetails = {
                id: targetUser.id,
                name: targetUser.user_metadata?.name || targetUser.email?.split('@')[0],
                email: targetUser.email,
                phone: targetUser.phone || 'N/A',
                document: targetUser.user_metadata?.document || 'N/A',
                type: targetUser.user_metadata?.type || 'PF',
                status: (targetUser as any).banned_until ? 'Banned' : 'Active',
                joinedAt: targetUser.created_at,
                credits: 0, // Placeholder
                purchases: activity.filter(a => a.payment_status === 'approved').map(a => ({
                    id: a.id,
                    date: a.created_at,
                    item: 'Auditoria Avulsa',
                    amount: 49.90
                })),
                activity: activity.map(a => ({
                    id: a.id,
                    date: a.created_at,
                    contract: a.contract_type || 'Contrato sem nome',
                    result: a.status
                }))
            }

            return new Response(
                JSON.stringify({ user: userDetails }),
                { headers: { ...corsHeaders, 'Content-Type': 'application/json' }, status: 200 }
            )
        }

        throw new Error('Invalid action')

    } catch (error) {
        console.error('Error in get-admin-data:', error)
        return new Response(
            JSON.stringify({ error: error instanceof Error ? error.message : 'Unknown error' }),
            { headers: { ...corsHeaders, 'Content-Type': 'application/json' }, status: 400 }
        )
    }
})
