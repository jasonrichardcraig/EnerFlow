using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class TicketTankRecord
{
    public int Id { get; set; }

    public int? TicketTankTypeId { get; set; }

    public int? TicketTankCalculationStandardId { get; set; }

    public int? TicketTankLevelTypeId { get; set; }

    public bool? TankIsInsulated { get; set; }

    public int? TicketTankShellMaterialId { get; set; }

    public int? TicketTankCustodyTransferCalculationMethodId { get; set; }

    public double? OpeningLiquidLevel { get; set; }

    public double? OpeningFreeWaterLevel { get; set; }

    public double? VesselForwardDraft { get; set; }

    public double? VesselAfterDraft { get; set; }

    public double? VesselTrim { get; set; }

    public double? VesselList { get; set; }

    public double? LiquidTemperature { get; set; }

    public double? AmbientTemperature { get; set; }

    public double? ShellTemperature { get; set; }

    public double? TankPressure { get; set; }

    public double? ObservedDensity { get; set; }

    public double? ObsDensityTemperature { get; set; }

    public double? ObsDensityPressure { get; set; }

    public double? OpeningTotalObservedVolume { get; set; }

    public double? OpeningTotalFreeWater { get; set; }

    public double? GasDensity { get; set; }

    public double? FloatingRoofAdjustment { get; set; }

    public double? ShellTemperatureCorrection { get; set; }

    public double? OpeningGrossObserved { get; set; }

    public double? LiquidTempCorrection { get; set; }

    public double? OpeningGrossStandard { get; set; }

    public double? OpeningSwpercent { get; set; }

    public double? OpeningSwcorrection { get; set; }

    public double? OpeningNetStandardVolume { get; set; }

    public double? OpeningSedimentWaterVolume { get; set; }

    public double? OpeningWeightConversionFactor { get; set; }

    public double? OpeningNetStandardWeight { get; set; }

    public double? OpeningLiquidMass { get; set; }

    public double? ClosingOrCurrentLiquidLevel { get; set; }

    public double? ClosingOrCurrentFreeWaterLevel { get; set; }

    public double? ClosingVesselForwardDraft { get; set; }

    public double? ClosingVesselAfterDraft { get; set; }

    public double? ClosingVesselTrim { get; set; }

    public double? ClosingVesselList { get; set; }

    public double? ClosingLiquidTemperature { get; set; }

    public double? ClosingAmbientTemperature { get; set; }

    public double? ClosingShellTemperature { get; set; }

    public double? ClosingTankPressure { get; set; }

    public double? ClosingObservedDensity { get; set; }

    public double? ClosingObsDensityTemperature { get; set; }

    public double? ClosingObsDensityPressure { get; set; }

    public double? ClosingOrCurrentTotalObservedVolume { get; set; }

    public double? ClosingTotalFreeWater { get; set; }

    public double? ClosingGasDensity { get; set; }

    public double? ClosingFloatingRoofAdjustment { get; set; }

    public double? TankShellTemperatureCorrection { get; set; }

    public double? ClosingGrossObservedVolume { get; set; }

    public double? ClosingLiquidTempCorrection { get; set; }

    public double? ClosingGrossStandardVolume { get; set; }

    public double? ClosingAndCurrentSwpercent { get; set; }

    public double? ClosingAndCurrentSwcorrection { get; set; }

    public double? ClosingNetStandardVolume { get; set; }

    public double? ClosingSedimentAndWater { get; set; }

    public double? ClosingWeightConversionFactor { get; set; }

    public double? ClosingNetStandardWeight { get; set; }

    public double? ClosingLiquidMass { get; set; }

    public double? TotalObservedVolume { get; set; }

    public double? GrossObservedVolume { get; set; }

    public double? GrossStandardVolume { get; set; }

    public double? SwPercent { get; set; }

    public double? SwCorrection { get; set; }

    public double? NetStandardVolume { get; set; }

    public double? SedimentAndWaterVolume { get; set; }

    public double? WeightConversionFactor { get; set; }

    public double? NetStandardWeight { get; set; }

    public double? LiquidMass { get; set; }

    public int? LevelUnitId { get; set; }

    public int? VesselDraftUnitId { get; set; }

    public int? TemperatureUnitId { get; set; }

    public int? BaseTemperatureUnitId { get; set; }

    public int? PressureUnitId { get; set; }

    public int? LiquidDensityUnitId { get; set; }

    public int? ObservedVolumeUnitId { get; set; }

    public int? StandardVolumeUnitId { get; set; }

    public int? MassUnitId { get; set; }

    public int TicketId { get; set; }

    public DateTime? DateTimeCreated { get; set; }

    public virtual Unit? BaseTemperatureUnit { get; set; }

    public virtual Unit? LevelUnit { get; set; }

    public virtual Unit? LiquidDensityUnit { get; set; }

    public virtual Unit? MassUnit { get; set; }

    public virtual Unit? ObservedVolumeUnit { get; set; }

    public virtual Unit? PressureUnit { get; set; }

    public virtual Unit? StandardVolumeUnit { get; set; }

    public virtual Unit? TemperatureUnit { get; set; }

    public virtual Ticket Ticket { get; set; } = null!;

    public virtual TicketTankCalculationStandard? TicketTankCalculationStandard { get; set; }

    public virtual TicketTankCustodyTransferCalculationMethod? TicketTankCustodyTransferCalculationMethod { get; set; }

    public virtual TicketTankLevelType? TicketTankLevelType { get; set; }

    public virtual TicketTankShellMaterial? TicketTankShellMaterial { get; set; }

    public virtual TankType? TicketTankType { get; set; }

    public virtual Unit? VesselDraftUnit { get; set; }
}
