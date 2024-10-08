using EnerFlow.Models;

namespace EnerFlow.ViewModels
{
    public class MeterRunViewModel : HierarchyViewModel
    {
        private readonly MeterRun _meterRun = null!;
        public MeterRunViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy) : base(parentHierarchyViewModel, hierarchy)
        {
            _meterRun = hierarchy.MeterRun!;
        }

        public MeterRunViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy, MeterRun metetRun) : base(parentHierarchyViewModel, hierarchy)
        {
            _meterRun = metetRun;
            metetRun.Hierarchy = hierarchy;
        }
    }
}
