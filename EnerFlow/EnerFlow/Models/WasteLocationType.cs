using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class WasteLocationType
{
    public int Id { get; set; }

    public bool IsReciever { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<Facility> Facilities { get; set; } = new List<Facility>();
}
