using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class WellComminglingProcess
{
    public int Id { get; set; }

    public string Code { get; set; } = null!;

    public string Name { get; set; } = null!;

    public virtual ICollection<WellComminglingStatus> WellComminglingStatuses { get; set; } = new List<WellComminglingStatus>();
}
