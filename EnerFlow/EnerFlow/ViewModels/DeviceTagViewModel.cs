using EnerFlow.Models;

namespace EnerFlow.ViewModels
{
    public class DeviceTagViewModel : HierarchyViewModel  
    {
        private readonly DeviceTag _deviceTag = null!;

        public DeviceTagViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy) : base(parentHierarchyViewModel, hierarchy)
        {
            _deviceTag = hierarchy.DeviceTags.First();
        }

        public DeviceTagViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy, DeviceTag deviceTag) : base(parentHierarchyViewModel, hierarchy)
        {
            _deviceTag = deviceTag;
            deviceTag.Hierarchy = hierarchy;
        }
    }
}
