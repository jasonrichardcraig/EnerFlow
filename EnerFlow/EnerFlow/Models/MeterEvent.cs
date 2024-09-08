using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class MeterEvent
{
    public DateTime TimeStamp { get; set; }

    public int MeterId { get; set; }

    public int RecordIndex { get; set; }

    public string? OperatorId { get; set; }

    public string? EventSource { get; set; }

    public string? EventCode { get; set; }

    public string? EventText { get; set; }

    public double? OldValue { get; set; }

    public double? NewValue { get; set; }

    public int? MeterEventTypeId { get; set; }

    public DateTime? DateTimeCreated { get; set; }

    public virtual Meter Meter { get; set; } = null!;

    public virtual MeterEventType? MeterEventType { get; set; }
}
