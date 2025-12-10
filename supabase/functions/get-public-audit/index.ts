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
        const { audit_id } = await req.json()

        if (!audit_id) {
            console.error('Missing audit_id in request')
            throw new Error('Audit ID is required')
        }

        // Validate UUID format
        const uuidRegex = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i
        if (!uuidRegex.test(audit_id)) {
            console.error(`Invalid audit_id format received: ${audit_id}`)
            throw new Error('Invalid audit ID format')
        }

        // Extract JWT from Authorization header to verify ownership
        const authHeader = req.headers.get('Authorization')
        if (!authHeader || !authHeader.startsWith('Bearer ')) {
            console.warn('Missing or invalid Authorization header')
            return new Response(
                JSON.stringify({ error: 'Authentication required' }),
                { headers: { ...corsHeaders, 'Content-Type': 'application/json' }, status: 401 }
            )
        }

        const jwt = authHeader.replace('Bearer ', '')

        // Create Supabase client with user's JWT to respect RLS
        const supabaseClient = createClient(
            Deno.env.get('SUPABASE_URL') ?? '',
            Deno.env.get('SUPABASE_ANON_KEY') ?? '',
            {
                global: {
                    headers: { Authorization: `Bearer ${jwt}` }
                }
            }
        )

        // Verify user is authenticated
        const { data: { user }, error: userError } = await supabaseClient.auth.getUser(jwt)
        
        if (userError || !user) {
            console.warn('Failed to authenticate user:', userError?.message)
            return new Response(
                JSON.stringify({ error: 'Invalid or expired authentication token' }),
                { headers: { ...corsHeaders, 'Content-Type': 'application/json' }, status: 401 }
            )
        }

        console.log(`Authenticated user ${user.id} requesting audit ${audit_id}`)

        // Use service role to fetch audit but verify ownership
        const supabaseAdmin = createClient(
            Deno.env.get('SUPABASE_URL') ?? '',
            Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
        )

        const { data, error } = await supabaseAdmin
            .from('auditorias_contratos')
            .select('*')
            .eq('id', audit_id)
            .single()

        if (error) {
            console.error('Database error fetching audit:', error.message)
            throw new Error('Audit not found')
        }

        // CRITICAL: Verify ownership - user can only access their own audits
        if (data.user_id !== user.id) {
            console.warn(`User ${user.id} attempted to access audit ${audit_id} owned by ${data.user_id}`)
            return new Response(
                JSON.stringify({ error: 'Access denied' }),
                { headers: { ...corsHeaders, 'Content-Type': 'application/json' }, status: 403 }
            )
        }

        console.log(`Successfully returning audit ${audit_id} to owner ${user.id}`)

        return new Response(
            JSON.stringify(data),
            {
                headers: { ...corsHeaders, 'Content-Type': 'application/json' },
                status: 200
            }
        )

    } catch (error) {
        console.error('Error in get-public-audit:', error)
        return new Response(
            JSON.stringify({ error: error instanceof Error ? error.message : 'Unknown error' }),
            {
                headers: { ...corsHeaders, 'Content-Type': 'application/json' },
                status: 400
            }
        )
    }
})
