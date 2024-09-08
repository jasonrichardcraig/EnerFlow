using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class WastePlantMonthlyActivity
{
    public int FacilityId { get; set; }

    public DateOnly ProductionDate { get; set; }

    public int ActivityFacilityId { get; set; }

    public int ActivityWellId { get; set; }

    public int FacilityActivityTypeId { get; set; }

    public int WasteCodeId { get; set; }

    public int RecordVersion { get; set; }

    public DateTime SystemTimeStamp { get; set; }

    public bool? IsDangerousWaste { get; set; }

    public decimal? OilVolume { get; set; }

    public decimal? WaterVolume { get; set; }

    public decimal? SolidsVolume { get; set; }

    public decimal? GasVolume { get; set; }

    public virtual Facility ActivityFacility { get; set; } = null!;

    public virtual Well ActivityWell { get; set; } = null!;

    public virtual Facility Facility { get; set; } = null!;

    public virtual FacilityActivityType FacilityActivityType { get; set; } = null!;

    public virtual WasteCode WasteCode { get; set; } = null!;
}
