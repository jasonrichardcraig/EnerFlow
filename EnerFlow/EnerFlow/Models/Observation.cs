using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class Observation
{
    public Guid Id { get; set; }

    public int RunSheetId { get; set; }

    public DateTime TimeStamp { get; set; }

    public string Notes { get; set; } = null!;

    public int UserId { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual RunSheet RunSheet { get; set; } = null!;
}
