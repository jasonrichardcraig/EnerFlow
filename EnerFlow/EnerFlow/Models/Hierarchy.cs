﻿using System;
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

    public double? Latitude { get; set; }

    public double? Longitude { get; set; }

    public int? DefaultZoomLevel { get; set; }

    public int NodeTypeId { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual ICollection<AnalogIoTag> AnalogIoTags { get; set; } = new List<AnalogIoTag>();

    public virtual ICollection<ContextTag> ContextTags { get; set; } = new List<ContextTag>();

    public virtual ICollection<DeviceTag> DeviceTags { get; set; } = new List<DeviceTag>();

    public virtual ICollection<Diagram> Diagrams { get; set; } = new List<Diagram>();

    public virtual ICollection<DigitalIoTag> DigitalIoTags { get; set; } = new List<DigitalIoTag>();

    public virtual ICollection<Document> Documents { get; set; } = new List<Document>();

    public virtual ICollection<Equipment> Equipment { get; set; } = new List<Equipment>();

    public virtual ICollection<Facility> Facilities { get; set; } = new List<Facility>();

    public virtual ICollection<Folder> Folders { get; set; } = new List<Folder>();

    public virtual ICollection<IpChannelTag> IpChannelTags { get; set; } = new List<IpChannelTag>();

    public virtual ICollection<MaintenanceRecord> MaintenanceRecords { get; set; } = new List<MaintenanceRecord>();

    public virtual ICollection<Meter> Meters { get; set; } = new List<Meter>();

    public virtual NodeType NodeType { get; set; } = null!;

    public virtual ICollection<Pump> Pumps { get; set; } = new List<Pump>();

    public virtual ICollection<RunSheetDailyLogEntry> RunSheetDailyLogEntries { get; set; } = new List<RunSheetDailyLogEntry>();

    public virtual ICollection<RunSheetItem> RunSheetItems { get; set; } = new List<RunSheetItem>();

    public virtual ICollection<RunSheet> RunSheets { get; set; } = new List<RunSheet>();

    public virtual ICollection<Satellite> Satellites { get; set; } = new List<Satellite>();

    public virtual ICollection<Screen> Screens { get; set; } = new List<Screen>();

    public virtual ICollection<SerialPortChannelTag> SerialPortChannelTags { get; set; } = new List<SerialPortChannelTag>();

    public virtual ICollection<StringIoTag> StringIoTags { get; set; } = new List<StringIoTag>();

    public virtual ICollection<Tank> Tanks { get; set; } = new List<Tank>();

    public virtual ICollection<Vessel> Vessels { get; set; } = new List<Vessel>();

    public virtual ICollection<Well> Wells { get; set; } = new List<Well>();
}
