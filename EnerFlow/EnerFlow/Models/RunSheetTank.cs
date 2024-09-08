using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class RunSheetTank
{
    public int RunSheetId { get; set; }

    public int TankId { get; set; }

    public int? Ordinal { get; set; }

    public virtual RunSheet RunSheet { get; set; } = null!;

    public virtual Tank Tank { get; set; } = null!;
}
