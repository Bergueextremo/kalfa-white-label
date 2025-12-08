import { useState } from "react";
import { useNavigate, useLocation, useSearchParams } from "react-router-dom";
import { Upload, ShieldCheck, Lock, Trash2, ArrowLeft, Scale } from "lucide-react";
import { Button } from "@/components/ui/button";
import { supabase } from "@/lib/supabase";
import { toast } from "sonner";

// Contract type configurations for dynamic titles
const contractTypeConfig: Record<string, { title: string; subtitle: string }> = {
    veiculo: {
        title: "Anexe seu Contrato de Financiamento de Veículo",
        subtitle: "Detectando juros abusivos, taxas ocultas e cláusulas de busca e apreensão"
    },
    imovel: {
        title: "Anexe seu Contrato de Aluguel ou Imobiliário",
        subtitle: "Detectando multas abusivas, reajuste IGP-M irregular e cláusulas de despejo"
    },
    emprestimo: {
        title: "Anexe seu Contrato de Empréstimo Bancário",
        subtitle: "Detectando venda casada, RMC irregular e anatocismo"
    },
    empresarial: {
        title: "Anexe seu Contrato Social ou Empresarial",
        subtitle: "Analisando cláusulas de exclusão de sócio e responsabilidade patrimonial"
    },
    servicos: {
        title: "Anexe seu Contrato de Prestação de Serviços",
        subtitle: "Verificando riscos trabalhistas, multas desproporcionais e prazos"
    },
    outros: {
        title: "Anexe seu Contrato para Análise",
        subtitle: "Varredura completa para identificação de cláusulas abusivas"
    }
};

const FreeScan = () => {
    const navigate = useNavigate();
    const location = useLocation();
    const [searchParams] = useSearchParams();
    
    // Get contract type from URL params or location state
    const typeFromUrl = searchParams.get('type');
    const typeFromState = location.state?.contractType;
    const contractTypeId = typeFromUrl || typeFromState || "outros";
    
    // Get dynamic content based on contract type
    const config = contractTypeConfig[contractTypeId] || contractTypeConfig.outros;

    const [file, setFile] = useState<File | null>(null);
    const [uploading, setUploading] = useState(false);
    const [scanning, setScanning] = useState(false);

    const handleFileChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        if (e.target.files && e.target.files[0]) {
            setFile(e.target.files[0]);
        }
    };

    const handleDrop = (e: React.DragEvent<HTMLDivElement>) => {
        e.preventDefault();
        if (e.dataTransfer.files && e.dataTransfer.files[0]) {
            setFile(e.dataTransfer.files[0]);
        }
    };

    const handleDragOver = (e: React.DragEvent<HTMLDivElement>) => {
        e.preventDefault();
    };

    const handleScan = async () => {
        if (!file) {
            toast.error("Por favor, selecione um arquivo");
            return;
        }

        setUploading(true);

        try {
            // Upload to temporary path
            const fileExt = file.name.split('.').pop();
            const fileName = `temp-scans/${crypto.randomUUID()}.${fileExt}`;

            const { error: uploadError } = await supabase.storage
                .from('contracts')
                .upload(fileName, file);

            if (uploadError) {
                throw uploadError;
            }

            setUploading(false);
            setScanning(true);

            // Call light scan function
            const { data, error } = await supabase.functions.invoke('scan-contract-light', {
                body: {
                    file_path: fileName,
                    contract_type: contractTypeId
                }
            });

            if (error) {
                throw error;
            }

            if (data && !data.success && data.error) {
                throw new Error(data.error);
            }

            const scanData = data.data || data; // Handle both wrapped and unwrapped data

            setScanning(false);

            // Navigate to preliminary result with scan data
            navigate('/resultado-preliminar', {
                state: {
                    scanResult: scanData,
                    filePath: fileName,
                    contractType: contractTypeId
                }
            });

        } catch (error: any) {
            console.error('Scan error:', error);
            toast.error(error.message || "Erro ao processar arquivo");
            setUploading(false);
            setScanning(false);
        }
    };

    return (
        <div className="min-h-screen bg-[#F8F9FA]">
            {/* Header */}
            <header className="bg-white border-b border-slate-200 sticky top-0 z-50">
                <div className="container mx-auto px-4 py-4">
                    <div className="flex items-center justify-between">
                        <div className="flex items-center gap-2 cursor-pointer" onClick={() => navigate("/")}>
                            <Scale className="h-7 w-7 text-[#0A192F]" />
                            <span className="text-xl font-bold text-[#0A192F]">JusContratos</span>
                        </div>
                        <button 
                            onClick={() => navigate('/consultas')}
                            className="flex items-center gap-2 text-sm text-slate-600 hover:text-slate-900 transition-colors"
                        >
                            <ArrowLeft className="h-4 w-4" />
                            Voltar
                        </button>
                    </div>
                </div>
            </header>

            {/* Main Content */}
            <div className="container mx-auto px-4 py-16">
                <div className="max-w-3xl mx-auto">
                    {/* Title - Dynamic based on contract type */}
                    <div className="text-center mb-12">
                        <div className="inline-flex items-center gap-2 bg-[#0A192F]/5 px-4 py-2 rounded-full mb-4">
                            <ShieldCheck className="h-4 w-4 text-[#0A192F]" />
                            <span className="text-xs font-semibold text-[#0A192F] uppercase tracking-wider">
                                Auditoria Forense Especializada
                            </span>
                        </div>
                        <h1 className="text-3xl md:text-4xl font-bold text-[#0A192F] mb-4">
                            {config.title}
                        </h1>
                        <p className="text-lg text-slate-600 max-w-2xl mx-auto">
                            {config.subtitle}
                        </p>
                    </div>

                    {/* Upload Area */}
                    <div
                        className="bg-white rounded-2xl shadow-lg border-2 border-dashed border-slate-300 p-12 text-center hover:border-blue-400 transition-colors cursor-pointer"
                        onDrop={handleDrop}
                        onDragOver={handleDragOver}
                        onClick={() => document.getElementById('file-input')?.click()}
                    >
                        <Upload className="h-16 w-16 text-slate-400 mx-auto mb-6" />

                        {file ? (
                            <div>
                                <p className="text-lg font-semibold text-slate-900 mb-2">
                                    {file.name}
                                </p>
                                <p className="text-sm text-slate-500">
                                    {(file.size / 1024 / 1024).toFixed(2)} MB
                                </p>
                            </div>
                        ) : (
                            <div>
                                <p className="text-lg font-semibold text-slate-900 mb-2">
                                    Arraste seu contrato aqui
                                </p>
                                <p className="text-sm text-slate-500 mb-4">
                                    ou clique para selecionar (PDF ou DOCX, até 10MB)
                                </p>
                            </div>
                        )}

                        <input
                            id="file-input"
                            type="file"
                            accept=".pdf,.docx"
                            onChange={handleFileChange}
                            className="hidden"
                        />
                    </div>

                    {/* Action Button */}
                    <div className="mt-8 text-center">
                        <Button
                            size="lg"
                            className="px-12 py-6 text-lg"
                            onClick={handleScan}
                            disabled={!file || uploading || scanning}
                        >
                            {uploading ? "Enviando..." : scanning ? "Analisando..." : "Iniciar Varredura Gratuita"}
                        </Button>
                    </div>

                    {/* Trust Signals */}
                    <div className="mt-16 grid grid-cols-1 md:grid-cols-3 gap-6">
                        <div className="flex items-center gap-3 text-slate-500">
                            <ShieldCheck className="h-5 w-5" />
                            <span className="text-sm">Análise sob sigilo absoluto</span>
                        </div>
                        <div className="flex items-center gap-3 text-slate-500">
                            <Lock className="h-5 w-5" />
                            <span className="text-sm">Criptografia Ponta-a-Ponta</span>
                        </div>
                        <div className="flex items-center gap-3 text-slate-500">
                            <Trash2 className="h-5 w-5" />
                            <span className="text-sm">Dados deletados pós-análise</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
};

export default FreeScan;
