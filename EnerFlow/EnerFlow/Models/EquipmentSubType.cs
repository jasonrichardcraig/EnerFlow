using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class EquipmentSubType
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string Description { get; set; } = null!;

    public int EquipmentTypeId { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual ICollection<Equipment> Equipment { get; set; } = new List<Equipment>();

    public virtual EquipmentType EquipmentType { get; set; } = null!;
}
