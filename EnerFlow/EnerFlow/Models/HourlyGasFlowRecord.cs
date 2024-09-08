using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class HourlyGasFlowRecord
{
    public int MeterId { get; set; }

    public DateTime TimeStamp { get; set; }

    public int? FlowTime { get; set; }

    public decimal? Dp { get; set; }

    public decimal? PulseCount { get; set; }

    public decimal? Pf { get; set; }

    public decimal? Tf { get; set; }

    public decimal? Extension { get; set; }

    public decimal? Cprime { get; set; }

    public decimal? Volume { get; set; }

    public decimal? Energy { get; set; }

    public decimal? Mass { get; set; }

    public decimal? Fpv { get; set; }

    public decimal? CasingPressure { get; set; }

    public decimal? TubingPressure { get; set; }

    public decimal? LinePressure { get; set; }

    public DateTime? DateTimeCreated { get; set; }

    public virtual Meter Meter { get; set; } = null!;
}
