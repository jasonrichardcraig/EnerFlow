using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class Diagram
{
    public int Id { get; set; }

    public int? HierarchyId { get; set; }

    public string? DiagramXml { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual Hierarchy? Hierarchy { get; set; }
}
