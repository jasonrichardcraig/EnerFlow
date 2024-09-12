using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class TagValueEnumeration
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string? Description { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual ICollection<AnalogIoTag> AnalogIoTags { get; set; } = new List<AnalogIoTag>();

    public virtual ICollection<TagValueEnumerationConstant> TagValueEnumerationConstants { get; set; } = new List<TagValueEnumerationConstant>();
}
