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
        const { start_date, end_date } = await req.json()

        // Create Supabase client with Service Role Key to bypass RLS
        const supabaseAdmin = createClient(
            Deno.env.get('SUPABASE_URL') ?? '',
            Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? '',
            { auth: { autoRefreshToken: false, persistSession: false } }
        )

        // Fetch total audits count
        const { count: totalAudits, error: auditsError } = await supabaseAdmin
            .from('auditorias_contratos')
            .select('*', { count: 'exact', head: true })
            .gte('created_at', start_date)
            .lte('created_at', end_date)

        if (auditsError) throw auditsError

        // Fetch approved sales
        const { data: salesData, error: salesError } = await supabaseAdmin
            .from('auditorias_contratos')
            .select('id, created_at')
            .eq('payment_status', 'approved')
            .gte('created_at', start_date)
            .lte('created_at', end_date)

        if (salesError) throw salesError

        // Calculate metrics using fixed price of R$ 49.90 per audit
        const AUDIT_PRICE = 49.90
        const salesCount = salesData?.length || 0
        const totalSales = salesCount * AUDIT_PRICE
        const conversionRate = totalAudits ? (salesCount / totalAudits) * 100 : 0
        const averageTicket = AUDIT_PRICE // Fixed price, so average is always the same

        // Generate daily sales data for chart
        const dailySalesMap = new Map<string, number>();

        // Initialize map with 0 for all days in range? 
        // Or just return what we have and let frontend handle filling gaps?
        // Let's return what we have, but formatted.

        salesData?.forEach(sale => {
            const date = sale.created_at.split('T')[0]; // YYYY-MM-DD
            const current = dailySalesMap.get(date) || 0;
            dailySalesMap.set(date, current + AUDIT_PRICE);
        });

        const chartData = Array.from(dailySalesMap.entries()).map(([date, revenue]) => ({
            date,
            revenue
        })).sort((a, b) => a.date.localeCompare(b.date));

        // Fetch recent audits
        const { data: recentAudits, error: recentError } = await supabaseAdmin
            .from('auditorias_contratos')
            .select('id, created_at, contract_type, status, payment_status')
            .order('created_at', { ascending: false })
            .limit(20)

        if (recentError) throw recentError

        // Add fixed amount to recent audits
        const auditsWithAmount = recentAudits?.map(audit => ({
            ...audit,
            amount: audit.payment_status === 'approved' ? AUDIT_PRICE.toString() : '0'
        })) || []

        // Fetch total users count (Active Users proxy)
        // We fetch a larger page to get a reasonable count for this scale.
        const { data: { users: allUsers }, error: listUsersError } = await supabaseAdmin.auth.admin.listUsers({ page: 1, perPage: 1000 })
        const totalUsers = allUsers?.length || 0

        if (listUsersError) console.error('Error fetching users:', listUsersError)

        return new Response(
            JSON.stringify({
                metrics: {
                    totalAudits: totalAudits || 0,
                    totalSales,
                    conversionRate,
                    averageTicket,
                    totalUsers
                },
                recentAudits: auditsWithAmount,
                chartData // Added this
            }),
            {
                headers: { ...corsHeaders, 'Content-Type': 'application/json' },
                status: 200
            }
        )

    } catch (error) {
        console.error('Error fetching admin metrics:', error)
        return new Response(
            JSON.stringify({ error: error instanceof Error ? error.message : 'Unknown error' }),
            {
                headers: { ...corsHeaders, 'Content-Type': 'application/json' },
                status: 400
            }
        )
    }
})
