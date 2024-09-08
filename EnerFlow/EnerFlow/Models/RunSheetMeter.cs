using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class RunSheetMeter
{
    public int RunSheetId { get; set; }

    public int MeterId { get; set; }

    public int? Ordinal { get; set; }

    public virtual Meter Meter { get; set; } = null!;

    public virtual RunSheet RunSheet { get; set; } = null!;
}
