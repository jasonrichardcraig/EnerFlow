using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class MeterExportType
{
    public int Id { get; set; }

    public string? Name { get; set; }

    public virtual ICollection<MeterRunTag> MeterRunTags { get; set; } = new List<MeterRunTag>();
}
