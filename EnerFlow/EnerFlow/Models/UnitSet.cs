using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class UnitSet
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public int? SystemDefaultUnitId { get; set; }

    public virtual Unit? SystemDefaultUnit { get; set; }

    public virtual ICollection<Unit> Units { get; set; } = new List<Unit>();
}
