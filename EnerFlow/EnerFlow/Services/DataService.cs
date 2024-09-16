using EnerFlow.Data;
using EnerFlow.Enums;
using EnerFlow.Models;
using EnerFlow.ViewModels;
using Microsoft.EntityFrameworkCore;
using System.Windows;


namespace EnerFlow.Services
{
    /// <summary>
    /// Represents a data service for managing hierarchies.
    /// </summary>
    public class DataService : IDataService
    {
        /// <summary>
        /// Gets or sets the EnerFlow context.
        /// </summary>
        public required EnerFlowContext Context { get; set; }

        /// <summary>
        /// Retrieves the children of a hierarchy.
        /// </summary>
        /// <param name="hierarchy">The parent hierarchy.</param>
        /// <returns>A list of child hierarchies.</returns>
        public List<Hierarchy> GetChildren(Hierarchy hierarchy)
        {
            return Context.Hierarchies
                .Where(h => h.Node.IsDescendantOf(hierarchy.Node) && h.Node.GetLevel() - 1 == hierarchy.Node.GetLevel())
                .ToList();
        }

        /// <summary>
        /// Retrieves the root hierarchy.
        /// </summary>
        /// <returns>The root hierarchy.</returns>
        public Hierarchy GetRootHierarchy()
        {
            return Context.Hierarchies.First(h => h.Node == HierarchyId.GetRoot());
        }

        /// <summary>
        /// Adds a company hierarchy node to the root hierarchy.
        /// </summary>
        /// <param name="rootHierarchy">The root hierarchy.</param>
        /// <param name="companyHierarchy">The company hierarchy to add.</param>
        public void AddCompanyHierarchyNode(Hierarchy rootHierarchy, Hierarchy companyHierarchy)
        {
            var lastChild = Context.Hierarchies
                .Where(n => n.Node.IsDescendantOf(rootHierarchy.Node))
                .Where(n => n.Node.GetLevel() == rootHierarchy.Node.GetLevel() + 1)
                .OrderByDescending(n => n.Node)
                .FirstOrDefault();

            // Set the node type to Company
            companyHierarchy.NodeType = Context.NodeTypes.First(n => n.Id == (int)HierarchyNodeType.Company);

            // Generate a new HierarchyId for the child node
            companyHierarchy.Node = rootHierarchy.Node.GetDescendant(lastChild?.Node, null);

            Context.Hierarchies.Add(companyHierarchy);

            Context.SaveChanges();
        }

        public void DeleteHierarchyNode(Hierarchy hierarchy)
        {
            try
            {
                var hierarchyId = hierarchy.Id;

                switch ((HierarchyNodeType)hierarchy.NodeTypeId)
                {
                    case HierarchyNodeType.Satellite:
                        Context.Satellites.Remove(Context.Satellites.First(s => s.HierarchyId == hierarchyId));
                        break;
                    case HierarchyNodeType.Well:
                        Context.Wells.Remove(Context.Wells.First(w => w.HierarchyId == hierarchyId));
                        break;
                    case HierarchyNodeType.RunSheet:
                        Context.RunSheets.Remove(Context.RunSheets.First(r => r.HierarchyId == hierarchyId));
                        break;
                    case HierarchyNodeType.ContextTag:
                        Context.ContextTags.Remove(Context.ContextTags.First(c => c.HierarchyId == hierarchyId));
                        break;
                    case HierarchyNodeType.SerialPortChannelTag:
                        Context.SerialChannelTags.Remove(Context.SerialChannelTags.First(s => s.HierarchyId == hierarchyId));
                        break;
                    case HierarchyNodeType.IpChannelTag:
                        Context.IpChannelTags.Remove(Context.IpChannelTags.First(i => i.HierarchyId == hierarchyId));
                        break;
                    case HierarchyNodeType.DeviceTag:
                        Context.DeviceTags.Remove(Context.DeviceTags.First(d => d.HierarchyId == hierarchyId));
                        break;
                    case HierarchyNodeType.AnalogIoTag:
                        Context.AnalogIoTags.Remove(Context.AnalogIoTags.First(a => a.HierarchyId == hierarchyId));
                        break;
                    case HierarchyNodeType.DigitalIoTag:
                        Context.DigitalIoTags.Remove(Context.DigitalIoTags.First(d => d.HierarchyId == hierarchyId));
                        break;
                    case HierarchyNodeType.StringIoTag:
                        Context.StringTags.Remove(Context.StringTags.First(s => s.HierarchyId == hierarchyId));
                        break;
                    case HierarchyNodeType.Screen:
                        Context.Screens.Remove(Context.Screens.First(s => s.HierarchyId == hierarchyId));
                        break;
                    case HierarchyNodeType.Diagram:
                        Context.Diagrams.Remove(Context.Diagrams.First(d => d.HierarchyId == hierarchyId));
                        break;
                    case HierarchyNodeType.Document:
                        Context.Documents.Remove(Context.Documents.First(d => d.HierarchyId == hierarchyId));
                        break;
                }

                Context.Hierarchies.Remove(hierarchy);
                Context.SaveChanges();

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
