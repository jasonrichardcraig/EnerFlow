using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class DigitalIoTagCurrentValue
{
    public int DigitalIoTagId { get; set; }

    public bool Value { get; set; }

    public bool IsBadQuality { get; set; }

    public DateTime TimeStamp { get; set; }

    public virtual DigitalIoTag DigitalIoTag { get; set; } = null!;
}
