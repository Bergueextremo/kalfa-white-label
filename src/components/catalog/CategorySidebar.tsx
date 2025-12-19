import { Category } from './types';
import { Button } from '@/components/ui/button';
import { ScrollArea } from '@/components/ui/scroll-area';
import { Building, Briefcase, Building2, Car, FileText, ChevronRight } from 'lucide-react';
import { cn } from '@/lib/utils';

interface CategorySidebarProps {
    categories: Category[];
    selectedCategory: string | null;
    onSelectCategory: (slug: string | null) => void;
}

const iconMap: Record<string, any> = {
    Building: Building,
    Briefcase: Briefcase,
    Building2: Building2,
    Car: Car,
};

export function CategorySidebar({ categories, selectedCategory, onSelectCategory }: CategorySidebarProps) {
    return (
        <div className="w-full md:w-64 flex-shrink-0 bg-card rounded-xl border p-4 h-fit">
            <h3 className="font-semibold mb-4 px-2 text-lg">Categorias</h3>
            <ScrollArea className="h-[calc(100vh-200px)]">
                <div className="space-y-1">
                    <Button
                        variant={selectedCategory === null ? "secondary" : "ghost"}
                        className="w-full justify-start"
                        onClick={() => onSelectCategory(null)}
                    >
                        <FileText className="mr-2 h-4 w-4" />
                        Todos os Modelos
                        {selectedCategory === null && <ChevronRight className="ml-auto h-4 w-4" />}
                    </Button>

                    {categories.map((category) => {
                        const Icon = category.icon && iconMap[category.icon] ? iconMap[category.icon] : FileText;

                        return (
                            <Button
                                key={category.id}
                                variant={selectedCategory === category.slug ? "secondary" : "ghost"}
                                className={cn("w-full justify-start", selectedCategory === category.slug && "bg-primary/10 text-primary hover:bg-primary/20")}
                                onClick={() => onSelectCategory(category.slug)}
                            >
                                <Icon className="mr-2 h-4 w-4" />
                                {category.name}
                                {selectedCategory === category.slug && <ChevronRight className="ml-auto h-4 w-4" />}
                            </Button>
                        );
                    })}
                </div>
            </ScrollArea>
        </div>
    );
}
