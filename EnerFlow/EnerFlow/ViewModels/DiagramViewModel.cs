using EnerFlow.Models;

namespace EnerFlow.ViewModels
{
    public class DiagramViewModel : HierarchyViewModel
    {
        private readonly Diagram _diagram = null!;

        public DiagramViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy) : base(parentHierarchyViewModel, hierarchy)
        {
            _diagram = hierarchy.Diagram!;
        }

        public DiagramViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy, Diagram diagram) : base(parentHierarchyViewModel, hierarchy)
        {
            _diagram = diagram;
            diagram.Hierarchy = hierarchy;
        }
    }
}
