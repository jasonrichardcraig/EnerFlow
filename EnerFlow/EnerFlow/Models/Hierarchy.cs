using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace EnerFlow.Models;

public partial class Hierarchy
{
    public int Id { get; set; }

    public HierarchyId Node { get; set; } = null!;

    public string Name { get; set; } = null!;

    public string? Description { get; set; }

    public bool IsDisabled { get; set; }

    public bool IsHidden { get; set; }

    public byte NodeTypeId { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual ICollection<AnalogIoTag> AnalogIoTags { get; set; } = new List<AnalogIoTag>();

    public virtual ICollection<ContextTag> ContextTags { get; set; } = new List<ContextTag>();

    public virtual ICollection<DeviceTag> DeviceTags { get; set; } = new List<DeviceTag>();

    public virtual ICollection<Diagram> Diagrams { get; set; } = new List<Diagram>();

    public virtual ICollection<DigitalIoTag> DigitalIoTags { get; set; } = new List<DigitalIoTag>();

    public virtual ICollection<Document> Documents { get; set; } = new List<Document>();

    public virtual ICollection<Facility> Facilities { get; set; } = new List<Facility>();

    public virtual ICollection<IpChannelTag> IpChannelTags { get; set; } = new List<IpChannelTag>();

    public virtual NodeType NodeType { get; set; } = null!;

    public virtual ICollection<RunSheet> RunSheets { get; set; } = new List<RunSheet>();

    public virtual ICollection<Satellite> Satellites { get; set; } = new List<Satellite>();

    public virtual ICollection<Screen> Screens { get; set; } = new List<Screen>();

    public virtual ICollection<SerialChannelTag> SerialChannelTags { get; set; } = new List<SerialChannelTag>();

    public virtual ICollection<StringTag> StringTags { get; set; } = new List<StringTag>();

    public virtual ICollection<Well> Wells { get; set; } = new List<Well>();

    public virtual ICollection<User> Users { get; set; } = new List<User>();
}
