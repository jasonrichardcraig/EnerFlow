using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class ConeType
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<Calculation> Calculations { get; set; } = new List<Calculation>();
}
