using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class FacilityStatus
{
    public int FacilityId { get; set; }

    public DateOnly TimeStamp { get; set; }

    public int FacilityStatusTypeId { get; set; }

    public int RecordVersion { get; set; }

    public virtual Facility Facility { get; set; } = null!;

    public virtual FacilityStatusType FacilityStatusType { get; set; } = null!;
}
