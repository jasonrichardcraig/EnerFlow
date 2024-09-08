using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class TicketScaleRecord
{
    public int Id { get; set; }

    public double? GrossWeight { get; set; }

    public double? TareWeight { get; set; }

    public double? NetWeight { get; set; }

    public double? WeightIn { get; set; }

    public string? InScaleId { get; set; }

    public double? WeightOut { get; set; }

    public string? OutScaleId { get; set; }

    public double? ObservedDensity { get; set; }

    public double? ObsDensityTemperature { get; set; }

    public double? NetStandardVolume { get; set; }

    public double? GrossStandardVolume { get; set; }

    public double? SedimentWaterPercent { get; set; }

    public int? WeightUnitId { get; set; }

    public int? DensityUnitId { get; set; }

    public int? TemperatureUnitId { get; set; }

    public int? StandardVolumeUnit { get; set; }

    public int TicketId { get; set; }

    public virtual Unit? DensityUnit { get; set; }

    public virtual Unit? StandardVolumeUnitNavigation { get; set; }

    public virtual Unit? TemperatureUnit { get; set; }

    public virtual Ticket Ticket { get; set; } = null!;

    public virtual Unit? WeightUnit { get; set; }
}
