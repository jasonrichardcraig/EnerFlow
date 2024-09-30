using EnerFlow.Models;

namespace EnerFlow.ViewModels
{
    public class VesselViewModel : HierarchyViewModel
    {
        private readonly Vessel _vessel = null!;
        public VesselViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy) : base(parentHierarchyViewModel, hierarchy)
        {
            _vessel = hierarchy.Vessels.First();
        }

        public VesselViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy, Vessel vessel) : base(parentHierarchyViewModel, hierarchy)
        {
            _vessel = vessel;
            vessel.Hierarchy = hierarchy;
        }
    }
}
