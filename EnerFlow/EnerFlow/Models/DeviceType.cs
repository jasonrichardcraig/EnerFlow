using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class DeviceType
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string Description { get; set; } = null!;

    public virtual ICollection<DeviceTag> DeviceTags { get; set; } = new List<DeviceTag>();
}
