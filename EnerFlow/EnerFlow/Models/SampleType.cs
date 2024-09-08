using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class SampleType
{
    public int Id { get; set; }

    public string Code { get; set; } = null!;

    public string Name { get; set; } = null!;

    public virtual ICollection<MeterConfiguration> MeterConfigurations { get; set; } = new List<MeterConfiguration>();
}
