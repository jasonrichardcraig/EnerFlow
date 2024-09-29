using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class Equipment
{
    public int Id { get; set; }

    public int HierarchyId { get; set; }

    public int EquipmentSubTypeId { get; set; }

    public virtual EquipmentSubType EquipmentSubType { get; set; } = null!;

    public virtual Hierarchy Hierarchy { get; set; } = null!;
}
