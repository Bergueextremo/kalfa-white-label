import { useState, useCallback } from "react";
import { Layout } from "@/components/Layout";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Upload, FileText, Loader2 } from "lucide-react";
import { Progress } from "@/components/ui/progress";
import { useNavigate } from "react-router-dom";
import { toast } from "sonner";

const NovaAuditoria = () => {
  const navigate = useNavigate();
  const [isDragging, setIsDragging] = useState(false);
  const [isProcessing, setIsProcessing] = useState(false);
  const [progress, setProgress] = useState(0);
  const [statusMessage, setStatusMessage] = useState("");

  const statusMessages = [
    "Iniciando varredura OCR...",
    "Conectando ao banco de dados do Banco Central...",
    "Verificando jurisprudência do STF...",
    "Calculando taxas de juros compostos...",
    "Gerando laudo final...",
  ];

  const processFile = async (file: File) => {
    if (!file.type.includes("pdf") && !file.type.includes("document")) {
      toast.error("Por favor, envie um arquivo PDF ou DOCX");
      return;
    }

    setIsProcessing(true);
    setProgress(0);
    
    // Simular processamento com mensagens técnicas
    for (let i = 0; i < statusMessages.length; i++) {
      setStatusMessage(statusMessages[i]);
      setProgress((i + 1) * 20);
      await new Promise(resolve => setTimeout(resolve, 2000));
    }

    // Completar e redirecionar
    toast.success("Auditoria concluída com sucesso!");
    navigate("/resultado/1");
  };

  const handleDrop = useCallback((e: React.DragEvent) => {
    e.preventDefault();
    setIsDragging(false);
    
    const file = e.dataTransfer.files[0];
    if (file) {
      processFile(file);
    }
  }, []);

  const handleFileInput = (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (file) {
      processFile(file);
    }
  };

  return (
    <Layout>
      <div className="max-w-4xl mx-auto space-y-6">
        {/* Header */}
        <div>
          <h1 className="text-3xl font-bold text-foreground">Nova Auditoria</h1>
          <p className="text-muted-foreground mt-1">
            Faça upload do contrato para análise forense completa
          </p>
        </div>

        {/* Upload Card */}
        <Card className="shadow-lg">
          <CardHeader>
            <CardTitle>Submeter Contrato</CardTitle>
            <CardDescription>
              Arraste seu contrato de financiamento ou aluguel aqui para varredura forense
            </CardDescription>
          </CardHeader>
          <CardContent>
            {!isProcessing ? (
              <div
                className={`border-2 border-dashed rounded-lg p-12 text-center transition-all ${
                  isDragging
                    ? "border-primary bg-accent/50"
                    : "border-border hover:border-primary/50 hover:bg-accent/30"
                }`}
                onDragOver={(e) => {
                  e.preventDefault();
                  setIsDragging(true);
                }}
                onDragLeave={() => setIsDragging(false)}
                onDrop={handleDrop}
              >
                <Upload className="h-16 w-16 mx-auto mb-4 text-muted-foreground" />
                <h3 className="text-xl font-semibold mb-2 text-foreground">
                  Arraste seu arquivo aqui
                </h3>
                <p className="text-muted-foreground mb-4">
                  Formatos aceitos: PDF, DOCX (máx. 10MB)
                </p>
                <label className="inline-block">
                  <input
                    type="file"
                    className="hidden"
                    accept=".pdf,.doc,.docx"
                    onChange={handleFileInput}
                  />
                  <span className="cursor-pointer inline-flex items-center gap-2 px-6 py-3 bg-primary text-primary-foreground rounded-md hover:bg-primary/90 transition-colors font-medium">
                    <FileText className="h-5 w-5" />
                    Selecionar Arquivo
                  </span>
                </label>
              </div>
            ) : (
              <div className="py-12 px-6 space-y-6">
                <div className="flex items-center justify-center gap-3 mb-6">
                  <Loader2 className="h-8 w-8 animate-spin text-primary" />
                  <h3 className="text-xl font-semibold text-foreground">
                    Processando Contrato
                  </h3>
                </div>
                
                <Progress value={progress} className="h-3" />
                
                <div className="text-center">
                  <p className="text-sm font-medium text-primary">{statusMessage}</p>
                  <p className="text-xs text-muted-foreground mt-2">
                    Aguarde enquanto realizamos a análise completa...
                  </p>
                </div>
              </div>
            )}
          </CardContent>
        </Card>

        {/* Info Cards */}
        <div className="grid md:grid-cols-3 gap-4">
          <Card className="border-success/20 bg-success/5">
            <CardContent className="pt-6">
              <div className="text-center">
                <div className="text-3xl font-bold text-success mb-2">100%</div>
                <p className="text-sm text-muted-foreground">Taxa de Detecção</p>
              </div>
            </CardContent>
          </Card>
          <Card className="border-primary/20 bg-primary/5">
            <CardContent className="pt-6">
              <div className="text-center">
                <div className="text-3xl font-bold text-primary mb-2">10 seg</div>
                <p className="text-sm text-muted-foreground">Tempo Médio</p>
              </div>
            </CardContent>
          </Card>
          <Card className="border-warning/20 bg-warning/5">
            <CardContent className="pt-6">
              <div className="text-center">
                <div className="text-3xl font-bold text-warning mb-2">24h</div>
                <p className="text-sm text-muted-foreground">Suporte Jurídico</p>
              </div>
            </CardContent>
          </Card>
        </div>
      </div>
    </Layout>
  );
};

export default NovaAuditoria;
