using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class DeviceCommand
{
    public int Id { get; set; }

    public string? Name { get; set; }

    public string? Description { get; set; }

    public string? Script { get; set; }

    public DateTime? DateTimeCreated { get; set; }

    public virtual ICollection<DeviceCommandParameter> DeviceCommandParameters { get; set; } = new List<DeviceCommandParameter>();
}
