using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class VesselType
{
    public int Id { get; set; }

    public string? Name { get; set; }

    public virtual ICollection<Vessel> Vessels { get; set; } = new List<Vessel>();
}
