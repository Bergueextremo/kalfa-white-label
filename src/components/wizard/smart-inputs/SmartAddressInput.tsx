import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Button } from "@/components/ui/button";
import { Search } from "lucide-react";
import { useState } from "react";
import { toast } from "sonner";

interface AddressData {
    cep: string;
    street: string;
    number: string;
    neighborhood: string;
    city: string;
    state: string;
}

interface SmartAddressInputProps {
    label: string;
    value: string; // The full address string for the contract
    onChange: (value: string) => void;
    // We can also accept an onStructuredChange prop if we want to save structured data separately
}

export function SmartAddressInput({ label, value, onChange }: SmartAddressInputProps) {
    const [cep, setCep] = useState("");
    const [loading, setLoading] = useState(false);

    // Internal state to hold the structured parts before combining
    const [address, setAddress] = useState<AddressData>({
        cep: "",
        street: "",
        number: "",
        neighborhood: "",
        city: "",
        state: ""
    });

    const fetchCep = async () => {
        if (cep.length !== 8) return;
        setLoading(true);
        try {
            const res = await fetch(`https://viacep.com.br/ws/${cep}/json/`);
            const data = await res.json();
            if (data.erro) {
                toast.error("CEP não encontrado");
                return;
            }

            setAddress(prev => {
                const newAddress = {
                    ...prev,
                    cep: data.cep,
                    street: data.logradouro,
                    neighborhood: data.bairro,
                    city: data.localidade,
                    state: data.uf
                };
                updateFullString(newAddress);
                return newAddress;
            });

        } catch (error) {
            toast.error("Erro ao buscar CEP");
        } finally {
            setLoading(false);
        }
    };

    const updateFullString = (data: AddressData) => {
        // Format: Rua X, nº 123, Bairro Y, Cidade/UF, CEP 00000-000
        const full = `${data.street}, nº ${data.number}, ${data.neighborhood}, ${data.city}/${data.state}, CEP ${data.cep}`;
        onChange(full);
    };

    const handleFieldChange = (field: keyof AddressData, val: string) => {
        setAddress(prev => {
            const newAddress = { ...prev, [field]: val };
            updateFullString(newAddress);
            return newAddress;
        });
    };

    return (
        <div className="space-y-3 border p-4 rounded-lg bg-card/50">
            <Label className="font-semibold text-primary">{label}</Label>

            <div className="flex gap-2">
                <div className="w-1/3">
                    <Label className="text-xs text-muted-foreground">CEP</Label>
                    <div className="flex gap-2">
                        <Input
                            value={cep}
                            onChange={e => setCep(e.target.value.replace(/\D/g, '').slice(0, 8))}
                            placeholder="00000000"
                        />
                        <Button size="icon" variant="outline" onClick={fetchCep} disabled={loading}>
                            <Search className="h-4 w-4" />
                        </Button>
                    </div>
                </div>
                <div className="flex-1">
                    <Label className="text-xs text-muted-foreground">Rua / Logradouro</Label>
                    <Input
                        value={address.street}
                        onChange={e => handleFieldChange('street', e.target.value)}
                    />
                </div>
            </div>

            <div className="flex gap-2">
                <div className="w-24">
                    <Label className="text-xs text-muted-foreground">Número</Label>
                    <Input
                        value={address.number}
                        onChange={e => handleFieldChange('number', e.target.value)}
                    />
                </div>
                <div className="flex-1">
                    <Label className="text-xs text-muted-foreground">Bairro</Label>
                    <Input
                        value={address.neighborhood}
                        onChange={e => handleFieldChange('neighborhood', e.target.value)}
                    />
                </div>
            </div>

            <div className="flex gap-2">
                <div className="flex-1">
                    <Label className="text-xs text-muted-foreground">Cidade</Label>
                    <Input
                        value={address.city}
                        onChange={e => handleFieldChange('city', e.target.value)}
                    />
                </div>
                <div className="w-20">
                    <Label className="text-xs text-muted-foreground">UF</Label>
                    <Input
                        value={address.state}
                        onChange={e => handleFieldChange('state', e.target.value)}
                    />
                </div>
            </div>

            {/* Hidden output preview or debug if needed 
            <p className="text-xs text-muted-foreground mt-2">{value}</p>
            */}
        </div>
    );
}
