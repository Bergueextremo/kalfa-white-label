import { useLocation, Link, useNavigate } from "react-router-dom";
import { useEffect, useState } from "react";
import { Footer } from "@/components/Footer";

const NotFound = () => {
  const location = useLocation();
  const navigate = useNavigate();
  const [countdown, setCountdown] = useState(5);

  useEffect(() => {
    console.error("404 Error: User attempted to access non-existent route:", location.pathname);
  }, [location.pathname]);

  useEffect(() => {
    const timer = setInterval(() => {
      setCountdown((prev) => {
        if (prev <= 1) {
          clearInterval(timer);
          navigate("/");
          return 0;
        }
        return prev - 1;
      });
    }, 1000);

    return () => clearInterval(timer);
  }, [navigate]);

  return (
    <div className="flex min-h-screen flex-col bg-slate-950 text-slate-100">
      <div className="flex flex-grow flex-col items-center justify-center p-4 text-center">
        <div className="mb-8 relative w-64 h-64 md:w-96 md:h-96">
          <img
            src="/src/assets/vector-principal.png"
            alt="Página não encontrada"
            className="w-full h-full object-contain animate-float"
          />
        </div>

        <h1 className="mb-4 text-5xl font-bold bg-gradient-to-r from-blue-400 to-purple-400 bg-clip-text text-transparent">
          404
        </h1>

        <h2 className="mb-4 text-2xl font-semibold text-slate-200">
          Página não encontrada
        </h2>

        <p className="mb-8 text-lg text-slate-400 max-w-md">
          Parece que você navegou para um lugar inexistente.
          Verifique o endereço ou retorne para a página inicial.
        </p>

        <p className="mb-6 text-sm text-slate-500">
          Redirecionando automaticamente em <span className="font-bold text-blue-400">{countdown}</span> segundo{countdown !== 1 ? 's' : ''}...
        </p>

        <Link
          to="/"
          className="px-6 py-3 rounded-lg bg-blue-600 hover:bg-blue-700 text-white font-medium transition-colors duration-200 shadow-lg shadow-blue-900/20"
        >
          Voltar para o Início
        </Link>
      </div>

      <Footer />
    </div>
  );
};

export default NotFound;
