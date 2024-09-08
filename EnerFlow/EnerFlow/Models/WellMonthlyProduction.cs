using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class WellMonthlyProduction
{
    public int WellId { get; set; }

    public DateOnly ProductionDate { get; set; }

    public int ProductTypeId { get; set; }

    public int WellStatusTypeId { get; set; }

    public decimal HoursOn { get; set; }

    public decimal Volume { get; set; }

    public decimal? Energy { get; set; }

    public int? CciCode { get; set; }

    public DateTime? DateTimeCreated { get; set; }

    public virtual ProductType ProductType { get; set; } = null!;

    public virtual Well Well { get; set; } = null!;
}
