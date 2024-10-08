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

    public double? Latitude { get; set; }

    public double? Longitude { get; set; }

    public int? DefaultZoomLevel { get; set; }

    public int NodeTypeId { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual AnalogIoTag? AnalogIoTag { get; set; }

    public virtual ContextTag? ContextTag { get; set; }

    public virtual Device? Device { get; set; }

    public virtual Diagram? Diagram { get; set; }

    public virtual DigitalIoTag? DigitalIoTag { get; set; }

    public virtual Document? Document { get; set; }

    public virtual Equipment? Equipment { get; set; }

    public virtual Facility? Facility { get; set; }

    public virtual Folder? Folder { get; set; }

    public virtual IpChannel? IpChannel { get; set; }

    public virtual ICollection<MaintenanceRecord> MaintenanceRecords { get; set; } = new List<MaintenanceRecord>();

    public virtual Meter? Meter { get; set; }

    public virtual MeterRun? MeterRun { get; set; }

    public virtual NodeType NodeType { get; set; } = null!;

    public virtual Pump? Pump { get; set; }

    public virtual RunSheet? RunSheet { get; set; }

    public virtual ICollection<RunSheetDailyLogEntry> RunSheetDailyLogEntries { get; set; } = new List<RunSheetDailyLogEntry>();

    public virtual ICollection<RunSheetItem> RunSheetItems { get; set; } = new List<RunSheetItem>();

    public virtual Screen? Screen { get; set; }

    public virtual SerialPortChannel? SerialPortChannel { get; set; }

    public virtual StringIoTag? StringIoTag { get; set; }

    public virtual Tank? Tank { get; set; }

    public virtual Vessel? Vessel { get; set; }

    public virtual Well? Well { get; set; }
}
