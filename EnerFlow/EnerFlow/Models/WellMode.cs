﻿using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class WellMode
{
    public int Id { get; set; }

    public string Code { get; set; } = null!;

    public string Name { get; set; } = null!;

    public virtual ICollection<WellStatus> WellStatuses { get; set; } = new List<WellStatus>();
}