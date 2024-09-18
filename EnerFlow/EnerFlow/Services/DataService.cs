using EnerFlow.Data;
using EnerFlow.Enums;
using EnerFlow.Models;
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
                .Include(hierarchy => hierarchy.Facilities)
                .Include(hierarchy => hierarchy.Satellites)
                .Include(hierarchy => hierarchy.Wells)
                .Include(hierarchy => hierarchy.RunSheets)
                .Include(hierarchy => hierarchy.ContextTags)
                .Include(hierarchy => hierarchy.SerialChannelTags)
                .Include(hierarchy => hierarchy.IpChannelTags)
                .Include(hierarchy => hierarchy.DeviceTags)
                .Include(hierarchy => hierarchy.AnalogIoTags)
                .Include(hierarchy => hierarchy.DigitalIoTags)
                .Include(hierarchy => hierarchy.StringTags)
                .Include(hierarchy => hierarchy.Screens)
                .Include(hierarchy => hierarchy.Diagrams)
                .Include(hierarchy => hierarchy.Documents)
                .OrderBy(h=>h.Name)
                .ToList();
        }

        /// <summary>
        /// Retrieves the root hierarchy.
        /// </summary>
        /// <returns>The root hierarchy.</returns>
        public Hierarchy GetSystemHierarchy()
        {
            return Context.Hierarchies.First(h => h.Node == HierarchyId.GetRoot());
        }

        /// <summary>
        /// Adds a company hierarchy node to the root hierarchy.
        /// </summary>
        /// <param name="parentHierarchy">The parent hierarchy.</param>
        /// <param name="newHierarchy">The new hierarchy to add.</param>
        public void AddHierarchyNode(Hierarchy parentHierarchy, Hierarchy newHierarchy, HierarchyNodeType hierarchyNodeType)
        {
            var lastChild = Context.Hierarchies
                .Where(n => n.Node.IsDescendantOf(parentHierarchy.Node))
                .Where(n => n.Node.GetLevel() == parentHierarchy.Node.GetLevel() + 1)
                .OrderByDescending(n => n.Node)
                .FirstOrDefault();

            // Set the node type
            newHierarchy.NodeType = Context.NodeTypes.First(n => n.Id == (int)hierarchyNodeType);

            // Generate a new HierarchyId for the child node
            newHierarchy.Node = parentHierarchy.Node.GetDescendant(lastChild?.Node, null);

            Context.Hierarchies.Add(newHierarchy);

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
