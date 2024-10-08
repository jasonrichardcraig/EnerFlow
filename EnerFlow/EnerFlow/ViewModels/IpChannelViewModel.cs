using EnerFlow.Models;

namespace EnerFlow.ViewModels
{
    public class IpChannelViewModel : HierarchyViewModel
    {
        private readonly IpChannel _ipChannel = null!;

        public IpChannelViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy) : base(parentHierarchyViewModel, hierarchy)
        {
            _ipChannel = hierarchy.IpChannel!;
        }

        public IpChannelViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy, IpChannel ipChannel) : base(parentHierarchyViewModel, hierarchy)
        {
            _ipChannel = ipChannel;
            ipChannel.Hierarchy = hierarchy;
        }
    }
}
