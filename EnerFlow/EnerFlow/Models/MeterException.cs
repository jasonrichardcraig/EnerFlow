using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class MeterException
{
    public int MeterId { get; set; }

    public DateTime TimeStamp { get; set; }

    public int MeterExceptionTypeId { get; set; }

    public int? MeterExceptionResolutionTypeId { get; set; }

    public int? ResolvedByUserId { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual Meter Meter { get; set; } = null!;

    public virtual MeterExceptionResolutionType? MeterExceptionResolutionType { get; set; }

    public virtual MeterExceptionType MeterExceptionType { get; set; } = null!;

    public virtual User? ResolvedByUser { get; set; }
}
