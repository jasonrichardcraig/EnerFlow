using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class TagValueEnumerationConstant
{
    public int TagValueEnumerationId { get; set; }

    public string Name { get; set; } = null!;

    public int Value { get; set; }

    public string? Description { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual TagValueEnumeration TagValueEnumeration { get; set; } = null!;
}
