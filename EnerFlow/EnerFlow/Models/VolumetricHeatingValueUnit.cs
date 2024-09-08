using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class VolumetricHeatingValueUnit
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string Symbol { get; set; } = null!;

    public int VolumeUnitId { get; set; }

    public int EnergyUnitId { get; set; }

    public virtual Unit EnergyUnit { get; set; } = null!;

    public virtual ICollection<MeterConfiguration> MeterConfigurations { get; set; } = new List<MeterConfiguration>();

    public virtual Unit VolumeUnit { get; set; } = null!;
}
