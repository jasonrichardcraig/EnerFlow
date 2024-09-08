using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class CompressibilityFactorUnit
{
    public int Id { get; set; }

    public string Code { get; set; } = null!;

    public string Name { get; set; } = null!;

    public virtual ICollection<LiquidBatchRecord> LiquidBatchRecords { get; set; } = new List<LiquidBatchRecord>();

    public virtual ICollection<MeterConfiguration> MeterConfigurations { get; set; } = new List<MeterConfiguration>();

    public virtual ICollection<PeriodicLiquidFlowRecord> PeriodicLiquidFlowRecords { get; set; } = new List<PeriodicLiquidFlowRecord>();
}
