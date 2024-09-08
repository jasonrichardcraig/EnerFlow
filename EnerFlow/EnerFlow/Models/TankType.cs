using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class TankType
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<Tank> Tanks { get; set; } = new List<Tank>();

    public virtual ICollection<TicketTankRecord> TicketTankRecords { get; set; } = new List<TicketTankRecord>();
}
