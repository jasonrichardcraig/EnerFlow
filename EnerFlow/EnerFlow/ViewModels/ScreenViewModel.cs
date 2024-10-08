using EnerFlow.Models;

namespace EnerFlow.ViewModels
{
    public class ScreenViewModel : HierarchyViewModel   
    {
        private readonly Screen _screen = null!;

        public ScreenViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy) : base(parentHierarchyViewModel, hierarchy)
        {
            _screen = hierarchy.Screen!;
        }

        public ScreenViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy, Screen screen) : base(parentHierarchyViewModel, hierarchy)
        {
            _screen = screen;
            screen.Hierarchy = hierarchy;
        }
    }
}
