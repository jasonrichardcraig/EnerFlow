using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class StringTagValueHistory
{
    public int StringTagId { get; set; }

    public DateTime TimeStamp { get; set; }

    public string? Value { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual StringIoTag StringTag { get; set; } = null!;
}
