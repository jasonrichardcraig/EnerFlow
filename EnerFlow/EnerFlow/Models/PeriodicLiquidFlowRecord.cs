using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class PeriodicLiquidFlowRecord
{
    public int MeterId { get; set; }

    public DateTime TimeStamp { get; set; }

    public int Duration { get; set; }

    public int RecordIndex { get; set; }

    public int? FlowTime { get; set; }

    public double? ObservedDensity { get; set; }

    public double? DensityTemperature { get; set; }

    public double? DensityPressure { get; set; }

    public double? UncorrectedDensity { get; set; }

    public double? MeterFlowingDensity { get; set; }

    public double? MeterTemperature { get; set; }

    public double? MeterPressure { get; set; }

    public double? IndicatedVolume { get; set; }

    public double? IndicatedVolumeIndexStart { get; set; }

    public double? IndicatedVolumeIndexEnd { get; set; }

    public double? GrossVolume { get; set; }

    public double? GrossVolumeIndexStart { get; set; }

    public double? GrossVolumeIndexEnd { get; set; }

    public double? GrossStandardVolume { get; set; }

    public double? GrossStandardVolumeIndexStart { get; set; }

    public double? GrossStandardVolumeIndexEnd { get; set; }

    public double? Mass { get; set; }

    public double? MassIndexStart { get; set; }

    public double? MassIndexEnd { get; set; }

    public double? UserDefined01 { get; set; }

    public double? UserDefined02 { get; set; }

    public double? UserDefined03 { get; set; }

    public double? UserDefined04 { get; set; }

    public double? UserDefined05 { get; set; }

    public double? UserDefined06 { get; set; }

    public double? UserDefined07 { get; set; }

    public double? UserDefined08 { get; set; }

    public string? UserDefined09 { get; set; }

    public string? UserDefined010 { get; set; }

    public double? RelativeDensity { get; set; }

    public double? Apidegrees { get; set; }

    public string? ProductName { get; set; }

    public int? FluidStandardId { get; set; }

    public int? FluidTypeId { get; set; }

    public int? TemperatureBaseUnitId { get; set; }

    public double? TemperatureBase { get; set; }

    public double? CompressibilityFactor { get; set; }

    public int? CompressibilityFactorUnitId { get; set; }

    public double? BaseDensityOverride { get; set; }

    public int? DensityUnitId { get; set; }

    public double? Alpha { get; set; }

    public int? AlphaUnitId { get; set; }

    public double? Evp { get; set; }

    public int? EvpUnitId { get; set; }

    public double? DensityCorrectionFactor { get; set; }

    public DateTime? ProveDate { get; set; }

    public DateTime? PycDate { get; set; }

    public double? CoriolisDriveGain { get; set; }

    public double? NetStandardVolume { get; set; }

    public double? NetStandardVolumeIndexStart { get; set; }

    public double? NetStandardVolumeIndexEnd { get; set; }

    public double? SedimentAndWaterVolume { get; set; }

    public double? SedimentAndWaterIndexStart { get; set; }

    public double? SedimentAndWaterIndexEnd { get; set; }

    public double? SedimentAndWaterPercent { get; set; }

    public double? SedimentAndWaterCorrection { get; set; }

    public double? Dp { get; set; }

    public double? Extension { get; set; }

    public double? Cprime { get; set; }

    public double? PulseCount { get; set; }

    public double? PulseIndexStart { get; set; }

    public double? PulseIndexEnd { get; set; }

    public double? GasEquivalentVolume { get; set; }

    public double? GasEquivalentEnergy { get; set; }

    public double? DensityMeterFactor { get; set; }

    public double? MeterFactor { get; set; }

    public double? Kfactor { get; set; }

    public double? EquilibriumVaporPressure { get; set; }

    public double? Ctl { get; set; }

    public double? Cpl { get; set; }

    public double? Ctpl { get; set; }

    public double? Ccf { get; set; }

    public double? Viscosity { get; set; }

    public double? Kappa { get; set; }

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

    public float? Ethylene { get; set; }

    public float? Propylene { get; set; }

    public float? Butylene { get; set; }

    public double? VolumeCorrelationFactor { get; set; }

    public double? CasingPressure { get; set; }

    public double? TubingPressure { get; set; }

    public double? LinePressure { get; set; }

    public DateTime? DateTimeCreated { get; set; }

    public virtual AlphaUnit? AlphaUnit { get; set; }

    public virtual CompressibilityFactorUnit? CompressibilityFactorUnit { get; set; }

    public virtual Unit? DensityUnit { get; set; }

    public virtual FluidStandard? FluidStandard { get; set; }

    public virtual FluidType? FluidType { get; set; }

    public virtual Meter Meter { get; set; } = null!;

    public virtual Unit? TemperatureBaseUnit { get; set; }
}
