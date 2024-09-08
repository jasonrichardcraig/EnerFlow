using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class GasBatchRecord
{
    public int Id { get; set; }

    public int? FacilityId { get; set; }

    public DateTime? TimeStamp { get; set; }

    public DateTime? EndTimeStamp { get; set; }

    public int? BatchTypeId { get; set; }

    public int? FluidStandardId { get; set; }

    public int? FluidTypeId { get; set; }

    public int? TemperatureBaseUnitId { get; set; }

    public double? TemperatureBase { get; set; }

    public double? CompressibilityFactor { get; set; }

    public int? CompressibilityFactorUnitId { get; set; }

    public string? BatchId { get; set; }

    public int? ReportNumber { get; set; }

    public float? UncorrectedDensity { get; set; }

    public float? MeterFlowingDensity { get; set; }

    public float? MeterTemperature { get; set; }

    public float? MeterPressure { get; set; }

    public float? MeterFactor { get; set; }

    public float? Kfactor { get; set; }

    public double? Dp { get; set; }

    public double? Extension { get; set; }

    public double? Cprime { get; set; }

    public double? PulseCount { get; set; }

    public double? PulseIndexStart { get; set; }

    public double? PulseIndexEnd { get; set; }

    public double? Mass { get; set; }

    public double? MassIndexStart { get; set; }

    public double? MassIndexEnd { get; set; }

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

    public double? RelativeDensity { get; set; }

    public double? Apidegrees { get; set; }

    public int? FlowTime { get; set; }

    public string? Witness { get; set; }

    public string? Transporter { get; set; }

    public string? ManifestId { get; set; }

    public string? Origin { get; set; }

    public string? Destination { get; set; }

    public string? VehicleId { get; set; }

    public string? DriverId { get; set; }

    public string? TrailerNumber { get; set; }

    public string? Consignee { get; set; }

    public string? Consignor { get; set; }

    public string? Seal1On { get; set; }

    public string? Seal1Off { get; set; }

    public string? Seal2On { get; set; }

    public string? Seal2Off { get; set; }

    public DateTime? CustomTimeStamp { get; set; }

    public string? CustomString01 { get; set; }

    public string? CustomString02 { get; set; }

    public string? CustomString03 { get; set; }

    public string? CustomString04 { get; set; }

    public string? CustomString05 { get; set; }

    public string? CustomString06 { get; set; }

    public string? CustomString07 { get; set; }

    public string? CustomString08 { get; set; }

    public double? CustomNumeric01 { get; set; }

    public double? CustomNumeric02 { get; set; }

    public double? CustomNumeric03 { get; set; }

    public double? CustomNumeric04 { get; set; }

    public double? CustomNumeric05 { get; set; }

    public double? CustomNumeric06 { get; set; }

    public double? CustomNumeric07 { get; set; }

    public double? CustomNumeric08 { get; set; }

    public DateTime? CustomDate01 { get; set; }

    public DateTime? CustomDate02 { get; set; }

    public DateTime? CustomDate03 { get; set; }

    public DateTime? CustomDate04 { get; set; }

    public DateTime? DateTimeCreated { get; set; }

    public virtual Facility? Facility { get; set; }
}
