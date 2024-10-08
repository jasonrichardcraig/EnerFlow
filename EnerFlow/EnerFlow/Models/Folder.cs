using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class Folder
{
    public int HierarchyId { get; set; }

    public bool IsHidden { get; set; }

    public bool IsReadOnly { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual Hierarchy Hierarchy { get; set; } = null!;
}
