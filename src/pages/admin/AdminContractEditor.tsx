import { useState, useEffect, useCallback } from "react";
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
import { useNavigate, useParams } from "react-router-dom";
import { Save, ArrowLeft, Loader2, RefreshCw, Trash2, Plus } from "lucide-react";
import { RichTextEditor } from "@/components/admin/RichTextEditor";
import { Category } from "@/components/catalog/types";
import { normalizeKey, cn } from "@/lib/utils";

// Helper to parse comma-separated options
const parseOptions = (str: string | string[] | null | undefined): string[] => {
    if (!str) return [];
    if (Array.isArray(str)) return str.map(s => String(s).trim()).filter(Boolean);
    if (typeof str !== 'string') return [];
    return str.split(',').map(s => s.trim()).filter(Boolean);
};

export default function AdminContractEditor() {
    const { id } = useParams();
    const isEditing = !!id;
    const navigate = useNavigate();
    const [isLoading, setIsLoading] = useState(false);
    const [isSaving, setIsSaving] = useState(false);
    const [categories, setCategories] = useState<Category[]>([]);

    // Form State
    const [title, setTitle] = useState("");
    const [subtitle, setSubtitle] = useState("");
    const [slug, setSlug] = useState("");
    const [price, setPrice] = useState("");
    const [categoryId, setCategoryId] = useState("");
    const [content, setContent] = useState("");
    const [isActive, setIsActive] = useState(true);
    const [wizardStages, setWizardStages] = useState<string[]>([]);

    // Detected Variables State - Enhanced to include options
    interface DetectedVariable {
        name: string;
        label: string;
        type: string;
        required: boolean;
        options: string; // Stored as comma-separated string for editing
        group_name: string;
    }
    const [detectedVariables, setDetectedVariables] = useState<DetectedVariable[]>([]);
    const [initialVariables, setInitialVariables] = useState<DetectedVariable[]>([]); // To store variables from DB
    const [selectedVars, setSelectedVars] = useState<string[]>([]); // For bulk actions

    // Fetch Categories
    useEffect(() => {
        const fetchCategories = async () => {
            const { data } = await supabase.from('contract_categories').select('*').order('name');
            setCategories(data || []);
        };
        fetchCategories();
    }, []);

    // Fetch Data if Editing
    useEffect(() => {
        if (!isEditing) return;

        const fetchData = async () => {
            setIsLoading(true);
            try {
                const { data: contract, error } = await supabase
                    .from('contracts')
                    .select('*')
                    .eq('id', id)
                    .single();

                if (error) throw error;

                setTitle(contract.title);
                setSlug(contract.slug);
                setSubtitle(contract.description || "");
                setPrice(contract.price.toString());
                setCategoryId(contract.category_id);
                setContent(contract.template_body || "");
                setIsActive(contract.is_active || false);
                setWizardStages(contract.wizard_stages || []);

                // Fetch existing vars to preserve configuration
                const { data: existingVars } = await supabase
                    .from('contract_variables')
                    .select('*')
                    .eq('contract_id', id)
                    .order('order_index');

                if (existingVars) {
                    const mappedVars = existingVars.map(v => ({
                        name: v.name,
                        label: v.label,
                        type: v.type,
                        required: v.required,
                        group_name: v.group_name || "",
                        options: Array.isArray(v.options) ? v.options.join(', ') : (v.options || '')
                    }));
                    setDetectedVariables(mappedVars);
                    setInitialVariables(mappedVars); // Store initial variables for merging
                }

            } catch (error) {
                console.error(error);
                toast.error("Erro ao carregar contrato");
                navigate('/admin/contratos');
            } finally {
                setIsLoading(false);
            }
        };

        fetchData();
    }, [id, isEditing, navigate]);

    // Auto-generate slug
    useEffect(() => {
        if (!isEditing && !slug && title) {
            setSlug(title.toLowerCase()
                .normalize("NFD").replace(/[\u0300-\u036f]/g, "")
                .replace(/[^a-z0-9]+/g, "-")
                .replace(/^-+|-+$/g, "")
            );
        }
    }, [title, isEditing, slug]);

    // Auto-detect variables logic
    const parseVariables = useCallback((text: string) => {
        // Remove HTML tags for variable detection to avoid issues with formatting inside placeholders
        const plainText = text.replace(/<[^>]*>/g, ' ');
        const uniqueVars = new Set<string>();
        const parsed: DetectedVariable[] = [];

        // 1. Match [Label]
        const bracketRegex = /\[([^\]]+)\]/g;
        const bracketMatches = [...plainText.matchAll(bracketRegex)];

        bracketMatches.forEach(match => {
            const rawLabel = match[1];
            const key = normalizeKey(rawLabel);

            if (!uniqueVars.has(key) && key.length > 0) {
                uniqueVars.add(key);
                parsed.push({
                    name: key,
                    label: rawLabel.trim(),
                    type: 'text',
                    required: true,
                    options: '',
                    group_name: '_default'
                });
            }
        });

        // 2. Match {{variable_name}} (Legacy support)
        const curlyRegex = /\{\{([^}]+)\}\}/g;
        const curlyMatches = [...plainText.matchAll(curlyRegex)];

        curlyMatches.forEach(match => {
            const rawName = match[1].trim();
            const key = rawName;

            // Beautify label: nome_parte_1 -> Nome Parte 1
            const label = rawName
                .split('_')
                .map(word => word.charAt(0).toUpperCase() + word.slice(1))
                .join(' ');

            if (!uniqueVars.has(key) && key.length > 0) {
                uniqueVars.add(key);
                parsed.push({
                    name: key,
                    label: label,
                    type: 'text',
                    required: true,
                    options: '',
                    group_name: '_default'
                });
            }
        });

        // Smart Merge
        setDetectedVariables(prev => {
            const merged: DetectedVariable[] = [];

            parsed.forEach(p => {
                // Try to find in initial variables (from DB) first
                const DBExisting = initialVariables.find(v => v.name === p.name);
                // Then try to find in current edits (from state)
                const stateExisting = prev.find(v => v.name === p.name);

                const existing = stateExisting || DBExisting;

                if (existing) {
                    merged.push({
                        ...p,
                        type: existing.type,
                        required: existing.required,
                        label: existing.label,
                        group_name: existing.group_name || '_default',
                        options: existing.options || ''
                    });
                } else {
                    merged.push(p);
                }
            });

            return merged;
        });
    }, [initialVariables]);

    useEffect(() => {
        parseVariables(content);
    }, [content, parseVariables]);

    const handleVariableChange = (name: string, field: keyof DetectedVariable, value: string | boolean) => {
        setDetectedVariables(prev => prev.map(v =>
            v.name === name ? { ...v, [field]: value } : v
        ));
    };

    const handleBulkStepChange = (newStep: string) => {
        if (selectedVars.length === 0) return;

        setDetectedVariables(prev => prev.map(v =>
            selectedVars.includes(v.name) ? { ...v, group_name: newStep } : v
        ));

        toast.success(`${selectedVars.length} variáveis movidas para: ${newStep === '_default' ? 'Informações Gerais' : newStep}`);
        setSelectedVars([]); // Clear selection after action
    };

    const toggleVarSelection = (name: string) => {
        setSelectedVars(prev =>
            prev.includes(name)
                ? prev.filter(n => n !== name)
                : [...prev, name]
        );
    };

    const toggleAllSelection = () => {
        if (selectedVars.length === detectedVariables.length) {
            setSelectedVars([]);
        } else {
            setSelectedVars(detectedVariables.map(v => v.name));
        }
    };

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        setIsSaving(true);

        try {
            if (!title || !slug || !categoryId || !price) {
                throw new Error("Preencha os campos obrigatórios (*)");
            }

            const payload = {
                title,
                slug,
                description: subtitle,
                category_id: categoryId,
                price: parseFloat(price.replace(',', '.')),
                template_body: content,
                is_active: isActive,
                wizard_stages: wizardStages
            };

            let contractId = id;

            if (isEditing) {
                const { error } = await supabase.from('contracts').update(payload).eq('id', id);
                if (error) throw error;
            } else {
                const { data, error } = await supabase.from('contracts').insert(payload).select().single();
                if (error) throw error;
                contractId = data.id;
            }

            // Sync Variables
            if (contractId) {
                await supabase.from('contract_variables').delete().eq('contract_id', contractId);

                if (detectedVariables.length > 0) {
                    const varsToInsert = detectedVariables.map((v, idx) => ({
                        contract_id: contractId,
                        name: v.name,
                        label: v.label,
                        type: v.type,
                        required: v.required,
                        group_name: v.group_name === '_default' ? null : v.group_name,
                        order_index: idx,
                        options: v.options ? parseOptions(v.options) : null
                    }));
                    const { error: varsError } = await supabase.from('contract_variables').insert(varsToInsert);
                    if (varsError) throw varsError;
                }
            }

            toast.success("Contrato salvo com sucesso!");
            navigate('/admin/contratos');

        } catch (error: unknown) {
            console.error(error);
            const message = error instanceof Error ? error.message : "Erro ao salvar contrato";
            toast.error(message);
        } finally {
            setIsSaving(false);
        }
    };

    if (isLoading) return <div className="h-screen flex items-center justify-center"><Loader2 className="h-8 w-8 animate-spin text-primary" /></div>;

    return (
        <AdminLayout>
            <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <div className="flex items-center gap-4 mb-6">
                    <Button variant="ghost" size="icon" onClick={() => navigate('/admin/contratos')}>
                        <ArrowLeft className="h-4 w-4" />
                    </Button>
                    <h1 className="text-2xl font-bold text-slate-800">{isEditing ? 'Editar Contrato' : 'Novo Contrato'}</h1>
                </div>

                <form onSubmit={handleSubmit} className="space-y-8">
                    {/* Top Section: Basic Info and Editor */}
                    <div className="grid grid-cols-1 gap-8">
                        {/* Basic Info */}
                        <Card className="bg-slate-50/50 border-slate-200">
                            <CardHeader className="py-4 border-b">
                                <CardTitle className="text-lg">Informações do Contrato</CardTitle>
                            </CardHeader>
                            <CardContent className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4 p-4">
                                <div className="space-y-1.5">
                                    <Label htmlFor="title" className="text-xs font-bold text-slate-500 uppercase">Título do Contrato *</Label>
                                    <Input id="title" value={title} onChange={e => setTitle(e.target.value)} className="h-9 bg-white" placeholder="Ex: Contrato de Locação" />
                                </div>
                                <div className="space-y-1.5">
                                    <Label htmlFor="slug" className="text-xs font-bold text-slate-500 uppercase">URL (slug) *</Label>
                                    <Input id="slug" value={slug} onChange={e => setSlug(e.target.value)} className="h-9 bg-white" placeholder="contrato-de-locacao" />
                                </div>
                                <div className="space-y-1.5">
                                    <Label htmlFor="category" className="text-xs font-bold text-slate-500 uppercase">Categoria *</Label>
                                    <Select value={categoryId} onValueChange={setCategoryId}>
                                        <SelectTrigger className="h-9 bg-white"><SelectValue placeholder="Selecione..." /></SelectTrigger>
                                        <SelectContent>
                                            {categories.map(cat => <SelectItem key={cat.id} value={cat.id}>{cat.name}</SelectItem>)}
                                        </SelectContent>
                                    </Select>
                                </div>
                                <div className="space-y-1.5">
                                    <Label htmlFor="price" className="text-xs font-bold text-slate-500 uppercase">Preço (R$) *</Label>
                                    <Input id="price" type="number" step="0.01" value={price} onChange={e => setPrice(e.target.value)} className="h-9 bg-white" />
                                </div>
                                <div className="space-y-1.5 md:col-span-2 lg:col-span-3">
                                    <Label htmlFor="subtitle" className="text-xs font-bold text-slate-500 uppercase">Chamada (Subtítulo)</Label>
                                    <Input id="subtitle" value={subtitle} onChange={e => setSubtitle(e.target.value)} className="h-9 bg-white" placeholder="Breve descrição para o catálogo" />
                                </div>
                                <div className="flex items-center gap-3 pt-6 lg:pt-5">
                                    <Switch id="active" checked={isActive} onCheckedChange={setIsActive} />
                                    <Label htmlFor="active" className="text-sm font-medium">Contrato Ativo</Label>
                                </div>
                            </CardContent>
                        </Card>

                        {/* Editor Card */}
                        <Card className="h-[600px] flex flex-col border-slate-200">
                            <CardHeader className="py-4 border-b bg-slate-50/30">
                                <div className="flex items-center justify-between">
                                    <div>
                                        <CardTitle className="text-lg">Conteúdo do Contrato</CardTitle>
                                        <CardDescription>Use <code>[Nome]</code> para criar campos variáveis.</CardDescription>
                                    </div>
                                </div>
                            </CardHeader>
                            <CardContent className="flex-1 p-0 relative flex flex-col overflow-hidden">
                                <RichTextEditor
                                    content={content}
                                    onChange={setContent}
                                    placeholder="Comece a digitar seu contrato..."
                                />
                            </CardContent>
                        </Card>

                        {/* Variable Explorer - Now a Dedicated Card to avoid overlap */}
                        {detectedVariables.length > 0 && (
                            <Card className="border-primary/20 bg-primary/5">
                                <CardHeader className="py-3 items-start">
                                    <div className="flex items-center gap-2">
                                        <RefreshCw className="h-4 w-4 text-primary" />
                                        <CardTitle className="text-sm font-bold text-primary uppercase tracking-wider">Variáveis Inteligentes Detectadas</CardTitle>
                                    </div>
                                    <CardDescription className="text-xs">Clique no nome para copiar e usar no texto.</CardDescription>
                                </CardHeader>
                                <CardContent className="p-4 pt-0">
                                    <div className="flex flex-wrap gap-2">
                                        {[...new Set(detectedVariables.map(v => v.label))].map(label => (
                                            <button
                                                key={label}
                                                type="button"
                                                onClick={() => {
                                                    navigator.clipboard.writeText(`[${label}]`);
                                                    toast.success(`Copiado: [${label}]`);
                                                }}
                                                className="inline-flex items-center px-3 py-1.5 rounded-lg bg-white border border-slate-200 text-xs font-semibold text-slate-700 hover:border-primary hover:text-primary hover:shadow-md transition-all cursor-pointer"
                                            >
                                                <span className="opacity-40 mr-1">[</span>
                                                {label}
                                                <span className="opacity-40 ml-1">]</span>
                                            </button>
                                        ))}
                                    </div>
                                </CardContent>
                            </Card>
                        )}
                    </div>

                    {/* Bottom Section: Side-by-Side Management */}
                    <div className="grid grid-cols-1 lg:grid-cols-12 gap-8">
                        {/* Stage Management Column (4/12) */}
                        <div className="lg:col-span-4 flex flex-col gap-8">
                            <Card className="flex flex-col">
                                <CardHeader className="pb-3 border-b">
                                    <div className="flex items-center justify-between">
                                        <div className="flex items-center gap-2">
                                            <Plus className="h-4 w-4 text-primary" />
                                            <CardTitle className="text-lg">Gerenciar Etapas</CardTitle>
                                        </div>
                                    </div>
                                    <CardDescription>Crie e organize as etapas do preenchimento.</CardDescription>
                                </CardHeader>
                                <CardContent className="p-4 space-y-4">
                                    <div className="flex gap-2">
                                        <Input
                                            id="new-stage"
                                            placeholder="Nome da etapa (ex: Cláusula 1)"
                                            onKeyDown={(e) => {
                                                if (e.key === 'Enter') {
                                                    e.preventDefault();
                                                    const val = (e.target as HTMLInputElement).value.trim();
                                                    if (val && !wizardStages.includes(val)) {
                                                        setWizardStages([...wizardStages, val]);
                                                        (e.target as HTMLInputElement).value = '';
                                                    }
                                                }
                                            }}
                                        />
                                        <Button
                                            type="button"
                                            onClick={() => {
                                                const el = document.getElementById('new-stage') as HTMLInputElement;
                                                const val = el.value.trim();
                                                if (val && !wizardStages.includes(val)) {
                                                    setWizardStages([...wizardStages, val]);
                                                    el.value = '';
                                                }
                                            }}
                                        >
                                            Adicionar
                                        </Button>
                                    </div>

                                    <div className="space-y-2">
                                        {wizardStages.length === 0 ? (
                                            <p className="text-xs text-muted-foreground text-center py-4 italic">
                                                Nenhuma etapa customizada.
                                            </p>
                                        ) : (
                                            wizardStages.map((stage, idx) => (
                                                <div key={stage} className="flex items-center justify-between p-2 bg-slate-50 border rounded-md group">
                                                    <div className="flex items-center gap-2">
                                                        <span className="text-xs font-mono text-slate-400">#{idx + 1}</span>
                                                        <span className="text-sm font-medium">{stage}</span>
                                                    </div>
                                                    <Button
                                                        type="button"
                                                        variant="ghost"
                                                        size="icon"
                                                        className="h-7 w-7 opacity-0 group-hover:opacity-100 transition-opacity"
                                                        onClick={() => setWizardStages(wizardStages.filter(s => s !== stage))}
                                                    >
                                                        <Trash2 className="h-3 w-3 text-red-500" />
                                                    </Button>
                                                </div>
                                            ))
                                        )}
                                    </div>
                                </CardContent>
                            </Card>
                        </div>

                        {/* Variable Management Column (8/12) */}
                        <div className="lg:col-span-8 flex flex-col">
                            <Card className="flex flex-col">
                                <CardHeader className="pb-3 border-b">
                                    <div className="flex items-center justify-between">
                                        <div className="flex items-center gap-2">
                                            <RefreshCw className="h-4 w-4 text-primary" />
                                            <CardTitle className="text-lg">Gerenciador de Variáveis</CardTitle>
                                        </div>
                                        <div className="flex items-center gap-2">
                                            <span className="text-xs bg-slate-100 px-2 py-1 rounded-full font-mono">
                                                {detectedVariables.length} encontradas
                                            </span>
                                            {detectedVariables.length > 0 && (
                                                <Button
                                                    type="button"
                                                    variant="ghost"
                                                    size="sm"
                                                    className="h-7 text-[10px] uppercase font-bold"
                                                    onClick={toggleAllSelection}
                                                >
                                                    {selectedVars.length === detectedVariables.length ? 'Desmarcar Tudo' : 'Selecionar Tudo'}
                                                </Button>
                                            )}
                                        </div>
                                    </div>
                                    <CardDescription>Configure os tipos e opções dos campos detectados.</CardDescription>
                                </CardHeader>
                                <CardContent className="flex-1 overflow-y-auto max-h-[600px] p-4 space-y-4">
                                    {/* Bulk Actions Bar */}
                                    {selectedVars.length > 0 && (
                                        <div className="bg-blue-50 border border-blue-100 p-3 rounded-lg flex items-center justify-between animate-in fade-in slide-in-from-top-2">
                                            <div className="flex items-center gap-2">
                                                <div className="h-2 w-2 rounded-full bg-blue-500 animate-pulse" />
                                                <span className="text-sm font-bold text-blue-700">{selectedVars.length} selecionadas</span>
                                            </div>
                                            <div className="flex items-center gap-2">
                                                <Select onValueChange={handleBulkStepChange}>
                                                    <SelectTrigger className="h-8 w-40 bg-white border-blue-200 text-blue-700 font-medium">
                                                        <SelectValue placeholder="Mover para Etapa..." />
                                                    </SelectTrigger>
                                                    <SelectContent>
                                                        <SelectItem value="_default">Informações Gerais</SelectItem>
                                                        {wizardStages.map(stage => (
                                                            <SelectItem key={stage} value={stage}>{stage}</SelectItem>
                                                        ))}
                                                    </SelectContent>
                                                </Select>
                                            </div>
                                        </div>
                                    )}

                                    {detectedVariables.length === 0 ? (
                                        <div className="text-center py-10 text-muted-foreground">
                                            <p>Nenhuma variável detectada.</p>
                                            <p className="text-xs mt-2">Adicione <code>[Exemplo]</code> no editor.</p>
                                        </div>
                                    ) : (
                                        detectedVariables.map((v, idx) => (
                                            <div
                                                key={v.name}
                                                className={cn(
                                                    "border rounded-lg p-4 bg-slate-50/50 space-y-4 transition-all border-l-4",
                                                    selectedVars.includes(v.name) ? "border-blue-500 bg-blue-50/30" : "border-slate-200"
                                                )}
                                            >
                                                {/* Header with Name and Required Toggle */}
                                                <div className="flex items-center justify-between">
                                                    <div className="flex items-center gap-3">
                                                        <Switch
                                                            checked={selectedVars.includes(v.name)}
                                                            onCheckedChange={() => toggleVarSelection(v.name)}
                                                            className="data-[state=checked]:bg-blue-600"
                                                        />
                                                        <div className="flex flex-col">
                                                            <span className="text-xs font-mono text-slate-500">{v.name}</span>
                                                            <span className="font-bold text-sm">Variavel #{idx + 1}</span>
                                                        </div>
                                                    </div>
                                                    <div className="flex items-center gap-4">
                                                        <div className="flex items-center gap-2">
                                                            <Label htmlFor={`req-${v.name}`} className="text-xs cursor-pointer">Obrigatório</Label>
                                                            <Switch
                                                                id={`req-${v.name}`}
                                                                checked={v.required}
                                                                onCheckedChange={(c) => handleVariableChange(v.name, 'required', c)}
                                                            />
                                                        </div>
                                                    </div>
                                                </div>

                                                {/* Label and Group Inputs */}
                                                <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
                                                    <div className="space-y-1">
                                                        <Label className="text-xs text-muted-foreground">Nome do Campo (Label)</Label>
                                                        <Input
                                                            value={v.label}
                                                            onChange={(e) => handleVariableChange(v.name, 'label', e.target.value)}
                                                            className="h-8 bg-white"
                                                        />
                                                    </div>
                                                    <div className="space-y-1">
                                                        <Label className="text-xs text-muted-foreground">Etapa do Assistente</Label>
                                                        <Select
                                                            value={v.group_name}
                                                            onValueChange={(val) => handleVariableChange(v.name, 'group_name', val)}
                                                        >
                                                            <SelectTrigger className="h-8 bg-white"><SelectValue placeholder="Selecione..." /></SelectTrigger>
                                                            <SelectContent>
                                                                <SelectItem value="_default">Informações Gerais</SelectItem>
                                                                {wizardStages.map(stage => (
                                                                    <SelectItem key={stage} value={stage}>{stage}</SelectItem>
                                                                ))}
                                                            </SelectContent>
                                                        </Select>
                                                    </div>
                                                </div>

                                                {/* Type and Options Row */}
                                                <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
                                                    <div className="space-y-1">
                                                        <Label className="text-xs text-muted-foreground">Tipo de Campo</Label>
                                                        <Select
                                                            value={v.type}
                                                            onValueChange={(val) => handleVariableChange(v.name, 'type', val)}
                                                        >
                                                            <SelectTrigger className="h-8 bg-white"><SelectValue /></SelectTrigger>
                                                            <SelectContent>
                                                                <SelectItem value="text">Texto Curto</SelectItem>
                                                                <SelectItem value="textarea">Texto Longo</SelectItem>
                                                                <SelectItem value="number">Número</SelectItem>
                                                                <SelectItem value="money">Moeda (R$)</SelectItem>
                                                                <SelectItem value="date">Data</SelectItem>
                                                                <SelectItem value="cpf">CPF</SelectItem>
                                                                <SelectItem value="cnpj">CNPJ</SelectItem>
                                                                <SelectItem value="email">E-mail</SelectItem>
                                                                <SelectItem value="select">Lista de Opções</SelectItem>
                                                            </SelectContent>
                                                        </Select>
                                                    </div>
                                                </div>

                                                {/* Conditional Options Input */}
                                                {v.type === 'select' && (
                                                    <div className="space-y-1 pt-2 border-t border-dashed">
                                                        <Label className="text-xs text-blue-600 font-semibold">Opções da Lista (separadas por vírgula)</Label>
                                                        <Input
                                                            value={v.options}
                                                            onChange={(e) => handleVariableChange(v.name, 'options', e.target.value)}
                                                            placeholder="Ex: Opção 1, Opção 2, Opção 3"
                                                            className="h-8 bg-white border-blue-200 focus-visible:ring-blue-200"
                                                        />
                                                        <p className="text-[10px] text-muted-foreground">O usuário poderá escolher apenas uma dessas opções.</p>
                                                    </div>
                                                )}
                                            </div>
                                        ))
                                    )}
                                </CardContent>
                            </Card>
                        </div>
                    </div>

                    <div className="flex justify-end gap-4 p-8 border-t bg-slate-50/50 -mx-4 sm:-mx-6 lg:-mx-8 rounded-b-xl border-slate-200">
                        <Button type="button" variant="ghost" onClick={() => navigate('/admin/contratos')}>Cancelar</Button>
                        <Button type="submit" size="lg" disabled={isSaving} className="bg-blue-600 hover:bg-blue-700 min-w-[200px] shadow-lg shadow-blue-200">
                            {isSaving && <Loader2 className="mr-2 h-4 w-4 animate-spin" />}
                            <Save className="mr-2 h-4 w-4" />
                            Salvar Alterações
                        </Button>
                    </div>
                </form>
            </div>
        </AdminLayout>
    );
}
