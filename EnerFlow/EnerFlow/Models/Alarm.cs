using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class Alarm
{
    public int Id { get; set; }

    public DateTime? TimeStamp { get; set; }

    public int? AlarmType { get; set; }

    public int? AlarmPriority { get; set; }

    public int? AlarmStatusId { get; set; }

    public int HierarchyId { get; set; }

    public string? Name { get; set; }

    public string? Description { get; set; }

    public object? Value { get; set; }

    public double? Setpoint { get; set; }

    public int? UnitId { get; set; }

    public string? AlarmSource { get; set; }

    public int? AcknowledgedByUser { get; set; }

    public virtual User? AcknowledgedByUserNavigation { get; set; }

    public virtual ICollection<AlarmNote> AlarmNotes { get; set; } = new List<AlarmNote>();

    public virtual AlarmPriority? AlarmPriorityNavigation { get; set; }

    public virtual AlarmStatus? AlarmStatus { get; set; }

    public virtual AlarmType? AlarmTypeNavigation { get; set; }

    public virtual Unit? Unit { get; set; }
}
