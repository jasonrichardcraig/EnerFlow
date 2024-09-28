using Microsoft.EntityFrameworkCore;

namespace EnerFlow.Models
{
    public partial class SearchResult
    {
        public int Id { get; set; }
        public HierarchyId? Node { get; set; }
        public Enums.NodeType NodeType { get; set; }
        public string Name { get; set; } = null!;
        public string Description { get; set; } = null!;
    }
}
