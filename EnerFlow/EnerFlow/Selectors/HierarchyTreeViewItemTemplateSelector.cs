using EnerFlow.Models;
using System.Windows;
using System.Windows.Controls;

namespace EnerFlow.Selectors
{
    internal class HierarchyTreeViewItemTemplateSelector : DataTemplateSelector
    {
        public DataTemplate RootTemplate { get; set; } = null!;
        public DataTemplate CompanyTemplate { get; set; } = null!;

        public override DataTemplate SelectTemplate(object item, DependencyObject container)
        {
            var hierarchy = (Hierarchy)item;

            switch(hierarchy.NodeTypeId)
            {
                case 0:
                    return RootTemplate;
                case 1:
                    return CompanyTemplate;
                default:
                    return base.SelectTemplate(item, container);
            }
        }
    }
}
