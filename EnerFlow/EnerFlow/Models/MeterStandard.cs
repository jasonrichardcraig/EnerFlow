using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class MeterStandard
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<Calculation> Calculations { get; set; } = new List<Calculation>();

    public virtual ICollection<MeterConfiguration> MeterConfigurations { get; set; } = new List<MeterConfiguration>();

    public virtual ICollection<TicketMeterRecord> TicketMeterRecords { get; set; } = new List<TicketMeterRecord>();
}
