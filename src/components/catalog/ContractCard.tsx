import { Contract } from './types';
import { Button } from '@/components/ui/button';
import { Card, CardContent, CardDescription, CardFooter, CardHeader, CardTitle } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';
import { CheckCircle2, ArrowRight } from 'lucide-react';

interface ContractCardProps {
    contract: Contract;
    onView: (slug: string) => void;
}

export function ContractCard({ contract, onView }: ContractCardProps) {
    return (
        <Card className="flex flex-col h-full hover:shadow-lg transition-all duration-300 border-primary/10 group">
            <CardHeader>
                <div className="flex justify-between items-start gap-2">
                    <CardTitle className="text-xl group-hover:text-primary transition-colors line-clamp-2">{contract.title}</CardTitle>
                    <Badge variant="secondary" className="font-bold whitespace-nowrap">
                        R$ {contract.price.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}
                    </Badge>
                </div>
                <CardDescription className="line-clamp-2 min-h-[40px]">
                    {contract.description}
                </CardDescription>
            </CardHeader>
            <CardContent className="flex-grow">
                <div className="flex items-center gap-2 text-sm text-muted-foreground bg-secondary/30 p-2 rounded-lg">
                    <CheckCircle2 className="h-4 w-4 text-green-500" />
                    <span>Blindagem Jurídica Inclusa</span>
                </div>
            </CardContent>
            <CardFooter>
                <Button className="w-full group-hover:bg-primary" onClick={() => onView(contract.slug)}>
                    Ver Detalhes <ArrowRight className="ml-2 h-4 w-4 group-hover:translate-x-1 transition-transform" />
                </Button>
            </CardFooter>
        </Card>
    );
}
