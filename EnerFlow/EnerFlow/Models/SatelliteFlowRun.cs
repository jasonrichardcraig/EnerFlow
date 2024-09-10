using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class SatelliteFlowRun
{
    public int Id { get; set; }

    public string? Name { get; set; }

    public int SatelliteId { get; set; }

    public int? GasMeterId { get; set; }

    public int? OilMeterId { get; set; }

    public int? WaterMeterId { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual Meter? GasMeter { get; set; }

    public virtual Meter? OilMeter { get; set; }

    public virtual Satellite Satellite { get; set; } = null!;

    public virtual Meter? WaterMeter { get; set; }

    public virtual ICollection<WellTest> WellTests { get; set; } = new List<WellTest>();
}
