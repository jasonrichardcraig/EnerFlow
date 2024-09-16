using EnerFlow.Data;
using EnerFlow.Models;

namespace EnerFlow.Services
{
    public interface IDataService
    {
        EnerFlowContext Context { get; set; }
        void AddCompanyHierarchyNode(Hierarchy rootHierarchy, Hierarchy companyHierarchy);
        void DeleteCompanyHierarchyNode(Hierarchy companyHierarchy);
        List<Hierarchy> GetChildren(Hierarchy hierarchy);
        Hierarchy GetRootHierarchy();
    }
}
