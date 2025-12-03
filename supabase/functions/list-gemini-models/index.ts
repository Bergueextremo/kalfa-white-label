
Deno.serve(async (req) => {
    const apiKey = Deno.env.get('GEMINI_API_KEY')
    if (!apiKey) {
        return new Response(JSON.stringify({ error: "No API Key" }), {
            headers: { "Content-Type": "application/json" },
        })
    }
    const response = await fetch(
        `https://generativelanguage.googleapis.com/v1beta/models?key=${apiKey}`
    )
    const data = await response.json()
    return new Response(JSON.stringify(data), {
        headers: { "Content-Type": "application/json" },
    })
})
