using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class MeterExceptionResolutionType
{
    public int Id { get; set; }

    public string? Name { get; set; }

    public virtual ICollection<MeterException> MeterExceptions { get; set; } = new List<MeterException>();
}
