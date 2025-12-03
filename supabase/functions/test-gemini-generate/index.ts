
Deno.serve(async (req) => {
    const apiKey = Deno.env.get('GEMINI_API_KEY')
    const response = await fetch(
        `https://generativelanguage.googleapis.com/v1/models/gemini-pro:generateContent?key=${apiKey}`,
        {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({
                contents: [{ parts: [{ text: "Hello" }] }]
            })
        }
    )
    const data = await response.json()
    return new Response(JSON.stringify(data), { headers: { 'Content-Type': 'application/json' } })
})
