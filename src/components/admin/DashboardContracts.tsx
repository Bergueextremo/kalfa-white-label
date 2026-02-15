import { Card, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { FileText, Loader2, Plus, Edit2, Trash2 } from "lucide-react";
import { useState, useEffect } from "react";
import { supabase } from "@/lib/supabase";
import { toast } from "sonner";

interface ContractTemplate {
    id: string;
    title: string;
    description: string;
    price: number;
    category: string;
    created_at: string;
}

export function DashboardContracts() {
    const [contracts, setContracts] = useState<ContractTemplate[]>([]);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        fetchContracts();
    }, []);

    const fetchContracts = async () => {
        try {
            setLoading(true);
            const { data, error } = await supabase
                .from('contracts_templates')
                .select('*')
                .order('created_at', { ascending: false });

            if (error) throw error;
            setContracts(data || []);
        } catch (error) {
            console.error('Error fetching contracts:', error);
            toast.error('Erro ao carregar modelos de contrato');
        } finally {
            setLoading(false);
        }
    };

    return (
        <div className="space-y-6">
            <div className="flex justify-between items-center">
                <div>
                    <h2 className="text-2xl font-bold text-slate-900">Contratos</h2>
                    <p className="text-slate-500 mt-1 text-sm">Modelos de contrato disponíveis para venda</p>
                </div>
                <Button size="sm" className="gap-2 bg-[#002B5C]">
                    <Plus className="h-4 w-4" />
                    Novo Modelo
                </Button>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                {loading ? (
                    <div className="col-span-full flex justify-center py-12">
                        <Loader2 className="h-8 w-8 animate-spin text-primary" />
                    </div>
                ) : contracts.length === 0 ? (
                    <div className="col-span-full p-12 text-center text-slate-500 text-sm">
                        Nenhum modelo de contrato cadastrado.
                    </div>
                ) : (
                    contracts.map((c) => (
                        <Card key={c.id} className="hover:shadow-md transition-shadow">
                            <CardContent className="p-4">
                                <div className="flex justify-between items-start mb-2">
                                    <div className="p-2 bg-blue-50 rounded-lg">
                                        <FileText className="h-5 w-5 text-[#002B5C]" />
                                    </div>
                                    <Badge variant="secondary" className="text-[10px]">
                                        {c.category}
                                    </Badge>
                                </div>
                                <h3 className="font-bold text-slate-900 truncate" title={c.title}>{c.title}</h3>
                                <p className="text-xs text-slate-500 mt-1 line-clamp-2 h-8">{c.description}</p>
                                <div className="flex justify-between items-center mt-4 pt-4 border-t border-slate-100">
                                    <span className="font-black text-[#002B5C]">
                                        R$ {c.price.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}
                                    </span>
                                    <div className="flex gap-1">
                                        <Button variant="ghost" size="icon" className="h-8 w-8">
                                            <Edit2 className="h-3.5 w-3.5" />
                                        </Button>
                                        <Button variant="ghost" size="icon" className="h-8 w-8 text-red-500">
                                            <Trash2 className="h-3.5 w-3.5" />
                                        </Button>
                                    </div>
                                </div>
                            </CardContent>
                        </Card>
                    ))
                )}
            </div>
        </div>
    );
}
