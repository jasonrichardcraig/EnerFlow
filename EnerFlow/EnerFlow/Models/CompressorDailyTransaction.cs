using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class CompressorDailyTransaction
{
    public int CompressorId { get; set; }

    public DateOnly TimeStamp { get; set; }

    public decimal? Rpm { get; set; }

    public decimal? PercentRecycleOrSlide { get; set; }

    public decimal? CoolantJacketWaterTemperature { get; set; }

    public decimal? HoursOn { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual Compressor Compressor { get; set; } = null!;
}
