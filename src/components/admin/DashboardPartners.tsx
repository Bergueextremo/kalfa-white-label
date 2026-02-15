import { useEffect, useState } from "react";
import { supabase } from "@/integrations/supabase/client";
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
    discount_rate: number;
    created_at: string;
}

export function DashboardPartners() {
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
            const { data, error } = await (supabase as any)
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
                discount_rate: editingPartner.discount_rate || 0,
            };

            if (editingPartner.id) {
                const { error } = await (supabase as any)
                    .from("partners")
                    .update(partnerData)
                    .eq("id", editingPartner.id);
                if (error) throw error;
                toast.success("Parceiro atualizado com sucesso!");
            } else {
                const { error } = await (supabase as any)
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
            const { error } = await (supabase as any)
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
        <div className="space-y-6">
            <div className="flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
                <div>
                    <h2 className="text-2xl font-bold text-slate-900">Parceiros</h2>
                    <p className="text-slate-500 mt-1 text-sm">Gerenciamento de cupons e descontos</p>
                </div>
                <div className="flex gap-2 w-full md:w-auto">
                    <div className="relative flex-1 md:w-64">
                        <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 h-4 w-4 text-slate-400" />
                        <Input
                            placeholder="Buscar..."
                            className="pl-9 h-9"
                            value={searchTerm}
                            onChange={(e) => setSearchTerm(e.target.value)}
                        />
                    </div>
                    <Button onClick={() => {
                        setEditingPartner({ commission_rate: 0, discount_rate: 0 });
                        setIsDialogOpen(true);
                    }} size="sm" className="gap-2">
                        <Plus className="h-4 w-4" />
                        Novo
                    </Button>
                </div>
            </div>

            <Card>
                <CardContent className="p-0 overflow-x-auto">
                    {isLoading ? (
                        <div className="flex justify-center py-12">
                            <Loader2 className="h-8 w-8 animate-spin text-[#002B5C]" />
                        </div>
                    ) : filteredPartners.length === 0 ? (
                        <div className="p-12 text-center text-slate-500 text-sm">
                            Nenhum parceiro encontrado.
                        </div>
                    ) : (
                        <table className="w-full text-left text-sm">
                            <thead className="bg-slate-50 border-b border-slate-200">
                                <tr>
                                    <th className="py-3 px-4 font-semibold text-slate-600">Nome</th>
                                    <th className="py-3 px-4 font-semibold text-slate-600">Código</th>
                                    <th className="py-3 px-4 font-semibold text-slate-600">Desconto (%)</th>
                                    <th className="py-3 px-4 font-semibold text-slate-600 font-normal">Comissão (%)</th>
                                    <th className="py-3 px-4 font-semibold text-slate-600 text-right">Ações</th>
                                </tr>
                            </thead>
                            <tbody>
                                {filteredPartners.map((p) => (
                                    <tr key={p.id} className="border-b border-slate-100 hover:bg-slate-50 transition-colors">
                                        <td className="py-3 px-4 font-medium text-slate-900">{p.name}</td>
                                        <td className="py-3 px-4">
                                            <code className="bg-slate-100 px-2 py-0.5 rounded text-slate-700 font-bold text-xs">
                                                {p.code}
                                            </code>
                                        </td>
                                        <td className="py-3 px-4 text-emerald-600 font-bold">{p.discount_rate}%</td>
                                        <td className="py-3 px-4 text-slate-600">{p.commission_rate}%</td>
                                        <td className="py-3 px-4 text-right space-x-1">
                                            <Button
                                                variant="ghost"
                                                size="icon"
                                                className="h-8 w-8"
                                                onClick={() => {
                                                    setEditingPartner(p);
                                                    setIsDialogOpen(true);
                                                }}
                                            >
                                                <Edit2 className="h-3.5 w-3.5" />
                                            </Button>
                                            <Button
                                                variant="ghost"
                                                size="icon"
                                                className="h-8 w-8 text-red-500 hover:text-red-700 hover:bg-red-50"
                                                onClick={() => handleDeletePartner(p.id)}
                                            >
                                                <Trash2 className="h-3.5 w-3.5" />
                                            </Button>
                                        </td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    )}
                </CardContent>
            </Card>

            <Dialog open={isDialogOpen} onOpenChange={setIsDialogOpen}>
                <DialogContent className="sm:max-w-[400px]">
                    <DialogHeader>
                        <DialogTitle>{editingPartner?.id ? "Editar Parceiro" : "Novo Parceiro"}</DialogTitle>
                    </DialogHeader>
                    <div className="space-y-4 py-2">
                        <div className="space-y-1">
                            <label className="text-xs font-semibold uppercase text-slate-500">Nome do Parceiro</label>
                            <Input
                                value={editingPartner?.name || ""}
                                onChange={(e) => setEditingPartner({ ...editingPartner, name: e.target.value })}
                                placeholder="Ex: João Silva"
                            />
                        </div>
                        <div className="grid grid-cols-2 gap-4">
                            <div className="space-y-1">
                                <label className="text-xs font-semibold uppercase text-slate-500">Cupom</label>
                                <Input
                                    value={editingPartner?.code || ""}
                                    onChange={(e) => setEditingPartner({ ...editingPartner, code: e.target.value })}
                                    placeholder="JOAO10"
                                    className="uppercase font-bold"
                                />
                            </div>
                            <div className="space-y-1">
                                <label className="text-xs font-semibold uppercase text-slate-500">Desconto (%)</label>
                                <Input
                                    type="number"
                                    value={editingPartner?.discount_rate || 0}
                                    onChange={(e) => setEditingPartner({ ...editingPartner, discount_rate: Number(e.target.value) })}
                                    className="text-emerald-600 font-bold"
                                />
                            </div>
                        </div>
                        <div className="space-y-1">
                            <label className="text-xs font-semibold uppercase text-slate-500">Comissão p/ Parceiro (%)</label>
                            <Input
                                type="number"
                                value={editingPartner?.commission_rate || 0}
                                onChange={(e) => setEditingPartner({ ...editingPartner, commission_rate: Number(e.target.value) })}
                            />
                        </div>
                    </div>
                    <DialogFooter>
                        <Button variant="outline" size="sm" onClick={() => setIsDialogOpen(false)}>Cancelar</Button>
                        <Button size="sm" onClick={handleSavePartner} className="bg-[#002B5C]">Salvar</Button>
                    </DialogFooter>
                </DialogContent>
            </Dialog>
        </div>
    );
}
