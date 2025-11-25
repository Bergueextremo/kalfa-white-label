import { useState } from "react";
import { useNavigate, useLocation } from "react-router-dom";
import { Upload, ShieldCheck, Lock, Trash2, ArrowLeft } from "lucide-react";
import { Button } from "@/components/ui/button";
import { supabase } from "@/lib/supabase";
import { toast } from "sonner";

const FreeScan = () => {
    const navigate = useNavigate();
    const location = useLocation();
    const contractType = location.state?.contractType || "Contrato";

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
                    contract_type: contractType
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
                    contractType
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
        <div className="min-h-screen bg-gradient-to-br from-slate-50 to-slate-100">
            {/* Header */}
            <header className="border-b border-slate-200 bg-white/80 backdrop-blur-sm">
                <div className="container mx-auto px-4 py-4">
                    <Button
                        variant="ghost"
                        onClick={() => navigate('/')}
                        className="gap-2"
                    >
                        <ArrowLeft className="h-4 w-4" />
                        Voltar
                    </Button>
                </div>
            </header>

            {/* Main Content */}
            <div className="container mx-auto px-4 py-16">
                <div className="max-w-3xl mx-auto">
                    {/* Title */}
                    <div className="text-center mb-12">
                        <h1 className="text-4xl font-bold text-slate-900 mb-4">
                            Varredura de Risco Gratuita
                        </h1>
                        <p className="text-lg text-slate-600">
                            Descubra se seu {contractType.toLowerCase()} possui cláusulas abusivas em segundos
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
