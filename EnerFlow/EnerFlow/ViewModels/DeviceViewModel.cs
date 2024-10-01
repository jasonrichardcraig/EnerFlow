using EnerFlow.Models;

namespace EnerFlow.ViewModels
{
    public class DeviceViewModel : HierarchyViewModel  
    {
        private readonly Device _device = null!;

        public DeviceViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy) : base(parentHierarchyViewModel, hierarchy)
        {
            _device = hierarchy.Devices.First();
        }

        public DeviceViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy, Device device) : base(parentHierarchyViewModel, hierarchy)
        {
            _device = device;
            device.Hierarchy = hierarchy;
        }
    }
}
