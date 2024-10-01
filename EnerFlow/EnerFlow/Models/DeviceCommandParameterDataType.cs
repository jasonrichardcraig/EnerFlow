using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class DeviceCommandParameterDataType
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string Description { get; set; } = null!;

    public virtual ICollection<DeviceCommandParameter> DeviceCommandParameters { get; set; } = new List<DeviceCommandParameter>();
}
