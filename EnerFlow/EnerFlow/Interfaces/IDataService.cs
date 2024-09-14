using EnerFlow.Data;
using EnerFlow.Enums;
using EnerFlow.Models;

namespace EnerFlow.Interfaces
{
    public interface IDataService
    {
        EnerFlowContext Context { get; set; }

        void AddHierarchyNode(Hierarchy hierarchy);
        IEnumerable<Hierarchy> GetChildren(Hierarchy hierarchy);
        Hierarchy GetRootHierarchy();
    }
}
