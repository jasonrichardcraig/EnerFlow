using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class Well
{
    public int HierarchyId { get; set; }

    public string? FormattedUwi { get; set; }

    public string? UnformattedUwi { get; set; }

    public string? SurfaceLocation { get; set; }

    public string? DownholeLocation { get; set; }

    public string? FieldCode { get; set; }

    public string? PoolCode { get; set; }

    public string? LicenseNumber { get; set; }

    public string? LicenseeCode { get; set; }

    public string? AgentCode { get; set; }

    public string? OperatorCode { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual Hierarchy Hierarchy { get; set; } = null!;

    public virtual ICollection<WastePlantDailyActivity> WastePlantDailyActivities { get; set; } = new List<WastePlantDailyActivity>();

    public virtual ICollection<WastePlantMonthlyActivity> WastePlantMonthlyActivities { get; set; } = new List<WastePlantMonthlyActivity>();

    public virtual ICollection<WellComminglingStatus> WellComminglingStatusCommingledWells { get; set; } = new List<WellComminglingStatus>();

    public virtual ICollection<WellComminglingStatus> WellComminglingStatusProductionWells { get; set; } = new List<WellComminglingStatus>();

    public virtual ICollection<WellDailyProduction> WellDailyProductions { get; set; } = new List<WellDailyProduction>();

    public virtual ICollection<WellMonthlyProduction> WellMonthlyProductions { get; set; } = new List<WellMonthlyProduction>();

    public virtual ICollection<WellStatus> WellStatuses { get; set; } = new List<WellStatus>();
}
