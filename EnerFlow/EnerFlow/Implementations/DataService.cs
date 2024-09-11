using EnerFlow.Data;
using EnerFlow.Models;
using EnerFlow.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace EnerFlow.Implementations
{
    public class DataService : IDataService
    {
        public required EnerFlowContext Context { get; set; }

        public Hierarchy GetRootHierarchy()
        {
            return Context.Hierarchies.FirstOrDefault(h => h.Node == HierarchyId.GetRoot())!;
        }

    }
}
