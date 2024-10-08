using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class FacilityDailyTransaction
{
    public int FacilityId { get; set; }

    public DateOnly ProductionDate { get; set; }

    public decimal? OilClosingVolume { get; set; }

    public decimal? OilTransloadedOutVolume { get; set; }

    public decimal? OilLoadInjection { get; set; }

    public decimal? OilOpeningVolume { get; set; }

    public decimal? OilTransloadedInVolume { get; set; }

    public decimal? OilRecoveredVolume { get; set; }

    public decimal? OilAdjustedVolume { get; set; }

    public decimal? OilNetProductionVolume { get; set; }

    public decimal? OilProrationFactor { get; set; }

    public decimal? OilWellEstimatedVolume { get; set; }

    public decimal? OilWellMeasuredVolume { get; set; }

    public decimal? BitumenWellMeasuredVolume { get; set; }

    public decimal? BitumenClosingVolume { get; set; }

    public decimal? BitumenTransloadedOutVolume { get; set; }

    public decimal? BitumenLoadInjection { get; set; }

    public decimal? BitumenOpeningVolume { get; set; }

    public decimal? BitumenTransloadedInVolume { get; set; }

    public decimal? BitumenRecoveredVolume { get; set; }

    public decimal? BitumenAdjustedVolume { get; set; }

    public decimal? BitumenNetProductionVolume { get; set; }

    public decimal? BitumenProrationFactor { get; set; }

    public decimal? BitumenWellEstimatedVolume { get; set; }

    public decimal? DiluentClosingVolume { get; set; }

    public decimal? DiluentTransloadedOutVolume { get; set; }

    public decimal? DiluentLoadInjectionVolume { get; set; }

    public decimal? DiluentOpeningVolume { get; set; }

    public decimal? DiluentTransloadedInVolume { get; set; }

    public decimal? DiluentRecoveredVolume { get; set; }

    public decimal? DiluentAdjustedVolume { get; set; }

    public decimal? DiluentNetProductionVolume { get; set; }

    public decimal? DiluentProrationFactor { get; set; }

    public decimal? CondensateWellEstimatedVolume1 { get; set; }

    public decimal? CondensateWellMeasuredVolume1 { get; set; }

    public decimal? CondensateClosingVolume { get; set; }

    public decimal? CondensateTransloadedOutVolume { get; set; }

    public decimal? CondensateLoadInjectionVolume { get; set; }

    public decimal? CondensateOpeningVolume { get; set; }

    public decimal? CondensateTransloadedInVolume { get; set; }

    public decimal? CondensateRecoveredVolume { get; set; }

    public decimal? CondensateAdjustedVolume { get; set; }

    public decimal? CondensateNetProductionVolume { get; set; }

    public decimal? CondensateProrationFactor { get; set; }

    public decimal? CondensateWellEstimatedVolume { get; set; }

    public decimal? CondensateWellMeasuredVolume { get; set; }

    public decimal? WaterClosingVolume { get; set; }

    public decimal? WaterTransloadedOutVolume { get; set; }

    public decimal? WaterLoadInjectionVolume { get; set; }

    public decimal? WaterOpeningVolume { get; set; }

    public decimal? WaterTransloadedInVolume { get; set; }

    public decimal? WaterRecoveredVolume { get; set; }

    public decimal? WaterSourceVolume { get; set; }

    public decimal? WaterInjectedVolume { get; set; }

    public decimal? WaterNetProductionVolume { get; set; }

    public decimal? WaterProrationFactor { get; set; }

    public decimal? WaterWellEstimatedVolume { get; set; }

    public decimal? WaterWellMeasuredVolume { get; set; }

    public decimal? SandCloseVolume { get; set; }

    public decimal? SandTransloadedOutVolume { get; set; }

    public decimal? SandOpeningVolume { get; set; }

    public decimal? SandNetProductionVolume { get; set; }

    public decimal? SandWellEstimatedVolume { get; set; }

    public decimal? SandWellMeasuredVolume { get; set; }

    public decimal? FluidClosingVolume { get; set; }

    public decimal? FluidTransloadedOutVolume { get; set; }

    public decimal? FluidLoadInjectionVolume { get; set; }

    public decimal? FluidOpeningVolume { get; set; }

    public decimal? FluidTransloadedInVolume { get; set; }

    public decimal? FluidRecoveredVolume { get; set; }

    public decimal? FluidNetProductionVolume { get; set; }

    public decimal? FluidProrationFactor { get; set; }

    public decimal? FluidWellEstimatedVolume { get; set; }

    public decimal? FluidWellMeasuredVolume { get; set; }

    public decimal? GasFuelVolume { get; set; }

    public decimal? GasFlareVolume { get; set; }

    public decimal? GasVentVolume { get; set; }

    public decimal? GasGroupInletVolume { get; set; }

    public decimal? GasSalesVolume { get; set; }

    public decimal? GasTransloadInVolume { get; set; }

    public decimal? GasFuelVolumeIn { get; set; }

    public decimal? GasStvVolume { get; set; }

    public decimal? GasProductionVolume { get; set; }

    public decimal? GasProrationFactor { get; set; }

    public decimal? GasWellProratedVolume { get; set; }

    public decimal? GasWellEstimatedVolume { get; set; }

    public decimal? GasWellMeasuredVolume { get; set; }

    public decimal? GasWellGatheredVolume { get; set; }

    public decimal? GasWellProducedVolume { get; set; }

    public decimal? GasWellGasLiftVolume { get; set; }

    public decimal? GasWellEffulentGasVoume { get; set; }

    public DateTime DateTimeCreated { get; set; }

    public virtual Facility Facility { get; set; } = null!;
}
