using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class TankDailyTransaction
{
    public int TankId { get; set; }

    public DateOnly TimeStamp { get; set; }

    public decimal? TankLevel { get; set; }

    public decimal? TankVolume { get; set; }

    public decimal? TankTemperature { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual Tank Tank { get; set; } = null!;
}
