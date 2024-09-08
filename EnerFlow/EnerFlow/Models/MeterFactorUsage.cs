using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class MeterFactorUsage
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<MeterConfiguration> MeterConfigurations { get; set; } = new List<MeterConfiguration>();
}
