import { Button } from "@/components/ui/button";
import { Footer } from "@/components/Footer";
import { useNavigate } from "react-router-dom";
import heroImage from "@/assets/hero-contrato-blindado.png"; // Importing the image
import protectionImage from "@/assets/protection-illustration.png";
import socialProofImage from "@/assets/social-proof-illustration.png";
import solutionImage from "@/assets/solution-illustration.png";
import managementImage from "@/assets/management-illustration.png";
import apiImage from "@/assets/api-illustration.png";
import logoAlfaConsultoria from "@/assets/logo-alfa-consultoria.png";
import { Menu, Scale, ShieldCheck, FileText, BadgeDollarSign, CheckCircle, Activity, Database, Check, RefreshCw, Mail, Settings, Briefcase, Layers, Shield, Lock, XCircle, AlertCircle, X } from "lucide-react";
import { Accordion, AccordionContent, AccordionItem, AccordionTrigger } from "@/components/ui/accordion";
import { Sheet, SheetContent, SheetTrigger } from "@/components/ui/sheet";
import { useState } from "react";
import { useAuth } from "@/contexts/AuthContext";
import { AiAssistant } from "@/components/AiAssistant";
const ContratoBlindado = () => {
  const navigate = useNavigate();
  const {
    isAuthenticated
  } = useAuth();
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);
  return <div className="min-h-screen bg-white">
    {/* Header - Replicated from Landing for consistency */}
    <header className="border-b border-border bg-white sticky top-0 z-50">
      <div className="container mx-auto px-4 py-4">
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-2 cursor-pointer" onClick={() => navigate("/contratoblindado")}>
            <img src={logoAlfaConsultoria} alt="Alfa Consultoria" className="h-12 md:h-14" />
          </div>

          {/* Desktop Navigation */}
          <nav className="hidden md:flex items-center gap-6">
            <button onClick={() => navigate("/contratoblindado")} className="text-sm font-medium text-gray-600 hover:text-gray-900 transition-colors">
              Consultas Blindadas
            </button>
            <button onClick={() => navigate("/financiamentoblindado")} className="text-sm font-medium text-gray-600 hover:text-gray-900 transition-colors">
              Financiamento
            </button>
            <button onClick={() => navigate("/leilaoblindado")} className="text-sm font-medium text-gray-600 hover:text-gray-900 transition-colors">
              Leilão
            </button>
            {isAuthenticated && (
              <Button variant="outline" onClick={() => navigate("/dashboard")}>
                Dashboard
              </Button>
            )}
            {!isAuthenticated && <Button variant="outline" onClick={() => navigate("/consultas")}>
              Solicitar Consulta
            </Button>}
          </nav>

          {/* Mobile Menu */}
          <Sheet open={mobileMenuOpen} onOpenChange={setMobileMenuOpen}>
            <SheetTrigger asChild className="md:hidden">
              <Button variant="ghost" size="icon">
                <Menu className="h-6 w-6" />
              </Button>
            </SheetTrigger>
            <SheetContent side="right">
              <nav className="flex flex-col gap-6 mt-8">
                <button className="text-sm font-medium text-gray-600 hover:text-gray-900 transition-colors text-left" onClick={() => { navigate("/contratoblindado"); setMobileMenuOpen(false); }}>
                  Consultas Blindadas
                </button>
                <button className="text-sm font-medium text-gray-600 hover:text-gray-900 transition-colors text-left" onClick={() => { navigate("/financiamentoblindado"); setMobileMenuOpen(false); }}>
                  Financiamento
                </button>
                <button className="text-sm font-medium text-gray-600 hover:text-gray-900 transition-colors text-left" onClick={() => { navigate("/leilaoblindado"); setMobileMenuOpen(false); }}>
                  Leilão
                </button>
                {isAuthenticated ? (
                  <Button variant="outline" onClick={() => navigate("/dashboard")}>
                    Dashboard
                  </Button>
                ) : (
                  <Button variant="outline" onClick={() => navigate("/consultas")}>
                    Entrar
                  </Button>
                )}
              </nav>
            </SheetContent>
          </Sheet>
        </div>
      </div>
    </header>

    {/* Hero Section */}
    <section className="container mx-auto px-4 py-8 md:py-16 lg:py-24">
      <div className="grid lg:grid-cols-2 gap-8 md:gap-12 items-center">
        {/* Left Content */}
        <div className="max-w-2xl">
          <h1 className="text-4xl md:text-5xl lg:text-6xl font-extrabold text-[#1a2b4b] leading-[1.1] mb-6">Consultoria Jurídica Online do Seu Contrato<br />
          </h1>
          <p className="text-gray-600 text-lg md:text-xl mb-8 leading-relaxed">Nosso sistema analisa automaticamente cláusulas, cálculos e riscos jurídicos para mostrar se você está pagando ou assumindo algo que não deveria. Rápido, seguro e explicado de forma simples.</p>
          <Button size="lg" className="bg-[#00C853] hover:bg-[#00a846] text-white font-bold text-base md:text-lg px-8 py-6 rounded-full shadow-lg hover:shadow-xl transition-all uppercase tracking-wide" onClick={() => navigate("/consultas")}>
            AUTENTICAR CONTRATO
          </Button>
        </div>

        {/* Right Content - Image */}
        <div className="relative flex justify-center lg:justify-end">
          <img src={heroImage} alt="Análise de Contrato" className="w-full max-w-md lg:max-w-full h-auto object-contain drop-shadow-xl" />
        </div>
      </div>
    </section>

    {/* Features Section */}
    <section id="funcionalidades" className="bg-white py-12 md:py-16 border-t border-gray-100">
      <div className="container mx-auto px-4">
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
          {/* Feature 1 */}
          <div className="flex items-start gap-4">
            <div className="flex-shrink-0 w-12 h-12 bg-[#F1F5F9] rounded-xl flex items-center justify-center">
              <FileText className="w-6 h-6 text-[#1a2b4b]" />
            </div>
            <div className="space-y-1">
              <h3 className="font-bold text-[#1a2b4b] text-lg">Análise Instantânea</h3>
              <p className="text-gray-500 text-sm leading-relaxed">
                Envie seu contrato e receba o resultado em segundos.
              </p>
            </div>
          </div>

          {/* Feature 2 */}
          <div className="flex items-start gap-4">
            <div className="flex-shrink-0 w-12 h-12 bg-[#F1F5F9] rounded-xl flex items-center justify-center">
              <Scale className="w-6 h-6 text-[#1a2b4b]" />
            </div>
            <div className="space-y-1">
              <h3 className="font-bold text-[#1a2b4b] text-lg">Base Jurídica</h3>
              <p className="text-gray-500 text-sm leading-relaxed">
                Análise fundamentada em leis e jurisprudência do STF.
              </p>
            </div>
          </div>

          {/* Feature 3 */}
          <div className="flex items-start gap-4">
            <div className="flex-shrink-0 w-12 h-12 bg-[#F1F5F9] rounded-xl flex items-center justify-center">
              <ShieldCheck className="w-6 h-6 text-[#1a2b4b]" />
            </div>
            <div className="space-y-1">
              <h3 className="font-bold text-[#1a2b4b] text-lg">Proteção Total</h3>
              <p className="text-gray-500 text-sm leading-relaxed">
                Identifique cláusulas abusivas antes de assinar.
              </p>
            </div>
          </div>

          {/* Feature 4 */}
          <div className="flex items-start gap-4">
            <div className="flex-shrink-0 w-12 h-12 bg-[#F1F5F9] rounded-xl flex items-center justify-center">
              <BadgeDollarSign className="w-6 h-6 text-[#1a2b4b]" />
            </div>
            <div className="space-y-1">
              <h3 className="font-bold text-[#1a2b4b] text-lg">Economia Real</h3>
              <p className="text-gray-500 text-sm leading-relaxed">
                Evite perdas financeiras com juros e multas ilegais.
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>

    {/* Protection Section */}
    <section className="bg-white py-16 md:py-24">
      <div className="container mx-auto px-4">
        <div className="grid lg:grid-cols-2 gap-12 lg:gap-20 items-center">
          {/* Left Content - Text */}
          <div className="order-2 lg:order-1">
            <h2 className="text-3xl md:text-4xl lg:text-5xl font-extrabold text-[#1a2b4b] mb-6 leading-tight">Proteção jurídica para os seus contratos<br />
            </h2>
            <p className="text-gray-600 mb-10 text-lg leading-relaxed">Conte com uma análise especializada que identifica riscos, falhas e cláusulas prejudiciais antes que você assine — garantindo segurança e previsibilidade em cada acordo.</p>

            <div className="space-y-8">
              {/* List Item 1 */}
              <div className="flex gap-4">
                <div className="flex-shrink-0 mt-1">
                  <Database className="w-6 h-6 text-[#00C853]" />
                </div>
                <div>
                  <h3 className="text-xl font-bold text-[#1a2b4b] mb-2">Leitura inteligente de cláusulas</h3>
                  <p className="text-gray-600 text-sm leading-relaxed">Nosso sistema analisa ponto a ponto do contrato e destaca riscos ocultos, ambiguidades e termos que podem gerar prejuízos no futuro.</p>
                </div>
              </div>

              {/* List Item 2 */}
              <div className="flex gap-4">
                <div className="flex-shrink-0 mt-1">
                  <Activity className="w-6 h-6 text-[#00C853]" />
                </div>
                <div>
                  <h3 className="text-xl font-bold text-[#1a2b4b] mb-2">Avaliação de risco contratual</h3>
                  <p className="text-gray-600 text-sm leading-relaxed">Receba um diagnóstico claro do nível de segurança do documento, com orientações práticas para corrigir problemas antes de fechar o acordo.</p>
                </div>
              </div>

              {/* List Item 3 */}
              <div className="flex gap-4">
                <div className="flex-shrink-0 mt-1">
                  <CheckCircle className="w-6 h-6 text-[#00C853]" />
                </div>
                <div>
                  <h3 className="text-xl font-bold text-[#1a2b4b] mb-2">Validação de identidade e legitimidade</h3>
                  <p className="text-gray-600 text-sm leading-relaxed">Confirmamos partes envolvidas, verificamos coerência e asseguramos que o contrato está juridicamente alinhado às normas aplicáveis.</p>
                </div>
              </div>
            </div>

            <div className="mt-10">
              <Button className="bg-[#00C853] hover:bg-[#00a846] text-white font-bold rounded-full px-8 py-6 text-base shadow-lg hover:shadow-xl transition-all" onClick={() => navigate("/consultas")}>
                Proteja seus contratos antes de assinar
              </Button>
            </div>
          </div>

          {/* Right Content - Image */}
          <div className="order-1 lg:order-2 flex justify-center lg:justify-end">
            <img src={protectionImage} alt="Proteção Jurídica" className="w-full max-w-lg lg:max-w-xl h-auto drop-shadow-2xl" />
          </div>
        </div>
      </div>
    </section>

    {/* Social Proof/Modern Audit Section */}
    <section className="bg-[#f8f9fa] py-16 md:py-24">
      <div className="container mx-auto px-4">
        <div className="grid lg:grid-cols-2 gap-12 lg:gap-20 items-center">
          {/* Left Content - Image */}
          <div className="flex justify-center lg:justify-start">
            <img src={socialProofImage} alt="Auditoria Moderna" className="w-full max-w-lg lg:max-w-xl h-auto drop-shadow-2xl" />
          </div>

          {/* Right Content - Text */}
          <div>
            <h2 className="text-3xl md:text-4xl lg:text-5xl font-extrabold text-[#1a2b4b] mb-6 leading-tight">Auditoria de contratos simples, rápida e acessível<br />
            </h2>
            <p className="text-gray-600 mb-8 text-lg leading-relaxed">Simplifique a análise de contratos e gere laudos completos em poucos minutos. Entregue um parecer claro, seguro e personalizado para cada cliente.</p>

            <ul className="space-y-4 mb-10">
              <li className="flex items-center gap-3">
                <Check className="w-5 h-5 text-[#00C853]" />
                <span className="text-gray-700 font-medium">Gere laudos profissionais sem complicação</span>
              </li>
              <li className="flex items-center gap-3">
                <Check className="w-5 h-5 text-[#00C853]" />
                <span className="text-gray-700 font-medium">Audite contratos de qualquer lugar, 100% online</span>
              </li>
              <li className="flex items-center gap-3">
                <Check className="w-5 h-5 text-[#00C853]" />
                <span className="text-gray-700 font-medium">Identifique erros e recupere valores de contratos antigos</span>
              </li>
              <li className="flex items-center gap-3">
                <Check className="w-5 h-5 text-[#00C853]" />
                <span className="text-gray-700 font-medium">Acompanhe todas as auditorias em tempo real</span>
              </li>
            </ul>

            <Button className="bg-[#00C853] hover:bg-[#00a846] text-white font-bold rounded-full px-8 py-6 text-base shadow-lg hover:shadow-xl transition-all" onClick={() => navigate("/consultas")}>
              COMEÇAR AUDITORIA
            </Button>
          </div>
        </div>
      </div>
    </section>

    {/* Education Section */}
    <section className="bg-white py-16 md:py-24">
      <div className="container mx-auto px-4">
        <h2 className="text-3xl md:text-4xl lg:text-5xl font-extrabold text-[#312E81] text-center mb-16 leading-tight">Por que tantos contratos têm erros?</h2>

        <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6 max-w-6xl mx-auto mb-16">
          {["Bancos e empresas colocam taxas escondidas.", "Juros calculados fora da norma legal.", "Multas e encargos abusivos.", "Cláusulas que prendem você ilegalmente.", "Termos que violam o Código de Defesa do Consumidor.", "Falta de clareza e transparência nas informações."].map((item, index) => <div key={index} className="bg-[#EFF6FF] rounded-2xl p-8 flex items-start gap-4 hover:shadow-md transition-shadow">
            <div className="flex-shrink-0 mt-1">
              <div className="w-8 h-8 rounded-full border-2 border-[#4338ca] flex items-center justify-center bg-white">
                <Check className="w-4 h-4 text-[#4338ca] stroke-[3]" />
              </div>
            </div>
            <p className="text-[#1e1b4b] font-bold text-lg leading-snug">
              {item}
            </p>
          </div>)}
        </div>

        <div className="text-center max-w-4xl mx-auto">
          <p className="text-lg md:text-xl text-gray-600 leading-relaxed">
            Nosso sistema de Consultoria Jurídica identifica automaticamente mais de{" "}
            <span className="text-[#4338ca] font-bold">318 irregularidades possíveis</span>{" "}
            em segundos, protegendo você de prejuízos futuros.
          </p>
        </div>
      </div>
    </section>


    {/* Cost Comparison Section */}
    <section className="bg-[#F8FAFC] py-16 md:py-24 border-y border-gray-100">
      <div className="container mx-auto px-4">
        <div className="text-center max-w-3xl mx-auto mb-16">
          <h2 className="text-3xl md:text-4xl lg:text-5xl font-extrabold text-[#1a2b4b] mb-4">
            Advogado VS Alfa Consultoria
          </h2>
          <p className="text-gray-600 text-lg md:text-xl font-medium">
            Compare antes de decidir. Segurança jurídica não precisa ser cara.
          </p>
        </div>

        <div className="grid md:grid-cols-2 gap-8 max-w-5xl mx-auto mb-16">
          {/* Advogado Tradicional */}
          <div className="bg-white rounded-3xl p-8 shadow-md border border-red-50 relative overflow-hidden">
            <div className="absolute top-0 left-0 w-2 h-full bg-red-500"></div>
            <div className="flex items-center gap-3 mb-6 font-bold text-red-600 text-xl">
              <XCircle className="w-6 h-6" />
              Advogado tradicional
            </div>

            <div className="mb-6">
              <span className="text-gray-400 text-sm block mb-1">Consulta jurídica</span>
              <span className="text-2xl font-bold text-gray-800">R$ 300 a R$ 600</span>
            </div>

            <ul className="space-y-4 mb-8">
              {[
                "Atendimento depende de agenda",
                "Prazo imprevisível",
                "Cada ajuste gera novo custo",
                "Valor final difícil de prever"
              ].map((item, i) => (
                <li key={i} className="flex items-start gap-3 text-gray-600">
                  <AlertCircle className="w-5 h-5 text-red-400 mt-0.5 flex-shrink-0" />
                  <span>{item}</span>
                </li>
              ))}
            </ul>

            <div className="bg-red-50 rounded-2xl p-6 border border-red-100">
              <span className="font-bold text-red-700 block mb-2">Resultado:</span>
              <ul className="space-y-2">
                <li className="text-red-700 font-medium flex items-center gap-2">
                  <X className="w-4 h-4" />
                  Alto custo para demandas simples
                </li>
                <li className="text-red-700 font-medium flex items-center gap-2">
                  <X className="w-4 h-4" />
                  Baixa previsibilidade
                </li>
                <li className="text-red-700 font-medium flex items-center gap-2">
                  <X className="w-4 h-4" />
                  Processo lento
                </li>
              </ul>
            </div>
          </div>

          {/* Alfa Consultoria */}
          <div className="bg-white rounded-3xl p-8 shadow-xl border-2 border-[#00C853] relative overflow-hidden transform md:scale-105 z-10">
            <div className="absolute top-0 right-0">
              <span className="bg-[#00C853] text-white text-[10px] font-bold px-3 py-1 rounded-bl-xl uppercase tracking-wider">
                Recomendado
              </span>
            </div>
            <div className="flex items-center gap-3 mb-6 font-bold text-[#00C853] text-xl">
              <CheckCircle className="w-6 h-6" />
              Alfa Consultoria | Contratos Blindados
            </div>

            <div className="mb-6">
              <span className="text-gray-400 text-sm block mb-1">Consulta jurídica online</span>
              <span className="text-2xl font-bold text-[#00C853]">R$ 197,00</span>
            </div>

            <ul className="space-y-4 mb-8">
              {[
                "Resposta rápida, sem espera",
                "Disponível 24h por dia",
                "Ajustes sem burocracia",
                "Preço claro desde o início"
              ].map((item, i) => (
                <li key={i} className="flex items-start gap-3 text-gray-700">
                  <Check className="w-5 h-5 text-[#00C853] mt-0.5 flex-shrink-0" />
                  <span className="font-medium">{item}</span>
                </li>
              ))}
            </ul>

            <div className="bg-[#E8F5E9] rounded-2xl p-6 border border-[#B9F6CA]">
              <span className="font-bold text-[#1B5E20] block mb-2">Resultado:</span>
              <ul className="space-y-2">
                <li className="text-[#2E7D32] font-semibold flex items-center gap-2">
                  <Check className="w-4 h-4" />
                  Economia imediata
                </li>
                <li className="text-[#2E7D32] font-semibold flex items-center gap-2">
                  <Check className="w-4 h-4" />
                  Agilidade
                </li>
                <li className="text-[#2E7D32] font-semibold flex items-center gap-2">
                  <Check className="w-4 h-4" />
                  Segurança jurídica acessível
                </li>
              </ul>
            </div>
          </div>
        </div>

        {/* Anchoring Phrase */}
        <div className="text-center mb-16 px-4">
          <p className="text-xl md:text-2xl font-extrabold text-[#1a2b4b] leading-tight max-w-2xl mx-auto">
            "O valor de uma única consulta tradicional pode custar o dobro do que você paga aqui."
          </p>
        </div>

        {/* Confidence Block */}
        <div className="bg-white rounded-3xl p-8 md:p-12 border border-blue-50 shadow-lg max-w-4xl mx-auto">
          <div className="grid sm:grid-cols-2 gap-6 mb-10">
            {[
              "Ideal para quem precisa de orientação jurídica rápida",
              "Perfeito para quem analisa contratos com frequência",
              "Sem surpresas na fatura",
              "Sem burocracia"
            ].map((item, i) => (
              <div key={i} className="flex items-center gap-3">
                <div className="bg-[#E0F2F1] rounded-full p-1">
                  <Check className="w-5 h-5 text-[#00C853]" />
                </div>
                <span className="text-gray-700 font-medium">{item}</span>
              </div>
            ))}
          </div>

          <div className="text-center">
            <Button
              size="lg"
              className="bg-[#00C853] hover:bg-[#00a846] text-white font-bold text-lg px-12 py-8 rounded-2xl shadow-lg hover:shadow-xl transition-all w-full md:w-auto mb-4"
              onClick={() => navigate("/consultas")}
            >
              Consultar Contrato
            </Button>
            <p className="text-gray-500 font-medium italic">
              Rápido. Claro. Sem dor de cabeça.
            </p>
          </div>
        </div>
      </div>
    </section>


    {/* Solution Section */}
    <section className="bg-white pb-20 md:pb-32 pt-10">
      <div className="container mx-auto px-4">
        {/* Top Part: Image and Text */}
        <div className="grid lg:grid-cols-2 gap-12 lg:gap-20 items-center mb-20">
          {/* Left Content - Image */}
          <div className="flex justify-center lg:justify-start">
            <img src={solutionImage} alt="Solução Completa" className="w-full max-w-lg lg:max-w-xl h-auto drop-shadow-2xl" />
          </div>

          {/* Right Content - Text */}
          <div>
            <h2 className="text-3xl md:text-4xl lg:text-5xl font-extrabold text-[#1a2b4b] mb-6 leading-tight">
              Solução completa e<br />
              flexível para auditoria
            </h2>
            <p className="text-gray-600 mb-10 text-lg leading-relaxed">
              Receba análises detalhadas de contratos de financiamento, aluguel e bancários.
              Crie e gerencie seus laudos de forma simples e eficiente.
            </p>

            <Button className="bg-[#00C853] hover:bg-[#00a846] text-white font-bold rounded-full px-8 py-6 text-base shadow-lg hover:shadow-xl transition-all" onClick={() => navigate("/consultas")}>
              COMEÇAR AGORA
            </Button>
          </div>
        </div>

        {/* Bottom Part: Cards Grid */}
        <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-6">
          {/* Card 1 */}
          <div className="bg-[#f8f9fa] rounded-2xl p-8 hover:shadow-lg transition-all border border-transparent hover:border-gray-200">
            <RefreshCw className="w-8 h-8 text-[#00C853] mb-6" />
            <h3 className="text-xl font-bold text-[#1a2b4b] mb-3">Monitoramento Contínuo</h3>
            <p className="text-gray-600 text-sm leading-relaxed">
              Se a jurisprudência mudar, nosso sistema alerta sobre novas oportunidades de revisão.
            </p>
          </div>

          {/* Card 2 */}
          <div className="bg-[#f8f9fa] rounded-2xl p-8 hover:shadow-lg transition-all border border-transparent hover:border-gray-200">
            <Mail className="w-8 h-8 text-[#00C853] mb-6" />
            <h3 className="text-xl font-bold text-[#1a2b4b] mb-3">Avisos Inteligentes</h3>
            <p className="text-gray-600 text-sm leading-relaxed">
              Envie notificações automáticas sobre o status da análise para seu cliente por e-mail.
            </p>
          </div>

          {/* Card 3 */}
          <div className="bg-[#f8f9fa] rounded-2xl p-8 hover:shadow-lg transition-all border border-transparent hover:border-gray-200">
            <Settings className="w-8 h-8 text-[#00C853] mb-6" />
            <h3 className="text-xl font-bold text-[#1a2b4b] mb-3">Laudos Personalizados</h3>
            <p className="text-gray-600 text-sm leading-relaxed">
              Crie documentos sob medida, com sua logo, cabeçalho e rodapé personalizados.
            </p>
          </div>

          {/* Card 4 */}
          <div className="bg-[#f8f9fa] rounded-2xl p-8 hover:shadow-lg transition-all border border-transparent hover:border-gray-200">
            <Briefcase className="w-8 h-8 text-[#00C853] mb-6" />
            <h3 className="text-xl font-bold text-[#1a2b4b] mb-3">Gestão de Processos</h3>
            <p className="text-gray-600 text-sm leading-relaxed">
              Organize todos os seus contratos auditados separadamente por cliente ou tipo.
            </p>
          </div>
        </div>
      </div>
    </section>



    {/* Management Section */}
    <section className="bg-white pb-16 md:pb-24">
      <div className="container mx-auto px-4">
        <div className="grid lg:grid-cols-2 gap-12 lg:gap-20 items-center">
          {/* Left Content - Image */}
          <div className="flex justify-center lg:justify-start">
            <img src={managementImage} alt="Gestão Centralizada" className="w-full max-w-lg lg:max-w-xl h-auto drop-shadow-2xl" />
          </div>

          {/* Right Content - Text */}
          <div>
            <h2 className="text-3xl md:text-4xl lg:text-5xl font-extrabold text-[#1a2b4b] mb-6 leading-tight">
              Gestão centralizada e<br />
              transparente
            </h2>
            <p className="text-gray-600 mb-8 text-lg leading-relaxed">
              Tenha total controle sobre suas auditorias e laudos para tomar decisões
              mais estratégicas para seus clientes.
            </p>

            <ul className="space-y-4 mb-10">
              <li className="flex items-center gap-3">
                <Check className="w-5 h-5 text-[#00C853]" />
                <span className="text-gray-700 font-medium">Saiba exatamente quando suas análises foram concluídas</span>
              </li>
              <li className="flex items-center gap-3">
                <Check className="w-5 h-5 text-[#00C853]" />
                <span className="text-gray-700 font-medium">Antecipe riscos contratuais com facilidade</span>
              </li>
              <li className="flex items-center gap-3">
                <Check className="w-5 h-5 text-[#00C853]" />
                <span className="text-gray-700 font-medium">Consulte os detalhes de cada irregularidade encontrada</span>
              </li>
              <li className="flex items-center gap-3">
                <Check className="w-5 h-5 text-[#00C853]" />
                <span className="text-gray-700 font-medium">Extraia relatórios personalizados para facilitar a negociação</span>
              </li>
            </ul>

            <Button className="bg-[#00C853] hover:bg-[#00a846] text-white font-bold rounded-full px-8 py-6 text-base shadow-lg hover:shadow-xl transition-all" onClick={() => navigate("/consultas")}>
              Cadastre-se agora
            </Button>
          </div>
        </div>
      </div>
    </section>




    {/* Pricing Section */}
    <section id="precos" className="bg-white pb-20 pt-10">
      <div className="container mx-auto px-4">
        <div className="max-w-4xl mx-auto">
          <div className="bg-white rounded-3xl border-2 border-[#00C853] p-8 md:p-12 shadow-2xl relative overflow-hidden">
            {/* Badge */}
            <div className="flex justify-center mb-6">
              <span className="bg-[#FFEbee] text-[#D32F2F] px-6 py-2 rounded-full font-bold text-sm uppercase tracking-wide flex items-center gap-2">
                Inicie Sua Blindagem Hoje
              </span>
            </div>

            {/* Heading */}
            <h2 className="text-3xl md:text-5xl font-extrabold text-[#1a2b4b] text-center mb-4 leading-tight">
              Auditoria Completa do Seu Contrato
            </h2>

            {/* Price */}
            <div className="flex flex-col items-center justify-center mb-4">
              <span className="text-gray-400 text-xl font-medium line-through">R$ 297,00</span>
              <div className="flex items-baseline gap-2 text-[#00C853]">
                <span className="text-6xl md:text-7xl font-extrabold">R$ 197,00</span>
              </div>
            </div>

            <p className="text-center text-gray-500 mb-10 text-lg">
              Pagamento único • Sem mensalidades
            </p>

            {/* Checklist Grid */}
            <div className="grid md:grid-cols-2 gap-y-4 gap-x-8 mb-10 text-left">
              <div className="flex items-start gap-3">
                <CheckCircle className="w-6 h-6 text-[#00C853] flex-shrink-0" />
                <span className="text-gray-600">Resultado em até 10 segundos</span>
              </div>
              <div className="flex items-start gap-3">
                <CheckCircle className="w-6 h-6 text-[#00C853] flex-shrink-0" />
                <span className="text-gray-600">Laudo técnico em PDF pronto para uso</span>
              </div>
              <div className="flex items-start gap-3">
                <CheckCircle className="w-6 h-6 text-[#00C853] flex-shrink-0" />
                <span className="text-gray-600">Baseado em súmulas do STJ e normas do Bacen</span>
              </div>
              <div className="flex items-start gap-3">
                <CheckCircle className="w-6 h-6 text-[#00C853] flex-shrink-0" />
                <span className="text-gray-600">100% seguro e confidencial (LGPD compliant)</span>
              </div>
              <div className="flex items-start gap-3">
                <CheckCircle className="w-6 h-6 text-[#00C853] flex-shrink-0" />
                <span className="text-gray-600">Modelo de notificação extrajudicial incluso</span>
              </div>
              <div className="flex items-start gap-3">
                <CheckCircle className="w-6 h-6 text-[#00C853] flex-shrink-0" />
                <span className="text-gray-600">Suporte prioritário por e-mail</span>
              </div>
              <div className="flex items-start gap-3">
                <CheckCircle className="w-6 h-6 text-[#00C853] flex-shrink-0" />
                <span className="text-gray-600">Orientação clara para corrigir qualquer falha encontrada</span>
              </div>
            </div>

            {/* Tagline */}
            <div className="mb-10 text-center max-w-2xl mx-auto">
              <h3 className="font-bold text-[#1a2b4b] text-xl mb-2">Auditoria rápida, precisa e confiável</h3>
              <p className="text-gray-600 text-base">
                Ideal para quem quer segurança jurídica, clareza no contrato e prevenção de riscos — tudo de forma simples e acessível.
              </p>
            </div>

            {/* Selo de Garantia */}
            <div className="bg-[#E8F5E9] border border-[#A5D6A7] rounded-xl p-6 mb-10 max-w-2xl mx-auto">
              <div className="flex items-start gap-4">
                <div className="flex-shrink-0">
                  <div className="w-12 h-12 bg-[#00C853] rounded-full flex items-center justify-center">
                    <ShieldCheck className="w-7 h-7 text-white" strokeWidth={2.5} />
                  </div>
                </div>
                <div className="text-left">
                  <h3 className="font-bold text-[#1a2b4b] text-lg mb-2">Garantia de Segurança Jurídica</h3>
                  <p className="text-gray-600 text-sm leading-relaxed">
                    Todas as nossas análises são baseadas em súmulas do STJ, normas do Bacen e legislação vigente.
                    Seus dados são protegidos por criptografia de ponta a ponta em conformidade com a LGPD.
                  </p>
                </div>
              </div>
            </div>

            {/* Button */}
            <div className="text-center">
              <Button className="w-full md:w-auto bg-[#00C853] hover:bg-[#00a846] text-white font-bold rounded-xl px-12 py-8 text-xl shadow-lg hover:shadow-xl transition-all mb-4" onClick={() => navigate("/consultas")}>
                Auditar Meu Contrato Agora
              </Button>

              <div className="flex items-center justify-center gap-2 text-xs text-gray-400 uppercase tracking-wider font-semibold">
                <Lock className="w-3 h-3" />
                Pagamento 100% seguro · SSL/TLS · LGPD Compliant
              </div>
            </div>

          </div>
        </div>
      </div>
    </section>


    {/* API Section */}
    <section className="bg-white pb-20 md:pb-32">
      <div className="container mx-auto px-4">
        <div className="grid lg:grid-cols-2 gap-12 lg:gap-20 items-center">
          {/* Left Content - Text */}
          <div className="order-2 lg:order-1">
            <h2 className="text-3xl md:text-4xl lg:text-5xl font-extrabold text-[#1a2b4b] mb-6 leading-tight">
              Para Empresas B2B<br />
            </h2>
            <p className="text-gray-600 mb-10 text-lg leading-relaxed">
              Cresça sua operação oferecendo análises e laudos com a identidade da sua empresa. Aumente sua capacidade, padronize processos e entregue mais segurança para seus clientes.
            </p>

            <div className="space-y-8 mb-10">
              {/* Feature 1 */}
              <div className="flex gap-4">
                <div className="flex-shrink-0 mt-1">
                  <Layers className="w-6 h-6 text-[#00C853]" />
                </div>
                <div>
                  <h3 className="text-xl font-bold text-[#1a2b4b] mb-2">Marca Própria (White Label)</h3>
                  <p className="text-gray-600 text-sm leading-relaxed">
                    Ofereça auditorias e laudos com o visual da sua empresa, reforçando credibilidade e profissionalismo.
                  </p>
                </div>
              </div>

              {/* Feature 2 */}
              <div className="flex gap-4">
                <div className="flex-shrink-0 mt-1">
                  <RefreshCw className="w-6 h-6 text-[#00C853]" />
                </div>
                <div>
                  <h3 className="text-xl font-bold text-[#1a2b4b] mb-2">Escalabilidade para Grandes Volumes</h3>
                  <p className="text-gray-600 text-sm leading-relaxed">
                    Analise dezenas ou centenas de contratos por dia com automação e precisão — sem aumentar sua equipe.
                  </p>
                </div>
              </div>

              {/* Feature 3 */}
              <div className="flex gap-4">
                <div className="flex-shrink-0 mt-1">
                  <Shield className="w-6 h-6 text-[#00C853]" />
                </div>
                <div>
                  <h3 className="text-xl font-bold text-[#1a2b4b] mb-2">Regras e Fluxos Personalizados</h3>
                  <p className="text-gray-600 text-sm leading-relaxed">
                    Defina critérios, prioridades e etapas que seguem exatamente o seu modelo de operação.
                  </p>
                </div>
              </div>
            </div>

            <Button className="bg-[#00C853] hover:bg-[#00a846] text-white font-bold rounded-full px-8 py-6 text-base shadow-lg hover:shadow-xl transition-all" onClick={() => window.open("https://wa.me/5561998684615", "_blank")}>
              Fale com um especialista
            </Button>
          </div>

          {/* Right Content - Image */}
          <div className="order-1 lg:order-2 flex justify-center lg:justify-end">
            <img src={apiImage} alt="API Robusta" className="w-full max-w-lg lg:max-w-xl h-auto drop-shadow-2xl" />
          </div>
        </div>
      </div>
    </section>

    {/* FAQ Section */}
    <section id="faq" className="bg-[#f8f9fa] py-20 md:py-32">
      <div className="container mx-auto px-4">
        <div className="grid lg:grid-cols-2 gap-12 lg:gap-20 items-start">
          {/* Left Content - Text */}
          <div>
            <h2 className="text-3xl md:text-4xl lg:text-5xl font-extrabold text-[#1a2b4b] mb-6 leading-tight">
              Ficou com dúvidas<br />
              sobre a Auditoria?
            </h2>
            <p className="text-gray-600 mb-8 text-lg leading-relaxed">
              Confira nossas perguntas mais frequentes para entender como protegemos seus contratos.
            </p>
            <Button className="bg-[#00C853] hover:bg-[#00a846] text-white font-bold rounded-full px-8 py-6 text-base shadow-lg hover:shadow-xl transition-all" onClick={() => window.open("https://wa.me/5561998684615", "_blank")}>
              Fale com um especialista
            </Button>
          </div>

          {/* Right Content - Accordion */}
          <div className="w-full">
            <Accordion type="single" collapsible className="w-full space-y-4">
              <AccordionItem value="item-1" className="bg-white rounded-xl border border-gray-100 px-6 data-[state=open]:shadow-md transition-all">
                <AccordionTrigger className="text-[#1a2b4b] font-bold text-lg hover:no-underline py-6">
                  O que é uma auditoria de contrato?
                </AccordionTrigger>
                <AccordionContent className="text-gray-600 text-base pb-6 leading-relaxed">
                  É uma análise detalhada realizada por nossa inteligência artificial para identificar cláusulas abusivas,
                  erros de cálculo, taxas ocultas e riscos jurídicos que podem prejudicar seu negócio.
                </AccordionContent>
              </AccordionItem>

              <AccordionItem value="item-2" className="bg-white rounded-xl border border-gray-100 px-6 data-[state=open]:shadow-md transition-all">
                <AccordionTrigger className="text-[#1a2b4b] font-bold text-lg hover:no-underline py-6">
                  Por que auditar meus contratos?
                </AccordionTrigger>
                <AccordionContent className="text-gray-600 text-base pb-6 leading-relaxed">
                  Para garantir que você não está pagando valores indevidos, evitar multas abusivas e ter segurança jurídica.
                  Muitos contratos contêm erros que passam despercebidos sem uma análise técnica.
                </AccordionContent>
              </AccordionItem>

              <AccordionItem value="item-3" className="bg-white rounded-xl border border-gray-100 px-6 data-[state=open]:shadow-md transition-all">
                <AccordionTrigger className="text-[#1a2b4b] font-bold text-lg hover:no-underline py-6">
                  Como funciona o Alfa Audit Pro?
                </AccordionTrigger>
                <AccordionContent className="text-gray-600 text-base pb-6 leading-relaxed">
                  Você envia seu contrato (PDF, Word ou imagem), nossa IA processa o documento em segundos, cruza com
                  leis vigentes e gera um laudo completo com score de risco e recomendações.
                </AccordionContent>
              </AccordionItem>

              <AccordionItem value="item-4" className="bg-white rounded-xl border border-gray-100 px-6 data-[state=open]:shadow-md transition-all">
                <AccordionTrigger className="text-[#1a2b4b] font-bold text-lg hover:no-underline py-6">
                  Quais tipos de contrato posso auditar?
                </AccordionTrigger>
                <AccordionContent className="text-gray-600 text-base pb-6 leading-relaxed">
                  Nossa plataforma é otimizada para financiamentos, empréstimos, contratos de aluguel, contratos de serviço,
                  contratos bancários e de adesão em geral.
                </AccordionContent>
              </AccordionItem>

              <AccordionItem value="item-5" className="bg-white rounded-xl border border-gray-100 px-6 data-[state=open]:shadow-md transition-all">
                <AccordionTrigger className="text-[#1a2b4b] font-bold text-lg hover:no-underline py-6">
                  Meus dados estão seguros?
                </AccordionTrigger>
                <AccordionContent className="text-gray-600 text-base pb-6 leading-relaxed">
                  Sim. Utilizamos criptografia de ponta a ponta e seguimos rigorosamente a LGPD. Seus documentos são
                  analisados sob total sigilo e você pode excluí-los a qualquer momento.
                </AccordionContent>
              </AccordionItem>

              <AccordionItem value="item-6" className="bg-white rounded-xl border border-gray-100 px-6 data-[state=open]:shadow-md transition-all">
                <AccordionTrigger className="text-[#1a2b4b] font-bold text-lg hover:no-underline py-6">
                  O que preciso para começar?
                </AccordionTrigger>
                <AccordionContent className="text-gray-600 text-base pb-6 leading-relaxed">
                  Apenas criar sua conta e fazer o upload do primeiro contrato. O sistema é intuitivo e o resultado sai na hora,
                  sem necessidade de instalação de softwares complexos.
                </AccordionContent>
              </AccordionItem>
            </Accordion>
          </div>
        </div>
      </div>
    </section>

    <Footer />
    <AiAssistant />
  </div>;
};
export default ContratoBlindado;