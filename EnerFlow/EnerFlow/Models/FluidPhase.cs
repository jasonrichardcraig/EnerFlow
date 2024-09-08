using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class FluidPhase
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<Calculation> CalculationBaseFluidPhases { get; set; } = new List<Calculation>();

    public virtual ICollection<Calculation> CalculationFlowingFluidPhases { get; set; } = new List<Calculation>();
}
