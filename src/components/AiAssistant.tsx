import { useState, useEffect, useRef } from "react";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardFooter, CardHeader, CardTitle } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { ScrollArea } from "@/components/ui/scroll-area";
import { useAuth } from "@/contexts/AuthContext";
import { supabase } from "@/integrations/supabase/client";
import { X, Send, Bot, Loader2, Sparkles, MessageCircle, CheckCheck } from "lucide-react";
import { cn } from "@/lib/utils";
import { toast } from "sonner";
import ReactMarkdown from 'react-markdown';
import { GoogleGenAI } from "@google/genai";
import { Link } from "react-router-dom";

interface Message {
    role: "user" | "model";
    content: string;
}

const SYSTEM_INSTRUCTION = `
[PERSONA/IDENTIDADE]
Você é Juliana Vieira, Auditora-Chefe da Jus Contratos. Atue como uma atendente técnica, firme e extremamente direta.
Sempre se identifique como Juliana Vieira da Jus Contratos.

[REGRA DE OURO - CAPTURA DE LEAD]
Sua missão principal é converter o visitante em lead. 
- Se o usuário ainda NÃO forneceu NOME e WHATSAPP, não forneça análises, dicas ou links. Responda: "Para iniciar sua Consulta Jurídica e identificar abusos, preciso primeiro registrar seu NOME e WHATSAPP. Qual seu contato?"
- SE O USUÁRIO JÁ FORNECEU OS DADOS (ver Contexto abaixo), prossiga diretamente para a solução/direcionamento técnico sem pedir os dados novamente.

[RESTRIÇÕES DE RESPOSTA]
- TAMANHO MÁXIMO: 350 caracteres. Seja breve e impactante.
- ESTILO: Use frases curtas. Evite apresentações longas ou "juridiquês" cansativo.
- FOCO: Direcione sempre para a abertura do protocolo técnico através dos dados de contato.

[MAPEAMENTO DE CTAs - USE EXATAMENTE ESTES LINKS]
Quando o usuário pedir o link ou estiver pronto para prosseguir, envie OBRIGATORIAMENTE o link em formato Markdown:
- Para Contratos (Geral, Financiamentos, Aluguel, Prestação de Serviço): [CLIQUE AQUI PARA AUDITORIA DE CONTRATO](/consultas)
- Para Leilões: [CLIQUE AQUI PARA AUDITORIA DE LEILÃO](/leilaoblindado)

[ESCOPO TÉCNICO - O QUE NÓS FAZEMOS]
Nós fazemos auditoria em TODOS estes tipos de documentos:
1. Financiamento de Veículo (Juros abusivos)
2. Arrematação em Leilão (Dívidas ocultas)
3. Aluguel & Imobiliário (Multas e reajustes)
4. Empréstimo Bancário & Consignado
5. Empresarial & Contrato Social
6. Prestação de Serviços
7. Outros Contratos (Consulta Jurídica Genérica)
Diga sempre que SIM, nós analisamos aluguel e imobiliário.

[EXEMPLO DE COMPORTAMENTO]
Usuário: "Qual o link?"
Você: "O protocolo já está ativo, [Nome]. Para sua segurança e economia, acesse agora: [CLIQUE AQUI PARA AUDITORIA DE CONTRATO](/consultas). É lá que faremos a análise dos abusos."
`;

export function AiAssistant() {
    const [isOpen, setIsOpen] = useState(false);
    const [messages, setMessages] = useState<Message[]>([]);
    const [inputValue, setInputValue] = useState("");
    const [isLoading, setIsLoading] = useState(false);
    const { user } = useAuth();
    const scrollAreaRef = useRef<HTMLDivElement>(null);
    const hasInitialized = useRef(false);

    // Notification states
    const [showNotification, setShowNotification] = useState(false);
    const [showTyping, setShowTyping] = useState(false);
    const [showBubbleMessage, setShowBubbleMessage] = useState(false);

    // Lead capture states
    const [hasSubmittedLead, setHasSubmittedLead] = useState(() => {
        return localStorage.getItem("jus_chat_lead_submitted") === "true";
    });
    const [leadName, setLeadName] = useState(() => {
        return localStorage.getItem("jus_chat_lead_name") || "";
    });
    const [leadWhatsapp, setLeadWhatsapp] = useState(() => {
        return localStorage.getItem("jus_chat_lead_phone") || "";
    });
    const [leadEmail, setLeadEmail] = useState(() => {
        return localStorage.getItem("jus_chat_lead_email") || "";
    });
    const [isSubmittingLead, setIsSubmittingLead] = useState(false);

    // Automatically bypass lead form if user is authenticated
    useEffect(() => {
        if (user && !hasSubmittedLead) {
            setHasSubmittedLead(true);
            setLeadName(user.name || "Cliente");
            setLeadEmail(user.email || "");
            // Persist this state as well
            localStorage.setItem("jus_chat_lead_submitted", "true");
            localStorage.setItem("jus_chat_lead_name", user.name || "Cliente");
            localStorage.setItem("jus_chat_lead_email", user.email || "");
        }
    }, [user, hasSubmittedLead]);

    // Animation sequence for notification
    useEffect(() => {
        const showNotificationTimer = setTimeout(() => {
            if (!isOpen) setShowNotification(true);
        }, 10000);

        const showTypingTimer = setTimeout(() => {
            if (!isOpen) setShowTyping(true);
        }, 11500);

        const showMessageTimer = setTimeout(() => {
            if (!isOpen) {
                setShowTyping(false);
                setShowBubbleMessage(true);
            }
        }, 13500);

        return () => {
            clearTimeout(showNotificationTimer);
            clearTimeout(showTypingTimer);
            clearTimeout(showMessageTimer);
        };
    }, [isOpen]);

    useEffect(() => {
        if (scrollAreaRef.current) {
            const scrollContainer = scrollAreaRef.current.querySelector('[data-radix-scroll-area-viewport]');
            if (scrollContainer) {
                scrollContainer.scrollTop = scrollContainer.scrollHeight;
            }
        }
    }, [messages, isOpen, isLoading]);

    useEffect(() => {
        if (isOpen && !hasInitialized.current) {
            const initChat = async () => {
                hasInitialized.current = true;
                const userName = user?.name || leadName || "Visitante";
                const initialContext = `O usuário se chama ${userName}. Inicie o atendimento agora como Auditor-Chefe.`;

                setIsLoading(true);
                try {
                    const apiKey = import.meta.env.VITE_GEMINI_API_KEY;
                    if (!apiKey) throw new Error("API Key configuration missing");

                    const ai = new GoogleGenAI({ apiKey });
                    const chat = ai.chats.create({
                        model: 'gemini-flash-latest',
                        config: { systemInstruction: SYSTEM_INSTRUCTION },
                        history: []
                    });

                    const response = await chat.sendMessage({ message: initialContext });

                    if (response.text) {
                        setMessages([{ role: "model", content: response.text }]);
                    }
                } catch (error) {
                    console.error("Initialization error:", error);
                    setMessages([{
                        role: "model",
                        content: "Olá. Sistema de auditoria conectado. Como posso proteger seu patrimônio hoje?"
                    }]);
                } finally {
                    setIsLoading(false);
                }
            };
            initChat();
        }
    }, [isOpen, user]);

    const handleLeadSubmit = async (e: React.FormEvent) => {
        e.preventDefault();

        if (!leadName.trim() || !leadWhatsapp.trim() || !leadEmail.trim()) {
            toast.error("Por favor, preencha todos os campos.");
            return;
        }

        setIsSubmittingLead(true);

        try {
            const { error } = await supabase
                .from('chat_leads')
                .insert([
                    {
                        name: leadName.trim(),
                        whatsapp: leadWhatsapp.trim(),
                        email: leadEmail.trim()
                    }
                ]);

            if (error) throw error;

            // Persist data in localStorage
            localStorage.setItem("jus_chat_lead_submitted", "true");
            localStorage.setItem("jus_chat_lead_name", leadName.trim());
            localStorage.setItem("jus_chat_lead_phone", leadWhatsapp.trim());
            localStorage.setItem("jus_chat_lead_email", leadEmail.trim());

            toast.success("Dados registrados! Iniciando atendimento...");
            setHasSubmittedLead(true);

            // Definir boas-vindas personalizadas diretamente para economizar API (evita erro 429)
            const personalizedGreeting = `Olá ${leadName.trim()}, eu sou a Juliana Vieira da Jus Contratos. Em que podemos te ajudar hoje? Através das nossas consultas você economiza e protege seu patrimônio contra abusos bancários. Qual o documento que precisa de uma análise imediata?`;

            setMessages([{
                role: "model",
                content: personalizedGreeting
            }]);
        } catch (error: any) {
            console.error("Error saving lead:", error);
            toast.error("Erro ao registrar dados. Tente novamente.");
        } finally {
            setIsSubmittingLead(false);
        }
    };

    const handleSendMessage = async () => {
        if (!inputValue.trim() || isLoading) return;

        const userMessage = inputValue;
        setMessages((prev) => [...prev, { role: "user", content: userMessage }]);
        setInputValue("");
        setIsLoading(true);

        try {
            const apiKey = import.meta.env.VITE_GEMINI_API_KEY;
            if (!apiKey) {
                console.error("API Key not found in VITE_GEMINI_API_KEY");
                toast.error("Configuração de API ausente.");
                throw new Error("Missing API Key");
            }

            const ai = new GoogleGenAI({ apiKey });

            const history = messages.map(m => ({
                role: m.role,
                parts: [{ text: m.content }]
            }));

            const chat = ai.chats.create({
                model: 'gemini-flash-latest',
                config: {
                    systemInstruction: SYSTEM_INSTRUCTION + `\n\nContexto: Usuário ${leadName || user?.name || "Visitante"}. WhatsApp: ${leadWhatsapp || "Não informado"}.`,
                },
                history: history
            });

            const result = await chat.sendMessage({ message: userMessage });
            const responseText = result.text;

            if (responseText) {
                setMessages((prev) => [...prev, { role: "model", content: responseText }]);
            }
        } catch (error: any) {
            console.error("Error sending message:", error);

            let errorMessage = "Erro de conexão com o Auditor.";
            if (error?.message?.includes("API Key")) {
                errorMessage = "Erro de configuração: Chave de API inválida ou ausente.";
            } else if (error?.status === 429) {
                errorMessage = "Sistema sobrecarregado. Tente novamente em instantes.";
            }

            toast.error(errorMessage);
            setMessages((prev) => [...prev, { role: "model", content: errorMessage }]);
        } finally {
            setIsLoading(false);
        }
    };

    const handleKeyDown = (e: React.KeyboardEvent) => {
        if (e.key === "Enter" && !e.shiftKey) {
            e.preventDefault();
            handleSendMessage();
        }
    };

    const handleNotificationClick = () => {
        setShowNotification(false);
        setShowTyping(false);
        setShowBubbleMessage(false);
        setIsOpen(true);
    };

    return (
        <>
            {/* Notification Bubble */}
            {showNotification && !isOpen && (
                <div
                    className="fixed bottom-6 right-6 z-50 cursor-pointer animate-scale-in"
                    onClick={handleNotificationClick}
                >
                    <div className="bg-white/95 backdrop-blur-md border border-[#00C851]/30 rounded-2xl shadow-2xl p-4 max-w-[280px] md:max-w-xs animate-slide-up relative overflow-hidden group">
                        {/* Glow effect */}
                        <div className="absolute inset-0 bg-gradient-to-br from-[#00C851]/5 to-transparent opacity-50 group-hover:opacity-100 transition-opacity"></div>

                        <div className="flex items-start space-x-3 relative z-10">
                            <div className="w-10 h-10 rounded-full overflow-hidden flex-shrink-0 shadow-lg border border-white/20 bg-[#002B5C] flex items-center justify-center">
                                <img src="/auditora.png" alt="Auditora Jus Contratos" className="w-full h-full object-cover" />
                            </div>
                            <div className="flex-1 min-w-0">
                                <div className="mb-1 flex items-center justify-between">
                                    <h4 className="font-bold text-[#002B5C] text-sm truncate">
                                        Juliana Vieira | Jus Contratos
                                    </h4>
                                    <span className="flex h-2 w-2 rounded-full bg-[#00C851] animate-pulse"></span>
                                </div>
                                {showTyping && (
                                    <div className="flex items-center space-x-1 py-1">
                                        <div className="flex space-x-1">
                                            <div className="w-1.5 h-1.5 bg-[#002B5C] rounded-full animate-bounce"></div>
                                            <div className="w-1.5 h-1.5 bg-[#002B5C] rounded-full animate-bounce [animation-delay:0.1s]"></div>
                                            <div className="w-1.5 h-1.5 bg-[#002B5C] rounded-full animate-bounce [animation-delay:0.2s]"></div>
                                        </div>
                                        <span className="text-[10px] text-gray-500 ml-2 font-medium italic">digitando...</span>
                                    </div>
                                )}
                                {showBubbleMessage && (
                                    <div className="bg-[#002B5C]/5 rounded-lg p-2 mt-1 border border-black/5 animate-in fade-in slide-in-from-top-1 duration-500">
                                        <p className="text-sm text-[#002B5C] leading-snug font-medium">
                                            👋 Olá! Precisa de ajuda com algum contrato ou leilão bancário?
                                        </p>
                                    </div>
                                )}
                            </div>
                        </div>
                    </div>
                </div>
            )}

            {/* Floating Button */}
            {!showNotification && !isOpen && (
                <div className="fixed bottom-6 right-6 z-50">
                    <Button
                        onClick={() => setIsOpen(true)}
                        className="w-16 h-16 rounded-full bg-gradient-primary shadow-xl hover:shadow-[#00C851]/40 transition-all duration-500 animate-pulse-glow hover:scale-110 active:scale-95 group"
                        size="icon"
                    >
                        <MessageCircle className="w-8 h-8 text-white group-hover:rotate-[15deg] transition-transform" />
                    </Button>
                </div>
            )}

            {/* Chat Window */}
            {isOpen && (
                <div className="fixed bottom-6 right-4 md:right-8 z-50 w-[95vw] md:w-[420px] h-[600px] max-h-[90vh] flex flex-col shadow-2xl overflow-hidden animate-slide-in-right rounded-3xl border border-white/20 bg-white/95 backdrop-blur-xl">
                    {/* Header */}
                    <div className="bg-[#002B5C] p-5 border-b border-white/10 shrink-0 relative overflow-hidden">
                        {/* Background subtle glow */}
                        <div className="absolute top-0 right-0 w-32 h-32 bg-[#00C851]/10 rounded-full blur-3xl -mr-10 -mt-10"></div>

                        <div className="flex items-center justify-between relative z-10">
                            <div className="flex items-center space-x-3">
                                <div className="w-12 h-12 rounded-2xl overflow-hidden bg-white/10 backdrop-blur-sm border border-white/20 flex items-center justify-center shadow-inner group transition-transform hover:scale-105 duration-300">
                                    <img src="/auditora.png" alt="Auditora Jus Contratos" className="w-full h-full object-cover" />
                                </div>
                                <div>
                                    <h3 className="font-bold text-base text-white tracking-tight">
                                        Juliana Vieira
                                    </h3>
                                    <div className="flex items-center space-x-1.5">
                                        <div className="w-2 h-2 bg-[#00C851] rounded-full animate-pulse shadow-[0_0_8px_#00C851]"></div>
                                        <p className="text-[11px] text-[#00C851] font-bold uppercase tracking-wider">
                                            Online agora
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <Button
                                onClick={() => setIsOpen(false)}
                                variant="ghost"
                                size="icon"
                                className="w-8 h-8 text-white/70 hover:text-white hover:bg-white/10 rounded-full transition-colors"
                            >
                                <X className="w-5 h-5" />
                            </Button>
                        </div>
                    </div>

                    {!hasSubmittedLead ? (
                        <div className="flex-1 flex flex-col p-6 overflow-auto bg-slate-50/50">
                            <div className="space-y-6">
                                <div className="text-center space-y-2">
                                    <div className="inline-flex p-3 bg-[#002B5C] rounded-2xl shadow-lg shadow-[#002B5C]/20 mb-2">
                                        <Sparkles className="w-6 h-6 text-[#00C851]" />
                                    </div>
                                    <h3 className="text-xl font-black text-[#002B5C] tracking-tight">Primeiro, seus dados</h3>
                                    <p className="text-xs text-gray-500 font-medium">
                                        Para iniciar sua Consulta Jurídica e registrar seu protocolo no sistema.
                                    </p>
                                </div>

                                <form onSubmit={handleLeadSubmit} className="space-y-5">
                                    <div className="space-y-1.5">
                                        <label className="text-[11px] font-black text-[#002B5C] uppercase tracking-widest px-1">
                                            Nome Completo
                                        </label>
                                        <Input
                                            type="text"
                                            placeholder="Ex: João Silva"
                                            value={leadName}
                                            onChange={(e) => setLeadName(e.target.value)}
                                            required
                                            className="h-12 border-slate-200 focus:ring-[#00C851]/20 focus:border-[#00C851] rounded-xl bg-white shadow-sm transition-all"
                                        />
                                    </div>

                                    <div className="space-y-1.5">
                                        <label className="text-[11px] font-black text-[#002B5C] uppercase tracking-widest px-1">
                                            WhatsApp
                                        </label>
                                        <Input
                                            type="tel"
                                            inputMode="numeric"
                                            pattern="[0-9]*"
                                            placeholder="Apenas números (DDD + Número)"
                                            value={leadWhatsapp}
                                            onChange={(e) => setLeadWhatsapp(e.target.value.replace(/\D/g, ""))}
                                            required
                                            className="h-12 border-slate-200 focus:ring-[#00C851]/20 focus:border-[#00C851] rounded-xl bg-white shadow-sm transition-all"
                                        />
                                    </div>

                                    <div className="space-y-1.5">
                                        <label className="text-[11px] font-black text-[#002B5C] uppercase tracking-widest px-1">
                                            E-mail Profissional
                                        </label>
                                        <Input
                                            type="email"
                                            placeholder="nome@email.com"
                                            value={leadEmail}
                                            onChange={(e) => setLeadEmail(e.target.value)}
                                            required
                                            className="h-12 border-slate-200 focus:ring-[#00C851]/20 focus:border-[#00C851] rounded-xl bg-white shadow-sm transition-all"
                                        />
                                    </div>

                                    <Button
                                        type="submit"
                                        disabled={isSubmittingLead}
                                        className="w-full h-14 bg-gradient-primary hover:shadow-2xl hover:shadow-[#00C851]/30 text-white font-black text-sm uppercase tracking-widest rounded-2xl transition-all duration-300 disabled:opacity-70 group mt-2"
                                    >
                                        {isSubmittingLead ? (
                                            <Loader2 className="h-5 w-5 animate-spin" />
                                        ) : (
                                            <>
                                                Iniciar Auditoria
                                                <Send className="ml-3 w-4 h-4 group-hover:translate-x-1 group-hover:-translate-y-1 transition-transform" />
                                            </>
                                        )}
                                    </Button>
                                </form>
                            </div>
                        </div>
                    ) : (
                        <>
                            <div className="flex-1 overflow-hidden bg-slate-50/30">
                                <ScrollArea className="h-full px-4 py-6" ref={scrollAreaRef}>
                                    <div className="space-y-6">
                                        {messages.map((msg, i) => (
                                            <div key={i} className={cn("flex flex-col w-full animate-in fade-in duration-500", msg.role === "user" ? "items-end slide-in-from-right-2" : "items-start slide-in-from-left-2")}>
                                                {/* Sender Name */}
                                                <span className="text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-1.5 px-2">
                                                    {msg.role === "user" ? (leadName || user?.name || "Você") : "Juliana Vieira"}
                                                </span>

                                                <div className={cn(
                                                    "max-w-[85%] rounded-[20px] px-5 py-3.5 text-sm shadow-md transition-all relative group",
                                                    msg.role === "user"
                                                        ? "bg-[#002B5C] text-white rounded-tr-none shadow-[#002B5C]/10"
                                                        : "bg-white text-slate-800 border border-slate-100 rounded-tl-none shadow-sm"
                                                )}>
                                                    <div className="prose prose-sm break-words dark:prose-invert prose-p:leading-relaxed prose-a:text-[#00C851] prose-strong:text-[#00C851]">
                                                        <ReactMarkdown
                                                            components={{
                                                                a: ({ href, children }) => {
                                                                    const isInternal = href?.startsWith('/');
                                                                    if (isInternal) {
                                                                        return (
                                                                            <Link
                                                                                to={href || '#'}
                                                                                onClick={() => setIsOpen(false)}
                                                                                className="inline-flex items-center justify-center w-full px-6 py-4 mt-4 font-black text-sm text-white uppercase tracking-widest transition-all bg-[#00C851] hover:bg-[#009624] rounded-2xl shadow-xl hover:shadow-[#00C851]/40 hover:scale-[1.03] active:scale-[0.97] no-underline group animate-in zoom-in-95 duration-500"
                                                                            >
                                                                                {children}
                                                                                <Send className="ml-3 h-4 w-4 rotate-[-45deg] group-hover:translate-x-1 transition-transform" />
                                                                            </Link>
                                                                        );
                                                                    }
                                                                    return (
                                                                        <a
                                                                            href={href}
                                                                            target="_blank"
                                                                            rel="noopener noreferrer"
                                                                            className="text-[#00C851] font-bold underline decoration-2 underline-offset-4 hover:text-[#009624] transition-colors"
                                                                        >
                                                                            {children}
                                                                        </a>
                                                                    );
                                                                }
                                                            }}
                                                        >
                                                            {msg.content}
                                                        </ReactMarkdown>
                                                    </div>

                                                    {/* Read Receipt / Status */}
                                                    <div className={cn(
                                                        "flex items-center justify-end mt-1 space-x-1",
                                                        msg.role === "user" ? "text-white/50" : "text-slate-400"
                                                    )}>
                                                        <span className="text-[9px] font-medium opacity-70">
                                                            {new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' })}
                                                        </span>
                                                        {msg.role === "user" && (
                                                            <CheckCheck className="w-3.5 h-3.5 text-[#00C851]" />
                                                        )}
                                                    </div>
                                                </div>
                                            </div>
                                        ))}
                                        {isLoading && (
                                            <div className="flex justify-start items-center space-x-2 animate-in fade-in slide-in-from-left-2 duration-300">
                                                <div className="bg-white border border-slate-100 rounded-2xl p-4 shadow-sm">
                                                    <div className="flex space-x-1.5">
                                                        <div className="w-2 h-2 bg-[#00C851] rounded-full animate-bounce [animation-duration:0.6s]"></div>
                                                        <div className="w-2 h-2 bg-[#00C851] rounded-full animate-bounce [animation-delay:0.1s] [animation-duration:0.6s]"></div>
                                                        <div className="w-2 h-2 bg-[#00C851] rounded-full animate-bounce [animation-delay:0.2s] [animation-duration:0.6s]"></div>
                                                    </div>
                                                </div>
                                                <span className="text-[10px] text-gray-400 font-bold uppercase tracking-widest">Analisando...</span>
                                            </div>
                                        )}
                                    </div>
                                </ScrollArea>
                            </div>

                            <CardFooter className="p-4 bg-white border-t border-slate-100 shrink-0">
                                <div className="flex w-full gap-2 items-center">
                                    <div className="relative flex-1 group">
                                        <Input
                                            placeholder="Descreva seu caso aqui..."
                                            value={inputValue}
                                            onChange={(e) => setInputValue(e.target.value)}
                                            onKeyDown={handleKeyDown}
                                            className="h-12 bg-slate-50 border-slate-100 focus:ring-[#00C851]/20 focus:border-[#009624] rounded-2xl transition-all pr-12 text-sm font-medium"
                                        />
                                        <div className="absolute right-3 top-1/2 -translate-y-1/2 hidden md:block">
                                            <div className="flex items-center space-x-1 px-2 py-1 rounded bg-slate-200/50">
                                                <span className="text-[9px] font-bold text-gray-400">ENTER</span>
                                            </div>
                                        </div>
                                    </div>
                                    <Button
                                        onClick={handleSendMessage}
                                        disabled={isLoading || !inputValue.trim()}
                                        size="icon"
                                        className="h-12 w-12 bg-gradient-primary hover:shadow-lg hover:shadow-[#00C851]/30 rounded-2xl transition-all shrink-0 active:scale-90 group"
                                    >
                                        <Send className="h-5 w-5 text-white group-hover:translate-x-0.5 group-hover:-translate-y-0.5 transition-transform" />
                                    </Button>
                                </div>
                            </CardFooter>
                        </>
                    )}
                </div>
            )}
        </>
    );
}