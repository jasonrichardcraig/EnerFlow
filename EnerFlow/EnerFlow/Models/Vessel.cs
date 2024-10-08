using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class Vessel
{
    public int HierarchyId { get; set; }

    public int VesselTypeId { get; set; }

    public double VesselHeight { get; set; }

    public double VesselVolume { get; set; }

    public double VesselFactor { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual Hierarchy Hierarchy { get; set; } = null!;

    public virtual VesselType VesselType { get; set; } = null!;
}
