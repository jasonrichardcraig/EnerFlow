using EnerFlow.Models;

namespace EnerFlow.ViewModels
{
    public class MeterViewModel: HierarchyViewModel
    {
        private readonly Meter _meter = null!;
        public MeterViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy) : base(parentHierarchyViewModel, hierarchy)
        {
            _meter = hierarchy.Meter!;
        }

        public MeterViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy, Meter meter) : base(parentHierarchyViewModel, hierarchy)
        {
            _meter = meter;
            meter.Hierarchy = hierarchy;
        }
    }
}
