using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class FacilityMonthlyActivity
{
    public int FacilityId { get; set; }

    public DateOnly ProductionDate { get; set; }

    public int FacilityActivityTypeId { get; set; }

    public int ProductTypeId { get; set; }

    public int ActivityFacilityId { get; set; }

    public int RecordVersion { get; set; }

    public decimal Volume { get; set; }

    public decimal? Energy { get; set; }

    public DateTime? DateTimeCreated { get; set; }

    public virtual Facility ActivityFacility { get; set; } = null!;

    public virtual Facility Facility { get; set; } = null!;

    public virtual FacilityActivityType FacilityActivityType { get; set; } = null!;
}
