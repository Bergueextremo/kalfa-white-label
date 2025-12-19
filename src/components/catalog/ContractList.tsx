import { Contract, Category } from './types';
import { ContractListItem } from './ContractListItem';

interface ContractListProps {
    contracts: Contract[];
    categories: Category[];
    onViewContract: (slug: string) => void;
}

export function ContractList({ contracts, categories, onViewContract }: ContractListProps) {
    if (contracts.length === 0) {
        return (
            <div className="text-center py-20 bg-secondary/10 rounded-xl border border-dashed">
                <p className="text-xl text-muted-foreground">Nenhum contrato encontrado.</p>
            </div>
        );
    }

    return (
        <div className="flex flex-col gap-4">
            {contracts.map(contract => {
                const category = categories.find(c => c.id === contract.category_id);
                return (
                    <ContractListItem
                        key={contract.id}
                        contract={contract}
                        categoryName={category?.name}
                        onView={onViewContract}
                    />
                );
            })}
        </div>
    );
}
