import { Input } from '@/components/ui/input';
import { Search } from 'lucide-react';
import { useEffect, useState } from 'react';

interface SearchBarProps {
    value: string;
    onChange: (value: string) => void;
    placeholder?: string;
    suggestions?: string[];
}

export function SearchBar({ value, onChange, placeholder = "Busque por um contrato (ex: Aluguel, Serviço...)" }: SearchBarProps) {
    const [inputValue, setInputValue] = useState(value);

    // Debounce internal update
    useEffect(() => {
        const timer = setTimeout(() => {
            onChange(inputValue);
        }, 300);
        return () => clearTimeout(timer);
    }, [inputValue, onChange]);

    return (
        <div className="relative w-full max-w-2xl mx-auto mb-8">
            <div className="relative">
                <Search className="absolute left-4 top-1/2 -translate-y-1/2 text-muted-foreground h-5 w-5" />
                <Input
                    value={inputValue}
                    onChange={(e) => setInputValue(e.target.value)}
                    className="pl-12 py-6 text-lg shadow-sm border-primary/20 focus-visible:ring-primary/30 rounded-full"
                    placeholder={placeholder}
                />
            </div>
            {/* Future: Autocomplete dropdown here */}
        </div>
    );
}
