using EnerFlow.Models;

namespace EnerFlow.ViewModels
{
    public class SerialPortChannelTagViewModel : HierarchyViewModel
    {
        private readonly SerialPortChannelTag _serialPortChannelTag = null!;

        public SerialPortChannelTagViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy) : base(parentHierarchyViewModel, hierarchy)
        {
            _serialPortChannelTag = hierarchy.SerialPortChannelTags.First();
        }

        public SerialPortChannelTagViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy, SerialPortChannelTag serialPortChannelTag) : base(parentHierarchyViewModel, hierarchy)
        {
            _serialPortChannelTag = serialPortChannelTag;
            serialPortChannelTag.Hierarchy = hierarchy;
        }
    }
}
