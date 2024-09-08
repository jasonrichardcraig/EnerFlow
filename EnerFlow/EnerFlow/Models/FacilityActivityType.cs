using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class FacilityActivityType
{
    public int Id { get; set; }

    public string Code { get; set; } = null!;

    public string Name { get; set; } = null!;

    public virtual ICollection<FacilityDailyActivity> FacilityDailyActivities { get; set; } = new List<FacilityDailyActivity>();

    public virtual ICollection<FacilityMonthlyActivity> FacilityMonthlyActivities { get; set; } = new List<FacilityMonthlyActivity>();

    public virtual ICollection<WastePlantDailyActivity> WastePlantDailyActivities { get; set; } = new List<WastePlantDailyActivity>();

    public virtual ICollection<WastePlantMonthlyActivity> WastePlantMonthlyActivities { get; set; } = new List<WastePlantMonthlyActivity>();
}
