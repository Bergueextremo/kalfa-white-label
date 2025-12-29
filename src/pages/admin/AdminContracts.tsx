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
    Loader2,
    CheckSquare,
    Square,
    ChevronDown,
    Settings2,
    Tag,
    DollarSign,
    Eye,
    EyeOff,
    Copy
} from "lucide-react";
import { Checkbox } from "@/components/ui/checkbox";
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
import { cn } from "@/lib/utils";

export default function AdminContracts() {
    const navigate = useNavigate();
    const [loading, setLoading] = useState(true);
    const [contracts, setContracts] = useState<Contract[]>([]);
    const [categories, setCategories] = useState<{ id: string, name: string }[]>([]);
    const [searchTerm, setSearchTerm] = useState("");
    const [selectedIds, setSelectedIds] = useState<string[]>([]);
    const [isBulkLoading, setIsBulkLoading] = useState(false);

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

    const fetchCategories = async () => {
        const { data } = await supabase.from('contract_categories').select('id, name').order('name');
        setCategories(data || []);
    };

    useEffect(() => {
        fetchContracts();
        fetchCategories();
    }, []);

    const toggleSelectAll = () => {
        if (selectedIds.length === filteredContracts.length) {
            setSelectedIds([]);
        } else {
            setSelectedIds(filteredContracts.map(c => c.id));
        }
    };

    const toggleSelect = (id: string) => {
        setSelectedIds(prev =>
            prev.includes(id) ? prev.filter(i => i !== id) : [...prev, id]
        );
    };

    const handleBulkDelete = async () => {
        if (!confirm(`Tem certeza que deseja excluir ${selectedIds.length} contratos?`)) return;
        setIsBulkLoading(true);
        try {
            const { error } = await supabase
                .from('contracts')
                .delete()
                .in('id', selectedIds);

            if (error) {
                if (error.code === '23503') { // Foreign key violation
                    throw new Error("Alguns contratos selecionados possuem vendas registradas e não podem ser excluídos. Tente desativá-los.");
                }
                throw error;
            }

            toast.success(`${selectedIds.length} contratos excluídos`);
            setContracts(prev => prev.filter(c => !selectedIds.includes(c.id)));
            setSelectedIds([]);
        } catch (error: any) {
            console.error(error);
            toast.error(error.message || "Erro ao excluir contratos");
        } finally {
            setIsBulkLoading(false);
        }
    };

    const handleBulkCategoryChange = async (categoryId: string) => {
        setIsBulkLoading(true);
        try {
            const { error } = await supabase
                .from('contracts')
                .update({ category_id: categoryId })
                .in('id', selectedIds);
            if (error) throw error;
            toast.success("Categorias atualizadas");
            fetchContracts();
            setSelectedIds([]);
        } catch (error) {
            console.error(error);
            toast.error("Erro ao atualizar categorias");
        } finally {
            setIsBulkLoading(false);
        }
    };

    const handleBulkPriceChange = async (price: number) => {
        setIsBulkLoading(true);
        try {
            const { error } = await supabase
                .from('contracts')
                .update({ price })
                .in('id', selectedIds);
            if (error) throw error;
            toast.success("Preços atualizados");
            fetchContracts();
            setSelectedIds([]);
        } catch (error) {
            console.error(error);
            toast.error("Erro ao atualizar preços");
        } finally {
            setIsBulkLoading(false);
        }
    };

    const handleBulkStatusChange = async (isActive: boolean) => {
        setIsBulkLoading(true);
        try {
            const { error } = await supabase
                .from('contracts')
                .update({ is_active: isActive })
                .in('id', selectedIds);
            if (error) throw error;
            toast.success(isActive ? "Contratos ativados" : "Contratos desativados");
            fetchContracts();
            setSelectedIds([]);
        } catch (error: any) {
            console.error(error);
            toast.error(error.message || "Erro ao atualizar status");
        } finally {
            setIsBulkLoading(false);
        }
    };

    const handleBulkDuplicate = async () => {
        if (!confirm(`Tem certeza que deseja duplicar ${selectedIds.length} contrato(s)?`)) return;
        setIsBulkLoading(true);
        try {
            // Get full data of selected contracts
            const contractsToDuplicate = contracts.filter(c => selectedIds.includes(c.id));

            // Create copies
            for (const contract of contractsToDuplicate) {
                const newContract = {
                    title: `${contract.title} (Cópia)`,
                    slug: `${contract.slug}-copia-${Date.now()}`,
                    description: contract.description,
                    template_body: contract.template_body,
                    price: contract.price,
                    category_id: contract.category_id,
                    is_active: false // Start as inactive
                };

                const { error } = await supabase.from('contracts').insert(newContract);
                if (error) throw error;
            }

            toast.success(`${selectedIds.length} contrato(s) duplicado(s)`);
            fetchContracts();
            setSelectedIds([]);
        } catch (error: any) {
            console.error(error);
            toast.error(error.message || "Erro ao duplicar contratos");
        } finally {
            setIsBulkLoading(false);
        }
    };

    const deleteContract = async (id: string) => {

        if (!confirm("Tem certeza que deseja excluir este contrato?")) return;

        try {
            const { error } = await supabase
                .from('contracts')
                .delete()
                .eq('id', id);

            if (error) {
                if (error.code === '23503') {
                    throw new Error("Este contrato possui vendas registradas e não pode ser excluído. Tente desativá-lo.");
                }
                throw error;
            }

            toast.success("Contrato excluído");
            setContracts(prev => prev.filter(c => c.id !== id));
        } catch (error: any) {
            console.error(error);
            toast.error(error.message || "Erro ao excluir contrato");
        }
    };

    const installUXModel = async () => {
        if (!confirm("Isso irá instalar o 'CONTRATO MODELO COM LÓGICA CONDICIONAL'. Deseja continuar?")) return;
        setIsBulkLoading(true);
        try {
            // 1. Create Contract
            const contractId = '00000000-0000-0000-0000-000000000001';

            // Upsert Contract
            const { error: contractError } = await supabase.from('contracts').upsert({
                id: contractId,
                title: 'CONTRATO MODELO COM LÓGICA CONDICIONAL',
                slug: 'contrato-modelo-ux-' + Date.now(), // Append timestamp to avoid slug conflict if exists
                description: 'Modelo de contrato com todas as variáveis e lógicas condicionais configuradas',
                category_id: categories[0]?.id, // Pick first category
                price: 0,
                is_active: true,
                wizard_stages: ['Tipo de Contratante', 'Qualificação Pessoa Física', 'Qualificação Pessoa Jurídica', 'Dados do Cônjuge', 'Objeto do Contrato', 'Valores e Condições', 'Prazos', 'Foro e Assinatura'],
                template_body: `<h1>CONTRATO MODELO</h1>... (Ver Conteúdo Completo no Editor)`
            });

            if (contractError) throw contractError;

            // 2. Delete existing vars for this contract
            await supabase.from('contract_variables').delete().eq('contract_id', contractId);

            // 3. Insert Variables
            const vars = [
                // Etapa 1: Natureza do Locador
                { contract_id: contractId, name: 'tipo_locador', label: 'O locador é:', type: 'select', options: '["Pessoa Física (particular)", "Pessoa Jurídica (imobiliária ou empresa)"]', required: true, group_name: 'Tipo de Contratante', order_index: 1, visibility_rule: null },

                // Etapa 2: Qualificação (PF)
                { contract_id: contractId, name: 'condicao_locador', label: 'O locador aluga o bem sob a seguinte condição:', type: 'select', options: '["Proprietário (dono) do bem", "Locatário e deseja sublocá-lo", "Fiduciário (pessoa encarregada pelo bem sob condição de testamento)", "Inventariante (representante da herança)", "Comodatário (pegou o bem emprestado)", "Usufrutuário (possui o direito de usufruir do bem)", "Outra situação"]', required: true, group_name: 'Qualificação Pessoa Física', order_index: 2, visibility_rule: { dependsOn: 'tipo_locador', operator: 'contains', value: 'Física' } },
                { contract_id: contractId, name: 'nome_completo', label: 'Nome Completo', type: 'text', required: true, group_name: 'Qualificação Pessoa Física', order_index: 3, visibility_rule: { dependsOn: 'tipo_locador', operator: 'contains', value: 'Física' } },
                { contract_id: contractId, name: 'nacionalidade', label: 'Nacionalidade do locador', type: 'text', required: true, group_name: 'Qualificação Pessoa Física', order_index: 4, visibility_rule: { dependsOn: 'tipo_locador', operator: 'contains', value: 'Física' } },
                { contract_id: contractId, name: 'estado_civil', label: 'Estado civil do locador:', type: 'select', options: '["Solteiro(a)", "Casado(a)", "Divorciado(a)", "em União Estável", "Separado(a) judicialmente", "Viúvo(a)"]', required: true, group_name: 'Qualificação Pessoa Física', order_index: 5, visibility_rule: { dependsOn: 'tipo_locador', operator: 'contains', value: 'Física' } },
                { contract_id: contractId, name: 'profissao', label: 'Profissão', type: 'text', required: true, group_name: 'Qualificação Pessoa Física', order_index: 6, visibility_rule: { dependsOn: 'tipo_locador', operator: 'contains', value: 'Física' } },

                // Documentos PF
                { contract_id: contractId, name: 'tipo_documento', label: 'Selecione o documento de identificação:', type: 'select', options: '["Carteira de Identidade (RG)", "Identidade Funcional", "Carteira de Trabalho e Previdência Social (CTPS)", "Carteira Nacional de Habilitação (CNH)", "Passaporte"]', required: true, group_name: 'Qualificação Pessoa Física', order_index: 7, visibility_rule: { dependsOn: 'tipo_locador', operator: 'contains', value: 'Física' } },
                { contract_id: contractId, name: 'numero_documento', label: 'Número do Documento', type: 'text', required: true, group_name: 'Qualificação Pessoa Física', order_index: 8, visibility_rule: { dependsOn: 'tipo_locador', operator: 'contains', value: 'Física' } },
                { contract_id: contractId, name: 'cpf', label: 'CPF', type: 'cpf', required: true, group_name: 'Qualificação Pessoa Física', order_index: 9, visibility_rule: { dependsOn: 'tipo_locador', operator: 'contains', value: 'Física' } },
                { contract_id: contractId, name: 'endereco_completo', label: 'Endereço Completo', type: 'text', required: true, group_name: 'Qualificação Pessoa Física', order_index: 10, visibility_rule: { dependsOn: 'tipo_locador', operator: 'contains', value: 'Física' } },

                // Etapa 3 (PJ)
                { contract_id: contractId, name: 'razao_social', label: 'Razão Social', type: 'text', required: true, group_name: 'Qualificação Pessoa Jurídica', order_index: 11, visibility_rule: { dependsOn: 'tipo_locador', operator: 'contains', value: 'Jurídica' } },
                { contract_id: contractId, name: 'cnpj', label: 'CNPJ', type: 'cnpj', required: true, group_name: 'Qualificação Pessoa Jurídica', order_index: 12, visibility_rule: { dependsOn: 'tipo_locador', operator: 'contains', value: 'Jurídica' } },
                { contract_id: contractId, name: 'endereco_empresa', label: 'Endereço da Empresa', type: 'text', required: true, group_name: 'Qualificação Pessoa Jurídica', order_index: 13, visibility_rule: { dependsOn: 'tipo_locador', operator: 'contains', value: 'Jurídica' } },
                { contract_id: contractId, name: 'representante_nome', label: 'Nome do Representante', type: 'text', required: true, group_name: 'Qualificação Pessoa Jurídica', order_index: 14, visibility_rule: { dependsOn: 'tipo_locador', operator: 'contains', value: 'Jurídica' } },
                { contract_id: contractId, name: 'representante_cpf', label: 'CPF do Representante', type: 'cpf', required: true, group_name: 'Qualificação Pessoa Jurídica', order_index: 15, visibility_rule: { dependsOn: 'tipo_locador', operator: 'contains', value: 'Jurídica' } },

                // Etapa 4 (Conjugê)
                { contract_id: contractId, name: 'conjuge_nome', label: 'Nome do Cônjuge', type: 'text', required: true, group_name: 'Dados do Cônjuge', order_index: 20, visibility_rule: { dependsOn: 'estado_civil', operator: 'equals', value: 'Casado(a)' } },
                { contract_id: contractId, name: 'conjuge_cpf', label: 'CPF do Cônjuge', type: 'cpf', required: true, group_name: 'Dados do Cônjuge', order_index: 21, visibility_rule: { dependsOn: 'estado_civil', operator: 'equals', value: 'Casado(a)' } },
                { contract_id: contractId, name: 'regime_bens', label: 'Regime de Bens', type: 'select', options: '["Comunhão Parcial de Bens", "Comunhão Universal de Bens", "Separação Total de Bens", "Participação Final nos Aquestos"]', required: true, group_name: 'Dados do Cônjuge', order_index: 23, visibility_rule: { dependsOn: 'estado_civil', operator: 'equals', value: 'Casado(a)' } },

                // Etapa 5 (Objeto)
                { contract_id: contractId, name: 'objeto_descricao', label: 'Descrição do Objeto (Endereço do Imóvel, etc)', type: 'textarea', required: true, group_name: 'Objeto do Contrato', order_index: 30, visibility_rule: null },

                // Etapa 6 (Valores)
                { contract_id: contractId, name: 'valor_total', label: 'Valor do Aluguel', type: 'money', required: true, group_name: 'Valores e Condições', order_index: 40, visibility_rule: null },
                { contract_id: contractId, name: 'dia_pagamento', label: 'Dia do Pagamento', type: 'number', required: true, group_name: 'Valores e Condições', order_index: 41, visibility_rule: null },
                { contract_id: contractId, name: 'forma_pagamento', label: 'Forma de Pagamento', type: 'select', options: '["Boleto Bancário", "Transferência Bancária / PIX", "Dinheiro em Espécie", "Cheque"]', required: true, group_name: 'Valores e Condições', order_index: 42, visibility_rule: null },

                // Etapa 7 (Prazos)
                { contract_id: contractId, name: 'data_inicio', label: 'Data de Início da Locação', type: 'date', required: true, group_name: 'Prazos', order_index: 50, visibility_rule: null },
                { contract_id: contractId, name: 'prazo_meses', label: 'Prazo em Meses', type: 'number', required: true, group_name: 'Prazos', order_index: 51, visibility_rule: null },

                // Etapa 8 (Foro)
                { contract_id: contractId, name: 'cidade_foro', label: 'Cidade do Foro', type: 'text', required: true, group_name: 'Foro e Assinatura', order_index: 60, visibility_rule: null },
                { contract_id: contractId, name: 'estado_foro', label: 'Estado do Foro', type: 'select', options: '["SP", "RJ", "MG", "RS", "PR", "SC", "ES", "GO", "DF", "BA", "PE", "CE", "AM", "PA", "MT", "MS", "TO", "RO", "AC", "RR", "AP", "MA", "PI", "RN", "PB", "AL", "SE"]', required: true, group_name: 'Foro e Assinatura', order_index: 61, visibility_rule: null },
                { contract_id: contractId, name: 'data_assinatura', label: 'Data de Assinatura', type: 'date', required: true, group_name: 'Foro e Assinatura', order_index: 62, visibility_rule: null },
            ];


            const { error: varsError } = await supabase.from('contract_variables').insert(vars);
            if (varsError) throw varsError;

            toast.success("✅ Modelo UX instalado com sucesso!");
            fetchContracts();

        } catch (error: any) {
            console.error(error);
            toast.error("Erro ao instalar modelo: " + error.message);
        } finally {
            setIsBulkLoading(false);
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
                    <div className="flex gap-3">
                        <Button
                            onClick={installUXModel}
                            variant="outline"
                            className="border-purple-200 text-purple-700 hover:bg-purple-50"
                        >
                            <Settings2 className="mr-2 h-4 w-4" />
                            Instalar Modelo UX
                        </Button>
                        <Button onClick={() => navigate('/admin/contratos/novo')} className="bg-blue-600 hover:bg-blue-700">
                            <Plus className="mr-2 h-4 w-4" />
                            Novo Contrato
                        </Button>
                    </div>
                </div>

                <div className="flex flex-col md:flex-row items-start md:items-center gap-4">
                    <div className="flex items-center gap-2 bg-white p-2 rounded-lg border flex-1 max-w-md w-full">
                        <Search className="h-4 w-4 text-slate-400" />
                        <Input
                            placeholder="Buscar contratos..."
                            className="border-0 focus-visible:ring-0 h-8"
                            value={searchTerm}
                            onChange={e => setSearchTerm(e.target.value)}
                        />
                    </div>

                    {selectedIds.length > 0 && (
                        <div className="flex items-center gap-2 bg-blue-50 border border-blue-100 p-1.5 rounded-lg animate-in fade-in slide-in-from-top-2 w-full md:w-auto overflow-x-auto">
                            <div className="flex items-center gap-2 px-3 border-r border-blue-200 mr-2 shrink-0">
                                {isBulkLoading ? (
                                    <Loader2 className="h-4 w-4 animate-spin text-blue-600" />
                                ) : (
                                    <span className="text-sm font-bold text-blue-700">{selectedIds.length} selecionados</span>
                                )}
                            </div>

                            <div className={cn("flex items-center gap-1 shrink-0", isBulkLoading && "opacity-50 pointer-events-none")}>
                                {/* Bulk Category */}
                                <DropdownMenu>
                                    <DropdownMenuTrigger asChild>
                                        <Button variant="ghost" size="sm" className="h-8 text-blue-700 hover:bg-blue-100 gap-2">
                                            <Tag className="h-3.5 w-3.5" />
                                            <span className="hidden sm:inline">Mudar Categoria</span>
                                            <ChevronDown className="h-3 w-3" />
                                        </Button>
                                    </DropdownMenuTrigger>
                                    <DropdownMenuContent>
                                        <DropdownMenuLabel>Selecionar Categoria</DropdownMenuLabel>
                                        {categories.map(cat => (
                                            <DropdownMenuItem key={cat.id} onClick={() => handleBulkCategoryChange(cat.id)}>
                                                {cat.name}
                                            </DropdownMenuItem>
                                        ))}
                                    </DropdownMenuContent>
                                </DropdownMenu>

                                {/* Bulk Price */}
                                <DropdownMenu>
                                    <DropdownMenuTrigger asChild>
                                        <Button variant="ghost" size="sm" className="h-8 text-blue-700 hover:bg-blue-100 gap-2">
                                            <DollarSign className="h-3.5 w-3.5" />
                                            <span className="hidden sm:inline">Alterar Preço</span>
                                            <ChevronDown className="h-3 w-3" />
                                        </Button>
                                    </DropdownMenuTrigger>
                                    <DropdownMenuContent className="p-2 w-48">
                                        <DropdownMenuLabel>Novo Preço (R$)</DropdownMenuLabel>
                                        <div className="flex gap-2 mt-2">
                                            <Input
                                                id="bulk-price"
                                                type="number"
                                                placeholder="0,00"
                                                className="h-8 text-xs"
                                                onKeyDown={(e) => {
                                                    if (e.key === 'Enter') {
                                                        const val = parseFloat((e.target as HTMLInputElement).value);
                                                        if (!isNaN(val)) handleBulkPriceChange(val);
                                                    }
                                                }}
                                            />
                                            <Button
                                                size="sm"
                                                className="h-8 px-2"
                                                onClick={() => {
                                                    const el = document.getElementById('bulk-price') as HTMLInputElement;
                                                    const val = parseFloat(el.value);
                                                    if (!isNaN(val)) handleBulkPriceChange(val);
                                                }}
                                            >
                                                Aplicar
                                            </Button>
                                        </div>
                                    </DropdownMenuContent>
                                </DropdownMenu>

                                <Button
                                    variant="ghost"
                                    size="sm"
                                    onClick={() => handleBulkStatusChange(true)}
                                    className="h-8 text-blue-700 hover:bg-blue-100 gap-2"
                                >
                                    <Eye className="h-3.5 w-3.5" />
                                    <span className="hidden sm:inline">Ativar</span>
                                </Button>

                                <Button
                                    variant="ghost"
                                    size="sm"
                                    onClick={() => handleBulkStatusChange(false)}
                                    className="h-8 text-blue-700 hover:bg-blue-100 gap-2"
                                >
                                    <EyeOff className="h-3.5 w-3.5" />
                                    <span className="hidden sm:inline">Desativar</span>
                                </Button>

                                <Button
                                    variant="ghost"
                                    size="sm"
                                    onClick={handleBulkDuplicate}
                                    className="h-8 text-blue-700 hover:bg-blue-100 gap-2"
                                >
                                    <Copy className="h-3.5 w-3.5" />
                                    <span className="hidden sm:inline">Duplicar</span>
                                </Button>

                                <Button
                                    variant="ghost"
                                    size="sm"
                                    onClick={handleBulkDelete}
                                    className="h-8 text-red-600 hover:bg-red-50 hover:text-red-700 gap-2"
                                >
                                    <Trash2 className="h-3.5 w-3.5" />
                                    <span className="hidden sm:inline">Excluir</span>
                                </Button>
                            </div>
                        </div>
                    )}
                </div>

                <div className="bg-white rounded-lg border shadow-sm">
                    <Table>
                        <TableHeader>
                            <TableRow>
                                <TableHead className="w-[40px]">
                                    <Checkbox
                                        checked={selectedIds.length === filteredContracts.length && filteredContracts.length > 0}
                                        onCheckedChange={toggleSelectAll}
                                    />
                                </TableHead>
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
                                    <TableRow key={contract.id} className={selectedIds.includes(contract.id) ? "bg-slate-50" : ""}>
                                        <TableCell>
                                            <Checkbox
                                                checked={selectedIds.includes(contract.id)}
                                                onCheckedChange={() => toggleSelect(contract.id)}
                                            />
                                        </TableCell>
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
                                            {contract.is_active ?
                                                <Badge className="bg-green-100 text-green-700 border-green-200 hover:bg-green-100">Ativo</Badge> :
                                                <Badge variant="secondary" className="bg-slate-100 text-slate-500 border-slate-200">Inativo</Badge>
                                            }
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
