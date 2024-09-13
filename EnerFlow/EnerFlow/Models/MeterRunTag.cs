using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class MeterRunTag
{
    public int Id { get; set; }

    public int HierarchyId { get; set; }

    public int DeviceId { get; set; }

    public string MeterTag { get; set; } = null!;

    public string MeterDescription { get; set; } = null!;

    public DateTime LastPollDateTime { get; set; }

    public DateTime LastExportDateTime { get; set; }

    public int MeterRunNumber { get; set; }

    public bool CollectHourlyHistory { get; set; }

    public bool CollectAlarms { get; set; }

    public bool CollectEvents { get; set; }

    public int LastHourlyIndex { get; set; }

    public int LastEventIndex { get; set; }

    public int LastAlarmIndex { get; set; }

    public bool AutoPollIsEnabled { get; set; }

    public DateTime AutoPollOffsetDateTime { get; set; }

    public int AutoPollIntervalSeconds { get; set; }

    public DateTime AutoPollLastRunDateTime { get; set; }

    public int? MeterExportTypeId { get; set; }

    public bool ExportIsEnabled { get; set; }

    public DateTime ExportOffsetDateTime { get; set; }

    public int ExportIntervalSeconds { get; set; }

    public string ExportPrimaryFolder { get; set; } = null!;

    public string ExportArchiveFolder { get; set; } = null!;

    public DateTime ExportLastRunDateTime { get; set; }

    public DateTime? DateTimeCreated { get; set; }

    public virtual DeviceTag? DeviceTag { get; set; }

    public virtual MeterExportType? MeterExportType { get; set; }

    public virtual ICollection<Meter> Meters { get; set; } = new List<Meter>();
}
