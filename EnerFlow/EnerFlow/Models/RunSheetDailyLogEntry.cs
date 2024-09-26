using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class RunSheetDailyLogEntry
{
    public int RunSheetId { get; set; }

    public DateOnly TimeStamp { get; set; }

    public int HierarchyId { get; set; }

    public int NodeTypeDailyLogPropertyId { get; set; }

    public object? Value { get; set; }

    public int UserId { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual Hierarchy Hierarchy { get; set; } = null!;

    public virtual NodeTypeDailyLogProperty NodeTypeDailyLogProperty { get; set; } = null!;

    public virtual RunSheetDailyLog RunSheetDailyLog { get; set; } = null!;
}
