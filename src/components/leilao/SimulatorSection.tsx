import { useState } from "react";
import { Button } from "@/components/ui/button";
import { Scale, AlertTriangle } from "lucide-react";

interface SimulatorSectionProps {
    onCtaClick: () => void;
}

export const SimulatorSection = ({ onCtaClick }: SimulatorSectionProps) => {
    const [currentQuestion, setCurrentQuestion] = useState(0);
    const [quizStarted, setQuizStarted] = useState(false);
    const [quizFinished, setQuizFinished] = useState(false);
    const [answers, setAnswers] = useState<string[]>([]);

    const questions = [
        "O Edital cita explicitamente quem paga as dívidas de condomínio/IPTU anteriores à arrematação?",
        "Você já verificou se existe algum processo de Nulidade ou Recurso pendente no CPF/CNPJ do executado?",
        "O leilão é Extrajudicial e o imóvel está ocupado?",
        "O veículo possui bloqueios judiciais (RENAJUD) ativos que podem impedir a transferência imediata?"
    ];

    const handleAnswer = (answer: string) => {
        const newAnswers = [...answers, answer];
        setAnswers(newAnswers);

        if (currentQuestion < questions.length - 1) {
            setCurrentQuestion(currentQuestion + 1);
        } else {
            setQuizFinished(true);
        }
    };

    const restartQuiz = () => {
        setQuizStarted(false);
        setQuizFinished(false);
        setCurrentQuestion(0);
        setAnswers([]);
    };

    const getResult = () => {
        const hasRisk = answers.some(a => a === "Não Sei" || a === "Não");
        if (hasRisk) {
            return {
                status: "⚠️ RISCO MODERADO A ALTO",
                message: "Você está prestes a dar um lance no escuro. Pequenas omissões no edital podem travar seu capital por meses ou gerar dívidas inesperadas.",
                color: "text-amber-600",
                bg: "bg-amber-50",
                border: "border-amber-200"
            };
        }
        return {
            status: "🔍 NECESSITA VALIDAÇÃO JURÍDICA",
            message: "A confiança é o primeiro passo para o erro. Nossa Consulta Jurídica valida se o que você leu é o que realmente está nos tribunais.",
            color: "text-blue-700",
            bg: "bg-blue-50",
            border: "border-blue-200"
        };
    };

    return (
        <section className="py-20 bg-slate-50 border-y border-slate-200" id="simulador" aria-labelledby="simulador-title">
            <div className="container mx-auto px-6 lg:px-4 max-w-4xl">
                <div className="text-center mb-10">
                    <h2 id="simulador-title" className="text-2xl md:text-3xl font-bold text-[#1a2b4b] mb-4">
                        Simulador de Viabilidade: Descubra o Nível de Risco do Lote
                    </h2>
                    <p className="text-gray-600">
                        Responda a 4 perguntas rápidas e veja se você está seguro para arrematar.
                    </p>
                </div>

                <div className="bg-white rounded-2xl shadow-xl border border-gray-100 overflow-hidden min-h-[400px] flex flex-col justify-center transition-all">
                    {!quizStarted ? (
                        <div className="p-10 text-center">
                            <div className="w-20 h-20 bg-blue-100 rounded-full flex items-center justify-center mx-auto mb-6">
                                <Scale className="w-10 h-10 text-[#002B5C]" aria-hidden="true" />
                            </div>
                            <h3 className="text-xl font-bold text-[#1a2b4b] mb-4">Você sabe onde está pisando?</h3>
                            <p className="text-gray-600 mb-8 max-w-lg mx-auto leading-relaxed">
                                A maioria dos prejuízos em leilões vem de detalhes ocultos no edital ou processos paralelos que você não viu.
                            </p>
                            <Button
                                size="lg"
                                className="bg-[#002B5C] hover:bg-[#001f42] text-white px-10 py-6 text-lg rounded-xl shadow-lg"
                                onClick={() => setQuizStarted(true)}
                                aria-label="Iniciar teste de risco de arrematação"
                            >
                                Fazer Teste de Risco
                            </Button>
                        </div>
                    ) : !quizFinished ? (
                        <div className="p-8 md:p-12 animate-in fade-in slide-in-from-right-8 duration-500">
                            <div className="flex justify-between items-center mb-8">
                                <span className="text-xs font-bold text-gray-500 uppercase tracking-widest">
                                    Pergunta {currentQuestion + 1} de {questions.length}
                                </span>
                                <div className="flex gap-1" role="progressbar" aria-valuenow={currentQuestion + 1} aria-valuemin={1} aria-valuemax={questions.length}>
                                    {questions.map((_, i) => (
                                        <div key={i} className={`h-1.5 w-6 rounded-full transition-colors ${i <= currentQuestion ? 'bg-[#002B5C]' : 'bg-gray-200'}`} />
                                    ))}
                                </div>
                            </div>

                            <h3 className="text-xl md:text-2xl font-bold text-[#1a2b4b] mb-10 leading-relaxed">
                                {questions[currentQuestion]}
                            </h3>

                            <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
                                <button
                                    className="py-4 px-6 rounded-xl border-2 border-slate-100 font-bold text-gray-600 hover:border-[#002B5C] hover:bg-[#002B5C] hover:text-white transition-all shadow-sm focus:ring-2 focus:ring-[#002B5C] outline-none"
                                    onClick={() => handleAnswer("Sim")}
                                    aria-label="Responder Sim para a pergunta atual"
                                >
                                    Sim
                                </button>
                                <button
                                    className="py-4 px-6 rounded-xl border-2 border-slate-100 font-bold text-gray-600 hover:border-[#002B5C] hover:bg-[#002B5C] hover:text-white transition-all shadow-sm focus:ring-2 focus:ring-[#002B5C] outline-none"
                                    onClick={() => handleAnswer("Não")}
                                    aria-label="Responder Não para a pergunta atual"
                                >
                                    Não
                                </button>
                                <button
                                    className="py-4 px-6 rounded-xl border-2 border-slate-100 font-bold text-gray-600 hover:border-amber-500 hover:bg-amber-500 hover:text-white transition-all shadow-sm focus:ring-2 focus:ring-amber-500 outline-none"
                                    onClick={() => handleAnswer("Não Sei")}
                                    aria-label="Responder Não Sei para a pergunta atual"
                                >
                                    Não Sei
                                </button>
                            </div>
                        </div>
                    ) : (
                        <div className="p-10 text-center animate-in zoom-in-95 duration-500" role="alert" aria-live="assertive">
                            <div className={`inline-block px-6 py-2 rounded-full text-sm font-bold mb-6 ${getResult().bg} ${getResult().color} border ${getResult().border}`}>
                                {getResult().status}
                            </div>

                            <h3 className="text-2xl md:text-3xl font-extrabold text-[#1a2b4b] mb-6">
                                Resultado da Análise
                            </h3>

                            <p className="text-gray-600 text-lg mb-10 max-w-xl mx-auto leading-relaxed">
                                {getResult().message}
                            </p>

                            <Button
                                className="w-full md:w-auto bg-[#00C851] hover:bg-[#009624] text-white font-bold text-base sm:text-lg h-16 px-6 sm:px-12 rounded-xl shadow-[0_4px_14px_0_rgba(0,200,81,0.39)] hover:shadow-[0_6px_20px_rgba(0,200,81,0.23)] hover:-translate-y-1 transition-all uppercase tracking-wider mb-6"
                                onClick={onCtaClick}
                                aria-label="Auditar este lote agora"
                            >
                                AUDITAR ESTE LOTE AGORA POR R$ 147
                            </Button>

                            <div>
                                <button
                                    onClick={restartQuiz}
                                    className="text-gray-500 text-sm hover:text-gray-700 underline decoration-gray-300 underline-offset-4 font-medium"
                                    aria-label="Refazer o teste de risco"
                                >
                                    Refazer teste
                                </button>
                            </div>
                        </div>
                    )}
                </div>
            </div>
        </section>
    );
};
