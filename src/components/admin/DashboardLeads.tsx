import { Card, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Download, MessageSquare, Loader2, Calendar } from "lucide-react";
import { useState, useEffect } from "react";
import { supabase } from "@/lib/supabase";
import { toast } from "sonner";

interface Lead {
    id: string;
    created_at: string;
    name: string;
    email: string;
    phone: string;
    status: string;
}

export function DashboardLeads() {
    const [leads, setLeads] = useState<Lead[]>([]);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        fetchLeads();
    }, []);

    const fetchLeads = async () => {
        try {
            setLoading(true);
            const { data, error } = await supabase.functions.invoke('get-admin-data', {
                body: { action: 'list_leads' }
            });

            if (error) throw error;
            setLeads(data.leads || []);
        } catch (error) {
            console.error('Error fetching leads:', error);
            toast.error('Erro ao carregar leads');
        } finally {
            setLoading(false);
        }
    };

    const handleExport = () => {
        const headers = ["Data", "Nome", "E-mail", "Telefone"];
        const csvContent = [
            headers.join(","),
            ...leads.map(l =>
                [
                    new Date(l.created_at).toLocaleDateString(),
                    l.name,
                    l.email,
                    l.phone
                ].join(",")
            )
        ].join("\n");

        const blob = new Blob([csvContent], { type: "text/csv;charset=utf-8;" });
        const link = document.createElement("a");
        const url = URL.createObjectURL(blob);

        link.setAttribute("href", url);
        link.setAttribute("download", `leads-${new Date().toISOString().split('T')[0]}.csv`);
        link.style.visibility = "hidden";
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
    };

    return (
        <div className="space-y-6">
            <div className="flex justify-between items-center">
                <div>
                    <h2 className="text-2xl font-bold text-slate-900">Leads</h2>
                    <p className="text-slate-500 mt-1 text-sm">Contatos capturados pelo assistente AI</p>
                </div>
                <Button onClick={handleExport} size="sm" className="gap-2">
                    <Download className="h-4 w-4" />
                    Exportar
                </Button>
            </div>

            <Card>
                <CardContent className="p-0 overflow-x-auto">
                    {loading ? (
                        <div className="flex justify-center py-12">
                            <Loader2 className="h-8 w-8 animate-spin text-primary" />
                        </div>
                    ) : leads.length === 0 ? (
                        <div className="p-12 text-center text-slate-500 text-sm">
                            Nenhum lead capturado ainda.
                        </div>
                    ) : (
                        <table className="w-full text-sm text-left">
                            <thead className="bg-slate-50 border-b border-slate-200">
                                <tr>
                                    <th className="py-3 px-4 font-semibold text-slate-600">Data</th>
                                    <th className="py-3 px-4 font-semibold text-slate-600">Nome</th>
                                    <th className="py-3 px-4 font-semibold text-slate-600">E-mail</th>
                                    <th className="py-3 px-4 font-semibold text-slate-600">Telefone</th>
                                </tr>
                            </thead>
                            <tbody>
                                {leads.map((l) => (
                                    <tr key={l.id} className="border-b border-slate-100 hover:bg-slate-50 transition-colors">
                                        <td className="py-3 px-4 text-slate-600 flex items-center gap-2">
                                            <Calendar className="h-3.5 w-3.5 opacity-50" />
                                            {new Date(l.created_at).toLocaleDateString()}
                                        </td>
                                        <td className="py-3 px-4 font-medium text-slate-900">
                                            {l.name}
                                        </td>
                                        <td className="py-3 px-4 text-slate-600">
                                            {l.email}
                                        </td>
                                        <td className="py-3 px-4 text-slate-600">
                                            {l.phone}
                                        </td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    )}
                </CardContent>
            </Card>
        </div>
    );
}
