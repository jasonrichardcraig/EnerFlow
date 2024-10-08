using EnerFlow.Models;

namespace EnerFlow.ViewModels
{
    public class RunSheetViewModel : HierarchyViewModel
    {

        private readonly RunSheet _runSheet = null!;

        public RunSheetViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy) : base(parentHierarchyViewModel, hierarchy)
        {
            _runSheet = hierarchy.RunSheet!;
        }

        public RunSheetViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy, RunSheet runSheet) : base(parentHierarchyViewModel, hierarchy)
        {
            _runSheet = runSheet;
            runSheet.Hierarchy = hierarchy;

        }
    }
}
