using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class RunSheetItemCapturePoint
{
    public int RunSheetId { get; set; }

    public int HierarchyId { get; set; }

    public int NodeTypeDailyLogPropertyId { get; set; }

    public int? Ordinal { get; set; }

    public virtual NodeTypeDailyLogProperty NodeTypeDailyLogProperty { get; set; } = null!;

    public virtual RunSheetItem RunSheetItem { get; set; } = null!;
}
