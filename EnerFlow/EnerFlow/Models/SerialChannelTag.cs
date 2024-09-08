using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class SerialChannelTag
{
    public int Id { get; set; }

    public int HierarchyId { get; set; }

    public string? Name { get; set; }

    public string? PortName { get; set; }

    public int? BaudRate { get; set; }

    public int? DataBits { get; set; }

    public int? Parity { get; set; }

    public int? StopBits { get; set; }

    public int? ReadTimeout { get; set; }

    public int? WriteTimeout { get; set; }

    public bool? SerialChannelDisabled { get; set; }

    public virtual ICollection<DeviceTag> DeviceTags { get; set; } = new List<DeviceTag>();

    public virtual Hierarchy Hierarchy { get; set; } = null!;
}
