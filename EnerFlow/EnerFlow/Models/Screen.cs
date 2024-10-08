using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class Screen
{
    public int HierarchyId { get; set; }

    public string? ScreenXml { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual Hierarchy Hierarchy { get; set; } = null!;
}
