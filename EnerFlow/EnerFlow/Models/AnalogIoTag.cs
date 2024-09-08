using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class AnalogIoTag
{
    public int Id { get; set; }

    public int HierarchyId { get; set; }

    public int? DeviceId { get; set; }

    public bool? ByteSwap { get; set; }

    public bool? WordSwap { get; set; }

    public double? Deadband { get; set; }

    public string? ReadAddress { get; set; }

    public int? ReadAddressScanInterval { get; set; }

    public string? HistoryAddress { get; set; }

    public int? HistoryAddressScanInterval { get; set; }

    public string? WriteAddress { get; set; }

    public double? UnscaledMinimum { get; set; }

    public double? UnscaledMaximum { get; set; }

    public double? ScaledMinimum { get; set; }

    public double? ScaledMaximum { get; set; }

    public bool? ClampScaledValue { get; set; }

    public bool? EnableLogging { get; set; }

    public int? HighHighAlarmPriorityId { get; set; }

    public int? HighHighAlarmDelay { get; set; }

    public double? HighHighAlarmSetpoint { get; set; }

    public double? HighHighAlarmDeadband { get; set; }

    public bool? HighHighAlarmDisable { get; set; }

    public int? HighAlarmPriorityId { get; set; }

    public int? HighAlarmDelay { get; set; }

    public double? HighAlarmSetpoint { get; set; }

    public double? HighAlarmDeadband { get; set; }

    public bool? HighAlarmDisable { get; set; }

    public int? LowAlarmPriorityId { get; set; }

    public int? LowAlarmDelay { get; set; }

    public double? LowAlarmSetpoint { get; set; }

    public double? LowAlarmDeadband { get; set; }

    public bool? LowAlarmDisable { get; set; }

    public int? LowLowAlarmPriorityId { get; set; }

    public int? LowLowAlarmDelay { get; set; }

    public double? LowLowAlarmSetpoint { get; set; }

    public double? LowLowAlarmDeadband { get; set; }

    public bool? LowLowAlarmDisable { get; set; }

    public int? DisplayOrder { get; set; }

    public int? NumberOfDigitsAfterDecimal { get; set; }

    public int? UnitId { get; set; }

    public virtual DeviceTag? Device { get; set; }

    public virtual AlarmPriority? HighAlarmPriority { get; set; }

    public virtual AlarmPriority? HighHighAlarmPriority { get; set; }

    public virtual AlarmPriority? LowAlarmPriority { get; set; }

    public virtual AlarmPriority? LowLowAlarmPriority { get; set; }

    public virtual Unit? Unit { get; set; }
}
