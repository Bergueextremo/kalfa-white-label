import { useEffect } from 'react';
import { useLocation, useNavigate } from 'react-router-dom';
import { Button } from '@/components/ui/button';
import { CheckCircle, Download, Home, FileText } from 'lucide-react';
import { downloadContractPDF } from '@/lib/pdfGenerator';
import { Header } from '@/components/Header';

export default function SuccessPage() {
    const navigate = useNavigate();
    const location = useLocation();
    const { contract, formData } = location.state || {};

    useEffect(() => {
        if (!contract || !formData) {
            navigate('/catalogo');
        }
    }, [contract, formData, navigate]);

    if (!contract || !formData) return null;

    const handleDownload = () => {
        downloadContractPDF(contract, formData);
    };

    return (
        <div className="min-h-screen bg-background flex flex-col">
            <Header />

            <main className="flex-grow flex items-center justify-center p-4">
                <div className="max-w-2xl w-full bg-card border rounded-2xl shadow-xl p-8 md:p-12 text-center space-y-8 animate-in fade-in zoom-in duration-500">

                    <div className="flex justify-center">
                        <div className="h-24 w-24 bg-green-100 text-green-600 rounded-full flex items-center justify-center animate-bounce">
                            <CheckCircle className="h-12 w-12" />
                        </div>
                    </div>

                    <div className="space-y-4">
                        <h1 className="text-3xl font-bold text-primary">Parabéns!</h1>
                        <p className="text-xl text-muted-foreground">
                            O seu documento <span className="font-semibold text-foreground">"{contract.title}"</span> foi criado com sucesso!
                        </p>
                        <p className="text-sm text-muted-foreground">
                            O número do pedido é: <span className="font-mono bg-secondary px-2 py-1 rounded">#{Math.floor(Math.random() * 1000000)}</span>
                        </p>
                    </div>

                    <div className="bg-secondary/20 p-6 rounded-xl border border-secondary">
                        <p className="mb-6 font-medium">CLIQUE no botão abaixo para BAIXAR AGORA o seu documento:</p>

                        <Button
                            size="lg"
                            className="w-full md:w-auto min-w-[300px] h-14 text-lg bg-amber-500 hover:bg-amber-600 text-white shadow-lg shadow-amber-500/20 transition-all hover:scale-105"
                            onClick={handleDownload}
                        >
                            <Download className="mr-3 h-6 w-6" />
                            BAIXAR DOCUMENTO
                        </Button>
                    </div>

                    <div className="space-y-2 text-sm text-muted-foreground text-left max-w-lg mx-auto bg-muted p-4 rounded-lg">
                        <p className="flex items-start gap-2">
                            <FileText className="h-4 w-4 mt-0.5 shrink-0" />
                            Você receberá um e-mail com o link para efetuar download.
                        </p>
                        <p className="flex items-start gap-2">
                            <CheckCircle className="h-4 w-4 mt-0.5 shrink-0" />
                            Verifique a caixa de SPAM ou LIXO ELETRÔNICO.
                        </p>
                    </div>

                    <div className="pt-8 border-t">
                        <Button variant="ghost" onClick={() => navigate('/catalogo')}>
                            <Home className="mr-2 h-4 w-4" />
                            Voltar para o Catálogo
                        </Button>
                    </div>
                </div>
            </main>
        </div>
    );
}
