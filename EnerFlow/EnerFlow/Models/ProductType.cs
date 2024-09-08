using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class ProductType
{
    public int Id { get; set; }

    public string Code { get; set; } = null!;

    public string Name { get; set; } = null!;

    public virtual ICollection<WellDailyProduction> WellDailyProductions { get; set; } = new List<WellDailyProduction>();

    public virtual ICollection<WellMonthlyProduction> WellMonthlyProductions { get; set; } = new List<WellMonthlyProduction>();
}
