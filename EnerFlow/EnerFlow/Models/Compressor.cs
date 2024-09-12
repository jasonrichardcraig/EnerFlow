using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class Compressor
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public bool IsScrewCompressor { get; set; }

    public int? NumberOfStages { get; set; }

    public decimal? Throughput { get; set; }

    public decimal? DailyFuelConsumption { get; set; }

    public int? FacilityId { get; set; }

    public int? WellId { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual ICollection<CompressorDailyTransaction> CompressorDailyTransactions { get; set; } = new List<CompressorDailyTransaction>();

    public virtual Facility? Facility { get; set; }

    public virtual ICollection<RunSheetCompressor> RunSheetCompressors { get; set; } = new List<RunSheetCompressor>();

    public virtual Well? Well { get; set; }
}
