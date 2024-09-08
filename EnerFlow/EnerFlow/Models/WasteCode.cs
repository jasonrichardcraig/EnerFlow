using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class WasteCode
{
    public int Id { get; set; }

    public string Code { get; set; } = null!;

    public string Description { get; set; } = null!;

    public virtual ICollection<WastePlantDailyActivity> WastePlantDailyActivities { get; set; } = new List<WastePlantDailyActivity>();

    public virtual ICollection<WastePlantMonthlyActivity> WastePlantMonthlyActivities { get; set; } = new List<WastePlantMonthlyActivity>();
}
