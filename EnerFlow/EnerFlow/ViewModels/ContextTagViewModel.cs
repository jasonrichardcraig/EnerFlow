using EnerFlow.Models;

namespace EnerFlow.ViewModels
{
    public class ContextTagViewModel : HierarchyViewModel
    {

        private readonly ContextTag _contextTag = null!;

        public ContextTagViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy) : base(parentHierarchyViewModel, hierarchy)
        {
            _contextTag = hierarchy.ContextTags.First();
        }

        public ContextTagViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy, ContextTag contextTag) : base(parentHierarchyViewModel, hierarchy)
        {
            _contextTag = contextTag;
            contextTag.Hierarchy = hierarchy;

        }
    }
}
