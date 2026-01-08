
const GEMINI_API_KEY = Deno.env.get("GEMINI_API_KEY");

const corsHeaders = {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
};

Deno.serve(async (req) => {
    // Handle CORS preflight request
    if (req.method === "OPTIONS") {
        return new Response("ok", { headers: corsHeaders });
    }

    try {
        // 1. Validate Environment Variables
        if (!GEMINI_API_KEY) {
            throw new Error("GEMINI_API_KEY is not set in Supabase Secrets.");
        }

        // 2. Parse Request Body
        let body;
        try {
            body = await req.json();
        } catch (e) {
            throw new Error("Invalid JSON body.");
        }

        const { messages } = body;

        // 3. Call Google Gemini API (Using stable latest flash model)
        const response = await fetch(
            `https://generativelanguage.googleapis.com/v1beta/models/gemini-flash-latest:generateContent?key=${GEMINI_API_KEY}`,
            {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify({
                    contents: messages,
                }),
            }
        );

        // 4. Handle Gemini API Errors
        if (!response.ok) {
            const errorText = await response.text();
            throw new Error(`Gemini API Error (${response.status}): ${errorText}`);
        }

        // 5. Parse Gemini Response
        const data = await response.json();
        const generatedText = data.candidates?.[0]?.content?.parts?.[0]?.text;

        if (!generatedText) {
            throw new Error("AI returned an empty response. Raw: " + JSON.stringify(data));
        }

        return new Response(
            JSON.stringify({ generatedText }),
            {
                headers: { ...corsHeaders, "Content-Type": "application/json" },
                status: 200,
            }
        );

    } catch (error) {
        console.error("Function Error:", error);

        return new Response(
            JSON.stringify({
                generatedText: `⚠️ Error: ${error.message}`
            }),
            {
                headers: { ...corsHeaders, "Content-Type": "application/json" },
                status: 200,
            }
        );
    }
});
