using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class MassHeatingValueUnit
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string Symbol { get; set; } = null!;

    public int MassUnitId { get; set; }

    public int EnergyUnitId { get; set; }

    public virtual Unit EnergyUnit { get; set; } = null!;

    public virtual Unit MassUnit { get; set; } = null!;

    public virtual ICollection<MeterConfiguration> MeterConfigurations { get; set; } = new List<MeterConfiguration>();
}
