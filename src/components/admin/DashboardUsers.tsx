import { Card, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Users, Loader2, Search, Edit2, ShieldAlert } from "lucide-react";
import { useState, useEffect } from "react";
import { supabase } from "@/lib/supabase";
import { toast } from "sonner";
import { Input } from "@/components/ui/input";

interface User {
    id: string;
    email: string;
    name: string;
    created_at: string;
    status: string;
    type: string;
}

export function DashboardUsers() {
    const [users, setUsers] = useState<User[]>([]);
    const [loading, setLoading] = useState(true);
    const [searchTerm, setSearchTerm] = useState("");

    useEffect(() => {
        fetchUsers();
    }, []);

    const fetchUsers = async () => {
        try {
            setLoading(true);
            const { data, error } = await supabase.functions.invoke('get-admin-data', {
                body: { action: 'list_users' }
            });

            if (error) throw error;
            setUsers(data.users || []);
        } catch (error) {
            console.error('Error fetching users:', error);
            toast.error('Erro ao carregar usuários');
        } finally {
            setLoading(false);
        }
    };

    const filteredUsers = users.filter(u =>
        u.email?.toLowerCase().includes(searchTerm.toLowerCase()) ||
        u.name?.toLowerCase().includes(searchTerm.toLowerCase())
    );

    return (
        <div className="space-y-6">
            <div className="flex justify-between items-center">
                <div>
                    <h2 className="text-2xl font-bold text-slate-900">Usuários</h2>
                    <p className="text-slate-500 mt-1 text-sm">Gerenciamento de acessos e perfis</p>
                </div>
                <div className="relative w-64">
                    <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 h-4 w-4 text-slate-400" />
                    <Input
                        placeholder="Buscar usuário..."
                        className="pl-9"
                        value={searchTerm}
                        onChange={(e) => setSearchTerm(e.target.value)}
                    />
                </div>
            </div>

            <Card>
                <CardContent className="p-0 overflow-x-auto">
                    {loading ? (
                        <div className="flex justify-center py-12">
                            <Loader2 className="h-8 w-8 animate-spin text-primary" />
                        </div>
                    ) : filteredUsers.length === 0 ? (
                        <div className="p-12 text-center text-slate-500 text-sm">
                            Nenhum usuário encontrado.
                        </div>
                    ) : (
                        <table className="w-full text-sm text-left">
                            <thead className="bg-slate-50 border-b border-slate-200">
                                <tr>
                                    <th className="py-3 px-4 font-semibold text-slate-600">Usuário</th>
                                    <th className="py-3 px-4 font-semibold text-slate-600">Tipo</th>
                                    <th className="py-3 px-4 font-semibold text-slate-600">Status</th>
                                    <th className="py-3 px-4 font-semibold text-slate-600">Cadastro</th>
                                    <th className="py-3 px-4 font-semibold text-slate-600 text-right">Ações</th>
                                </tr>
                            </thead>
                            <tbody>
                                {filteredUsers.map((u) => (
                                    <tr key={u.id} className="border-b border-slate-100 hover:bg-slate-50 transition-colors">
                                        <td className="py-3 px-4">
                                            <div className="flex flex-col">
                                                <span className="font-medium text-slate-900">{u.name}</span>
                                                <span className="text-xs text-slate-500">{u.email}</span>
                                            </div>
                                        </td>
                                        <td className="py-3 px-4">
                                            <Badge variant="outline" className="text-[10px] uppercase">
                                                {u.type}
                                            </Badge>
                                        </td>
                                        <td className="py-3 px-4">
                                            <Badge className={`${u.status === 'Active' ? 'bg-green-100 text-green-700 border-green-200' : 'bg-red-100 text-red-700 border-red-200'} text-[10px] px-2 py-0`} variant="outline">
                                                {u.status === 'Active' ? 'Ativo' : 'Banido'}
                                            </Badge>
                                        </td>
                                        <td className="py-3 px-4 text-slate-600">
                                            {new Date(u.created_at).toLocaleDateString()}
                                        </td>
                                        <td className="py-3 px-4 text-right">
                                            <Button variant="ghost" size="icon" className="h-8 w-8">
                                                <Edit2 className="h-3.5 w-3.5" />
                                            </Button>
                                        </td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    )}
                </CardContent>
            </Card>
        </div>
    );
}
