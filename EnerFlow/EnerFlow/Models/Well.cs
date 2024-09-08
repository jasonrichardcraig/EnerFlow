using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class Well
{
    public int Id { get; set; }

    public int FacilityId { get; set; }

    public string Name { get; set; } = null!;

    public string FormattedUwi { get; set; } = null!;

    public string UnformattedUwi { get; set; } = null!;

    public string? SurfaceLocation { get; set; }

    public double? Latitude { get; set; }

    public double? Longitude { get; set; }

    public string? FieldCode { get; set; }

    public string? PoolCode { get; set; }

    public string? LicenseNumber { get; set; }

    public string? LicenseeCode { get; set; }

    public string? AgentCode { get; set; }

    public string? OperatorCode { get; set; }

    public virtual Facility Facility { get; set; } = null!;

    public virtual ICollection<WastePlantDailyActivity> WastePlantDailyActivities { get; set; } = new List<WastePlantDailyActivity>();

    public virtual ICollection<WastePlantMonthlyActivity> WastePlantMonthlyActivities { get; set; } = new List<WastePlantMonthlyActivity>();

    public virtual ICollection<WellComminglingStatus> WellComminglingStatusCommingledWells { get; set; } = new List<WellComminglingStatus>();

    public virtual ICollection<WellComminglingStatus> WellComminglingStatusProductionWells { get; set; } = new List<WellComminglingStatus>();

    public virtual ICollection<WellDailyProduction> WellDailyProductions { get; set; } = new List<WellDailyProduction>();

    public virtual ICollection<WellMonthlyProduction> WellMonthlyProductions { get; set; } = new List<WellMonthlyProduction>();

    public virtual ICollection<WellStatus> WellStatuses { get; set; } = new List<WellStatus>();
}
