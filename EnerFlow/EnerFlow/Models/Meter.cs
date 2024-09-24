using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class Meter
{
    public int Id { get; set; }

    public int HierarchyId { get; set; }

    public int? MeterRunTagId { get; set; }

    public bool? IsChart { get; set; }

    public string? Name { get; set; }

    public string? Description { get; set; }

    public bool? IsLiquidMeter { get; set; }

    public int? MeterPurposeId { get; set; }

    public int? FluidTypeId { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual ICollection<DailyGasFlowRecord> DailyGasFlowRecords { get; set; } = new List<DailyGasFlowRecord>();

    public virtual ICollection<DailyLiquidFlowRecord> DailyLiquidFlowRecords { get; set; } = new List<DailyLiquidFlowRecord>();

    public virtual FluidType? FluidType { get; set; }

    public virtual Hierarchy Hierarchy { get; set; } = null!;

    public virtual ICollection<HourlyGasFlowRecord> HourlyGasFlowRecords { get; set; } = new List<HourlyGasFlowRecord>();

    public virtual ICollection<HourlyLiquidFlowRecord> HourlyLiquidFlowRecords { get; set; } = new List<HourlyLiquidFlowRecord>();

    public virtual ICollection<MeterAlarm> MeterAlarms { get; set; } = new List<MeterAlarm>();

    public virtual ICollection<MeterEvent> MeterEvents { get; set; } = new List<MeterEvent>();

    public virtual ICollection<MeterException> MeterExceptions { get; set; } = new List<MeterException>();

    public virtual MeterPurpose? MeterPurpose { get; set; }

    public virtual MeterRunTag? MeterRunTag { get; set; }

    public virtual ICollection<PeriodicGasFlowRecord> PeriodicGasFlowRecords { get; set; } = new List<PeriodicGasFlowRecord>();

    public virtual ICollection<PeriodicLiquidFlowRecord> PeriodicLiquidFlowRecords { get; set; } = new List<PeriodicLiquidFlowRecord>();

    public virtual ICollection<UltrasonicDiagnosticHistory> UltrasonicDiagnosticHistories { get; set; } = new List<UltrasonicDiagnosticHistory>();
}
