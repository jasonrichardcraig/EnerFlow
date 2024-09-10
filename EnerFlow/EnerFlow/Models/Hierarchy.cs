using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace EnerFlow.Models;

public partial class Hierarchy
{
    public int Id { get; set; }

    public HierarchyId Node { get; set; } = null!;

    public string Name { get; set; } = null!;

    public byte NodeTypeId { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual ICollection<DeviceTag> DeviceTags { get; set; } = new List<DeviceTag>();

    public virtual ICollection<DigitalIoTag> DigitalIoTags { get; set; } = new List<DigitalIoTag>();

    public virtual ICollection<Facility> Facilities { get; set; } = new List<Facility>();

    public virtual NodeType NodeType { get; set; } = null!;

    public virtual ICollection<RunSheet> RunSheets { get; set; } = new List<RunSheet>();

    public virtual ICollection<Satellite> Satellites { get; set; } = new List<Satellite>();

    public virtual ICollection<SerialChannelTag> SerialChannelTags { get; set; } = new List<SerialChannelTag>();

    public virtual ICollection<Tank> Tanks { get; set; } = new List<Tank>();

    public virtual ICollection<TcpIpChannelTag> TcpIpChannelTags { get; set; } = new List<TcpIpChannelTag>();

    public virtual ICollection<Well> Wells { get; set; } = new List<Well>();

    public virtual ICollection<User> Users { get; set; } = new List<User>();
}
