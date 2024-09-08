using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class PumpDailyTransaction
{
    public int PumpId { get; set; }

    public DateOnly TimeStamp { get; set; }

    public decimal? StrokesPerMinute { get; set; }

    public decimal? Rpm { get; set; }

    public decimal? HoursOn { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual Pump Pump { get; set; } = null!;
}
