using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class DigitalIoTag
{
    public int Id { get; set; }

    public int HierarchyId { get; set; }

    public int? DeviceId { get; set; }

    public string? ReadAddress { get; set; }

    public int? ReadAddressScanInterval { get; set; }

    public string? HistoryAddress { get; set; }

    public int? HistoryAddressScanInterval { get; set; }

    public string? WriteAddress { get; set; }

    public bool? IsCalculated { get; set; }

    public string? Code { get; set; }

    public int? AlarmPriorityId { get; set; }

    public bool? AlarmDisabled { get; set; }

    public string? TrueValueText { get; set; }

    public string? FalseValueText { get; set; }

    public bool? IsBadQuality { get; set; }

    public bool? ManualData { get; set; }

    public bool? Value { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual ICollection<Alarm> Alarms { get; set; } = new List<Alarm>();

    public virtual DeviceTag? Device { get; set; }

    public virtual ICollection<DigitalIoTagHistory> DigitalIoTagHistories { get; set; } = new List<DigitalIoTagHistory>();

    public virtual Hierarchy Hierarchy { get; set; } = null!;
}
