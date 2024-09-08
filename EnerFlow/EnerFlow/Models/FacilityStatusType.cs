using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class FacilityStatusType
{
    public int Id { get; set; }

    public string Code { get; set; } = null!;

    public string Name { get; set; } = null!;

    public virtual ICollection<FacilityStatus> FacilityStatuses { get; set; } = new List<FacilityStatus>();
}
