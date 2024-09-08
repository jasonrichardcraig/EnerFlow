using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class TicketMeterCalculationMethod
{
    public int Id { get; set; }

    public string Code { get; set; } = null!;

    public string Name { get; set; } = null!;

    public virtual ICollection<TicketMeterRecord> TicketMeterRecords { get; set; } = new List<TicketMeterRecord>();
}
