using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class NodeType
{
    public byte Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<Hierarchy> Hierarchies { get; set; } = new List<Hierarchy>();
}
