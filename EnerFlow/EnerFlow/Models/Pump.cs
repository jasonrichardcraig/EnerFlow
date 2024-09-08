using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class Pump
{
    public int Id { get; set; }

    public int FacilityId { get; set; }

    public int PumpTypeId { get; set; }

    public double StrokeRpmFactor { get; set; }

    public string Name { get; set; } = null!;

    public DateTime DateTimeCreated { get; set; }

    public virtual Facility Facility { get; set; } = null!;

    public virtual ICollection<PumpDailyTransaction> PumpDailyTransactions { get; set; } = new List<PumpDailyTransaction>();

    public virtual PumpType PumpType { get; set; } = null!;

    public virtual ICollection<RunSheetPump> RunSheetPumps { get; set; } = new List<RunSheetPump>();
}
