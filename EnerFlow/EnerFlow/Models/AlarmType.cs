using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class AlarmType
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<Alarm> Alarms { get; set; } = new List<Alarm>();
}
