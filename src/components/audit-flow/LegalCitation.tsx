import React from 'react';
import { Scale, ExternalLink } from 'lucide-react';

interface LegalCitationProps {
    text: string;
}

export function LegalCitation({ text }: LegalCitationProps) {
    if (!text) return null;

    // Helper function to process text and add links
    const processText = (inputText: string) => {
        // Regex patterns for common Brazilian legal terms
        const patterns = [
            { regex: /(Lei nº\s?[\d\.]+)/gi, url: 'https://www.google.com/search?q=$1' },
            { regex: /(Art\.\s?\d+[º°]?\s?[\w\d]*)/gi, url: 'https://www.google.com/search?q=$1' },
            { regex: /(Súmula\s?\d+)/gi, url: 'https://www.google.com/search?q=$1' },
            { regex: /(Código Civil)/gi, url: 'https://www.google.com/search?q=Código+Civil+Brasileiro' },
            { regex: /(CDC|Código de Defesa do Consumidor)/gi, url: 'https://www.google.com/search?q=Código+de+Defesa+do+Consumidor' },
            { regex: /(CLT|Consolidação das Leis do Trabalho)/gi, url: 'https://www.google.com/search?q=CLT' },
            { regex: /(CF\/88|Constituição Federal)/gi, url: 'https://www.google.com/search?q=Constituição+Federal+1988' },
        ];

        // We need to split the text and reconstruct it with links
        // This is a simplified approach. For complex nested matches, a parser is better, 
        // but for this purpose, we can iterate or use a simpler replacement strategy.
        // Since React requires elements, we can't just use string.replace.

        // Let's try a simpler approach: split by the most common delimiters and check matches?
        // Or better: use a library like react-string-replace if available? 
        // Since we don't have it, we'll implement a basic splitter.

        // Actually, let's just use a simple split/map for the most prominent ones if they don't overlap.
        // Given the complexity of regex replacement in React without `dangerouslySetInnerHTML` (which we want to avoid for XSS),
        // and without external libs, we can try to match the *first* occurrence, split, and recurse?
        // Or just render the text and add a "Pesquisar Base Legal" button? 
        // The requirement says "Transforme esses termos em links".

        // Let's use a safe approach: `dangerouslySetInnerHTML` is risky if we don't sanitize.
        // But since this text comes from our AI (trusted source?), it might be okay? 
        // No, let's stick to a safe React array map approach.

        // Simplified: We will just link the whole block to a search if it's short, 
        // OR we just highlight the text and provide a search link at the end.
        // BUT the user asked for specific terms to be links.

        // Let's try to match the whole text against the regexes and replace.
        // We can do this by splitting the string by the regex.

        let parts: (string | JSX.Element)[] = [inputText];

        patterns.forEach(({ regex, url }) => {
            const newParts: (string | JSX.Element)[] = [];
            parts.forEach(part => {
                if (typeof part !== 'string') {
                    newParts.push(part);
                    return;
                }

                // Split by regex, keeping the separator (captured group)
                // Note: JS split with regex capturing group includes the captures in the result
                const split = part.split(regex);

                for (let i = 0; i < split.length; i++) {
                    const chunk = split[i];
                    // If this chunk matches the regex, it's our term
                    if (chunk.match(regex)) {
                        const searchUrl = url.replace('$1', encodeURIComponent(chunk));
                        newParts.push(
                            <a
                                key={`${i}-${chunk}`}
                                href={searchUrl}
                                target="_blank"
                                rel="noopener noreferrer"
                                className="text-blue-700 hover:text-blue-900 hover:underline font-semibold inline-flex items-center gap-0.5"
                                title="Pesquisar Jurisprudência"
                            >
                                {chunk}
                                <ExternalLink className="w-3 h-3 opacity-50" />
                            </a>
                        );
                    } else if (chunk) {
                        newParts.push(chunk);
                    }
                }
            });
            parts = newParts;
        });

        return parts;
    };

    return (
        <div className="mt-4 bg-slate-50 border-l-4 border-blue-600 rounded-r-lg p-4 shadow-sm">
            <div className="flex items-center gap-2 mb-2">
                <div className="p-1.5 bg-blue-100 rounded-md">
                    <Scale className="w-4 h-4 text-blue-700" />
                </div>
                <h4 className="text-xs font-bold text-blue-700 uppercase tracking-wider">
                    Base Legal & Jurisprudência
                </h4>
            </div>
            <p className="text-sm text-slate-700 font-serif italic leading-relaxed">
                "{processText(text)}"
            </p>
        </div>
    );
}
