using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class RunSheetPump
{
    public int RunSheetId { get; set; }

    public int PumpId { get; set; }

    public int Ordinal { get; set; }

    public virtual Pump Pump { get; set; } = null!;

    public virtual RunSheet RunSheet { get; set; } = null!;
}
