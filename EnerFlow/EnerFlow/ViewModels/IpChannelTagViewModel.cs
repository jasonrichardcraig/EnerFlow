using EnerFlow.Models;

namespace EnerFlow.ViewModels
{
    public class IpChannelTagViewModel : HierarchyViewModel
    {
        private readonly IpChannelTag _ipChannelTag = null!;

        public IpChannelTagViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy) : base(parentHierarchyViewModel, hierarchy)
        {
            _ipChannelTag = hierarchy.IpChannelTags.First();
        }

        public IpChannelTagViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy, IpChannelTag ipChannelTag) : base(parentHierarchyViewModel, hierarchy)
        {
            _ipChannelTag = ipChannelTag;
            ipChannelTag.Hierarchy = hierarchy;
        }
    }
}
