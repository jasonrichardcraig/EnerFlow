using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class Tank
{
    public int Id { get; set; }

    public int HierarchyId { get; set; }

    public int TankTypeId { get; set; }

    public double TankHeight { get; set; }

    public double TankVolume { get; set; }

    public double TankFactor { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual Hierarchy Hierarchy { get; set; } = null!;

    public virtual ICollection<TankDailyTransaction> TankDailyTransactions { get; set; } = new List<TankDailyTransaction>();

    public virtual TankType TankType { get; set; } = null!;
}
