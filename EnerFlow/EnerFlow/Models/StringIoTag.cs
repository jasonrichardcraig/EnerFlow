using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class StringIoTag
{
    public int Id { get; set; }

    public int HierarchyId { get; set; }

    public string? ReadAddress { get; set; }

    public int? ReadAddressScanInterval { get; set; }

    public int? Length { get; set; }

    public string? PaddingCharacter { get; set; }

    public string? WriteAddress { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual Hierarchy Hierarchy { get; set; } = null!;

    public virtual ICollection<StringTagValueHistory> StringTagValueHistories { get; set; } = new List<StringTagValueHistory>();
}
