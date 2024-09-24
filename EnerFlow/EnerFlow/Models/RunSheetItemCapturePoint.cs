using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class RunSheetItemCapturePoint
{
    public int RunSheetId { get; set; }

    public int HierarchyId { get; set; }

    public string PropertyName { get; set; } = null!;

    public int? Ordinal { get; set; }

    public virtual ICollection<RunSheetDailyLogEntry> RunSheetDailyLogEntries { get; set; } = new List<RunSheetDailyLogEntry>();

    public virtual RunSheetItem RunSheetItem { get; set; } = null!;
}
