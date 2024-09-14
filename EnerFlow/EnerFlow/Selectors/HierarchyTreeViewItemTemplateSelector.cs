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
        /// Gets or sets the DataTemplate for the Root node type.
        /// </summary>
        public DataTemplate? RootTemplate { get; set; }

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
        /// Gets or sets the DataTemplate for the Facility node type.
        /// </summary>
        public DataTemplate? FacilityTemplate { get; set; }

        /// <summary>
        /// Gets or sets the DataTemplate for the Satellite node type.
        /// </summary>
        public DataTemplate? SatelliteTemplate { get; set; }

        /// <summary>
        /// Gets or sets the DataTemplate for the Well node type.
        /// </summary>
        public DataTemplate? WellTemplate { get; set; }

        /// <summary>
        /// Gets or sets the DataTemplate for the RunSheet node type.
        /// </summary>
        public DataTemplate? RunSheetTemplate { get; set; }

        /// <summary>
        /// Gets or sets the DataTemplate for the Context Tag node type.
        /// </summary>
        public DataTemplate? ContextTagTemplate { get; set; }

        /// <summary>
        /// Gets or sets the DataTemplate for the Serial Port Channel Tag node type.
        /// </summary>
        public DataTemplate? SerialPortChannelTagTemplate { get; set; }

        /// <summary>
        /// Gets or sets the DataTemplate for the IP Channel Tag node type.
        /// </summary>
        public DataTemplate? IpChannelTagTemplate { get; set; }

        /// <summary>
        /// Gets or sets the DataTemplate for the Device Tag node type.
        /// </summary>
        public DataTemplate? DeviceTagTemplate { get; set; }

        /// <summary>
        /// Gets or sets the DataTemplate for the Analog I/O Tag node type.
        /// </summary>
        public DataTemplate? AnalogIoTagTemplate { get; set; }

        /// <summary>
        /// Gets or sets the DataTemplate for the Digital I/O Tag node type.
        /// </summary>
        public DataTemplate? DigitalIoTagTemplate { get; set; }

        /// <summary>
        /// Gets or sets the DataTemplate for the String I/O Tag node type.
        /// </summary>
        public DataTemplate? StringIoTagTemplate { get; set; }

        /// <summary>
        /// Gets or sets the DataTemplate for the Screen node type.
        /// </summary>
        public DataTemplate? ScreenTemplate { get; set; }

        /// <summary>
        /// Gets or sets the DataTemplate for the Diagram node type.
        /// </summary>
        public DataTemplate? DiagramTemplate { get; set; }

        /// <summary>
        /// Gets or sets the DataTemplate for the Document node type.
        /// </summary>
        public DataTemplate? DocumentTemplate { get; set; }

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
                HierarchyNodeType.Root => RootTemplate ?? base.SelectTemplate(item, container),
                HierarchyNodeType.Company => CompanyTemplate ?? base.SelectTemplate(item, container),
                HierarchyNodeType.District => DistrictTemplate ?? base.SelectTemplate(item, container),
                HierarchyNodeType.Area => AreaTemplate ?? base.SelectTemplate(item, container),
                HierarchyNodeType.Field => FieldTemplate ?? base.SelectTemplate(item, container),
                HierarchyNodeType.Facility => FacilityTemplate ?? base.SelectTemplate(item, container),
                HierarchyNodeType.Satellite => SatelliteTemplate ?? base.SelectTemplate(item, container),
                HierarchyNodeType.Well => WellTemplate ?? base.SelectTemplate(item, container),
                HierarchyNodeType.RunSheet => RunSheetTemplate ?? base.SelectTemplate(item, container),
                HierarchyNodeType.ContextTag => ContextTagTemplate ?? base.SelectTemplate(item, container),
                HierarchyNodeType.SerialPortChannelTag => SerialPortChannelTagTemplate ?? base.SelectTemplate(item, container),
                HierarchyNodeType.IpChannelTag => IpChannelTagTemplate ?? base.SelectTemplate(item, container),
                HierarchyNodeType.DeviceTag => DeviceTagTemplate ?? base.SelectTemplate(item, container),
                HierarchyNodeType.AnalogIoTag => AnalogIoTagTemplate ?? base.SelectTemplate(item, container),
                HierarchyNodeType.DigitalIoTag => DigitalIoTagTemplate ?? base.SelectTemplate(item, container),
                HierarchyNodeType.StringIoTag => StringIoTagTemplate ?? base.SelectTemplate(item, container),
                HierarchyNodeType.Screen => ScreenTemplate ?? base.SelectTemplate(item, container),
                HierarchyNodeType.Diagram => DiagramTemplate ?? base.SelectTemplate(item, container),
                HierarchyNodeType.Document => DocumentTemplate ?? base.SelectTemplate(item, container),
                _ => base.SelectTemplate(item, container),
            };
        }
    }
}
