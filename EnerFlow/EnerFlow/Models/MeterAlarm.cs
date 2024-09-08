using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class MeterAlarm
{
    public DateTime TimeStamp { get; set; }

    public int MeterId { get; set; }

    public int RecordIndex { get; set; }

    public string? AlarmClass { get; set; }

    public string? AlarmCode { get; set; }

    public string? State { get; set; }

    public string? Tag { get; set; }

    public double? Value { get; set; }

    public DateTime? DateTimeCreated { get; set; }

    public virtual Meter Meter { get; set; } = null!;
}
