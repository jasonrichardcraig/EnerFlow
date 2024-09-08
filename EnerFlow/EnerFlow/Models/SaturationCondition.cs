using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class SaturationCondition
{
    public int Id { get; set; }

    public string? Code { get; set; }

    public string? Name { get; set; }

    public virtual ICollection<MeterConfiguration> MeterConfigurationEfmHeatingValueSaturationConditions { get; set; } = new List<MeterConfiguration>();

    public virtual ICollection<MeterConfiguration> MeterConfigurationEfmRelativeDensitySaturationConditions { get; set; } = new List<MeterConfiguration>();
}
