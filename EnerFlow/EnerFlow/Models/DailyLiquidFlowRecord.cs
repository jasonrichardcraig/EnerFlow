using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class DailyLiquidFlowRecord
{
    public int MeterId { get; set; }

    public DateTime TimeStamp { get; set; }

    public int? FlowTime { get; set; }

    public decimal? Density { get; set; }

    public decimal? MeterTemperature { get; set; }

    public decimal? MeterPressure { get; set; }

    public decimal? Dp { get; set; }

    public decimal? Extension { get; set; }

    public decimal? Cprime { get; set; }

    public decimal? PulseCount { get; set; }

    public decimal? IndicatedVolume { get; set; }

    public decimal? GrossVolume { get; set; }

    public decimal? GrossStandardVolume { get; set; }

    public decimal? NetStandardVolume { get; set; }

    public decimal? SedimentAndWaterVolume { get; set; }

    public decimal? SedimentAndWaterPercent { get; set; }

    public decimal? Mass { get; set; }

    public decimal? GasEquivalentVolume { get; set; }

    public decimal? GasEquivalentEnergy { get; set; }

    public decimal? CoriolisDriveGain { get; set; }

    public decimal? CasingPressure { get; set; }

    public decimal? TubingPressure { get; set; }

    public decimal? LinePressure { get; set; }

    public DateTime? DateTimeCreated { get; set; }

    public virtual Meter Meter { get; set; } = null!;
}
