import { useState, useEffect } from "react";
import { AdminLayout } from "@/components/admin/AdminLayout";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Label } from "@/components/ui/label";
import { Input } from "@/components/ui/input";
import { Textarea } from "@/components/ui/textarea";
import { Button } from "@/components/ui/button";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { Switch } from "@/components/ui/switch";
import { supabase } from "@/lib/supabase";
import { toast } from "sonner";
import { useNavigate } from "react-router-dom";
import { Plus, Trash2, Save, ArrowLeft, Loader2 } from "lucide-react";
import { Category } from "@/components/catalog/types";

// Temporary ID generator
const generateId = () => Math.random().toString(36).substr(2, 9);

interface Variable {
    tempId: string;
    name: string;
    label: string;
    type: string;
    required: boolean;
}

export default function AdminContractNew() {
    const navigate = useNavigate();
    const [isLoading, setIsLoading] = useState(false);
    const [categories, setCategories] = useState<Category[]>([]);

    // Form State
    const [title, setTitle] = useState("");
    const [subtitle, setSubtitle] = useState(""); // Maps to description
    const [slug, setSlug] = useState("");
    const [price, setPrice] = useState("");
    const [categoryId, setCategoryId] = useState("");
    const [content, setContent] = useState(""); // Maps to template_body
    const [isActive, setIsActive] = useState(true);

    // Variables State
    const [variables, setVariables] = useState<Variable[]>([]);

    // Fetch Categories
    useEffect(() => {
        const fetchCategories = async () => {
            const { data, error } = await supabase
                .from('contract_categories')
                .select('*')
                .order('name');
            if (error) {
                toast.error("Erro ao carregar categorias");
                console.error(error);
            } else {
                setCategories(data || []);
            }
        };
        fetchCategories();
    }, []);

    // Auto-generate slug from title
    useEffect(() => {
        if (!slug && title) {
            setSlug(title.toLowerCase()
                .normalize("NFD").replace(/[\u0300-\u036f]/g, "") // remove accents
                .replace(/[^a-z0-9]+/g, "-") // replace non-alphanumeric with dash
                .replace(/^-+|-+$/g, "") // remove leading/trailing dashes
            );
        }
    }, [title]);

    const addVariable = () => {
        setVariables([
            ...variables,
            { tempId: generateId(), name: "", label: "", type: "text", required: true }
        ]);
    };

    const removeVariable = (tempId: string) => {
        setVariables(variables.filter(v => v.tempId !== tempId));
    };

    const updateVariable = (tempId: string, field: keyof Variable, value: any) => {
        setVariables(variables.map(v =>
            v.tempId === tempId ? { ...v, [field]: value } : v
        ));
    };

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        setIsLoading(true);

        try {
            if (!title || !slug || !categoryId || !price) {
                throw new Error("Preencha os campos obrigatórios (*)");
            }

            // 1. Create Contract
            const { data: contract, error: contractError } = await supabase
                .from('contracts')
                .insert({
                    title,
                    slug,
                    description: subtitle,
                    category_id: categoryId,
                    price: parseFloat(price.replace(',', '.')),
                    template_body: content,
                    is_active: isActive
                })
                .select()
                .single();

            if (contractError) throw contractError;

            // 2. Create Variables
            if (variables.length > 0) {
                const variablesToInsert = variables.map((v, index) => ({
                    contract_id: contract.id,
                    name: v.name,
                    label: v.label,
                    type: v.type,
                    required: v.required,
                    order_index: index,
                    options: null
                }));

                const { error: varsError } = await supabase
                    .from('contract_variables')
                    .insert(variablesToInsert);

                if (varsError) throw varsError;
            }

            toast.success("Contrato criado com sucesso!");
            navigate('/admin'); // Or to list
        } catch (error: any) {
            console.error(error);
            toast.error(error.message || "Erro ao salvar contrato");
        } finally {
            setIsLoading(false);
        }
    };

    return (
        <AdminLayout>
            <div className="max-w-5xl mx-auto pb-10">
                <div className="flex items-center gap-4 mb-6">
                    <Button variant="ghost" size="icon" onClick={() => navigate('/admin')}>
                        <ArrowLeft className="h-4 w-4" />
                    </Button>
                    <h1 className="text-2xl font-bold text-slate-800">Novo Contrato</h1>
                </div>

                <form onSubmit={handleSubmit} className="space-y-8">
                    {/* Basic Info */}
                    <Card>
                        <CardHeader>
                            <CardTitle>Informações Básicas</CardTitle>
                            <CardDescription>Dados principais do contrato para o catálogo</CardDescription>
                        </CardHeader>
                        <CardContent className="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div className="space-y-2">
                                <Label htmlFor="title">Título *</Label>
                                <Input
                                    id="title"
                                    value={title}
                                    onChange={e => setTitle(e.target.value)}
                                    placeholder="Ex: Contrato de Aluguel"
                                />
                            </div>

                            <div className="space-y-2">
                                <Label htmlFor="slug">Slug (URL) *</Label>
                                <Input
                                    id="slug"
                                    value={slug}
                                    onChange={e => setSlug(e.target.value)}
                                    placeholder="contract-slug"
                                />
                            </div>

                            <div className="space-y-2">
                                <Label htmlFor="category">Categoria *</Label>
                                <Select value={categoryId} onValueChange={setCategoryId}>
                                    <SelectTrigger>
                                        <SelectValue placeholder="Selecione..." />
                                    </SelectTrigger>
                                    <SelectContent>
                                        {categories.map(cat => (
                                            <SelectItem key={cat.id} value={cat.id}>{cat.name}</SelectItem>
                                        ))}
                                    </SelectContent>
                                </Select>
                            </div>

                            <div className="space-y-2">
                                <Label htmlFor="price">Preço (R$) *</Label>
                                <Input
                                    id="price"
                                    type="number"
                                    step="0.01"
                                    value={price}
                                    onChange={e => setPrice(e.target.value)}
                                    placeholder="0.00"
                                />
                            </div>

                            <div className="space-y-2 md:col-span-2">
                                <Label htmlFor="subtitle">Subtítulo (Descrição Curta)</Label>
                                <Input
                                    id="subtitle"
                                    value={subtitle}
                                    onChange={e => setSubtitle(e.target.value)}
                                    placeholder="Uma breve descrição que aparece no card do catálogo"
                                />
                            </div>

                            <div className="flex items-center gap-2">
                                <Switch id="active" checked={isActive} onCheckedChange={setIsActive} />
                                <Label htmlFor="active">Ativo no Catálogo</Label>
                            </div>
                        </CardContent>
                    </Card>

                    {/* Contract Body */}
                    <Card>
                        <CardHeader>
                            <CardTitle>Conteúdo do Contrato</CardTitle>
                            <CardDescription>
                                Texto jurídico com placeholders. Use <code>{'{{variavel}}'}</code> para substituir.
                                Suporta Markdown/HTML básico.
                            </CardDescription>
                        </CardHeader>
                        <CardContent>
                            <Textarea
                                className="min-h-[400px] font-mono text-sm"
                                value={content}
                                onChange={e => setContent(e.target.value)}
                                placeholder="CONTRATO DE LOCAÇÃO...&#10;&#10;Pelo presente, {{nome_locador}}..."
                            />
                        </CardContent>
                    </Card>

                    {/* Variables */}
                    <Card>
                        <CardHeader className="flex flex-row items-center justify-between">
                            <div>
                                <CardTitle>Variáveis de Preenchimento</CardTitle>
                                <CardDescription>Campos que o usuário deverá preencher no checkout</CardDescription>
                            </div>
                            <Button type="button" variant="outline" size="sm" onClick={addVariable}>
                                <Plus className="mr-2 h-4 w-4" />
                                Adicionar
                            </Button>
                        </CardHeader>
                        <CardContent className="space-y-4">
                            {variables.length === 0 && (
                                <div className="text-center py-8 text-muted-foreground bg-slate-50 rounded border border-dashed">
                                    Nenhuma variável adicionada. O contrato será estático.
                                </div>
                            )}

                            {variables.map((v, idx) => (
                                <div key={v.tempId} className="flex gap-4 items-start p-4 bg-slate-50 rounded border">
                                    <div className="grid grid-cols-1 md:grid-cols-4 gap-4 flex-grow">
                                        <div className="space-y-1">
                                            <Label className="text-xs">Nome no Texto (ex: nome_locador)</Label>
                                            <Input
                                                value={v.name}
                                                onChange={e => updateVariable(v.tempId, 'name', e.target.value)}
                                                placeholder="nome_variavel"
                                                className="h-8"
                                            />
                                        </div>
                                        <div className="space-y-1">
                                            <Label className="text-xs">Label para Usuário</Label>
                                            <Input
                                                value={v.label}
                                                onChange={e => updateVariable(v.tempId, 'label', e.target.value)}
                                                placeholder="Nome do Locador"
                                                className="h-8"
                                            />
                                        </div>
                                        <div className="space-y-1">
                                            <Label className="text-xs">Tipo</Label>
                                            <Select value={v.type} onValueChange={(val) => updateVariable(v.tempId, 'type', val)}>
                                                <SelectTrigger className="h-8">
                                                    <SelectValue />
                                                </SelectTrigger>
                                                <SelectContent>
                                                    <SelectItem value="text">Texto</SelectItem>
                                                    <SelectItem value="date">Data</SelectItem>
                                                    <SelectItem value="number">Número</SelectItem>
                                                    <SelectItem value="currency">Moeda</SelectItem>
                                                    <SelectItem value="cpf">CPF</SelectItem>
                                                    <SelectItem value="cnpj">CNPJ</SelectItem>
                                                </SelectContent>
                                            </Select>
                                        </div>
                                        <div className="flex items-center gap-2 pt-6">
                                            <Switch
                                                checked={v.required}
                                                onCheckedChange={(c) => updateVariable(v.tempId, 'required', c)}
                                            />
                                            <Label className="text-xs">Obrigatório</Label>
                                        </div>
                                    </div>
                                    <Button
                                        type="button"
                                        variant="ghost"
                                        size="icon"
                                        className="text-red-500 hover:text-red-700 hover:bg-red-50"
                                        onClick={() => removeVariable(v.tempId)}
                                    >
                                        <Trash2 className="h-4 w-4" />
                                    </Button>
                                </div>
                            ))}
                        </CardContent>
                    </Card>

                    <div className="flex justify-end gap-4">
                        <Button type="button" variant="ghost" onClick={() => navigate('/admin')}>
                            Cancelar
                        </Button>
                        <Button type="submit" disabled={isLoading}>
                            {isLoading && <Loader2 className="mr-2 h-4 w-4 animate-spin" />}
                            <Save className="mr-2 h-4 w-4" />
                            Criar Contrato
                        </Button>
                    </div>
                </form>
            </div>
        </AdminLayout>
    );
}
