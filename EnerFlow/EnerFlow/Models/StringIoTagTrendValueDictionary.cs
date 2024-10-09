using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class StringIoTagTrendValueDictionary
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string? Description { get; set; }

    public virtual ICollection<StringIoTagTrendValueDictionaryItem> StringIoTagTrendValueDictionaryItems { get; set; } = new List<StringIoTagTrendValueDictionaryItem>();

    public virtual ICollection<StringIoTag> StringIoTags { get; set; } = new List<StringIoTag>();
}
