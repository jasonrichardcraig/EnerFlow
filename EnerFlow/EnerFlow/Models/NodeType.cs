using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class NodeType
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<Hierarchy> Hierarchies { get; set; } = new List<Hierarchy>();

    public virtual ICollection<NodeTypeDailyLogProperty> NodeTypeDailyLogProperties { get; set; } = new List<NodeTypeDailyLogProperty>();
}
