using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class ContextTag
{
    public int HierarchyId { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual ICollection<ContextTagProperty> ContextTagProperties { get; set; } = new List<ContextTagProperty>();

    public virtual Hierarchy Hierarchy { get; set; } = null!;
}
