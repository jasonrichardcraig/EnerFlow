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

    public int? AlarmPriorityId { get; set; }

    public bool? AlarmDisabled { get; set; }

    public virtual DeviceTag? Device { get; set; }

    public virtual Hierarchy Hierarchy { get; set; } = null!;
}
