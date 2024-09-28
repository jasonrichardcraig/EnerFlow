using EnerFlow.Data;
using EnerFlow.Enums;
using EnerFlow.Models;
using EnerFlow.ViewModels;

namespace EnerFlow.Services
{
    public interface IDataService
    {
        EnerFlowContext Context { get; set; }
        void AddHierarchyNode(Hierarchy parentHierarchy, Hierarchy newHierarchy, Enums.NodeType hierarchyNodeType);
        void DeleteHierarchyNode(Hierarchy hierarchy);
        List<Hierarchy> GetChildren(Hierarchy hierarchy);
        Hierarchy GetSystemHierarchy();

        void Search(string searchText, Action<IEnumerable<SearchResult>> searchResultsCallback);


    }
}
