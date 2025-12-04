import { AdminLayout } from "@/components/admin/AdminLayout";
import { useParams, useNavigate } from "react-router-dom";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { ArrowLeft, User, CreditCard, Activity, Loader2 } from "lucide-react";
import { useState, useEffect } from "react";
import { supabase } from "@/lib/supabase";
import { toast } from "sonner";

interface UserDetail {
  id: string;
  name: string;
  email: string;
  phone: string;
  document: string;
  type: string;
  status: string;
  joinedAt: string;
  credits: number;
  purchases: { id: string; date: string; item: string; amount: number }[];
  activity: { id: string; date: string; contract: string; result: string }[];
}

const AdminUserDetail = () => {
  const { id } = useParams();
  const navigate = useNavigate();
  const [user, setUser] = useState<UserDetail | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (id) fetchUserDetails(id);
  }, [id]);

  const fetchUserDetails = async (userId: string) => {
    try {
      setLoading(true);
      const { data, error } = await supabase.functions.invoke('get-admin-data', {
        body: { action: 'get_user_details', userId }
      });

      if (error) throw error;
      setUser(data.user);
    } catch (error) {
      console.error('Error fetching user details:', error);
      toast.error('Erro ao carregar detalhes do usuário');
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return (
      <AdminLayout>
        <div className="flex justify-center py-20">
          <Loader2 className="h-8 w-8 animate-spin text-primary" />
        </div>
      </AdminLayout>
    );
  }

  if (!user) {
    return (
      <AdminLayout>
        <div className="text-center py-20">
          <h2 className="text-2xl font-bold text-slate-700">Usuário não encontrado</h2>
          <Button onClick={() => navigate('/admin/users')} className="mt-4">Voltar</Button>
        </div>
      </AdminLayout>
    );
  }

  return (
    <AdminLayout>
      <div className="space-y-6">
        <Button variant="ghost" onClick={() => navigate('/admin/users')} className="pl-0 hover:bg-transparent hover:text-blue-600">
          <ArrowLeft className="h-4 w-4 mr-2" />
          Voltar para Lista
        </Button>

        <div className="flex justify-between items-start">
          <div>
            <h1 className="text-3xl font-bold text-slate-900">{user.name}</h1>
            <p className="text-slate-500">{user.email}</p>
          </div>
          <Badge className={user.status === 'Active' ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700'}>
            {user.status}
          </Badge>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
          {/* Profile Info */}
          <Card className="md:col-span-1">
            <CardHeader>
              <CardTitle className="flex items-center gap-2 text-lg">
                <User className="h-5 w-5 text-blue-500" />
                Dados do Perfil
              </CardTitle>
            </CardHeader>
            <CardContent className="space-y-4">
              <div>
                <label className="text-xs font-semibold text-slate-500 uppercase">Documento</label>
                <p className="font-medium">{user.document}</p>
              </div>
              <div>
                <label className="text-xs font-semibold text-slate-500 uppercase">Telefone</label>
                <p className="font-medium">{user.phone}</p>
              </div>
              <div>
                <label className="text-xs font-semibold text-slate-500 uppercase">Tipo</label>
                <p className="font-medium">{user.type}</p>
              </div>
              <div>
                <label className="text-xs font-semibold text-slate-500 uppercase">Membro desde</label>
                <p className="font-medium">{new Date(user.joinedAt).toLocaleDateString()}</p>
              </div>
            </CardContent>
          </Card>

          <div className="md:col-span-2 space-y-6">
            {/* Purchase History */}
            <Card>
              <CardHeader>
                <CardTitle className="flex items-center gap-2 text-lg">
                  <CreditCard className="h-5 w-5 text-green-500" />
                  Histórico de Compras
                </CardTitle>
              </CardHeader>
              <CardContent>
                {user.purchases.length > 0 ? (
                  <table className="w-full">
                    <thead>
                      <tr className="text-left text-sm text-slate-500 border-b">
                        <th className="pb-2">Data</th>
                        <th className="pb-2">Item</th>
                        <th className="pb-2 text-right">Valor</th>
                      </tr>
                    </thead>
                    <tbody>
                      {user.purchases.map(p => (
                        <tr key={p.id} className="border-b last:border-0">
                          <td className="py-3">{new Date(p.date).toLocaleDateString()}</td>
                          <td className="py-3 font-medium">{p.item}</td>
                          <td className="py-3 text-right">R$ {p.amount.toFixed(2)}</td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                ) : (
                  <p className="text-slate-500 text-sm">Nenhuma compra registrada.</p>
                )}
              </CardContent>
            </Card>

            {/* Activity Log */}
            <Card>
              <CardHeader>
                <CardTitle className="flex items-center gap-2 text-lg">
                  <Activity className="h-5 w-5 text-purple-500" />
                  Atividade Recente
                </CardTitle>
              </CardHeader>
              <CardContent>
                {user.activity.length > 0 ? (
                  <div className="space-y-4">
                    {user.activity.map(a => (
                      <div key={a.id} className="flex justify-between items-center border-b pb-3 last:border-0 last:pb-0">
                        <div>
                          <p className="font-medium text-slate-800">{a.contract}</p>
                          <p className="text-xs text-slate-500">{new Date(a.date).toLocaleDateString()}</p>
                        </div>
                        <Badge variant="secondary">{a.result}</Badge>
                      </div>
                    ))}
                  </div>
                ) : (
                  <p className="text-slate-500 text-sm">Nenhuma atividade recente.</p>
                )}
              </CardContent>
            </Card>
          </div>
        </div>
      </div>
    </AdminLayout>
  );
};

export default AdminUserDetail;
