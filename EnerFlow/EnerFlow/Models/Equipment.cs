using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class Equipment
{
    public int HierarchyId { get; set; }

    public int? EquipmentSubTypeId { get; set; }

    public string? SerialNumber { get; set; }

    public string? AssetTag { get; set; }

    public string? Model { get; set; }

    public string? Manufacturer { get; set; }

    public DateOnly? InstallationDate { get; set; }

    public int? EquipmentStatusId { get; set; }

    public string? Notes { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual EquipmentStatus? EquipmentStatus { get; set; }

    public virtual EquipmentSubType? EquipmentSubType { get; set; }

    public virtual Hierarchy Hierarchy { get; set; } = null!;
}
