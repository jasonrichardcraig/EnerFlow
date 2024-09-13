using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class Document
{
    public int Id { get; set; }

    public int? HierarchyId { get; set; }

    public byte[]? DocumentData { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual Hierarchy? Hierarchy { get; set; }
}
