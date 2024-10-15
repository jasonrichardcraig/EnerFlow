using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class WellDirectionalDrilling
{
    public int Id { get; set; }

    public int WellId { get; set; }

    public DateOnly? StartDate { get; set; }

    public double? Depth { get; set; }

    public string? Reason { get; set; }

    public virtual Well Well { get; set; } = null!;
}
