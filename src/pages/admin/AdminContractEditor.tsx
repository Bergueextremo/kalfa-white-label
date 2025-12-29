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
import { Save, ArrowLeft, Loader2, RefreshCw, Trash2, Plus, Copy, Unlink } from "lucide-react";
import { RichTextEditor } from "@/components/admin/RichTextEditor";
import { Category, VisibilityRule } from "@/components/catalog/types";
import { normalizeKey, cn } from "@/lib/utils";
import { Dialog, DialogContent, DialogDescription, DialogFooter, DialogHeader, DialogTitle, DialogTrigger } from "@/components/ui/dialog";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";

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
    const [newStageInput, setNewStageInput] = useState("");

    // Form State
    const [title, setTitle] = useState("");
    const [subtitle, setSubtitle] = useState("");
    const [slug, setSlug] = useState("");
    const [price, setPrice] = useState("");
    const [categoryId, setCategoryId] = useState("");
    const [content, setContent] = useState("");
    const [isActive, setIsActive] = useState(true);
    const [wizardStages, setWizardStages] = useState<string[]>([]);

    // Detected Variables State
    interface DetectedVariable {
        name: string;
        label: string;
        type: string;
        required: boolean;
        options: string;
        group_name: string;
        prefix: string;
        suffix: string;
        visibility_rule: VisibilityRule | null;
    }
    const [detectedVariables, setDetectedVariables] = useState<DetectedVariable[]>([]);
    const [initialVariables, setInitialVariables] = useState<DetectedVariable[]>([]);
    const [selectedVars, setSelectedVars] = useState<string[]>([]);

    // Add Variable Modal State
    const [createVarModal, setCreateVarModal] = useState<{ isOpen: boolean; parentName: string; optionValue: string } | null>(null);
    const [newVarLabel, setNewVarLabel] = useState("");
    const [newVarType, setNewVarType] = useState("text");
    const [newVarOptions, setNewVarOptions] = useState("");

    // Fetch Categories
    useEffect(() => {
        const fetchCategories = async () => {
            const { data } = await supabase.from('contract_categories').select('*').order('name');
            setCategories(data || []);
        };
        fetchCategories();
    }, []);

    // Fetch Data
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
                        options: Array.isArray(v.options) ? v.options.join(', ') : (v.options || ''),
                        prefix: v.prefix || "",
                        suffix: v.suffix || "",
                        visibility_rule: v.visibility_rule || null
                    }));
                    setDetectedVariables(mappedVars);
                    setInitialVariables(mappedVars);
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

    // Slug gen
    useEffect(() => {
        if (!isEditing && !slug && title) {
            setSlug(title.toLowerCase()
                .normalize("NFD").replace(/[\u0300-\u036f]/g, "")
                .replace(/[^a-z0-9]+/g, "-")
                .replace(/^-+|-+$/g, "")
            );
        }
    }, [title, isEditing, slug]);

    // State to track which vars are effectively in the text (vs manual/ghosts)
    const [textKeys, setTextKeys] = useState<Set<string>>(new Set());

    // Enhanced Parse Logic (Sync with Text + Maintain Children)
    const parseVariables = useCallback((text: string) => {
        const plainText = text.replace(/<[^>]*>/g, ' ');

        // 1. Identify Variables currently in the text
        const textVarsMap = new Map<string, { label: string }>();

        // Match [Label]
        const bracketRegex = /\[([^\]]+)\]/g;
        const bracketMatches = [...plainText.matchAll(bracketRegex)];
        bracketMatches.forEach(match => {
            const rawLabel = match[1];
            const key = normalizeKey(rawLabel);
            if (key.length > 0) {
                textVarsMap.set(key, { label: rawLabel.trim() });
            }
        });

        // Match {{variable_name}}
        const curlyRegex = /\{\{([^}]+)\}\}/g;
        const curlyMatches = [...plainText.matchAll(curlyRegex)];
        curlyMatches.forEach(match => {
            const rawName = match[1].trim();
            const label = rawName.split('_').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(' ');
            textVarsMap.set(rawName, { label });
        });

        // Update the Set of keys found in text
        setTextKeys(new Set(textVarsMap.keys()));

        // 2. Sync Merge
        setDetectedVariables(prev => {
            const merged: DetectedVariable[] = [];
            const processedNames = new Set<string>();

            // A. Keep variables that are valid (In Text OR Have Visibility Rule)
            // We iterate over the UNION of (Text Vars) and (Existing Vars with Rules)

            // First, process everything currently in state to preserve configs
            prev.forEach(existingVar => {
                const isInText = textVarsMap.has(existingVar.name);
                const hasRule = !!existingVar.visibility_rule;

                // CRITICAL: Keep if it's in the text OR if it's a child variable (nested)
                if (isInText || hasRule) {
                    merged.push(existingVar);
                    processedNames.add(existingVar.name);
                }
            });

            // B. Add NEW variables found in text that weren't in state
            textVarsMap.forEach((val, key) => {
                if (!processedNames.has(key)) {
                    // New detection! Check DB history first
                    const inDB = initialVariables.find(v => v.name === key);
                    if (inDB) {
                        const dbOpts = (inDB as any).options;
                        merged.push({
                            name: key,
                            label: inDB.label, // Prefer DB label/config
                            type: inDB.type,
                            required: inDB.required,
                            options: Array.isArray(dbOpts) ? dbOpts.join(', ') : (dbOpts || ''),
                            group_name: inDB.group_name || '_default',
                            prefix: inDB.prefix || '',
                            suffix: inDB.suffix || '',
                            visibility_rule: inDB.visibility_rule || null
                        });
                    } else {
                        // Brand new default
                        merged.push({
                            name: key,
                            label: val.label,
                            type: 'text',
                            required: true,
                            options: '',
                            group_name: '_default',
                            prefix: '',
                            suffix: '',
                            visibility_rule: null // Root by default
                        });
                    }
                    processedNames.add(key);
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

    // Function to Force Delete (for ghosts)
    const deleteVariable = (name: string) => {
        setDetectedVariables(prev => prev.filter(v => v.name !== name));
        toast.success("Variável removida.");
    };

    const handleCreateVariable = () => {
        if (!createVarModal || !newVarLabel) return;

        const name = normalizeKey(newVarLabel);

        // Avoid dupes
        if (detectedVariables.some(v => v.name === name)) {
            toast.error("Já existe uma variável com esse nome (ou similar).");
            return;
        }

        const newVar: DetectedVariable = {
            name,
            label: newVarLabel,
            type: newVarType,
            required: true,
            options: newVarOptions,
            group_name: '_default',
            prefix: '',
            suffix: '',
            visibility_rule: {
                dependsOn: createVarModal.parentName,
                operator: 'equals',
                value: createVarModal.optionValue
            }
        };

        setDetectedVariables(prev => [...prev, newVar]);
        toast.success(`Variável "${newVarLabel}" criada com sucesso!`);

        // Reset and close
        setNewVarLabel("");
        setNewVarType("text");
        setNewVarOptions("");
        setCreateVarModal(null);
    };

    const handleBulkStepChange = (newStep: string) => {
        if (selectedVars.length === 0) return;
        setDetectedVariables(prev => prev.map(v =>
            selectedVars.includes(v.name) ? { ...v, group_name: newStep } : v
        ));
        toast.success(`${selectedVars.length} variáveis movidas per: ${newStep}`);
        setSelectedVars([]);
    };

    const toggleVarSelection = (name: string) => {
        setSelectedVars(prev => prev.includes(name) ? prev.filter(n => n !== name) : [...prev, name]);
    };

    const toggleAllSelection = () => {
        if (selectedVars.length === detectedVariables.length) setSelectedVars([]);
        else setSelectedVars(detectedVariables.map(v => v.name));
    };

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        setIsSaving(true);
        try {
            if (!title || !slug || !categoryId || !price) throw new Error("Preencha campos obrigatórios");

            const payload = {
                title, slug, description: subtitle, category_id: categoryId,
                price: parseFloat(price.replace(',', '.')), template_body: content,
                is_active: isActive, wizard_stages: wizardStages
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
                        options: v.options ? parseOptions(v.options) : null,
                        prefix: v.prefix || null,
                        suffix: v.suffix || null,
                        visibility_rule: v.visibility_rule || null
                    }));
                    const { error: varsError } = await supabase.from('contract_variables').insert(varsToInsert);
                    if (varsError) throw varsError;
                }
            }
            toast.success("Salvo com sucesso!");
            // navigate('/admin/contratos');
        } catch (error: unknown) {
            const message = error instanceof Error ? error.message : "Erro desconhecido";
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
                    <div className="grid grid-cols-1 gap-8">
                        {/* Basic Info */}
                        <Card className="bg-slate-50/50 border-slate-200">
                            <CardHeader className="py-4 border-b">
                                <CardTitle className="text-lg">Informações do Contrato</CardTitle>
                            </CardHeader>
                            <CardContent className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4 p-4">
                                <div className="space-y-1.5">
                                    <Label htmlFor="title" className="text-xs font-bold text-slate-500 uppercase">Título *</Label>
                                    <Input id="title" value={title} onChange={e => setTitle(e.target.value)} className="h-9 bg-white" />
                                </div>
                                <div className="space-y-1.5">
                                    <Label htmlFor="slug" className="text-xs font-bold text-slate-500 uppercase">Slug *</Label>
                                    <Input id="slug" value={slug} onChange={e => setSlug(e.target.value)} className="h-9 bg-white" />
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
                                    <Label htmlFor="price" className="text-xs font-bold text-slate-500 uppercase">Preço *</Label>
                                    <Input id="price" type="number" value={price} onChange={e => setPrice(e.target.value)} className="h-9 bg-white" />
                                </div>
                                <div className="space-y-1.5 md:col-span-2 lg:col-span-3">
                                    <Label htmlFor="subtitle" className="text-xs font-bold text-slate-500 uppercase">Chamada</Label>
                                    <Input id="subtitle" value={subtitle} onChange={e => setSubtitle(e.target.value)} className="h-9 bg-white" />
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
                                <CardTitle className="text-lg">Conteúdo</CardTitle>
                            </CardHeader>
                            <CardContent className="flex-1 p-0 relative flex flex-col overflow-hidden">
                                <RichTextEditor content={content} onChange={setContent} placeholder="Conteúdo..." />
                            </CardContent>
                        </Card>

                        {/* Variable Explorer */}
                        {detectedVariables.length > 0 && (
                            <Card className="border-primary/20 bg-primary/5">
                                <CardHeader className="py-3 items-start">
                                    <div className="flex items-center gap-2">
                                        <RefreshCw className="h-4 w-4 text-primary" />
                                        <CardTitle className="text-sm font-bold text-primary uppercase tracking-wider">Variáveis Detectadas</CardTitle>
                                    </div>
                                    <CardDescription className="text-xs">Variáveis detectadas automaticamente.</CardDescription>
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
                                                <span className="opacity-40 mr-1">[</span>{label}<span className="opacity-40 ml-1">]</span>
                                            </button>
                                        ))}
                                    </div>
                                </CardContent>
                            </Card>
                        )}
                    </div>

                    <div className="grid grid-cols-1 lg:grid-cols-12 gap-8">
                        {/* Stages */}
                        <div className="lg:col-span-4 flex flex-col gap-8">
                            <Card>
                                <CardHeader className="pb-3 border-b">
                                    <CardTitle className="text-lg">Etapas</CardTitle>
                                </CardHeader>
                                <CardContent className="p-4 space-y-4">
                                    <div className="flex gap-2">
                                        <Input
                                            id="new-stage"
                                            placeholder="Nome da etapa"
                                            value={newStageInput}
                                            onChange={(e) => setNewStageInput(e.target.value)}
                                            onKeyDown={(e) => {
                                                if (e.key === 'Enter') {
                                                    e.preventDefault();
                                                    if (newStageInput.trim() && !wizardStages.includes(newStageInput.trim())) {
                                                        setWizardStages([...wizardStages, newStageInput.trim()]);
                                                        setNewStageInput('');
                                                    }
                                                }
                                            }}
                                        />
                                        <Button
                                            type="button"
                                            onClick={() => {
                                                if (newStageInput.trim() && !wizardStages.includes(newStageInput.trim())) {
                                                    setWizardStages([...wizardStages, newStageInput.trim()]);
                                                    setNewStageInput('');
                                                }
                                            }}
                                        >
                                            Adicionar
                                        </Button>
                                    </div>
                                    <div className="space-y-2">
                                        {wizardStages.map((stage, idx) => (
                                            <div key={stage} className="flex items-center justify-between p-2 bg-slate-50 border rounded-md group">
                                                <span className="text-sm font-medium">{idx + 1}. {stage}</span>
                                                <Button variant="ghost" size="icon" onClick={() => setWizardStages(wizardStages.filter(s => s !== stage))}><Trash2 className="h-3 w-3 text-red-500" /></Button>
                                            </div>
                                        ))}
                                    </div>
                                </CardContent>
                            </Card>
                        </div>

                        {/* Variables Manager */}
                        <div className="lg:col-span-8 flex flex-col">
                            <Card>
                                <CardHeader className="pb-3 border-b flex flex-row items-center justify-between">
                                    <CardTitle className="text-lg">Gerenciador de Variáveis</CardTitle>
                                    <div className="flex items-center gap-2">
                                        <span className="text-xs bg-slate-100 px-2 py-1 rounded-full font-mono">{detectedVariables.length} vars</span>
                                        <Button type="button" variant="ghost" size="sm" onClick={toggleAllSelection}>Select All</Button>
                                    </div>
                                </CardHeader>
                                <CardContent className="flex-1 overflow-y-auto max-h-[600px] p-4 space-y-4">
                                    {selectedVars.length > 0 && (
                                        <div className="bg-blue-50 border border-blue-100 p-3 rounded-lg flex items-center justify-between">
                                            <span className="text-sm font-bold text-blue-700">{selectedVars.length} selecionadas</span>
                                            <Select onValueChange={handleBulkStepChange}>
                                                <SelectTrigger className="h-8 w-40 bg-white"><SelectValue placeholder="Mover..." /></SelectTrigger>
                                                <SelectContent>
                                                    <SelectItem value="_default">Geral</SelectItem>
                                                    {wizardStages.map(s => <SelectItem key={s} value={s}>{s}</SelectItem>)}
                                                </SelectContent>
                                            </Select>
                                        </div>
                                    )}

                                    {(() => {
                                        const getChildrenForOption = (parentName: string, optionValue: string) => detectedVariables.filter(v => v.visibility_rule?.dependsOn === parentName && v.visibility_rule?.value === optionValue);

                                        // "Orphan" Check: A variable is root if:
                                        // 1. It has NO visibility rule
                                        // 2. Parent missing
                                        // 3. Parent Option mismatch (e.g. parent changed options)
                                        const allNames = new Set(detectedVariables.map(v => v.name));

                                        // Pre-calc parent options for fast lookup
                                        const parentOptionsMap = new Map<string, Set<string>>();
                                        detectedVariables.forEach(v => {
                                            if (v.type === 'select') {
                                                const rawOpts = typeof v.options === 'string' ? parseOptions(v.options) : (Array.isArray(v.options) ? v.options : []);
                                                // Extract VALUES only for dependency check (Label|Value -> Value)
                                                const values = rawOpts.map(o => o.includes('|') ? o.split('|')[1].trim() : o);
                                                parentOptionsMap.set(v.name, new Set(values));
                                            }
                                        });

                                        const rootVariables = detectedVariables.filter(v => {
                                            if (!v.visibility_rule) return true;

                                            const pName = v.visibility_rule.dependsOn;
                                            if (!allNames.has(pName)) return true; // Parent missing

                                            // Check if the specific option value is valid
                                            const pOpts = parentOptionsMap.get(pName);
                                            if (!pOpts || !pOpts.has(v.visibility_rule.value as string)) return true; // Value mismatch

                                            return false; // It's a valid happy child
                                        });

                                        const renderVariableCard = (v: DetectedVariable) => {
                                            const isSelected = selectedVars.includes(v.name);
                                            const optionsList = typeof v.options === 'string' ? parseOptions(v.options) : (Array.isArray(v.options) ? v.options : []);

                                            // Helper to check if this var is an orphan (has rule but parent missing) for UI indication
                                            const isOrphan = v.visibility_rule && (!allNames.has(v.visibility_rule.dependsOn) || !parentOptionsMap.get(v.visibility_rule.dependsOn)?.has(v.visibility_rule.value as string));
                                            const inText = textKeys.has(v.name);

                                            return (
                                                <div key={v.name} className={cn("border rounded-lg p-4 bg-slate-50/50 space-y-4 transition-all border-l-4", isSelected ? "border-blue-500 bg-blue-50/30" : "border-slate-200")}>
                                                    <div className="flex items-center justify-between">
                                                        <div className="flex items-center gap-3">
                                                            <Switch checked={isSelected} onCheckedChange={() => toggleVarSelection(v.name)} className="data-[state=checked]:bg-blue-600" />
                                                            <div className="flex flex-col">
                                                                <div className="flex items-center gap-2">
                                                                    <span className="text-xs font-mono text-slate-500">{v.name}</span>
                                                                    {isOrphan && <span className="text-[10px] bg-red-100 text-red-600 px-1 rounded border border-red-200">Vínculo Quebrado</span>}
                                                                    {!inText && <span className="text-[10px] bg-amber-100 text-amber-600 px-1 rounded border border-amber-200" title="Criada Manualmente ou fantasma">Manual</span>}
                                                                    <Button type="button" variant="ghost" size="icon" className="h-4 w-4" onClick={() => { navigator.clipboard.writeText(`[${v.label}]`); toast.success("Tag copiada!"); }}><Copy className="h-3 w-3" /></Button>
                                                                </div>
                                                                <span className="font-bold text-sm">{v.label}</span>
                                                            </div>
                                                        </div>
                                                        <div className="flex items-center gap-4">
                                                            <div className="flex items-center gap-2">
                                                                <Label htmlFor={`req-${v.name}`} className="text-xs cursor-pointer">Obrigatório</Label>
                                                                <Switch id={`req-${v.name}`} checked={v.required} onCheckedChange={(c) => handleVariableChange(v.name, 'required', c)} />
                                                            </div>
                                                            {/* DELETE LOGIC */}
                                                            {/* 1. If NOT in text -> Always Force Delete (Manual/Ghost) */}
                                                            {!inText ? (
                                                                <Button
                                                                    type="button"
                                                                    variant="ghost"
                                                                    size="icon"
                                                                    className="h-6 w-6 text-red-600 hover:text-red-900 hover:bg-red-100"
                                                                    title="Excluir Definitivamente"
                                                                    onClick={() => deleteVariable(v.name)}
                                                                >
                                                                    <Trash2 className="h-3 w-3" />
                                                                </Button>
                                                            ) : (
                                                                // 2. If IN text but has rule -> Unlink (Move to root)
                                                                v.visibility_rule && (
                                                                    <Button
                                                                        type="button"
                                                                        variant="ghost"
                                                                        size="icon"
                                                                        className="h-6 w-6 text-orange-400 hover:text-orange-700 hover:bg-orange-50"
                                                                        title="Desvincular (Mover para Raiz)"
                                                                        onClick={() => setDetectedVariables(prev => prev.map(vv => vv.name === v.name ? { ...vv, visibility_rule: null } : vv))}
                                                                    >
                                                                        <Unlink className="h-3 w-3" />
                                                                    </Button>
                                                                )
                                                            )}
                                                        </div>
                                                    </div>

                                                    <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
                                                        <div className="space-y-1">
                                                            <Label className="text-xs text-muted-foreground">Label</Label>
                                                            <Input value={v.label} onChange={(e) => handleVariableChange(v.name, 'label', e.target.value)} className="h-8 bg-white" />
                                                        </div>
                                                        <div className="space-y-1">
                                                            <Label className="text-xs text-muted-foreground">Etapa</Label>
                                                            <Select value={v.group_name} onValueChange={(val) => handleVariableChange(v.name, 'group_name', val)}>
                                                                <SelectTrigger className="h-8 bg-white"><SelectValue placeholder="Selecione..." /></SelectTrigger>
                                                                <SelectContent>
                                                                    <SelectItem value="_default">Informações Gerais</SelectItem>
                                                                    {wizardStages.map(stage => <SelectItem key={stage} value={stage}>{stage}</SelectItem>)}
                                                                </SelectContent>
                                                            </Select>
                                                        </div>
                                                    </div>

                                                    <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
                                                        <div className="space-y-1">
                                                            <Label className="text-xs text-muted-foreground">Tipo</Label>
                                                            <Select value={v.type} onValueChange={(val) => handleVariableChange(v.name, 'type', val)}>
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

                                                    <div className="grid grid-cols-2 gap-3 pt-2">
                                                        <div className="space-y-1">
                                                            <Label className="text-[10px] text-slate-400 font-bold uppercase">Prefixo</Label>
                                                            <Input value={v.prefix} onChange={(e) => handleVariableChange(v.name, 'prefix', e.target.value)} className="h-8 bg-white" placeholder="Ex: R$ " />
                                                        </div>
                                                        <div className="space-y-1">
                                                            <Label className="text-[10px] text-slate-400 font-bold uppercase">Sufixo</Label>
                                                            <Input value={v.suffix} onChange={(e) => handleVariableChange(v.name, 'suffix', e.target.value)} className="h-8 bg-white" placeholder="Ex: p/ mês" />
                                                        </div>
                                                    </div>

                                                    {v.type === 'select' && (
                                                        <div className="space-y-1 pt-2 border-t border-dashed">
                                                            <Label className="text-xs text-blue-600 font-semibold">Opções (separadas por vírgula). Use "Rótulo|Valor" para definir texto diferente.</Label>
                                                            <Input value={v.options} onChange={(e) => handleVariableChange(v.name, 'options', e.target.value)} className="h-8 bg-white" placeholder="Ex: Pessoa Física, Pessoa Jurídica | Texto Jurídico Longo" />
                                                        </div>
                                                    )}

                                                    {v.type === 'select' && optionsList.length > 0 && (
                                                        <div className="space-y-3 pt-2">
                                                            <p className="text-xs font-semibold text-slate-500 uppercase tracking-wide">Vinculação de Variáveis</p>
                                                            {optionsList.map(opt => {
                                                                const [label, val] = opt.includes('|') ? opt.split('|').map(s => s.trim()) : [opt, opt];
                                                                return (
                                                                    <div key={val} className="ml-4 pl-4 border-l-2 border-slate-300 space-y-2">
                                                                        <div className="flex items-center gap-2">
                                                                            <span className="text-xs font-bold text-slate-700 bg-slate-200 px-2 py-1 rounded">Se escolher "{label}"</span>
                                                                            <span className="text-[10px] text-slate-400">Mostrar:</span>
                                                                        </div>

                                                                        <div className="space-y-3 my-2">
                                                                            {getChildrenForOption(v.name, val).map(child => renderVariableCard(child))}
                                                                        </div>

                                                                        <div className="flex items-center gap-2">
                                                                            <Button
                                                                                type="button"
                                                                                variant="outline"
                                                                                size="sm"
                                                                                className="h-7 text-xs border-dashed border-slate-300 text-slate-500 hover:text-blue-600 hover:border-blue-400"
                                                                                onClick={() => setCreateVarModal({ isOpen: true, parentName: v.name, optionValue: val })}
                                                                            >
                                                                                <Plus className="h-3 w-3 mr-1" />
                                                                                Adicionar Campo
                                                                            </Button>

                                                                            {/* Dropdown for Existing - Optional/Secondary */}
                                                                            <Select value="_placeholder" onValueChange={(val) => {
                                                                                if (val !== '_placeholder') {
                                                                                    setDetectedVariables(prev => prev.map(vv => vv.name === val ? { ...vv, visibility_rule: { dependsOn: v.name, operator: 'equals', value: val } } : vv));
                                                                                    toast.success(`Movido para "${label}"`);
                                                                                }
                                                                            }}>
                                                                                <SelectTrigger className="h-7 w-[20px] px-0 border-0 hover:bg-slate-100"><Plus className="h-3 w-3 text-slate-400" /></SelectTrigger>
                                                                                <SelectContent>
                                                                                    <SelectItem value="_placeholder" disabled>Vincular Existente...</SelectItem>
                                                                                    {detectedVariables.filter(c => c.name !== v.name && !c.visibility_rule).map(c => <SelectItem key={c.name} value={c.name}>{c.label}</SelectItem>)}
                                                                                </SelectContent>
                                                                            </Select>
                                                                        </div>
                                                                    </div>
                                                                );
                                                            })}
                                                        </div>
                                                    )}
                                                </div>
                                            );
                                        };

                                        return (
                                            <div className="space-y-4">
                                                {detectedVariables.length === 0 ? <p className="text-center text-muted-foreground p-10">Nenhuma variável.</p> : rootVariables.map(renderVariableCard)}
                                            </div>
                                        );
                                    })()}
                                </CardContent>
                            </Card>
                        </div>
                    </div>

                    <div className="flex justify-end gap-4 p-8 border-t bg-slate-50/50 rounded-b-xl border-slate-200">
                        <Button type="button" variant="ghost" onClick={() => navigate('/admin/contratos')}>Cancelar</Button>
                        <Button type="submit" size="lg" disabled={isSaving} className="bg-blue-600 hover:bg-blue-700 min-w-[200px] shadow-lg shadow-blue-200">
                            {isSaving && <Loader2 className="mr-2 h-4 w-4 animate-spin" />}
                            <Save className="mr-2 h-4 w-4" />
                            Salvar Alterações
                        </Button>
                    </div>
                </form>

                {/* CREATE VARIABLE DIALOG */}
                <Dialog open={!!createVarModal} onOpenChange={(open) => !open && setCreateVarModal(null)}>
                    <DialogContent className="sm:max-w-md">
                        <DialogHeader>
                            <DialogTitle>Criar Nova Variável</DialogTitle>
                            <DialogDescription>
                                Adicionando campo que aparecerá quando <strong>{createVarModal?.parentName}</strong> for igual a <strong>{createVarModal?.optionValue}</strong>.
                            </DialogDescription>
                        </DialogHeader>
                        <div className="grid gap-4 py-4">
                            <div className="grid grid-cols-4 items-center gap-4">
                                <Label htmlFor="new-label" className="text-right">Label</Label>
                                <Input id="new-label" value={newVarLabel} onChange={(e) => setNewVarLabel(e.target.value)} className="col-span-3" placeholder="Ex: CPF do Locador" />
                            </div>
                            <div className="grid grid-cols-4 items-center gap-4">
                                <Label htmlFor="new-type" className="text-right">Tipo</Label>
                                <Select value={newVarType} onValueChange={setNewVarType}>
                                    <SelectTrigger className="col-span-3">
                                        <SelectValue />
                                    </SelectTrigger>
                                    <SelectContent>
                                        <SelectItem value="text">Texto Curto</SelectItem>
                                        <SelectItem value="textarea">Texto Longo</SelectItem>
                                        <SelectItem value="number">Número</SelectItem>
                                        <SelectItem value="money">Moeda</SelectItem>
                                        <SelectItem value="date">Data</SelectItem>
                                        <SelectItem value="cpf">CPF</SelectItem>
                                        <SelectItem value="cnpj">CNPJ</SelectItem>
                                        <SelectItem value="email">E-mail</SelectItem>
                                        <SelectItem value="select">Lista de Opções</SelectItem>
                                    </SelectContent>
                                </Select>
                            </div>
                            {newVarType === 'select' && (
                                <div className="grid grid-cols-4 items-center gap-4">
                                    <Label htmlFor="new-options" className="text-right">Opções</Label>
                                    <Input id="new-options" value={newVarOptions} onChange={(e) => setNewVarOptions(e.target.value)} className="col-span-3" placeholder="Opção A, Opção B" />
                                </div>
                            )}
                        </div>
                        <DialogFooter>
                            <Button type="button" variant="secondary" onClick={() => setCreateVarModal(null)}>Cancelar</Button>
                            <Button type="button" onClick={handleCreateVariable}>Criar Campo</Button>
                        </DialogFooter>
                    </DialogContent>
                </Dialog>
            </div>
        </AdminLayout>
    );
}
