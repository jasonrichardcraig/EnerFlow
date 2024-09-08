using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class FacilitySubType
{
    public int Id { get; set; }

    public int FacilityTypeId { get; set; }

    public string Code { get; set; } = null!;

    public string Name { get; set; } = null!;

    public virtual ICollection<Facility> Facilities { get; set; } = new List<Facility>();

    public virtual FacilityType FacilityType { get; set; } = null!;
}
