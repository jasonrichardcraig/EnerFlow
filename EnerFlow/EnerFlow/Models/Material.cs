using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class Material
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<Calculation> CalculationBoreMaterials { get; set; } = new List<Calculation>();

    public virtual ICollection<Calculation> CalculationPipeMaterials { get; set; } = new List<Calculation>();

    public virtual ICollection<MeterConfiguration> MeterConfigurationBoreMaterials { get; set; } = new List<MeterConfiguration>();

    public virtual ICollection<MeterConfiguration> MeterConfigurationPipeMaterials { get; set; } = new List<MeterConfiguration>();

    public virtual ICollection<TicketMeterRecord> TicketMeterRecordBoreMaterials { get; set; } = new List<TicketMeterRecord>();

    public virtual ICollection<TicketMeterRecord> TicketMeterRecordPipeMaterials { get; set; } = new List<TicketMeterRecord>();
}
