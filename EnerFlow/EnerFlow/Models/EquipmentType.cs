using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class EquipmentType
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string Description { get; set; } = null!;

    public virtual ICollection<EquipmentSubType> EquipmentSubTypes { get; set; } = new List<EquipmentSubType>();
}
