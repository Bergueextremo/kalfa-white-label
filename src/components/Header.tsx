import { useState } from 'react';
import { useNavigate, useLocation } from "react-router-dom";
import { Menu, X } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Sheet, SheetContent, SheetTrigger } from '@/components/ui/sheet';
import { useAuth } from "@/contexts/AuthContext";
import logoJusContratos from "@/assets/logo-juscontratos.png";

export const Header = () => {
    const navigate = useNavigate();
    const location = useLocation();
    const { isAuthenticated } = useAuth();
    const [mobileMenuOpen, setMobileMenuOpen] = useState(false);

    // Helper to handle navigation to sections
    const scrollToSection = (sectionId: string) => {
        if (location.pathname !== '/home') {
            navigate('/home');
            setTimeout(() => {
                const element = document.getElementById(sectionId);
                if (element) element.scrollIntoView({ behavior: 'smooth' });
            }, 100);
        } else {
            const element = document.getElementById(sectionId);
            if (element) element.scrollIntoView({ behavior: 'smooth' });
        }
        setMobileMenuOpen(false);
    };

    return (
        <header className="border-b border-border bg-card/50 backdrop-blur-sm sticky top-0 z-50">
            <div className="container mx-auto px-4 py-4">
                <div className="flex items-center justify-between">
                    <div className="flex items-center gap-2 cursor-pointer" onClick={() => navigate('/home')}>
                        <img src={logoJusContratos} alt="JusContratos" className="h-12 md:h-14" />
                    </div>

                    {/* Desktop Navigation */}
                    <nav className="hidden md:flex items-center gap-8">
                        <button onClick={() => scrollToSection('features')} className="text-sm font-medium text-muted-foreground hover:text-foreground transition-colors">
                            Recursos
                        </button>
                        <button onClick={() => navigate('/consultas')} className="text-sm font-medium text-muted-foreground hover:text-foreground transition-colors">
                            Consultas
                        </button>
                        <button onClick={() => scrollToSection('pricing')} className="text-sm font-medium text-muted-foreground hover:text-foreground transition-colors">
                            Preços
                        </button>
                        <Button variant="outline" onClick={() => navigate(isAuthenticated ? "/dashboard" : "/auth")}>
                            {isAuthenticated ? "Dashboard" : "Entrar"}
                        </Button>
                        {!isAuthenticated && <Button onClick={() => navigate("/auth")}>
                            Começar Gratuitamente
                        </Button>}
                    </nav>

                    {/* Mobile Menu */}
                    <Sheet open={mobileMenuOpen} onOpenChange={setMobileMenuOpen}>
                        <SheetTrigger asChild className="md:hidden">
                            <Button variant="ghost" size="icon">
                                <Menu className="h-6 w-6" />
                            </Button>
                        </SheetTrigger>
                        <SheetContent side="right" className="w-[300px] sm:w-[400px]">
                            <nav className="flex flex-col gap-6 mt-8">
                                <button
                                    className="text-lg font-medium text-foreground hover:text-primary transition-colors text-left"
                                    onClick={() => scrollToSection('features')}
                                >
                                    Recursos
                                </button>
                                <button
                                    className="text-lg font-medium text-foreground hover:text-primary transition-colors text-left"
                                    onClick={() => {
                                        navigate('/consultas');
                                        setMobileMenuOpen(false);
                                    }}
                                >
                                    Consultas
                                </button>
                                <button
                                    className="text-lg font-medium text-foreground hover:text-primary transition-colors text-left"
                                    onClick={() => scrollToSection('pricing')}
                                >
                                    Preços
                                </button>
                                <div className="flex flex-col gap-3 pt-4 border-t">
                                    <Button
                                        variant="outline"
                                        className="w-full"
                                        onClick={() => {
                                            navigate(isAuthenticated ? "/dashboard" : "/auth");
                                            setMobileMenuOpen(false);
                                        }}
                                    >
                                        {isAuthenticated ? "Dashboard" : "Entrar"}
                                    </Button>
                                    {!isAuthenticated && (
                                        <Button
                                            className="w-full"
                                            onClick={() => {
                                                navigate("/auth");
                                                setMobileMenuOpen(false);
                                            }}
                                        >
                                            Começar Gratuitamente
                                        </Button>
                                    )}
                                </div>
                            </nav>
                        </SheetContent>
                    </Sheet>
                </div>
            </div>
        </header>
    );
};
