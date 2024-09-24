using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class Satellite
{
    public int Id { get; set; }

    public int HierarchyId { get; set; }

    public string? LocationName { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual Hierarchy Hierarchy { get; set; } = null!;
}
