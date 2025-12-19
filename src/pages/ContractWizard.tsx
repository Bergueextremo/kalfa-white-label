import { useEffect, useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { supabase } from '@/lib/supabase';
import { Contract, ContractVariable } from '@/components/catalog/types';
import { DynamicWizardManager } from '@/components/wizard/DynamicWizardManager';
import { LivePreview } from '@/components/wizard/LivePreview';
import { Header } from '@/components/Header';
import { Button } from '@/components/ui/button';
import { ArrowLeft, Loader2, Download, ShoppingCart } from 'lucide-react';
import { toast } from 'sonner';
// import { jsPDF } from 'jspdf';

export default function ContractWizard() {
    const { slug } = useParams();
    const navigate = useNavigate();
    const [contract, setContract] = useState<Contract | null>(null);
    const [variables, setVariables] = useState<ContractVariable[]>([]);
    const [formData, setFormData] = useState<Record<string, string>>({});
    const [isLoading, setIsLoading] = useState(true);

    useEffect(() => {
        if (!slug) return;

        async function fetchData() {
            setIsLoading(true);
            try {
                // Fetch Contract
                const { data: contractData, error: contractError } = await supabase
                    .from('contracts')
                    .select('*')
                    .eq('slug', slug)
                    .single();

                if (contractError) throw contractError;
                setContract(contractData);

                // Fetch Variables
                const { data: varData, error: varError } = await supabase
                    .from('contract_variables')
                    .select('*')
                    .eq('contract_id', contractData.id)
                    .order('order_index');

                if (varError) throw varError;
                setVariables(varData || []);

                // Init form data
                const initialData: Record<string, string> = {};
                varData?.forEach(v => initialData[v.name] = '');
                setFormData(initialData);

            } catch (error) {
                console.error('Error fetching wizard data:', error);
                toast.error("Erro ao carregar o contrato.");
            } finally {
                setIsLoading(false);
            }
        }

        fetchData();
    }, [slug]);

    const handleInputChange = (name: string, value: string) => {
        setFormData(prev => ({ ...prev, [name]: value }));
    };

    const handleCheckout = () => {
        // Determine if all required are filled
        const missing = variables.filter(v => v.required && !formData[v.name]);
        if (missing.length > 0) {
            toast.error(`Preencha todos os campos obrigatórios: ${missing.map(v => v.label).join(', ')}`);
            return;
        }

        // Redirect to Checkout Page
        navigate('/checkout', {
            state: {
                contract: contract,
                formData: formData,
                isContractPurchase: true
            }
        });
    };

    if (isLoading) {
        return (
            <div className="h-screen flex items-center justify-center">
                <Loader2 className="h-8 w-8 animate-spin text-primary" />
            </div>
        );
    }

    if (!contract) {
        return <div className="p-8 text-center">Contrato não encontrado.</div>;
    }

    return (
        <div className="min-h-screen flex flex-col bg-background">
            <Header />

            <main className="flex-grow container mx-auto px-4 py-6 max-w-[1600px]">
                <div className="flex items-center gap-4 mb-6">
                    <Button variant="ghost" size="icon" onClick={() => navigate('/catalogo')}>
                        <ArrowLeft className="h-4 w-4" />
                    </Button>
                    <div>
                        <h1 className="text-2xl font-bold">{contract.title}</h1>
                        <p className="text-sm text-muted-foreground">Preencha os dados abaixo para personalizar seu documento.</p>
                    </div>
                    <div className="ml-auto flex gap-3">
                        <Button variant="outline" className="hidden md:flex">
                            <Download className="mr-2 h-4 w-4" />
                            Preview PDF
                        </Button>
                        <Button size="lg" className="bg-primary hover:bg-primary/90 font-bold uppercase tracking-wider" onClick={handleCheckout}>
                            <ShoppingCart className="mr-2 h-4 w-4" />
                            Emitir Contrato (R$ {contract.price.toLocaleString('pt-BR', { minimumFractionDigits: 2 })})
                        </Button>
                    </div>
                </div>

                <div className="grid grid-cols-1 lg:grid-cols-12 gap-8 h-[calc(100vh-180px)]">
                    {/* Left: Dynamic Form */}
                    <div className="lg:col-span-4 h-full overflow-hidden">
                        <DynamicWizardManager
                            contractTitle={contract?.title || ''}
                            variables={variables}
                            formData={formData}
                            onChange={handleInputChange}
                            onComplete={handleCheckout}
                            wizardStages={contract.wizard_stages}
                        />
                    </div>

                    {/* Right: Live Preview */}
                    <div className="lg:col-span-8 h-full overflow-hidden hidden lg:block">
                        <LivePreview
                            robustTemplate={contract.template_body || ''}
                            formData={formData}
                        />
                    </div>
                </div>
            </main>
        </div>
    );
}
