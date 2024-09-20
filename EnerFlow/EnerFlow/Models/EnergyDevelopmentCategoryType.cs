using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class EnergyDevelopmentCategoryType
{
    public int Id { get; set; }

    public string Code { get; set; } = null!;

    public string Description { get; set; } = null!;

    public virtual ICollection<Facility> Facilities { get; set; } = new List<Facility>();
}
