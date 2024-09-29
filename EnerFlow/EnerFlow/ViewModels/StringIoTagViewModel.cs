using EnerFlow.Models;

namespace EnerFlow.ViewModels
{
    public class StringIoTagViewModel: HierarchyViewModel
    {
        private readonly StringIoTag _stringIoTag = null!;

        public StringIoTagViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy) : base(parentHierarchyViewModel, hierarchy)
        {
            _stringIoTag = hierarchy.StringIoTags.First();
        }

        public StringIoTagViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy, StringIoTag stringIoTag) : base(parentHierarchyViewModel, hierarchy)
        {
            _stringIoTag = stringIoTag;
            stringIoTag.Hierarchy = hierarchy;
        }
    }
}
