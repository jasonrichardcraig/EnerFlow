using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class AnalogIoTagCurrentValue
{
    public int AnalogIoTagId { get; set; }

    public double Value { get; set; }

    public bool IsBadQuality { get; set; }

    public DateTime TimeStamp { get; set; }

    public virtual AnalogIoTag AnalogIoTag { get; set; } = null!;
}
