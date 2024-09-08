using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class CompositeAlarm
{
    public int Id { get; set; }

    public int HierarchyId { get; set; }

    public int? TriggeredByParameterTypeId { get; set; }

    public string? TriggeredBy { get; set; }

    public string? FunctionType { get; set; }

    public double? Setpoint { get; set; }

    public double? OnDelay { get; set; }

    public double? OffDelay { get; set; }

    public double? Deadband { get; set; }

    public int? AlarmPriority { get; set; }

    public bool? AlarmDisabled { get; set; }

    public virtual Hierarchy Hierarchy { get; set; } = null!;

    public virtual ParameterType? TriggeredByParameterType { get; set; }
}
