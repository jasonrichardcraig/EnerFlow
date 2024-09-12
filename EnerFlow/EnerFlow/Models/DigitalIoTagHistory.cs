using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class DigitalIoTagHistory
{
    public int DigitalIoTagId { get; set; }

    public DateTime TimeStamp { get; set; }

    public bool? Value { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual DigitalIoTag DigitalIoTag { get; set; } = null!;
}
