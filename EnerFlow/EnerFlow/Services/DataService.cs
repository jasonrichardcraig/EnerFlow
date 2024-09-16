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

        public void DeleteCompanyHierarchyNode(Hierarchy companyHierarchy)
        {
            try
            {
                Context.Hierarchies.Remove(companyHierarchy);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
