using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class AnalogIoTagValueHistory
{
    public int AnalogIoTagId { get; set; }

    public DateTime TimeStamp { get; set; }

    public double? Value { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual AnalogIoTag AnalogIoTag { get; set; } = null!;
}
