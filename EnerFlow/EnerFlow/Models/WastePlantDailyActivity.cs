using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class WastePlantDailyActivity
{
    public int FacilityId { get; set; }

    public DateOnly ProductionDate { get; set; }

    public int ActivityFacilityId { get; set; }

    public int ActivityWellId { get; set; }

    public int FacilityActivityTypeId { get; set; }

    public int WasteCodeId { get; set; }

    public bool? IsDangerousWaste { get; set; }

    public double? OilVolume { get; set; }

    public double? WaterVolume { get; set; }

    public double? SolidsVolume { get; set; }

    public double? GasVolume { get; set; }

    public virtual Facility ActivityFacility { get; set; } = null!;

    public virtual Well ActivityWell { get; set; } = null!;

    public virtual Facility Facility { get; set; } = null!;

    public virtual FacilityActivityType FacilityActivityType { get; set; } = null!;

    public virtual WasteCode WasteCode { get; set; } = null!;
}
