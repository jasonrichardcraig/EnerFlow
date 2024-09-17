using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class Well
{
    public int Id { get; set; }

    public int HierarchyId { get; set; }

    public int? FacilityId { get; set; }

    public int? SatelliteId { get; set; }

    public string Name { get; set; } = null!;

    public string FormattedUwi { get; set; } = null!;

    public string UnformattedUwi { get; set; } = null!;

    public string? SurfaceLocation { get; set; }

    public string? FieldCode { get; set; }

    public string? PoolCode { get; set; }

    public string? LicenseNumber { get; set; }

    public string? LicenseeCode { get; set; }

    public string? AgentCode { get; set; }

    public string? OperatorCode { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual ICollection<Compressor> Compressors { get; set; } = new List<Compressor>();

    public virtual ICollection<Equipment> Equipment { get; set; } = new List<Equipment>();

    public virtual Facility? Facility { get; set; }

    public virtual Satellite? FacilityNavigation { get; set; }

    public virtual Hierarchy Hierarchy { get; set; } = null!;

    public virtual ICollection<Meter> Meters { get; set; } = new List<Meter>();

    public virtual ICollection<Pump> Pumps { get; set; } = new List<Pump>();

    public virtual ICollection<Tank> Tanks { get; set; } = new List<Tank>();

    public virtual ICollection<WastePlantDailyActivity> WastePlantDailyActivities { get; set; } = new List<WastePlantDailyActivity>();

    public virtual ICollection<WastePlantMonthlyActivity> WastePlantMonthlyActivities { get; set; } = new List<WastePlantMonthlyActivity>();

    public virtual ICollection<WellComminglingStatus> WellComminglingStatusCommingledWells { get; set; } = new List<WellComminglingStatus>();

    public virtual ICollection<WellComminglingStatus> WellComminglingStatusProductionWells { get; set; } = new List<WellComminglingStatus>();

    public virtual ICollection<WellDailyProduction> WellDailyProductions { get; set; } = new List<WellDailyProduction>();

    public virtual ICollection<WellMonthlyProduction> WellMonthlyProductions { get; set; } = new List<WellMonthlyProduction>();

    public virtual ICollection<WellStatus> WellStatuses { get; set; } = new List<WellStatus>();
}
