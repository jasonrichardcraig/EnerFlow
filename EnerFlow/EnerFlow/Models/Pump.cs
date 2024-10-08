﻿using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class Pump
{
    public int HierarchyId { get; set; }

    public int PumpTypeId { get; set; }

    public double StrokeRpmFactor { get; set; }

    public string Name { get; set; } = null!;

    public DateTime DateTimeCreated { get; set; }

    public virtual Hierarchy Hierarchy { get; set; } = null!;

    public virtual PumpType PumpType { get; set; } = null!;
}
