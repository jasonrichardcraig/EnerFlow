using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class WellStatus
{
    public int WellId { get; set; }

    public DateOnly TimeStamp { get; set; }

    public int RecordVersion { get; set; }

    public int WellFluidId { get; set; }

    public int WellModeId { get; set; }

    public int WellTypeId { get; set; }

    public int WellStructureId { get; set; }

    public int? PrimaryLinkedFacilityId { get; set; }

    public int? SecondaryLinkedFacilityId { get; set; }

    public DateTime? DateTimeCreated { get; set; }

    public virtual Facility? PrimaryLinkedFacility { get; set; }

    public virtual Facility? SecondaryLinkedFacility { get; set; }

    public virtual Well Well { get; set; } = null!;

    public virtual WellFluid WellFluid { get; set; } = null!;

    public virtual WellMode WellMode { get; set; } = null!;

    public virtual WellStructure WellStructure { get; set; } = null!;

    public virtual WellType WellType { get; set; } = null!;
}
