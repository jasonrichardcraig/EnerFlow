using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class RunSheetDailyLog
{
    public int RunSheetId { get; set; }

    public DateOnly TimeStamp { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual RunSheet RunSheet { get; set; } = null!;

    public virtual ICollection<RunSheetDailyLogEntry> RunSheetDailyLogEntries { get; set; } = new List<RunSheetDailyLogEntry>();
}
