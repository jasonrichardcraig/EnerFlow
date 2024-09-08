using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class FacilityType
{
    public int Id { get; set; }

    public string Code { get; set; } = null!;

    public string Name { get; set; } = null!;

    public virtual ICollection<FacilitySubType> FacilitySubTypes { get; set; } = new List<FacilitySubType>();
}
