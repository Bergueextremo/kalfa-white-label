import { Contract } from './types';
import { Button } from '@/components/ui/button';
import { ArrowRight, FileText } from 'lucide-react';
import { Badge } from '@/components/ui/badge';

interface ContractListItemProps {
    contract: Contract;
    onView: (slug: string) => void;
    categoryName?: string;
}

export function ContractListItem({ contract, onView, categoryName }: ContractListItemProps) {
    return (
        <div
            className="group flex flex-col md:flex-row items-center gap-4 p-4 rounded-lg border bg-card hover:shadow-md transition-all cursor-pointer"
            onClick={() => onView(contract.slug)}
        >
            <div className="flex items-center justify-center h-12 w-12 rounded-full bg-primary/10 text-primary shrink-0">
                <FileText className="h-6 w-6" />
            </div>

            <div className="flex-grow text-center md:text-left w-full">
                <div className="flex items-center justify-center md:justify-start gap-2 mb-1">
                    <h3 className="font-semibold text-lg leading-tight group-hover:text-primary transition-colors">
                        {contract.title}
                    </h3>
                    {categoryName && (
                        <Badge variant="secondary" className="text-xs hidden lg:inline-flex whitespace-nowrap">
                            {categoryName}
                        </Badge>
                    )}
                </div>
                {contract.description && (
                    <p className="text-sm text-muted-foreground line-clamp-1 hidden md:block">
                        {contract.description}
                    </p>
                )}
            </div>

            <div className="flex items-center gap-4 mt-2 md:mt-0 shrink-0">
                <span className="font-bold text-lg text-primary">
                    R$ {contract.price.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}
                </span>
                <Button size="sm" className="whitespace-nowrap">
                    Criar Agora
                    <ArrowRight className="ml-2 h-4 w-4" />
                </Button>
            </div>
        </div>
    );
}
