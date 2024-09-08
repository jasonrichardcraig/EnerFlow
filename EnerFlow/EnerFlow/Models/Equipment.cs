using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class Equipment
{
    public int Id { get; set; }

    public int? FacilityId { get; set; }

    public int? EquipmentTypeId { get; set; }

    public decimal? Fuel { get; set; }

    public decimal? Flare { get; set; }

    public decimal? Vent { get; set; }

    public DateTime? DateTimeCreated { get; set; }

    public virtual EquipmentType? EquipmentType { get; set; }

    public virtual Facility? Facility { get; set; }
}
