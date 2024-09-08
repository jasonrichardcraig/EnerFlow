using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class WellStatusType
{
    public int Id { get; set; }

    public string Code { get; set; } = null!;

    public string Name { get; set; } = null!;

    public virtual ICollection<WellDailyProduction> WellDailyProductions { get; set; } = new List<WellDailyProduction>();
}
