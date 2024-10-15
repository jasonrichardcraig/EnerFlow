using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class WellHistory
{
    public int Id { get; set; }

    public int WellId { get; set; }

    public DateOnly? Date { get; set; }

    public string? Event { get; set; }

    public virtual Well Well { get; set; } = null!;
}
