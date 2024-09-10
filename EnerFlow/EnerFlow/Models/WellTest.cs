using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class WellTest
{
    public int Id { get; set; }

    public int? WellId { get; set; }

    public int? SatelliteFlowRunId { get; set; }

    public DateTime? StartDate { get; set; }

    public DateTime? EndDate { get; set; }

    public int? Duration { get; set; }

    public string? TestNumber { get; set; }

    public string? TestedBy { get; set; }

    public int? HoursOn { get; set; }

    public decimal? TotalGas { get; set; }

    public decimal? TotalOil { get; set; }

    public decimal? TotalWater { get; set; }

    public decimal? WaterCut { get; set; }

    public decimal? AverageCasingPressure { get; set; }

    public decimal? AverageTubingPressure { get; set; }

    public decimal? AverageLinePressure { get; set; }

    public string? Notes { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual SatelliteFlowRun? SatelliteFlowRun { get; set; }
}
