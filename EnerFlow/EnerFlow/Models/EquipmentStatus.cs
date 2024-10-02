using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class EquipmentStatus
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string Description { get; set; } = null!;

    public virtual ICollection<Equipment> Equipment { get; set; } = new List<Equipment>();
}
