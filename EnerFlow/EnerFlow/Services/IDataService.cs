using EnerFlow.Data;
using EnerFlow.Models;
using Microsoft.EntityFrameworkCore;

namespace EnerFlow.Services
{
    public interface IDataService
    {
        EnerFlowContext Context { get; set; }
        void SaveChanges();
        bool IsNameUniqueWithinHierarchy(string name, HierarchyId parentId);
        HierarchyId GetSibling(HierarchyId hierarchyId);
        void AddHierarchyNode(Hierarchy parentHierarchy, Hierarchy newHierarchy, Enums.NodeType hierarchyNodeType);
        void DeleteHierarchyNode(Hierarchy hierarchy);
        List<Hierarchy> GetChildren(Hierarchy hierarchy, List<Enums.NodeType> nodeTypes);
        Hierarchy GetSystemHierarchy();
        void Search(string searchText, Action<IEnumerable<SearchResult>> searchResultsCallback);
    }
}
