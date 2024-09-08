using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class RunSheetCompressor
{
    public int RunSheetId { get; set; }

    public int CompressorId { get; set; }

    public int Ordinal { get; set; }

    public virtual Compressor Compressor { get; set; } = null!;

    public virtual RunSheet RunSheet { get; set; } = null!;
}
