import { useEffect, useState } from "react";
import { supabase } from "@/integrations/supabase/client";
import { AdminLayout } from "@/components/admin/AdminLayout";
import { Card, CardContent } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Button } from "@/components/ui/button";
import { toast } from "sonner";
import { Search, Loader2, Download, MessageSquare, Phone, Mail } from "lucide-react";
import { format } from "date-fns";

interface ChatLead {
    id: string;
    name: string;
    whatsapp: string;
    email: string;
    created_at: string;
}

export default function AdminLeads() {
    const [leads, setLeads] = useState<ChatLead[]>([]);
    const [searchTerm, setSearchTerm] = useState("");
    const [isLoading, setIsLoading] = useState(true);

    useEffect(() => {
        fetchLeads();
    }, []);

    const fetchLeads = async () => {
        try {
            setIsLoading(true);
            const { data, error } = await supabase
                .from("chat_leads")
                .select("*")
                .order("created_at", { ascending: false });

            if (error) throw error;

            setLeads(data || []);
        } catch (error: any) {
            console.error("Error fetching leads:", error);
            toast.error("Erro ao carregar leads.");
        } finally {
            setIsLoading(false);
        }
    };

    const filteredLeads = leads.filter(
        (lead) =>
            (lead.name?.toLowerCase() || "").includes(searchTerm.toLowerCase()) ||
            (lead.email?.toLowerCase() || "").includes(searchTerm.toLowerCase()) ||
            (lead.whatsapp || "").includes(searchTerm)
    );

    const handleExport = () => {
        const headers = ["Nome", "WhatsApp", "Email", "Data de Captura"];
        const csvContent = [
            headers.join(","),
            ...filteredLeads.map(lead =>
                [
                    lead.name,
                    lead.whatsapp,
                    lead.email,
                    format(new Date(lead.created_at), "dd/MM/yyyy HH:mm")
                ].join(",")
            )
        ].join("\n");

        const blob = new Blob([csvContent], { type: "text/csv;charset=utf-8;" });
        const link = document.createElement("a");
        const url = URL.createObjectURL(blob);

        link.setAttribute("href", url);
        link.setAttribute("download", `leads-chat-${new Date().toISOString().split('T')[0]}.csv`);
        link.style.visibility = "hidden";
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
    };

    return (
        <AdminLayout>
            <div className="space-y-6">
                <div className="flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
                    <div>
                        <h1 className="text-3xl font-bold text-slate-900">Leads do Chat</h1>
                        <p className="text-slate-500 mt-1">Gerenciamento de leads capturados pelo assistente</p>
                    </div>
                    <div className="flex gap-3 w-full md:w-auto">
                        <div className="relative flex-1 md:w-72">
                            <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 h-4 w-4 text-slate-400" />
                            <Input
                                placeholder="Buscar por nome, email ou whatsapp..."
                                className="pl-10"
                                value={searchTerm}
                                onChange={(e) => setSearchTerm(e.target.value)}
                            />
                        </div>
                        <Button variant="outline" onClick={handleExport} className="gap-2">
                            <Download className="h-4 w-4" />
                            <span className="hidden sm:inline">Exportar</span>
                        </Button>
                    </div>
                </div>

                <Card>
                    <CardContent className="p-0">
                        {isLoading ? (
                            <div className="flex justify-center py-12">
                                <Loader2 className="h-8 w-8 animate-spin text-[#002B5C]" />
                            </div>
                        ) : filteredLeads.length === 0 ? (
                            <div className="p-12 text-center">
                                <p className="text-slate-500">
                                    {searchTerm
                                        ? "Nenhum lead encontrado com esse termo."
                                        : "Nenhum lead capturado ainda."}
                                </p>
                            </div>
                        ) : (
                            <div className="overflow-x-auto">
                                <table className="w-full">
                                    <thead className="bg-slate-50 border-b border-slate-200">
                                        <tr>
                                            <th className="text-left py-4 px-6 font-semibold text-slate-600 text-sm">Nome / Email</th>
                                            <th className="text-left py-4 px-6 font-semibold text-slate-600 text-sm">WhatsApp</th>
                                            <th className="text-left py-4 px-6 font-semibold text-slate-600 text-sm">Data de Captura</th>
                                            <th className="text-right py-4 px-6 font-semibold text-slate-600 text-sm">Ações</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {filteredLeads.map((lead) => (
                                            <tr key={lead.id} className="border-b border-slate-100 hover:bg-slate-50 transition-colors">
                                                <td className="py-4 px-6">
                                                    <div className="font-medium text-slate-900">{lead.name}</div>
                                                    <div className="text-sm text-slate-500">{lead.email}</div>
                                                </td>
                                                <td className="py-4 px-6">
                                                    <a
                                                        href={`https://wa.me/${lead.whatsapp.replace(/\D/g, "")}`}
                                                        target="_blank"
                                                        rel="noopener noreferrer"
                                                        className="flex items-center gap-2 text-sm text-[#00C851] hover:underline"
                                                    >
                                                        <Phone className="h-3 w-3" />
                                                        {lead.whatsapp}
                                                    </a>
                                                </td>
                                                <td className="py-4 px-6 text-slate-600 text-sm">
                                                    {format(new Date(lead.created_at), "dd/MM/yyyy HH:mm")}
                                                </td>
                                                <td className="py-4 px-6 text-right">
                                                    <div className="flex justify-end gap-2">
                                                        <Button
                                                            variant="ghost"
                                                            size="sm"
                                                            asChild
                                                        >
                                                            <a href={`mailto:${lead.email}`}>
                                                                <Mail className="h-4 w-4 mr-2" />
                                                                <span className="hidden sm:inline">Email</span>
                                                            </a>
                                                        </Button>
                                                        <Button
                                                            variant="ghost"
                                                            size="sm"
                                                            className="text-[#00C851] hover:text-[#009624] hover:bg-[#00C851]/10"
                                                            asChild
                                                        >
                                                            <a
                                                                href={`https://wa.me/${lead.whatsapp.replace(/\D/g, "")}`}
                                                                target="_blank"
                                                                rel="noopener noreferrer"
                                                            >
                                                                <MessageSquare className="h-4 w-4 mr-2" />
                                                                <span className="hidden sm:inline">WhatsApp</span>
                                                            </a>
                                                        </Button>
                                                    </div>
                                                </td>
                                            </tr>
                                        ))}
                                    </tbody>
                                </table>
                            </div>
                        )}
                    </CardContent>
                </Card>
            </div>
        </AdminLayout>
    );
}
