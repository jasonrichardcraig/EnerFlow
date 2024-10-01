using EnerFlow.Models;

namespace EnerFlow.ViewModels
{
    public class SerialPortChannelViewModel : HierarchyViewModel
    {
        private readonly SerialPortChannel _serialPortChannel = null!;

        public SerialPortChannelViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy) : base(parentHierarchyViewModel, hierarchy)
        {
            _serialPortChannel = hierarchy.SerialPortChannels.First();
        }

        public SerialPortChannelViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy, SerialPortChannel serialPortChannel) : base(parentHierarchyViewModel, hierarchy)
        {
            _serialPortChannel = serialPortChannel;
            serialPortChannel.Hierarchy = hierarchy;
        }
    }
}
