﻿using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class StringIoTagCurrentValue
{
    public int StringIoTagId { get; set; }

    public double Value { get; set; }

    public bool IsBadQuality { get; set; }

    public DateTime TimeStamp { get; set; }

    public virtual StringIoTag StringIoTag { get; set; } = null!;
}