using System;
using System.Collections.Generic;
using NetTopologySuite.Geometries;

namespace EnerFlow.Models;

public partial class ContextTag
{
    public int Id { get; set; }

    public int HierarchyId { get; set; }

    public Geometry? Location { get; set; }

    public int? DefaultZoomLevel { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual ICollection<ContextTagProperty> ContextTagProperties { get; set; } = new List<ContextTagProperty>();

    public virtual Hierarchy Hierarchy { get; set; } = null!;
}
