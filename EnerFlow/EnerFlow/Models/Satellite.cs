using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class Satellite
{
    public int Id { get; set; }

    public int HierarchyId { get; set; }

    public int? FacilityId { get; set; }

    public int? GroupMeterId { get; set; }

    public string? Name { get; set; }

    public string? LocationName { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual ICollection<Equipment> Equipment { get; set; } = new List<Equipment>();

    public virtual Facility? Facility { get; set; }

    public virtual Meter? GroupMeter { get; set; }

    public virtual Hierarchy Hierarchy { get; set; } = null!;

    public virtual ICollection<Meter> Meters { get; set; } = new List<Meter>();

    public virtual ICollection<Pump> Pumps { get; set; } = new List<Pump>();

    public virtual ICollection<SatelliteFlowRun> SatelliteFlowRuns { get; set; } = new List<SatelliteFlowRun>();

    public virtual ICollection<Tank> Tanks { get; set; } = new List<Tank>();

    public virtual ICollection<Well> Wells { get; set; } = new List<Well>();
}
