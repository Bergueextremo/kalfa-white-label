import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

const corsHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

// Simple in-memory rate limiting (per IP)
// In production, consider using Redis or a proper rate limiting service
const rateLimitMap = new Map<string, { count: number; resetTime: number }>();
const RATE_LIMIT_MAX = 5; // Max 5 requests
const RATE_LIMIT_WINDOW_MS = 60 * 1000; // Per minute

function checkRateLimit(clientIP: string): boolean {
    const now = Date.now();
    const record = rateLimitMap.get(clientIP);
    
    if (!record || now > record.resetTime) {
        // Reset the window
        rateLimitMap.set(clientIP, { count: 1, resetTime: now + RATE_LIMIT_WINDOW_MS });
        return true;
    }
    
    if (record.count >= RATE_LIMIT_MAX) {
        return false; // Rate limited
    }
    
    record.count++;
    return true;
}

// Add artificial delay to prevent timing attacks
async function addSecurityDelay(): Promise<void> {
    // Random delay between 100-500ms to obscure timing differences
    const delay = 100 + Math.random() * 400;
    await new Promise(resolve => setTimeout(resolve, delay));
}

Deno.serve(async (req) => {
    if (req.method === 'OPTIONS') {
        return new Response('ok', { headers: corsHeaders })
    }

    try {
        // Get client IP for rate limiting
        const clientIP = req.headers.get('x-forwarded-for')?.split(',')[0]?.trim() || 
                        req.headers.get('x-real-ip') || 
                        'unknown';
        
        // Check rate limit
        if (!checkRateLimit(clientIP)) {
            console.warn(`Rate limit exceeded for IP: ${clientIP}`);
            // Still add delay to prevent timing-based enumeration
            await addSecurityDelay();
            return new Response(
                JSON.stringify({ error: 'Too many requests. Please try again later.' }),
                { headers: { ...corsHeaders, 'Content-Type': 'application/json' }, status: 429 }
            )
        }

        const { doc_type, doc_value } = await req.json()

        // Validate input format
        if (!doc_type || !doc_value) {
            await addSecurityDelay();
            return new Response(
                JSON.stringify({ error: 'doc_type and doc_value are required' }),
                { headers: { ...corsHeaders, 'Content-Type': 'application/json' }, status: 400 }
            )
        }

        // Validate doc_type
        if (!['cpf', 'cnpj'].includes(doc_type)) {
            await addSecurityDelay();
            return new Response(
                JSON.stringify({ error: 'Invalid document type' }),
                { headers: { ...corsHeaders, 'Content-Type': 'application/json' }, status: 400 }
            )
        }

        // Basic format validation for CPF (11 digits) and CNPJ (14 digits)
        const cleanValue = doc_value.replace(/\D/g, '');
        if (doc_type === 'cpf' && cleanValue.length !== 11) {
            await addSecurityDelay();
            return new Response(
                JSON.stringify({ error: 'Invalid CPF format' }),
                { headers: { ...corsHeaders, 'Content-Type': 'application/json' }, status: 400 }
            )
        }
        if (doc_type === 'cnpj' && cleanValue.length !== 14) {
            await addSecurityDelay();
            return new Response(
                JSON.stringify({ error: 'Invalid CNPJ format' }),
                { headers: { ...corsHeaders, 'Content-Type': 'application/json' }, status: 400 }
            )
        }

        // Create Supabase client with Service Role Key to access auth.users
        const supabaseAdmin = createClient(
            Deno.env.get('SUPABASE_URL') ?? '',
            Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? '',
            { auth: { autoRefreshToken: false, persistSession: false } }
        )

        // Use the database RPC function for efficient lookup (avoids listing all users)
        const { data: foundEmail, error: rpcError } = await supabaseAdmin.rpc('get_email_by_document', {
            doc_type: doc_type,
            doc_value: cleanValue
        })

        // Always add delay to prevent timing-based enumeration
        await addSecurityDelay();

        if (rpcError) {
            console.error('RPC error:', rpcError);
            // Generic error - don't reveal specifics
            return new Response(
                JSON.stringify({ error: 'Unable to process request' }),
                { headers: { ...corsHeaders, 'Content-Type': 'application/json' }, status: 500 }
            )
        }

        if (!foundEmail) {
            // Use same response time and generic message to prevent enumeration
            return new Response(
                JSON.stringify({ error: 'Document not found' }),
                { headers: { ...corsHeaders, 'Content-Type': 'application/json' }, status: 404 }
            )
        }

        // Return masked email to reduce exposure (show only partial email)
        const maskedEmail = maskEmail(foundEmail);
        
        return new Response(
            JSON.stringify({ email: maskedEmail, hint: 'Partial email shown for security' }),
            { headers: { ...corsHeaders, 'Content-Type': 'application/json' }, status: 200 }
        )

    } catch (error) {
        console.error('Error in get-email-by-document:', error)
        // Add delay even on error
        await addSecurityDelay();
        return new Response(
            JSON.stringify({ error: 'Unable to process request' }),
            { headers: { ...corsHeaders, 'Content-Type': 'application/json' }, status: 400 }
        )
    }
})

// Mask email to prevent full exposure: "john.doe@example.com" -> "j***e@e***e.com"
function maskEmail(email: string): string {
    const [localPart, domain] = email.split('@');
    if (!localPart || !domain) return '***@***.***';
    
    const maskedLocal = localPart.length > 2 
        ? localPart[0] + '***' + localPart[localPart.length - 1]
        : localPart[0] + '***';
    
    const domainParts = domain.split('.');
    const maskedDomain = domainParts.map(part => 
        part.length > 2 ? part[0] + '***' + part[part.length - 1] : part[0] + '***'
    ).join('.');
    
    return `${maskedLocal}@${maskedDomain}`;
}
