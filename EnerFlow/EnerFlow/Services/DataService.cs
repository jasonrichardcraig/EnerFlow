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
        public List<Hierarchy> GetChildren(Hierarchy hierarchy, List<Enums.NodeType> nodeTypes)
        {
            return new List<Hierarchy>(Context.Hierarchies
                .Where(h => h.Node.IsDescendantOf(hierarchy.Node) && h.Node.GetLevel() - 1 == hierarchy.Node.GetLevel() && nodeTypes.Contains((Enums.NodeType)h.NodeType.Id))
                .Include(h => h.NodeType)
                .Include(h => h.Facility)
                .Include(h => h.Well)
                .Include(h => h.RunSheet)
                .Include(h => h.ContextTag!).ThenInclude(c => c.ContextTagProperties)
                .Include(h => h.SerialPortChannel)
                .Include(h => h.IpChannel)
                .Include(h => h.Device)
                .Include(h => h.DigitalIoTag!).ThenInclude(d => d.DigitalIoTagCurrentValue!)
                .Include(h => h.AnalogIoTag!).ThenInclude(a => a.AnalogIoTagCurrentValue!)
                .Include(h => h.StringIoTag!).ThenInclude(s => s.StringIoTagCurrentValue!)
                .Include(h => h.MeterRun)
                .Include(h => h.Screen)
                .Include(h => h.Diagram)
                .Include(h => h.Document)
                .Include(h => h.Folder)
                .Include(h => h.Meter)
                .Include(h => h.Pump)
                .Include(h => h.Tank)
                .Include(h => h.Vessel)
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
        /// Checks if the given name is unique within the specified hierarchy.
        /// </summary>
        /// <param name="name">The name to check.</param>
        /// <param name="parentId">The parent hierarchy ID.</param>
        /// <returns>True if the name is unique within the hierarchy, otherwise false.</returns>
        public bool IsNameUniqueWithinHierarchy(string name, HierarchyId parentId)
        {
            return !Context.Hierarchies.Any(h => h.Node.IsDescendantOf(parentId) && h.Name == name);
        }

        public HierarchyId GetSibling(HierarchyId hierarchyId)
        {
            return Context.Hierarchies
                .Where(h => h.Node.GetAncestor(1) == hierarchyId.GetAncestor(1) && h.Node != hierarchyId)
                .OrderBy(h => h.Name)
                .FirstOrDefault()?.Node ?? HierarchyId.GetRoot();
        }

        /// <summary>
        /// Adds a company hierarchy node to the root hierarchy.
        /// </summary>
        /// <param name="parentHierarchy">The parent hierarchy.</param>
        /// <param name="newHierarchy">The new hierarchy to add.</param>
        /// <param name="hierarchyNodeType">The node type of the new hierarchy.</param>
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

        /// <summary>
        /// Deletes a hierarchy node and its associated entities.
        /// </summary>
        /// <param name="hierarchy">The hierarchy to delete.</param>
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
                        Context.ContextTagProperties.RemoveRange(Context.ContextTagProperties.Where(c => c.ContextTagId == hierarchyId));
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
                        Context.Database.ExecuteSqlRaw("DELETE FROM AnalogIoTagValueHistory WHERE AnalogIoTagID = {0}", hierarchyId);
                        Context.AnalogIoTagCurrentValues.Remove(hierarchy.AnalogIoTag!.AnalogIoTagCurrentValue!);
                        Context.AnalogIoTags.Remove(hierarchy.AnalogIoTag!);
                        break;
                    case Enums.NodeType.DigitalIoTag:
                        Context.Database.ExecuteSqlRaw("DELETE FROM DigitalIoTagValueHistory WHERE DigitalIoTagID = {0}", hierarchyId);
                        Context.DigitalIoTagCurrentValues.Remove(hierarchy.DigitalIoTag!.DigitalIoTagCurrentValue!);
                        Context.DigitalIoTags.Remove(hierarchy.DigitalIoTag!);
                        break;
                    case Enums.NodeType.StringIoTag:
                        Context.Database.ExecuteSqlRaw("DELETE FROM StringIoTagValueHistory WHERE StringIoTagID = {0}", hierarchyId);
                        Context.StringIoTagCurrentValues.Remove(hierarchy.StringIoTag!.StringIoTagCurrentValue!);
                        Context.StringIoTags.Remove(Context.StringIoTags.First(s => s.HierarchyId == hierarchyId));
                        break;
                    case Enums.NodeType.MeterRun:
                        Context.MeterRuns.Remove(Context.MeterRuns.First(m => m.HierarchyId == hierarchyId));
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
                        Context.Folders.Remove(Context.Folders.First(f => f.HierarchyId == hierarchyId));
                        break;
                    case Enums.NodeType.Meter:
                        Context.Meters.Remove(Context.Meters.First(d => d.HierarchyId == hierarchyId));
                        break;
                    case Enums.NodeType.Pump:
                        Context.Pumps.Remove(Context.Pumps.First(p => p.HierarchyId == hierarchyId));
                        break;
                    case Enums.NodeType.Tank:
                        Context.Tanks.Remove(Context.Tanks.First(t => t.HierarchyId == hierarchyId));
                        break;
                    case Enums.NodeType.Vessel:
                        Context.Vessels.Remove(Context.Vessels.First(v => v.HierarchyId == hierarchyId));
                        break;
                    case Enums.NodeType.Equipment:
                        Context.Equipment.Remove(Context.Equipment.First(e => e.HierarchyId == hierarchyId));
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

        /// <summary>
        /// Performs a search for hierarchies based on the given search text.
        /// </summary>
        /// <param name="searchText">The search text.</param>
        /// <param name="searchResultsCallback">The callback function to receive the search results.</param>
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
