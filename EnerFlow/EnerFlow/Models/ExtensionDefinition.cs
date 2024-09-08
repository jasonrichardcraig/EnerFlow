using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class ExtensionDefinition
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<MeterConfiguration> MeterConfigurations { get; set; } = new List<MeterConfiguration>();

    public virtual ICollection<TicketMeterRecord> TicketMeterRecords { get; set; } = new List<TicketMeterRecord>();
}
