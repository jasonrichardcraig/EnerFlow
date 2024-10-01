namespace EnerFlow.Models;

public partial class MeterRun
{
    public int Id { get; set; }

    public int HierarchyId { get; set; }

    public string? MeterTag { get; set; }

    public string? MeterDescription { get; set; }

    public DateTime? LastPollDateTime { get; set; }

    public DateTime? LastExportDateTime { get; set; }

    public int? MeterRunNumber { get; set; }

    public bool? CollectHourlyHistory { get; set; }

    public bool? CollectAlarms { get; set; }

    public bool? CollectEvents { get; set; }

    public int? LastHourlyIndex { get; set; }

    public int? LastEventIndex { get; set; }

    public int? LastAlarmIndex { get; set; }

    public bool? AutoPollIsEnabled { get; set; }

    public DateTime? AutoPollOffsetDateTime { get; set; }

    public int? AutoPollIntervalSeconds { get; set; }

    public DateTime? AutoPollLastRunDateTime { get; set; }

    public int? MeterExportTypeId { get; set; }

    public bool? ExportIsEnabled { get; set; }

    public DateTime? ExportOffsetDateTime { get; set; }

    public int? ExportIntervalSeconds { get; set; }

    public string? ExportPrimaryFolder { get; set; }

    public string? ExportArchiveFolder { get; set; }

    public DateTime? ExportLastRunDateTime { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual Hierarchy Hierarchy { get; set; } = null!;

    public virtual MeterExportType? MeterExportType { get; set; }

    public virtual ICollection<Meter> Meters { get; set; } = new List<Meter>();
}
