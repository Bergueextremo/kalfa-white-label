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
        const { doc_type, doc_value } = await req.json()

        if (!doc_type || !doc_value) {
            throw new Error('doc_type and doc_value are required')
        }

        // Create Supabase client with Service Role Key to access auth.users
        const supabaseAdmin = createClient(
            Deno.env.get('SUPABASE_URL') ?? '',
            Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? '',
            { auth: { autoRefreshToken: false, persistSession: false } }
        )

        // List all users and find the one with matching CPF/CNPJ
        const { data: { users }, error: usersError } = await supabaseAdmin.auth.admin.listUsers()

        if (usersError) throw usersError

        const foundUser = users.find(u => {
            if (doc_type === 'cpf') {
                return u.user_metadata?.cpf === doc_value
            } else if (doc_type === 'cnpj') {
                return u.user_metadata?.cnpj === doc_value
            }
            return false
        })

        if (!foundUser || !foundUser.email) {
            return new Response(
                JSON.stringify({ error: 'Document not found' }),
                { headers: { ...corsHeaders, 'Content-Type': 'application/json' }, status: 404 }
            )
        }

        return new Response(
            JSON.stringify({ email: foundUser.email }),
            { headers: { ...corsHeaders, 'Content-Type': 'application/json' }, status: 200 }
        )

    } catch (error) {
        console.error('Error in get-email-by-document:', error)
        return new Response(
            JSON.stringify({ error: error instanceof Error ? error.message : 'Unknown error' }),
            { headers: { ...corsHeaders, 'Content-Type': 'application/json' }, status: 400 }
        )
    }
})
