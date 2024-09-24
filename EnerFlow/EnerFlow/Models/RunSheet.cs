using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class RunSheet
{
    public int Id { get; set; }

    public int HierarchyId { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual Hierarchy Hierarchy { get; set; } = null!;

    public virtual ICollection<Observation> Observations { get; set; } = new List<Observation>();

    public virtual ICollection<RunSheetDailyLog> RunSheetDailyLogs { get; set; } = new List<RunSheetDailyLog>();

    public virtual ICollection<RunSheetItem> RunSheetItems { get; set; } = new List<RunSheetItem>();

    public virtual ICollection<User> Users { get; set; } = new List<User>();
}
