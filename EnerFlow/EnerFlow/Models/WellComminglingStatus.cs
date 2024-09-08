using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class WellComminglingStatus
{
    public int CommingledWellId { get; set; }

    public DateOnly TimeStamp { get; set; }

    public int WellComminglingProcessId { get; set; }

    public int ProductionWellId { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual Well CommingledWell { get; set; } = null!;

    public virtual Well ProductionWell { get; set; } = null!;

    public virtual WellComminglingProcess WellComminglingProcess { get; set; } = null!;
}
