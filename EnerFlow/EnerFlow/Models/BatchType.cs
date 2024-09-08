using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class BatchType
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<LiquidBatchRecord> LiquidBatchRecords { get; set; } = new List<LiquidBatchRecord>();
}
