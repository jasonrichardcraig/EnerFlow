using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class TicketTankShellMaterial
{
    public int Id { get; set; }

    public string Code { get; set; } = null!;

    public string Name { get; set; } = null!;

    public virtual ICollection<TicketTankRecord> TicketTankRecords { get; set; } = new List<TicketTankRecord>();
}
