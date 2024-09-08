using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class PeriodicGasFlowRecord
{
    public int MeterId { get; set; }

    public DateTime TimeStamp { get; set; }

    public int Duration { get; set; }

    public int RecordIndex { get; set; }

    public int? FlowTime { get; set; }

    public double? Dp { get; set; }

    public double? PulseCount { get; set; }

    public double? Pf { get; set; }

    public double? Tf { get; set; }

    public double? Extension { get; set; }

    public double? Cprime { get; set; }

    public double? Volume { get; set; }

    public double? Energy { get; set; }

    public double? Mass { get; set; }

    public double? Kfactor { get; set; }

    public double? Fpv { get; set; }

    public int? PulseIndexStart { get; set; }

    public int? PulseIndexEnd { get; set; }

    public int? RawVolumeIndexStart { get; set; }

    public int? RawVolumeIndexEnd { get; set; }

    public int? VolumeIndexStart { get; set; }

    public int? VolumeIndexEnd { get; set; }

    public int? MassIndexStart { get; set; }

    public int? MassIndexEnd { get; set; }

    public double? UserDefined01 { get; set; }

    public double? UserDefined02 { get; set; }

    public double? UserDefined03 { get; set; }

    public double? UserDefined04 { get; set; }

    public double? UserDefined05 { get; set; }

    public double? UserDefined06 { get; set; }

    public double? UserDefined07 { get; set; }

    public double? UserDefined08 { get; set; }

    public string? UserDefined09 { get; set; }

    public string? UserDefined10 { get; set; }

    public double? DifferentialPressureY { get; set; }

    public float? Kappa { get; set; }

    public float? Viscosity { get; set; }

    public float? HeatingValue { get; set; }

    public float? RelativeDensity { get; set; }

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

    public double? VolumeCorrelationFactor { get; set; }

    public double? CasingPressure { get; set; }

    public double? TubingPressure { get; set; }

    public double? LinePressure { get; set; }

    public DateTime? DateTimeCreated { get; set; }

    public virtual Meter Meter { get; set; } = null!;
}
