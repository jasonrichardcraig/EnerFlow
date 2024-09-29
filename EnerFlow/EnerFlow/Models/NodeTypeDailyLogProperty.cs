using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class NodeTypeDailyLogProperty
{
    public int Id { get; set; }

    public int NodeTypeId { get; set; }

    public string EntityName { get; set; } = null!;

    public string PropertyName { get; set; } = null!;

    public int? UnitId { get; set; }

    public virtual NodeType NodeType { get; set; } = null!;

    public virtual ICollection<RunSheetDailyLogEntry> RunSheetDailyLogEntries { get; set; } = new List<RunSheetDailyLogEntry>();

    public virtual ICollection<RunSheetItemCapturePoint> RunSheetItemCapturePoints { get; set; } = new List<RunSheetItemCapturePoint>();

    public virtual Unit? Unit { get; set; }
}
