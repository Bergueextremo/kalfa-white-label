import { useState, useEffect } from "react";
import { AdminLayout } from "@/components/admin/AdminLayout";
import { Button } from "@/components/ui/button";
import {
    Table,
    TableBody,
    TableCell,
    TableHead,
    TableHeader,
    TableRow,
} from "@/components/ui/table";
import { Badge } from "@/components/ui/badge";
import { Input } from "@/components/ui/input";
import {
    Plus,
    Search,
    MoreHorizontal,
    Pencil,
    Trash2,
    FileText,
    Loader2
} from "lucide-react";
import {
    DropdownMenu,
    DropdownMenuContent,
    DropdownMenuItem,
    DropdownMenuLabel,
    DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu";
import { useNavigate } from "react-router-dom";
import { supabase } from "@/lib/supabase";
import { toast } from "sonner";
import { Contract } from "@/components/catalog/types";

export default function AdminContracts() {
    const navigate = useNavigate();
    const [loading, setLoading] = useState(true);
    const [contracts, setContracts] = useState<Contract[]>([]);
    const [searchTerm, setSearchTerm] = useState("");

    const fetchContracts = async () => {
        setLoading(true);
        try {
            const { data, error } = await supabase
                .from('contracts')
                .select('*')
                .order('created_at', { ascending: false });

            if (error) throw error;
            setContracts(data || []);
        } catch (error) {
            console.error(error);
            toast.error("Erro ao carregar contratos");
        } finally {
            setLoading(false);
        }
    };

    useEffect(() => {
        fetchContracts();
    }, []);

    const deleteContract = async (id: string) => {
        if (!confirm("Tem certeza que deseja excluir este contrato?")) return;

        try {
            // Delete variables first (cascade should handle this but let's be safe if no cascade)
            // Assuming DB has cascade or we delete manually. RLS policies usually apply.
            // Let's try direct delete.
            const { error } = await supabase
                .from('contracts')
                .delete()
                .eq('id', id);

            if (error) throw error;

            toast.success("Contrato excluído");
            setContracts(prev => prev.filter(c => c.id !== id));
        } catch (error) {
            console.error(error);
            toast.error("Erro ao excluir contrato");
        }
    };

    const filteredContracts = contracts.filter(c =>
        c.title.toLowerCase().includes(searchTerm.toLowerCase()) ||
        c.description?.toLowerCase().includes(searchTerm.toLowerCase())
    );

    return (
        <AdminLayout>
            <div className="space-y-6">
                <div className="flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
                    <div>
                        <h1 className="text-3xl font-bold text-slate-900">Contratos</h1>
                        <p className="text-slate-500 mt-1">Gerencie os modelos de contrato disponíveis no catálogo</p>
                    </div>
                    <Button onClick={() => navigate('/admin/contratos/novo')} className="bg-blue-600 hover:bg-blue-700">
                        <Plus className="mr-2 h-4 w-4" />
                        Novo Contrato
                    </Button>
                </div>

                <div className="flex items-center gap-2 bg-white p-2 rounded-lg border max-w-md">
                    <Search className="h-4 w-4 text-slate-400" />
                    <Input
                        placeholder="Buscar contratos..."
                        className="border-0 focus-visible:ring-0"
                        value={searchTerm}
                        onChange={e => setSearchTerm(e.target.value)}
                    />
                </div>

                <div className="bg-white rounded-lg border shadow-sm">
                    <Table>
                        <TableHeader>
                            <TableRow>
                                <TableHead>Título</TableHead>
                                <TableHead>Slug</TableHead>
                                <TableHead>Preço</TableHead>
                                <TableHead>Status</TableHead>
                                <TableHead className="w-[80px]"></TableHead>
                            </TableRow>
                        </TableHeader>
                        <TableBody>
                            {loading ? (
                                <TableRow>
                                    <TableCell colSpan={5} className="h-24 text-center">
                                        <Loader2 className="h-6 w-6 animate-spin mx-auto text-primary" />
                                    </TableCell>
                                </TableRow>
                            ) : filteredContracts.length === 0 ? (
                                <TableRow>
                                    <TableCell colSpan={5} className="h-24 text-center text-muted-foreground">
                                        Nenhum contrato encontrado.
                                    </TableCell>
                                </TableRow>
                            ) : (
                                filteredContracts.map((contract) => (
                                    <TableRow key={contract.id}>
                                        <TableCell className="font-medium">
                                            <div className="flex items-center gap-2">
                                                <div className="bg-blue-50 p-2 rounded text-blue-600">
                                                    <FileText className="h-4 w-4" />
                                                </div>
                                                {contract.title}
                                            </div>
                                        </TableCell>
                                        <TableCell className="font-mono text-xs text-muted-foreground">
                                            {contract.slug}
                                        </TableCell>
                                        <TableCell>
                                            {contract.price === 0 ?
                                                <Badge variant="secondary">Grátis</Badge> :
                                                `R$ ${contract.price.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}`
                                            }
                                        </TableCell>
                                        <TableCell>

                                        </TableCell>
                                        <TableCell>
                                            <DropdownMenu>
                                                <DropdownMenuTrigger asChild>
                                                    <Button variant="ghost" className="h-8 w-8 p-0">
                                                        <MoreHorizontal className="h-4 w-4" />
                                                    </Button>
                                                </DropdownMenuTrigger>
                                                <DropdownMenuContent align="end">
                                                    <DropdownMenuLabel>Ações</DropdownMenuLabel>
                                                    <DropdownMenuItem onClick={() => navigate(`/admin/contratos/${contract.id}`)}>
                                                        <Pencil className="mr-2 h-4 w-4" /> Editar
                                                    </DropdownMenuItem>
                                                    <DropdownMenuItem
                                                        onClick={() => deleteContract(contract.id)}
                                                        className="text-red-600 focus:text-red-600"
                                                    >
                                                        <Trash2 className="mr-2 h-4 w-4" /> Excluir
                                                    </DropdownMenuItem>
                                                </DropdownMenuContent>
                                            </DropdownMenu>
                                        </TableCell>
                                    </TableRow>
                                ))
                            )}
                        </TableBody>
                    </Table>
                </div>
            </div>
        </AdminLayout>
    );
}
