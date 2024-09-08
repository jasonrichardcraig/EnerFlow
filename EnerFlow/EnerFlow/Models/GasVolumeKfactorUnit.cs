using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class GasVolumeKfactorUnit
{
    public int Id { get; set; }

    public string Code { get; set; } = null!;

    public bool IsUnitPerPulse { get; set; }

    public int UnitId { get; set; }

    public string Symbol { get; set; } = null!;

    public string Description { get; set; } = null!;

    public virtual ICollection<MeterConfiguration> MeterConfigurations { get; set; } = new List<MeterConfiguration>();
}
