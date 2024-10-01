using EnerFlow.Data;
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
            return new List<Hierarchy>(Context.Hierarchies
                .Where(h => h.Node.IsDescendantOf(hierarchy.Node) && h.Node.GetLevel() - 1 == hierarchy.Node.GetLevel())
                .Include(h => h.NodeType)
                .Include(h => h.Facilities)
                .Include(h => h.Wells)
                .Include(h => h.RunSheets)
                .Include(h => h.ContextTags)
                .Include(h => h.SerialPortChannels)
                .Include(h => h.IpChannels)
                .Include(h => h.Devices)
                .Include(h => h.AnalogIoTags)
                .Include(h => h.DigitalIoTags)
                .Include(h => h.StringIoTags)
                .Include(h => h.MeterRuns)
                .Include(h => h.Screens)
                .Include(h => h.Diagrams)
                .Include(h => h.Documents)
                .Include(h => h.Folders)
                .Include(h => h.Meters)
                .Include(h => h.Pumps)
                .Include(h => h.Tanks)
                .Include(h => h.Vessels)
                .Include(h => h.Equipment)
                .OrderBy(h => h.Name));
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
        public void AddHierarchyNode(Hierarchy parentHierarchy, Hierarchy newHierarchy, Enums.NodeType hierarchyNodeType)
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

                switch ((Enums.NodeType)hierarchy.NodeTypeId)
                {
                    case Enums.NodeType.Facility:
                        Context.Facilities.Remove(Context.Facilities.First(f => f.HierarchyId == hierarchyId));
                        break;
                    case Enums.NodeType.Well:
                        Context.Wells.Remove(Context.Wells.First(w => w.HierarchyId == hierarchyId));
                        break;
                    case Enums.NodeType.RunSheet:
                        Context.RunSheets.Remove(Context.RunSheets.First(r => r.HierarchyId == hierarchyId));
                        break;
                    case Enums.NodeType.ContextTag:
                        Context.ContextTags.Remove(Context.ContextTags.First(c => c.HierarchyId == hierarchyId));
                        break;
                    case Enums.NodeType.SerialPortChannel:
                        Context.SerialPortChannels.Remove(Context.SerialPortChannels.First(s => s.HierarchyId == hierarchyId));
                        break;
                    case Enums.NodeType.IpChannel:
                        Context.IpChannels.Remove(Context.IpChannels.First(i => i.HierarchyId == hierarchyId));
                        break;
                    case Enums.NodeType.Device:
                        Context.Devices.Remove(Context.Devices.First(d => d.HierarchyId == hierarchyId));
                        break;
                    case Enums.NodeType.AnalogIoTag:
                        Context.AnalogIoTags.Remove(Context.AnalogIoTags.First(a => a.HierarchyId == hierarchyId));
                        break;
                    case Enums.NodeType.DigitalIoTag:
                        Context.DigitalIoTags.Remove(Context.DigitalIoTags.First(d => d.HierarchyId == hierarchyId));
                        break;
                    case Enums.NodeType.StringIoTag:
                        Context.StringIoTags.Remove(Context.StringIoTags.First(s => s.HierarchyId == hierarchyId));
                        break;
                    case Enums.NodeType.Screen:
                        Context.Screens.Remove(Context.Screens.First(s => s.HierarchyId == hierarchyId));
                        break;
                    case Enums.NodeType.Diagram:
                        Context.Diagrams.Remove(Context.Diagrams.First(d => d.HierarchyId == hierarchyId));
                        break;
                    case Enums.NodeType.Document:
                        Context.Documents.Remove(Context.Documents.First(d => d.HierarchyId == hierarchyId));
                        break;
                    case Enums.NodeType.Folder:
                        Context.Documents.Remove(Context.Documents.First(f => f.HierarchyId == hierarchyId));
                        break;
                    case Enums.NodeType.Meter:
                        Context.Documents.Remove(Context.Documents.First(d => d.HierarchyId == hierarchyId));
                        break;
                    case Enums.NodeType.Pump:
                        Context.Documents.Remove(Context.Documents.First(p => p.HierarchyId == hierarchyId));
                        break;
                    case Enums.NodeType.Tank:
                        Context.Documents.Remove(Context.Documents.First(t => t.HierarchyId == hierarchyId));
                        break;
                    case Enums.NodeType.Vessel:
                        Context.Documents.Remove(Context.Documents.First(v => v.HierarchyId == hierarchyId));
                        break;
                    case Enums.NodeType.Equipment:
                        Context.Documents.Remove(Context.Documents.First(e => e.HierarchyId == hierarchyId));
                        break;
                    default:
                        Context.Hierarchies.Remove(hierarchy);
                        break;
                }


                Context.SaveChanges();

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        public void Search(string searchText, Action<IEnumerable<SearchResult>> searchResultsCallback)
        {
            if (searchText.Length > 0)
            {
                var results = Context.Hierarchies
                    .Where(h => EF.Functions.Like(h.Name, $"%{searchText}%") || EF.Functions.Like(h.Description, $"%{searchText}%"))
                    .Select(h => new SearchResult
                    {
                        Id = h.Id,
                        Node = h.Node,
                        NodeType = (Enums.NodeType)h.NodeType.Id,
                        Name = h.Name,
                        Description = h.Description!
                    });

                searchResultsCallback(results);
            }
            else
            {
                searchResultsCallback([]);
            }
        }
    }
}
