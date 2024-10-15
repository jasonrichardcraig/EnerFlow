using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class WellProductionDatum
{
    public int Id { get; set; }

    public int WellId { get; set; }

    public int? Period { get; set; }

    public int? TotalProductionHours { get; set; }

    public double? GasQuantity { get; set; }

    public double? OilQuantity { get; set; }

    public double? WaterQuantity { get; set; }

    public virtual Well Well { get; set; } = null!;
}
