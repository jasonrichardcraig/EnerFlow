using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class RunSheetDailyLogEntry
{
    public int RunSheetId { get; set; }

    public DateOnly TimeStamp { get; set; }

    public int HierarchyId { get; set; }

    public string PropertyName { get; set; } = null!;

    public string? StringValue { get; set; }

    public double? NumericValue { get; set; }

    public int UserId { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual RunSheetDailyLog RunSheetDailyLog { get; set; } = null!;

    public virtual RunSheetItemCapturePoint RunSheetItemCapturePoint { get; set; } = null!;
}
