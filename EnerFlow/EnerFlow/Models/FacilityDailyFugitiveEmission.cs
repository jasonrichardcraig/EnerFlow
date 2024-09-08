using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class FacilityDailyFugitiveEmission
{
    public int FacilityId { get; set; }

    public DateOnly ProductionDate { get; set; }

    public decimal Fuel { get; set; }

    public decimal Flare { get; set; }

    public decimal Vent { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual Facility Facility { get; set; } = null!;
}
