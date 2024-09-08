using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class MeterConfiguration
{
    public int MeterId { get; set; }

    public DateTime TimeStamp { get; set; }

    public string? MeterNumber { get; set; }

    public int? MeterStandardId { get; set; }

    public int? FluidStandardId { get; set; }

    public int? DataResolution { get; set; }

    public bool? DataSpanIsLeading { get; set; }

    public int? StaticPressureMeasurementId { get; set; }

    /// <summary>
    /// Pressure base for measured gas volume or gas equivalent volume
    /// </summary>
    public double? Pb { get; set; }

    /// <summary>
    /// Temperature base for measured gas volume or gas equivalent volume
    /// </summary>
    public double? Tb { get; set; }

    public double? AtmosphericPressure { get; set; }

    public double? Altitude { get; set; }

    public double? Latitude { get; set; }

    /// <summary>
    /// Densitometer Correction Factor, DCF, Pyc Factor
    /// </summary>
    public double? DensityMeterFactor { get; set; }

    /// <summary>
    /// Indicates that water vapor correction has been calculated and
    /// applied to the gas volume.
    /// </summary>
    public bool? FactorFwv { get; set; }

    /// <summary>
    /// Indicates that the Full Well Stream Factor has been applied to the
    /// gas volume.
    /// </summary>
    public bool? FactorFws { get; set; }

    /// <summary>
    /// Null and zero are treated as 1
    /// </summary>
    public double? FullWellStreamFactor { get; set; }

    /// <summary>
    /// Null and zero are treated as 1
    /// ; Coefficient of Discharge for Cone meters
    /// </summary>
    public double? FixedFactor { get; set; }

    public int? EfmRelativeDensitySaturationConditionId { get; set; }

    public int? EfmHeatingValueSaturationConditionId { get; set; }

    /// <summary>
    /// Indicates default temperature is used in the gas volume calculation.
    /// </summary>
    public bool? HasDefaultTemperature { get; set; }

    public double? DefaultTemperature { get; set; }

    /// <summary>
    /// Shrink factor to calculate theoretical production on liquid meters.
    /// </summary>
    public double? ShrinkFactor { get; set; }

    /// <summary>
    /// Density at stock tank conditions to calculate theoretical production on
    /// liquid meters.
    /// </summary>
    public double? StockTankDensity { get; set; }

    /// <summary>
    /// S&amp;W% at stock tank conditions to calculate theoretical production on
    /// liquid meters.
    /// </summary>
    public double? StockTankSedimentAndWaterPercent { get; set; }

    public string? ProductName { get; set; }

    public int? FluidTypeId { get; set; }

    public double? CompressibilityFactor { get; set; }

    public int? CompressibilityFactorUnitId { get; set; }

    public double? BaseDensityOverride { get; set; }

    public int? DensityUnitId { get; set; }

    public double? Alpha { get; set; }

    public int? AlphaUnitId { get; set; }

    public double? EquilibriumVaporPressure { get; set; }

    public int? EquilibriumVaporPressureUnitId { get; set; }

    public double? DensityCorrectionFactor { get; set; }

    public DateTime? ProveDate { get; set; }

    public DateTime? PycDate { get; set; }

    /// <summary>
    /// Dials (or digits) are used to determine when an index reading has
    /// “rolled over”.
    /// </summary>
    public short? NumberOfDialsTotalizerDigits { get; set; }

    /// <summary>
    /// Indicates if the volume is already corrected for pressure.
    /// </summary>
    public bool? PressureCompenstated { get; set; }

    /// <summary>
    /// Indicates if the volume is already corrected for temperature.
    /// </summary>
    public bool? TemperatureCompensated { get; set; }

    public int? MeterFactorUsageId { get; set; }

    /// <summary>
    /// Linear meters.
    /// </summary>
    public double? MeterFactor { get; set; }

    /// <summary>
    /// Linear meters.
    /// </summary>
    public double? Kfactor { get; set; }

    /// <summary>
    /// Line Pack only.
    /// </summary>
    public double? PipeLength { get; set; }

    /// <summary>
    /// Coriolis only.
    /// </summary>
    public bool? MeterFactorKfactorCurveIsAveraged { get; set; }

    /// <summary>
    /// Coriolis only. Indicates that the Correction for Flow Pressure Effect, Ffpe, is used in the mass calculation.
    /// </summary>
    public bool? FlowingPressureEnabled { get; set; }

    /// <summary>
    /// Coriolis only. Given as a percent of rate per unit pressure
    /// </summary>
    public double? FlowingPressureEffect { get; set; }

    /// <summary>
    /// Coriolis only. Pressure at which Peffect was determined
    /// </summary>
    public double? CalibrationPressure { get; set; }

    public double? MeasuredPipeDiameter { get; set; }

    public double? PipeReferenceTemperature { get; set; }

    public int? PipeMaterialId { get; set; }

    public double? MeasuredBoreDiameter { get; set; }

    public double? BoreReferenceTemperature { get; set; }

    public int? BoreMaterialId { get; set; }

    public int? TapTypeId { get; set; }

    public int? StaticTapTypeId { get; set; }

    public int? ExtensionDefinitionId { get; set; }

    /// <summary>
    /// Indicates that the Factor Fa is included in the AGA-3(1985) calculation of gas volume.
    /// </summary>
    public bool? FactorFa { get; set; }

    /// <summary>
    /// Indicates that the Factor Fb is included in the AGA-3(1985) calculation of gas volume.
    /// </summary>
    public bool? FactorFb { get; set; }

    /// <summary>
    /// Indicates that the Factor Fg is included in the AGA-3(1985) calculation of gas volume.
    /// </summary>
    public bool? FactorFg { get; set; }

    /// <summary>
    /// Indicates that the Factor Fpv is included in the AGA-3(1985) calculation of gas volume.
    /// </summary>
    public bool? FactorFpv { get; set; }

    /// <summary>
    /// Indicates that the Factor Fr is included in the AGA-3(1985) calculation of gas volume
    /// </summary>
    public bool? FactorFr { get; set; }

    /// <summary>
    /// Indicates that the Factor Ft is included in the AGA-3(1985) calculation of gas volume.
    /// </summary>
    public bool? FactorFt { get; set; }

    /// <summary>
    /// Indicates that the Factor Y is included in the AGA-3(1985) calculation of gas volume.
    /// </summary>
    public bool? FactorY { get; set; }

    public double? LowFlowCutoffSetPoint { get; set; }

    public double? BackflowAlarmSetPoint { get; set; }

    public double? DplowAlarmSetPoint { get; set; }

    public double? DphighAlarmSetPoint { get; set; }

    public double? DpcalibratedRangeLow { get; set; }

    public double? DpcalibratedRangeHigh { get; set; }

    public double? DptransducerRangeLow { get; set; }

    public double? DptransducerRangeHigh { get; set; }

    public double? SplowAlarmSetPoint { get; set; }

    public double? SphighAlarmSetPoint { get; set; }

    public double? SpcalibratedRangeLow { get; set; }

    public double? SpcalibratedRangeHigh { get; set; }

    public double? SptransducerRangeLow { get; set; }

    public double? SptransducerRangeHigh { get; set; }

    public double? TmpLowAlarmSetPoint { get; set; }

    public double? TmpHighAlarmSetPoint { get; set; }

    public double? TmpCalibratedRangeLow { get; set; }

    public double? TmpCalibratedRangeHigh { get; set; }

    public double? TmpTransducerRangeLow { get; set; }

    public double? TmpTransducerRangeHigh { get; set; }

    /// <summary>
    /// Flow computer Identification for product mapping
    /// </summary>
    public string? FlowComputerId { get; set; }

    public string? MeterSerialNumber { get; set; }

    public DateTime? FirstDeliveryDate { get; set; }

    public int? PowerSourceId { get; set; }

    public bool? LiveAnalysis { get; set; }

    public bool? LiveHeatingValue { get; set; }

    public bool? LiveGravity { get; set; }

    public bool? LiveTemperature { get; set; }

    public int? FittingTypeId { get; set; }

    /// <summary>
    /// Between 0 and 23, inclusive. If no value is provided in the file and the meter does not have a contract hour specified in FLOWCAL, then the contract hour for the system that the meter belongs to will be used as the contract hour.
    /// </summary>
    public int? ContractHour { get; set; }

    /// <summary>
    /// Between -5and 28, inclusive. If no value is provided in the file and the meter does not have a contract day specified in FLOWCAL, then a contract day of 1 will be used. If a contract day of 0 is specified, FLOWCAL will treat this the same as a contract day of 1.
    /// </summary>
    public int? ContractDay { get; set; }

    public DateTime? MeterAccessDate { get; set; }

    public DateTime? ColdStartDate { get; set; }

    public DateTime? WarmStartDate { get; set; }

    /// <summary>
    /// Indicates that an RTD is attached.
    /// </summary>
    public bool? HasRtd { get; set; }

    /// <summary>
    /// Indicates that an attached RTD is in use. Has RTD and Use RTD are not stored in FLOWCAL but an exception will be generated if these two fields do not match.
    /// </summary>
    public bool? UseRtd { get; set; }

    /// <summary>
    /// Number of days for a chart
    /// </summary>
    public int? Rotation { get; set; }

    public bool? IsChart { get; set; }

    public DateTime? SampleDate { get; set; }

    public int? SampleTypeId { get; set; }

    public double? HeatingValue { get; set; }

    /// <summary>
    /// Gas Relative Density at base conditions
    /// </summary>
    public double? GasRelativeDensity { get; set; }

    public double? Viscosity { get; set; }

    public double? Kappa { get; set; }

    /// <summary>
    /// Mole %
    /// </summary>
    public double? Methane { get; set; }

    /// <summary>
    /// Mole %
    /// </summary>
    public double? Nitrogen { get; set; }

    /// <summary>
    /// Mole %
    /// </summary>
    public double? CarbonDioxide { get; set; }

    /// <summary>
    /// Mole %
    /// </summary>
    public double? Ethane { get; set; }

    /// <summary>
    /// Mole %
    /// </summary>
    public double? Propane { get; set; }

    /// <summary>
    /// Mole %
    /// </summary>
    public double? Water { get; set; }

    /// <summary>
    /// Mole %
    /// </summary>
    public double? HydrogenSulfide { get; set; }

    /// <summary>
    /// Mole %
    /// </summary>
    public double? Hydrogen { get; set; }

    /// <summary>
    /// Mole %
    /// </summary>
    public double? CarbonMonoxide { get; set; }

    /// <summary>
    /// Mole %
    /// </summary>
    public double? Oxygen { get; set; }

    public double? IButane { get; set; }

    /// <summary>
    /// Mole %
    /// </summary>
    public double? NButane { get; set; }

    public double? IPentane { get; set; }

    /// <summary>
    /// Mole %
    /// </summary>
    public double? NPentane { get; set; }

    /// <summary>
    /// Mole %
    /// </summary>
    public double? Hexane { get; set; }

    /// <summary>
    /// Mole %
    /// </summary>
    public double? Heptane { get; set; }

    /// <summary>
    /// Mole %
    /// </summary>
    public double? Octane { get; set; }

    /// <summary>
    /// Mole %
    /// </summary>
    public double? Nonane { get; set; }

    /// <summary>
    /// Mole %
    /// </summary>
    public double? Decane { get; set; }

    /// <summary>
    /// Mole %
    /// </summary>
    public double? Helium { get; set; }

    /// <summary>
    /// Mole %
    /// </summary>
    public double? Argon { get; set; }

    /// <summary>
    /// Mole %
    /// </summary>
    public double? Ethylene { get; set; }

    /// <summary>
    /// Mole %
    /// </summary>
    public double? Propylene { get; set; }

    /// <summary>
    /// Amount of water per unit volume. For example, lbs/MMscf
    /// </summary>
    public double? WaterContent { get; set; }

    /// <summary>
    /// H2S content in ppm
    /// </summary>
    public double? HydrogenSulfideContent { get; set; }

    public int? DifferentialPressureUnit { get; set; }

    public int? StaticPressureUnit { get; set; }

    public int? TemperatureUnit { get; set; }

    public int? RawVolumeUnit { get; set; }

    public int? MeasuredVolumeUnit { get; set; }

    public int? EnergyUnit { get; set; }

    public int? TemperatureBaseUnitId { get; set; }

    public int? GasPressureBaseUnitId { get; set; }

    public int? AtmosphericPressureUnitId { get; set; }

    public int? GasVolumeKfactorUnitId { get; set; }

    public int? LiquidVolumeKfactorUnitId { get; set; }

    public int? MassKfactorUnitId { get; set; }

    public int? BoreReferenceTemperatureUnitId { get; set; }

    public int? PipeReferenceTemperatureUnitId { get; set; }

    public int? BoreDiameterUnitId { get; set; }

    public int? PipeDiameterUnitId { get; set; }

    public int? VolumetricHeatingValueUnitId { get; set; }

    public int? ViscosityUnitId { get; set; }

    public int? MassHeatingValueUnitId { get; set; }

    public int? PipeLengthUnitId { get; set; }

    public int? MassUnitId { get; set; }

    public int? ObservedDensityUnitId { get; set; }

    public int? IndicatedVolumeUnitId { get; set; }

    public int? GrossVolumeUnitId { get; set; }

    public int? GrossStandardVolumeUnitId { get; set; }

    public int? NetStandardVolumeUnitId { get; set; }

    public string? UserCharacteristic01 { get; set; }

    public string? UserCharacteristic02 { get; set; }

    public string? UserCharacteristic03 { get; set; }

    public string? UserCharacteristic04 { get; set; }

    public string? UserCharacteristic05 { get; set; }

    public string? UserCharacteristic06 { get; set; }

    public string? UserCharacteristic07 { get; set; }

    public string? UserCharacteristic08 { get; set; }

    public string? UserCharacteristic09 { get; set; }

    public string? UserCharacteristic10 { get; set; }

    public string? UserCharacteristic11 { get; set; }

    public string? UserCharacteristic12 { get; set; }

    public string? UserCharacteristic13 { get; set; }

    public string? UserCharacteristic14 { get; set; }

    public string? UserCharacteristic15 { get; set; }

    public string? UserCharacteristic16 { get; set; }

    public string? UserCharacteristic17 { get; set; }

    public string? UserCharacteristic18 { get; set; }

    public string? UserCharacteristic19 { get; set; }

    public string? UserCharacteristic20 { get; set; }

    public string? UserCharacteristic21 { get; set; }

    public string? UserCharacteristic22 { get; set; }

    public string? UserCharacteristic23 { get; set; }

    public string? UserCharacteristic24 { get; set; }

    public string? UserCharacteristic25 { get; set; }

    public string? UserCharacteristic26 { get; set; }

    public string? UserCharacteristic27 { get; set; }

    public string? UserCharacteristic28 { get; set; }

    public string? UserCharacteristic29 { get; set; }

    public string? UserCharacteristic30 { get; set; }

    public DateTime? DateTimeCreated { get; set; }

    public virtual AlphaUnit? AlphaUnit { get; set; }

    public virtual Unit? AlphaUnitNavigation { get; set; }

    public virtual Unit? AtmosphericPressureUnit { get; set; }

    public virtual Unit? BoreDiameterUnit { get; set; }

    public virtual Material? BoreMaterial { get; set; }

    public virtual Unit? BoreReferenceTemperatureUnit { get; set; }

    public virtual CompressibilityFactorUnit? CompressibilityFactorUnit { get; set; }

    public virtual Unit? DensityUnit { get; set; }

    public virtual Unit? DifferentialPressureUnitNavigation { get; set; }

    public virtual SaturationCondition? EfmHeatingValueSaturationCondition { get; set; }

    public virtual SaturationCondition? EfmRelativeDensitySaturationCondition { get; set; }

    public virtual Unit? EnergyUnitNavigation { get; set; }

    public virtual Unit? EquilibriumVaporPressureUnit { get; set; }

    public virtual ExtensionDefinition? ExtensionDefinition { get; set; }

    public virtual FittingType? FittingType { get; set; }

    public virtual FluidStandard? FluidStandard { get; set; }

    public virtual FluidType? FluidType { get; set; }

    public virtual Unit? GasPressureBaseUnit { get; set; }

    public virtual GasVolumeKfactorUnit? GasVolumeKfactorUnit { get; set; }

    public virtual Unit? GrossStandardVolumeUnit { get; set; }

    public virtual Unit? GrossVolumeUnit { get; set; }

    public virtual Unit? IndicatedVolumeUnit { get; set; }

    public virtual LiquidVolumeKfactorUnit? LiquidVolumeKfactorUnit { get; set; }

    public virtual MassHeatingValueUnit? MassHeatingValueUnit { get; set; }

    public virtual MassKfactorUnit? MassKfactorUnit { get; set; }

    public virtual Unit? MassUnit { get; set; }

    public virtual Unit? MeasuredVolumeUnitNavigation { get; set; }

    public virtual MeterFactorUsage? MeterFactorUsage { get; set; }

    public virtual MeterStandard? MeterStandard { get; set; }

    public virtual Unit? NetStandardVolumeUnit { get; set; }

    public virtual Unit? ObservedDensityUnit { get; set; }

    public virtual Unit? PipeDiameterUnit { get; set; }

    public virtual Unit? PipeLengthUnit { get; set; }

    public virtual Material? PipeMaterial { get; set; }

    public virtual Unit? PipeReferenceTemperatureUnit { get; set; }

    public virtual PowerSource? PowerSource { get; set; }

    public virtual Unit? RawVolumeUnitNavigation { get; set; }

    public virtual SampleType? SampleType { get; set; }

    public virtual StaticPressureMeasurement? StaticPressureMeasurement { get; set; }

    public virtual Unit? StaticPressureUnitNavigation { get; set; }

    public virtual StaticTapType? StaticTapType { get; set; }

    public virtual TapType? TapType { get; set; }

    public virtual Unit? TemperatureBaseUnit { get; set; }

    public virtual Unit? TemperatureUnitNavigation { get; set; }

    public virtual Unit? ViscosityUnit { get; set; }

    public virtual VolumetricHeatingValueUnit? VolumetricHeatingValueUnit { get; set; }
}
