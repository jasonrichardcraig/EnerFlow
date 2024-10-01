using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class DeviceCommandParameter
{
    public int Id { get; set; }

    public int? DeviceCommandId { get; set; }

    public int? DeviceCommandParameterDataTypeId { get; set; }

    public string? Name { get; set; }

    public string? Description { get; set; }

    public object? DefaultValue { get; set; }

    public int? Ordinal { get; set; }

    public DateTime? DateTimeCreated { get; set; }

    public virtual DeviceCommand? DeviceCommand { get; set; }

    public virtual DeviceCommandParameterDataType? DeviceCommandParameterDataType { get; set; }
}
