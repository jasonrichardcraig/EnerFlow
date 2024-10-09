using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class StringIoTagTrendValueDictionaryItem
{
    public int StringIoTagTrendValueDictionariesId { get; set; }

    public int ItemKey { get; set; }

    public string ItemValue { get; set; } = null!;

    public virtual StringIoTagTrendValueDictionary StringIoTagTrendValueDictionaries { get; set; } = null!;
}
