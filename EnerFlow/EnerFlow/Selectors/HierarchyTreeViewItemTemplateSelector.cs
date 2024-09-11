using EnerFlow.Enums;
using EnerFlow.ViewModels;
using System.Windows;
using System.Windows.Controls;

namespace EnerFlow.Selectors
{
    /// <summary>
    /// A custom DataTemplateSelector for selecting the appropriate DataTemplate based on the type of hierarchy node.
    /// </summary>
    internal class HierarchyTreeViewItemTemplateSelector : DataTemplateSelector
    {
        /// <summary>
        /// Gets or sets the DataTemplate for the Company node type.
        /// </summary>
        public DataTemplate? CompanyTemplate { get; set; }

        /// <summary>
        /// Gets or sets the DataTemplate for the District node type.
        /// </summary>
        public DataTemplate? DistrictTemplate { get; set; }

        /// <summary>
        /// Gets or sets the DataTemplate for the Area node type.
        /// </summary>
        public DataTemplate? AreaTemplate { get; set; }

        /// <summary>
        /// Gets or sets the DataTemplate for the Field node type.
        /// </summary>
        public DataTemplate? FieldTemplate { get; set; }

        /// <summary>
        /// Selects the appropriate DataTemplate based on the type of hierarchy node.
        /// </summary>
        /// <param name="item">The data item.</param>
        /// <param name="container">The container.</param>
        /// <returns>The selected DataTemplate.</returns>
        public override DataTemplate SelectTemplate(object item, DependencyObject container)
        {
            var hierarchyViewModel = (HierarchyViewModel)item;

            return (HierarchyNodeType)hierarchyViewModel.Hierarchy.NodeTypeId switch
            {
                HierarchyNodeType.Company => CompanyTemplate ?? base.SelectTemplate(item, container),
                HierarchyNodeType.District => DistrictTemplate ?? base.SelectTemplate(item, container),
                HierarchyNodeType.Area => AreaTemplate ?? base.SelectTemplate(item, container),
                HierarchyNodeType.Field => FieldTemplate ?? base.SelectTemplate(item, container),
                _ => base.SelectTemplate(item, container),
            };
        }
    }
}
