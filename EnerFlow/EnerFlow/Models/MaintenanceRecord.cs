using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class MaintenanceRecord
{
    public Guid Id { get; set; }

    public int HierarchyId { get; set; }

    public DateTime TimeStamp { get; set; }

    public int? PerformedByUserId { get; set; }

    public int? MaintenanceTypeId { get; set; }

    public string? Description { get; set; }

    public string? Actions { get; set; }

    public DateTime? NextScheduledDate { get; set; }

    public decimal? LaborHours { get; set; }

    public decimal? HourlyRate { get; set; }

    public decimal? MaterialCost { get; set; }

    public decimal? TotalCost { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual Hierarchy Hierarchy { get; set; } = null!;

    public virtual MaintenanceType? MaintenanceType { get; set; }
}
