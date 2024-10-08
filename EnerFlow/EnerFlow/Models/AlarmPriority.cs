using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class AlarmPriority
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<Alarm> Alarms { get; set; } = new List<Alarm>();

    public virtual ICollection<AnalogIoTag> AnalogIoTagHighAlarmPriorities { get; set; } = new List<AnalogIoTag>();

    public virtual ICollection<AnalogIoTag> AnalogIoTagHighHighAlarmPriorities { get; set; } = new List<AnalogIoTag>();

    public virtual ICollection<AnalogIoTag> AnalogIoTagLowAlarmPriorities { get; set; } = new List<AnalogIoTag>();

    public virtual ICollection<AnalogIoTag> AnalogIoTagLowLowAlarmPriorities { get; set; } = new List<AnalogIoTag>();

    public virtual ICollection<DigitalIoTag> DigitalIoTags { get; set; } = new List<DigitalIoTag>();
}
