using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class ContextTagProperty
{
    public int ContextTagId { get; set; }

    public string Name { get; set; } = null!;

    public string? Description { get; set; }

    public object? Value { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual ContextTag ContextTag { get; set; } = null!;
}
