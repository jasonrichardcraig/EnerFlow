using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class IpChannelTag
{
    public int Id { get; set; }

    public int HierarchyId { get; set; }

    public bool? IsUdp { get; set; }

    public string? HostName { get; set; }

    public int? HostPort { get; set; }

    public int? ConnectionAttempts { get; set; }

    public int? ConnectionRetryDelay { get; set; }

    public int? IdleDisconnectDelay { get; set; }

    public int? MaximumConnections { get; set; }

    public bool? TracingEnabled { get; set; }

    public int? ReadTimeout { get; set; }

    public int? WriteTimeout { get; set; }

    public virtual Hierarchy Hierarchy { get; set; } = null!;
}
