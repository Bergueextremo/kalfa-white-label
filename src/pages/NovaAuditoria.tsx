import { Layout } from "@/components/Layout";
import { AuditFlowManager } from "@/components/audit-flow/AuditFlowManager";

const NovaAuditoria = () => {
  return (
    <Layout>
      <div className="max-w-7xl mx-auto py-8 px-4">
        <AuditFlowManager />
      </div>
    </Layout>
  );
};

export default NovaAuditoria;
