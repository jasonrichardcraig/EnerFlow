using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class TicketMeterRecord
{
    public int Id { get; set; }

    public int? MeterStandardId { get; set; }

    public int? TicketMeterCalculationMethodId { get; set; }

    public double? ObservedDensityCorrectedDensity { get; set; }

    public double? DensityTemperature { get; set; }

    public double? DensityPressure { get; set; }

    public double? DensityMeterFactor { get; set; }

    public double? UncorrectedDensity { get; set; }

    public double? MeterFlowingDensity { get; set; }

    public double? MeterTemperature { get; set; }

    public double? MeterPressure { get; set; }

    public double? MeterFactor { get; set; }

    public double? Kfactor { get; set; }

    public double? EquilibriumVaporPressure { get; set; }

    public double? Ctl { get; set; }

    public double? Cpl { get; set; }

    public double? Ctpl { get; set; }

    public double? Ccf { get; set; }

    public double? Dp { get; set; }

    public double? PulseCount { get; set; }

    public double? OpeningPulseIndex { get; set; }

    public double? ClosingPulseIndex { get; set; }

    public double? IndicatedVolume { get; set; }

    public double? OpeningIvindex { get; set; }

    public double? ClosingIvindex { get; set; }

    public double? GrossVolume { get; set; }

    public double? OpeningGvindex { get; set; }

    public double? ClosingGvindex { get; set; }

    public double? GrossStdVolume { get; set; }

    public double? OpeningGsvIndex { get; set; }

    public double? ClosingGsvIndex { get; set; }

    public double? NetStdVolume { get; set; }

    public double? OpeningNsvIndex { get; set; }

    public double? ClosingNsvIndex { get; set; }

    public double? SwVolume { get; set; }

    public double? OpeningSwindex { get; set; }

    public double? ClosingSwindex { get; set; }

    public double? SwPercent { get; set; }

    public double? SwCorrection { get; set; }

    public double? Mass { get; set; }

    public double? OpeningMassIndex { get; set; }

    public double? ClosingMassIndex { get; set; }

    public double? TotalizerDigits { get; set; }

    public double? FixedFactor { get; set; }

    public int? DensityUnitId { get; set; }

    public int? TemperatureUnitId { get; set; }

    public int? PressureUnitId { get; set; }

    public int? VolumeKfactorUnitId { get; set; }

    public int? MassKfactorUnitId { get; set; }

    public int? VolumeUnitId { get; set; }

    public int? MassUnitId { get; set; }

    public int? DifferentialPressureUnitId { get; set; }

    public int? PipeReferenceTemperatureUnitId { get; set; }

    public int? BoreReferenceTemperatureUnitId { get; set; }

    public int? BoreDiameterUnit { get; set; }

    public int? PipeDiameterUnit { get; set; }

    public int? PipeLengthUnit { get; set; }

    public int? AtmosphericPressureUnit { get; set; }

    public int? StaticPressureMeasurementId { get; set; }

    public double? AtmosphericPressure { get; set; }

    public double? PipeDiameter { get; set; }

    public double? PipeRefTemp { get; set; }

    public int? PipeMaterialId { get; set; }

    public double? BoreDiameter { get; set; }

    public double? PlateReferenceTemp { get; set; }

    public int? BoreMaterialId { get; set; }

    public int? TapTypeId { get; set; }

    public int? StaticTapTypeId { get; set; }

    public int? ExtensionDefinitionId { get; set; }

    public bool? FlowingPressureEnabled { get; set; }

    public double? FlowingPressureEffect { get; set; }

    public double? CalibrationPressure { get; set; }

    public bool? PressureCompensated { get; set; }

    public bool? TemperatureCompensated { get; set; }

    public double? PipeLength { get; set; }

    public string? MeterId { get; set; }

    public int TicketId { get; set; }

    public DateTime? DateTimeCreated { get; set; }

    public virtual Unit? AtmosphericPressureUnitNavigation { get; set; }

    public virtual Unit? BoreDiameterUnitNavigation { get; set; }

    public virtual Material? BoreMaterial { get; set; }

    public virtual Unit? BoreReferenceTemperatureUnit { get; set; }

    public virtual Unit? DensityUnit { get; set; }

    public virtual Unit? DifferentialPressureUnit { get; set; }

    public virtual ExtensionDefinition? ExtensionDefinition { get; set; }

    public virtual MeterStandard? MeterStandard { get; set; }

    public virtual Unit? PipeDiameterUnitNavigation { get; set; }

    public virtual Unit? PipeLengthUnitNavigation { get; set; }

    public virtual Material? PipeMaterial { get; set; }

    public virtual Unit? PipeReferenceTemperatureUnit { get; set; }

    public virtual Unit? PressureUnit { get; set; }

    public virtual StaticPressureMeasurement? StaticPressureMeasurement { get; set; }

    public virtual StaticTapType? StaticTapType { get; set; }

    public virtual TapType? TapType { get; set; }

    public virtual Unit? TemperatureUnit { get; set; }

    public virtual Ticket Ticket { get; set; } = null!;

    public virtual TicketMeterCalculationMethod? TicketMeterCalculationMethod { get; set; }
}
