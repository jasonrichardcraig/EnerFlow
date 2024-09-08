using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class MeterPurpose
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<Meter> Meters { get; set; } = new List<Meter>();
}
