using EnerFlow.Models;

namespace EnerFlow.ViewModels
{
    public class TankViewModel : HierarchyViewModel 
    {
        private readonly Tank _tank = null!;
        public TankViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy) : base(parentHierarchyViewModel, hierarchy)
        {
            _tank = hierarchy.Tank!;
        }

        public TankViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy, Tank tank) : base(parentHierarchyViewModel, hierarchy)
        {
            _tank = tank;
            tank.Hierarchy = hierarchy;
        }
    }
}
