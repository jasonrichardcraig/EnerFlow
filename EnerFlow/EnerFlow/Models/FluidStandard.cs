using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class FluidStandard
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<Calculation> Calculations { get; set; } = new List<Calculation>();

    public virtual ICollection<LiquidBatchRecord> LiquidBatchRecords { get; set; } = new List<LiquidBatchRecord>();

    public virtual ICollection<MeterConfiguration> MeterConfigurations { get; set; } = new List<MeterConfiguration>();

    public virtual ICollection<PeriodicLiquidFlowRecord> PeriodicLiquidFlowRecords { get; set; } = new List<PeriodicLiquidFlowRecord>();

    public virtual ICollection<Ticket> Tickets { get; set; } = new List<Ticket>();
}
