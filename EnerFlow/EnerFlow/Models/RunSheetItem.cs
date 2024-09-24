using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class RunSheetItem
{
    public int RunSheetId { get; set; }

    public int HierarchyId { get; set; }

    public int Ordinal { get; set; }

    public virtual Hierarchy Hierarchy { get; set; } = null!;

    public virtual RunSheet RunSheet { get; set; } = null!;

    public virtual ICollection<RunSheetItemCapturePoint> RunSheetItemCapturePoints { get; set; } = new List<RunSheetItemCapturePoint>();
}
