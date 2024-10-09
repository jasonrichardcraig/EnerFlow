using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class StringIoTagValueHistory
{
    public int StringIoTagId { get; set; }

    public DateTime TimeStamp { get; set; }

    public string? Value { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual StringIoTag StringIoTag { get; set; } = null!;
}
