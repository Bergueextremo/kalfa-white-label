import { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { supabase } from '@/lib/supabase';
import { Category, Contract } from '@/components/catalog/types';
import { CategorySidebar } from '@/components/catalog/CategorySidebar';
import { ContractList } from '@/components/catalog/ContractList';
import { SearchBar } from '@/components/catalog/SearchBar';
import { Header } from '@/components/Header';
import { Footer } from '@/components/Footer';

export default function Catalog() {
    const navigate = useNavigate();
    const [categories, setCategories] = useState<Category[]>([]);
    const [contracts, setContracts] = useState<Contract[]>([]);
    const [selectedCategory, setSelectedCategory] = useState<string | null>(null);
    const [searchTerm, setSearchTerm] = useState('');
    const [isLoading, setIsLoading] = useState(true);

    useEffect(() => {
        async function fetchData() {
            setIsLoading(true);
            try {
                // Fetch Categories
                const { data: catData, error: catError } = await supabase
                    .from('contract_categories')
                    .select('*')
                    .order('name');

                if (catError) throw catError;
                setCategories(catData || []);

                // Fetch Contracts
                const { data: conData, error: conError } = await supabase
                    .from('contracts')
                    .select('*')
                    .eq('is_active', true)
                    .order('title');

                if (conError) throw conError;
                setContracts(conData || []);

            } catch (error) {
                console.error('Error fetching catalog data:', error);
            } finally {
                setIsLoading(false);
            }
        }

        fetchData();
    }, []);

    const filteredContracts = contracts.filter(contract => {
        const matchesCategory = selectedCategory ?
            // Direct match or check if category matches (requires joining or matching ID in a real app, 
            // but here we filter by category_id which should map to the selected category slug. 
            // Wait, contracts have category_id (UUID), selectedCategory is slug.
            // We need to map slug to ID.
            categories.find(c => c.slug === selectedCategory)?.id === contract.category_id
            : true;

        const matchesSearch = contract.title.toLowerCase().includes(searchTerm.toLowerCase()) ||
            contract.description?.toLowerCase().includes(searchTerm.toLowerCase()) ||
            contract.category_id === categories.find(c => c.name.toLowerCase().includes(searchTerm.toLowerCase()))?.id;

        return matchesCategory && matchesSearch;
    });

    return (
        <div className="min-h-screen flex flex-col bg-background">
            <Header />

            <main className="flex-grow container mx-auto px-4 py-8">
                <div className="text-center mb-10">
                    <h1 className="text-4xl font-bold mb-4 bg-gradient-to-r from-primary to-primary/60 bg-clip-text text-transparent">
                        Vitrine de Contratos
                    </h1>
                    <p className="text-muted-foreground max-w-2xl mx-auto">
                        Escolha o modelo ideal para o seu negócio. Todos os documentos são revisados por nossa inteligência forense.
                    </p>
                </div>

                <SearchBar value={searchTerm} onChange={setSearchTerm} />

                <div className="flex flex-col md:flex-row gap-8 items-start relative">
                    <div className="md:sticky md:top-24 w-full md:w-64 shrink-0">
                        <CategorySidebar
                            categories={categories}
                            selectedCategory={selectedCategory}
                            onSelectCategory={setSelectedCategory}
                        />
                    </div>

                    <div className="flex-grow w-full">
                        {isLoading ? (
                            <div className="space-y-4">
                                {[1, 2, 3, 4, 5, 6].map(i => (
                                    <div key={i} className="h-24 bg-secondary/20 animate-pulse rounded-lg" />
                                ))}
                            </div>
                        ) : (
                            <ContractList
                                contracts={filteredContracts}
                                categories={categories}
                                onViewContract={(slug) => navigate(`/catalogo/${slug}`)}
                            />
                        )}
                    </div>
                </div>
            </main>

            <Footer />
        </div>
    );
}
