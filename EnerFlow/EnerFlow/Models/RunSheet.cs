using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class RunSheet
{
    public int Id { get; set; }

    public int HierarchyId { get; set; }

    public string Name { get; set; } = null!;

    public string Description { get; set; } = null!;

    public DateTime DateTimeCreated { get; set; }

    public virtual Hierarchy Hierarchy { get; set; } = null!;

    public virtual ICollection<RunSheetCompressor> RunSheetCompressors { get; set; } = new List<RunSheetCompressor>();

    public virtual ICollection<RunSheetMeter> RunSheetMeters { get; set; } = new List<RunSheetMeter>();

    public virtual ICollection<RunSheetPump> RunSheetPumps { get; set; } = new List<RunSheetPump>();

    public virtual ICollection<RunSheetTank> RunSheetTanks { get; set; } = new List<RunSheetTank>();
}
