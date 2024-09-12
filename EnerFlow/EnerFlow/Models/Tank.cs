﻿using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class Tank
{
    public int Id { get; set; }

    public int TankTypeId { get; set; }

    public string Name { get; set; } = null!;

    public double TankHeight { get; set; }

    public double TankVolume { get; set; }

    public double TankFactor { get; set; }

    public int? WellId { get; set; }

    public int? SatelliteId { get; set; }

    public int? FacilityId { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual Facility? Facility { get; set; }

    public virtual ICollection<RunSheetTank> RunSheetTanks { get; set; } = new List<RunSheetTank>();

    public virtual Satellite? Satellite { get; set; }

    public virtual ICollection<TankDailyTransaction> TankDailyTransactions { get; set; } = new List<TankDailyTransaction>();

    public virtual TankType TankType { get; set; } = null!;

    public virtual Well? Well { get; set; }
}