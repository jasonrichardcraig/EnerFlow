using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class StringIoTag
{
    public int HierarchyId { get; set; }

    public string? ReadAddress { get; set; }

    public int? ReadAddressScanInterval { get; set; }

    public int? Length { get; set; }

    public string? PaddingCharacter { get; set; }

    public string? WriteAddress { get; set; }

    public bool? IsCalculated { get; set; }

    public string? Script { get; set; }

    public int? DisplayOrder { get; set; }

    public bool? UseDefaultTrendStyle { get; set; }

    public string? LineStyle { get; set; }

    public int? LineWidth { get; set; }

    public string? LineColor { get; set; }

    public int? StringIoTagTrendValueDictionaryId { get; set; }

    public double? ManualData { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual Hierarchy Hierarchy { get; set; } = null!;

    public virtual StringIoTagCurrentValue? StringIoTagCurrentValue { get; set; }

    public virtual StringIoTagTrendValueDictionary? StringIoTagTrendValueDictionary { get; set; }

    public virtual ICollection<StringIoTagValueHistory> StringIoTagValueHistories { get; set; } = new List<StringIoTagValueHistory>();
}
