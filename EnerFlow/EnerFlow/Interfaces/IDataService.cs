using EnerFlow.Data;
using EnerFlow.Models;

namespace EnerFlow.Interfaces
{
    public interface IDataService
    {
        EnerFlowContext Context { get; set; }
        Hierarchy GetRootHierarchy();
    }
}
