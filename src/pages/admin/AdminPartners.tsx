import { useEffect, useState } from "react";
import { supabase } from "@/integrations/supabase/client";
import { AdminLayout } from "@/components/admin/AdminLayout";
import { Card, CardContent } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Button } from "@/components/ui/button";
import { toast } from "sonner";
import { Search, Loader2, Plus, Edit2, Trash2 } from "lucide-react";
import {
    Dialog,
    DialogContent,
    DialogHeader,
    DialogTitle,
    DialogFooter,
} from "@/components/ui/dialog";

interface Partner {
    id: string;
    name: string;
    code: string;
    commission_rate: number;
    created_at: string;
}

export default function AdminPartners() {
    const [partners, setPartners] = useState<Partner[]>([]);
    const [searchTerm, setSearchTerm] = useState("");
    const [isLoading, setIsLoading] = useState(true);
    const [isDialogOpen, setIsDialogOpen] = useState(false);
    const [editingPartner, setEditingPartner] = useState<Partial<Partner> | null>(null);

    useEffect(() => {
        fetchPartners();
    }, []);

    const fetchPartners = async () => {
        try {
            setIsLoading(true);
            const { data, error } = await supabase
                .from("partners")
                .select("*")
                .order("created_at", { ascending: false });

            if (error) throw error;
            setPartners(data || []);
        } catch (error: any) {
            console.error("Error fetching partners:", error);
            toast.error("Erro ao carregar parceiros.");
        } finally {
            setIsLoading(false);
        }
    };

    const handleSavePartner = async () => {
        try {
            if (!editingPartner?.name || !editingPartner?.code) {
                toast.error("Nome e código são obrigatórios.");
                return;
            }

            const partnerData = {
                name: editingPartner.name,
                code: editingPartner.code.toUpperCase().trim(),
                commission_rate: editingPartner.commission_rate || 0,
            };

            if (editingPartner.id) {
                const { error } = await supabase
                    .from("partners")
                    .update(partnerData)
                    .eq("id", editingPartner.id);
                if (error) throw error;
                toast.success("Parceiro atualizado com sucesso!");
            } else {
                const { error } = await supabase
                    .from("partners")
                    .insert([partnerData]);
                if (error) throw error;
                toast.success("Parceiro criado com sucesso!");
            }

            setIsDialogOpen(false);
            fetchPartners();
        } catch (error: any) {
            console.error("Error saving partner:", error);
            toast.error(error.message || "Erro ao salvar parceiro.");
        }
    };

    const handleDeletePartner = async (id: string) => {
        if (!confirm("Tem certeza que deseja excluir este parceiro?")) return;

        try {
            const { error } = await supabase
                .from("partners")
                .delete()
                .eq("id", id);
            if (error) throw error;
            toast.success("Parceiro excluído com sucesso!");
            fetchPartners();
        } catch (error: any) {
            console.error("Error deleting partner:", error);
            toast.error("Erro ao excluir parceiro.");
        }
    };

    const filteredPartners = partners.filter(
        (p) =>
            p.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
            p.code.toLowerCase().includes(searchTerm.toLowerCase())
    );

    return (
        <AdminLayout>
            <div className="space-y-6">
                <div className="flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
                    <div>
                        <h1 className="text-3xl font-bold text-slate-900">Parceiros</h1>
                        <p className="text-slate-500 mt-1">Gerenciamento de cupons e parceiros</p>
                    </div>
                    <div className="flex gap-3 w-full md:w-auto">
                        <div className="relative flex-1 md:w-72">
                            <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 h-4 w-4 text-slate-400" />
                            <Input
                                placeholder="Buscar parceiro..."
                                className="pl-10"
                                value={searchTerm}
                                onChange={(e) => setSearchTerm(e.target.value)}
                            />
                        </div>
                        <Button onClick={() => {
                            setEditingPartner({});
                            setIsDialogOpen(true);
                        }} className="gap-2">
                            <Plus className="h-4 w-4" />
                            Novo Parceiro
                        </Button>
                    </div>
                </div>

                <Card>
                    <CardContent className="p-0">
                        {isLoading ? (
                            <div className="flex justify-center py-12">
                                <Loader2 className="h-8 w-8 animate-spin text-[#002B5C]" />
                            </div>
                        ) : filteredPartners.length === 0 ? (
                            <div className="p-12 text-center text-slate-500">
                                Nenhum parceiro encontrado.
                            </div>
                        ) : (
                            <div className="overflow-x-auto">
                                <table className="w-full text-left">
                                    <thead className="bg-slate-50 border-b border-slate-200">
                                        <tr>
                                            <th className="py-4 px-6 font-semibold text-slate-600 text-sm">Nome</th>
                                            <th className="py-4 px-6 font-semibold text-slate-600 text-sm">Código (Cupom)</th>
                                            <th className="py-4 px-6 font-semibold text-slate-600 text-sm">Comissão (%)</th>
                                            <th className="py-4 px-6 font-semibold text-slate-600 text-sm">Data de Criação</th>
                                            <th className="py-4 px-6 font-semibold text-slate-600 text-sm text-right">Ações</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {filteredPartners.map((p) => (
                                            <tr key={p.id} className="border-b border-slate-100 hover:bg-slate-50 transition-colors">
                                                <td className="py-4 px-6 font-medium text-slate-900">{p.name}</td>
                                                <td className="py-4 px-6">
                                                    <code className="bg-slate-100 px-2 py-1 rounded text-slate-700 font-bold">
                                                        {p.code}
                                                    </code>
                                                </td>
                                                <td className="py-4 px-6 text-slate-600">{p.commission_rate}%</td>
                                                <td className="py-4 px-6 text-slate-600 text-sm">
                                                    {new Date(p.created_at).toLocaleDateString()}
                                                </td>
                                                <td className="py-4 px-6 text-right space-x-2">
                                                    <Button
                                                        variant="ghost"
                                                        size="sm"
                                                        onClick={() => {
                                                            setEditingPartner(p);
                                                            setIsDialogOpen(true);
                                                        }}
                                                    >
                                                        <Edit2 className="h-4 w-4" />
                                                    </Button>
                                                    <Button
                                                        variant="ghost"
                                                        size="sm"
                                                        className="text-red-500 hover:text-red-700 hover:bg-red-50"
                                                        onClick={() => handleDeletePartner(p.id)}
                                                    >
                                                        <Trash2 className="h-4 w-4" />
                                                    </Button>
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

            <Dialog open={isDialogOpen} onOpenChange={setIsDialogOpen}>
                <DialogContent>
                    <DialogHeader>
                        <DialogTitle>{editingPartner?.id ? "Editar Parceiro" : "Novo Parceiro"}</DialogTitle>
                    </DialogHeader>
                    <div className="space-y-4 py-4">
                        <div className="space-y-2">
                            <label className="text-sm font-medium">Nome do Parceiro</label>
                            <Input
                                value={editingPartner?.name || ""}
                                onChange={(e) => setEditingPartner({ ...editingPartner, name: e.target.value })}
                                placeholder="Ex: João Silva"
                            />
                        </div>
                        <div className="space-y-2">
                            <label className="text-sm font-medium">Código do Cupom</label>
                            <Input
                                value={editingPartner?.code || ""}
                                onChange={(e) => setEditingPartner({ ...editingPartner, code: e.target.value })}
                                placeholder="Ex: JOAO10"
                                className="uppercase"
                            />
                        </div>
                        <div className="space-y-2">
                            <label className="text-sm font-medium">Comissão (%)</label>
                            <Input
                                type="number"
                                value={editingPartner?.commission_rate || 0}
                                onChange={(e) => setEditingPartner({ ...editingPartner, commission_rate: Number(e.target.value) })}
                                placeholder="0"
                            />
                        </div>
                    </div>
                    <DialogFooter>
                        <Button variant="outline" onClick={() => setIsDialogOpen(false)}>Cancelar</Button>
                        <Button onClick={handleSavePartner}>Salvar</Button>
                    </DialogFooter>
                </DialogContent>
            </Dialog>
        </AdminLayout>
    );
}
