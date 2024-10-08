using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class LinkedMeterRun
{
    public int MeterId { get; set; }

    public int MeterRunId { get; set; }

    public virtual Meter Meter { get; set; } = null!;

    public virtual MeterRun MeterRun { get; set; } = null!;
}
