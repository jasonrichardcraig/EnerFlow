using EnerFlow.Models;

namespace EnerFlow.ViewModels
{
    public class FolderViewModel : HierarchyViewModel
    {
        private readonly Folder _folder = null!;
        public FolderViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy) : base(parentHierarchyViewModel, hierarchy)
        {
            _folder = hierarchy.Folders.First();
        }

        public FolderViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy, Folder folder) : base(parentHierarchyViewModel, hierarchy)
        {
            _folder = folder;
            folder.Hierarchy = hierarchy;
        }
    }
}
