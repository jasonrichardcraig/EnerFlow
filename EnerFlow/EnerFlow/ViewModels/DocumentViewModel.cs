using EnerFlow.Models;

namespace EnerFlow.ViewModels
{
    public class DocumentViewModel : HierarchyViewModel
    {
        private readonly Document _document = null!;
        public DocumentViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy) : base(parentHierarchyViewModel, hierarchy)
        {
            _document = hierarchy.Document!;
        }

        public DocumentViewModel(HierarchyViewModel parentHierarchyViewModel, Hierarchy hierarchy, Document document) : base(parentHierarchyViewModel, hierarchy)
        {
            _document = document;
            document.Hierarchy = hierarchy;
        }
    }
}
