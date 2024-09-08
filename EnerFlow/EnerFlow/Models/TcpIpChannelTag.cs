using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class TcpIpChannelTag
{
    public int Id { get; set; }

    public int HierarchyId { get; set; }

    public string? Name { get; set; }

    public string? HostName { get; set; }

    public int? HostPort { get; set; }

    public int? ConnectionAttempts { get; set; }

    public int? ConnectionRetryDelay { get; set; }

    public int? IdleConnectionDisconnectDelay { get; set; }

    public int? MaximumConnections { get; set; }

    public bool? TracingEnabled { get; set; }

    public int? ReadTimeout { get; set; }

    public int? WriteTimeout { get; set; }

    public virtual ICollection<DeviceTag> DeviceTags { get; set; } = new List<DeviceTag>();

    public virtual Hierarchy Hierarchy { get; set; } = null!;
}
