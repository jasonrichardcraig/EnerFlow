using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class DigitalIoTag
{
    public int HierarchyId { get; set; }

    public string? ReadAddress { get; set; }

    public int? ReadAddressScanInterval { get; set; }

    public string? HistoryAddress { get; set; }

    public int? HistoryAddressScanInterval { get; set; }

    public string? WriteAddress { get; set; }

    public bool? IsCalculated { get; set; }

    public string? Script { get; set; }

    public int? AlarmPriorityId { get; set; }

    public bool? AlarmDisabled { get; set; }

    public int? AlarmDelay { get; set; }

    public bool? InvertState { get; set; }

    public string? TrueValueText { get; set; }

    public string? FalseValueText { get; set; }

    public int? DisplayOrder { get; set; }

    public bool? UseDefaultTrendStyle { get; set; }

    public string? LineStyle { get; set; }

    public int? LineWidth { get; set; }

    public string? LineColor { get; set; }

    public bool? ManualData { get; set; }

    public bool? Value { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual AlarmPriority? AlarmPriority { get; set; }

    public virtual DigitalIoTagCurrentValue? DigitalIoTagCurrentValue { get; set; }

    public virtual ICollection<DigitalIoTagValueHistory> DigitalIoTagValueHistories { get; set; } = new List<DigitalIoTagValueHistory>();

    public virtual Hierarchy Hierarchy { get; set; } = null!;
}
