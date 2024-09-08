using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class PumpType
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<Pump> Pumps { get; set; } = new List<Pump>();
}
