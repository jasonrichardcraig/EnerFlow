using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class UnitClass
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<Unit> Units { get; set; } = new List<Unit>();
}
