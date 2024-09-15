using EnerFlow.Data;
using EnerFlow.Models;
using Microsoft.EntityFrameworkCore;

namespace EnerFlow.Services
{
    public class DataService : IDataService
    {
        public required EnerFlowContext Context { get; set; }

        public IEnumerable<Hierarchy> GetChildren(Hierarchy hierarchy)
        {
            return Context.Hierarchies.Where(h => h.Node.IsDescendantOf(hierarchy.Node) && h.Node.GetLevel() - 1 == hierarchy.Node.GetLevel())!;
        }

        public Hierarchy GetRootHierarchy()
        {
            return Context.Hierarchies.FirstOrDefault(h => h.Node == HierarchyId.GetRoot())!;
        }

        public void AddHierarchyNode(Hierarchy hierarchy)
        {
            throw new System.NotImplementedException();
        }

    }
}
