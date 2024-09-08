using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class AlarmNote
{
    public int AlarmId { get; set; }

    public DateTime TimeStamp { get; set; }

    public string Notes { get; set; } = null!;

    public virtual Alarm Alarm { get; set; } = null!;
}
