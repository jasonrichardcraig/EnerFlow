using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class Unit
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string Symbol { get; set; } = null!;

    public string ConvertFrom { get; set; } = null!;

    public string? ConvertTo { get; set; }

    public int? BaseUnitId { get; set; }

    public int FormulaTypeId { get; set; }

    public int UnitClassId { get; set; }

    public virtual ICollection<Alarm> Alarms { get; set; } = new List<Alarm>();

    public virtual ICollection<AnalogIoTag> AnalogIoTags { get; set; } = new List<AnalogIoTag>();

    public virtual Unit? BaseUnit { get; set; }

    public virtual UnitFormulaType FormulaType { get; set; } = null!;

    public virtual ICollection<Unit> InverseBaseUnit { get; set; } = new List<Unit>();

    public virtual ICollection<LiquidBatchRecord> LiquidBatchRecordDensityUnits { get; set; } = new List<LiquidBatchRecord>();

    public virtual ICollection<LiquidBatchRecord> LiquidBatchRecordEvpUnits { get; set; } = new List<LiquidBatchRecord>();

    public virtual ICollection<LiquidBatchRecord> LiquidBatchRecordTemperatureBaseUnits { get; set; } = new List<LiquidBatchRecord>();

    public virtual ICollection<MassHeatingValueUnit> MassHeatingValueUnitEnergyUnits { get; set; } = new List<MassHeatingValueUnit>();

    public virtual ICollection<MassHeatingValueUnit> MassHeatingValueUnitMassUnits { get; set; } = new List<MassHeatingValueUnit>();

    public virtual ICollection<MeterConfiguration> MeterConfigurationAlphaUnitNavigations { get; set; } = new List<MeterConfiguration>();

    public virtual ICollection<MeterConfiguration> MeterConfigurationAtmosphericPressureUnits { get; set; } = new List<MeterConfiguration>();

    public virtual ICollection<MeterConfiguration> MeterConfigurationBoreDiameterUnits { get; set; } = new List<MeterConfiguration>();

    public virtual ICollection<MeterConfiguration> MeterConfigurationBoreReferenceTemperatureUnits { get; set; } = new List<MeterConfiguration>();

    public virtual ICollection<MeterConfiguration> MeterConfigurationDensityUnits { get; set; } = new List<MeterConfiguration>();

    public virtual ICollection<MeterConfiguration> MeterConfigurationDifferentialPressureUnitNavigations { get; set; } = new List<MeterConfiguration>();

    public virtual ICollection<MeterConfiguration> MeterConfigurationEnergyUnitNavigations { get; set; } = new List<MeterConfiguration>();

    public virtual ICollection<MeterConfiguration> MeterConfigurationEquilibriumVaporPressureUnits { get; set; } = new List<MeterConfiguration>();

    public virtual ICollection<MeterConfiguration> MeterConfigurationGasPressureBaseUnits { get; set; } = new List<MeterConfiguration>();

    public virtual ICollection<MeterConfiguration> MeterConfigurationGrossStandardVolumeUnits { get; set; } = new List<MeterConfiguration>();

    public virtual ICollection<MeterConfiguration> MeterConfigurationGrossVolumeUnits { get; set; } = new List<MeterConfiguration>();

    public virtual ICollection<MeterConfiguration> MeterConfigurationIndicatedVolumeUnits { get; set; } = new List<MeterConfiguration>();

    public virtual ICollection<MeterConfiguration> MeterConfigurationMassUnits { get; set; } = new List<MeterConfiguration>();

    public virtual ICollection<MeterConfiguration> MeterConfigurationMeasuredVolumeUnitNavigations { get; set; } = new List<MeterConfiguration>();

    public virtual ICollection<MeterConfiguration> MeterConfigurationNetStandardVolumeUnits { get; set; } = new List<MeterConfiguration>();

    public virtual ICollection<MeterConfiguration> MeterConfigurationObservedDensityUnits { get; set; } = new List<MeterConfiguration>();

    public virtual ICollection<MeterConfiguration> MeterConfigurationPipeDiameterUnits { get; set; } = new List<MeterConfiguration>();

    public virtual ICollection<MeterConfiguration> MeterConfigurationPipeLengthUnits { get; set; } = new List<MeterConfiguration>();

    public virtual ICollection<MeterConfiguration> MeterConfigurationPipeReferenceTemperatureUnits { get; set; } = new List<MeterConfiguration>();

    public virtual ICollection<MeterConfiguration> MeterConfigurationRawVolumeUnitNavigations { get; set; } = new List<MeterConfiguration>();

    public virtual ICollection<MeterConfiguration> MeterConfigurationStaticPressureUnitNavigations { get; set; } = new List<MeterConfiguration>();

    public virtual ICollection<MeterConfiguration> MeterConfigurationTemperatureBaseUnits { get; set; } = new List<MeterConfiguration>();

    public virtual ICollection<MeterConfiguration> MeterConfigurationTemperatureUnitNavigations { get; set; } = new List<MeterConfiguration>();

    public virtual ICollection<MeterConfiguration> MeterConfigurationViscosityUnits { get; set; } = new List<MeterConfiguration>();

    public virtual ICollection<PeriodicLiquidFlowRecord> PeriodicLiquidFlowRecordDensityUnits { get; set; } = new List<PeriodicLiquidFlowRecord>();

    public virtual ICollection<PeriodicLiquidFlowRecord> PeriodicLiquidFlowRecordTemperatureBaseUnits { get; set; } = new List<PeriodicLiquidFlowRecord>();

    public virtual ICollection<Ticket> TicketCompressibilityFactorUnits { get; set; } = new List<Ticket>();

    public virtual ICollection<Ticket> TicketDensityUnits { get; set; } = new List<Ticket>();

    public virtual ICollection<TicketMeterRecord> TicketMeterRecordAtmosphericPressureUnitNavigations { get; set; } = new List<TicketMeterRecord>();

    public virtual ICollection<TicketMeterRecord> TicketMeterRecordBoreDiameterUnitNavigations { get; set; } = new List<TicketMeterRecord>();

    public virtual ICollection<TicketMeterRecord> TicketMeterRecordBoreReferenceTemperatureUnits { get; set; } = new List<TicketMeterRecord>();

    public virtual ICollection<TicketMeterRecord> TicketMeterRecordDensityUnits { get; set; } = new List<TicketMeterRecord>();

    public virtual ICollection<TicketMeterRecord> TicketMeterRecordDifferentialPressureUnits { get; set; } = new List<TicketMeterRecord>();

    public virtual ICollection<TicketMeterRecord> TicketMeterRecordPipeDiameterUnitNavigations { get; set; } = new List<TicketMeterRecord>();

    public virtual ICollection<TicketMeterRecord> TicketMeterRecordPipeLengthUnitNavigations { get; set; } = new List<TicketMeterRecord>();

    public virtual ICollection<TicketMeterRecord> TicketMeterRecordPipeReferenceTemperatureUnits { get; set; } = new List<TicketMeterRecord>();

    public virtual ICollection<TicketMeterRecord> TicketMeterRecordPressureUnits { get; set; } = new List<TicketMeterRecord>();

    public virtual ICollection<TicketMeterRecord> TicketMeterRecordTemperatureUnits { get; set; } = new List<TicketMeterRecord>();

    public virtual ICollection<Ticket> TicketOdorantUnits { get; set; } = new List<Ticket>();

    public virtual ICollection<TicketScaleRecord> TicketScaleRecordDensityUnits { get; set; } = new List<TicketScaleRecord>();

    public virtual ICollection<TicketScaleRecord> TicketScaleRecordStandardVolumeUnitNavigations { get; set; } = new List<TicketScaleRecord>();

    public virtual ICollection<TicketScaleRecord> TicketScaleRecordTemperatureUnits { get; set; } = new List<TicketScaleRecord>();

    public virtual ICollection<TicketScaleRecord> TicketScaleRecordWeightUnits { get; set; } = new List<TicketScaleRecord>();

    public virtual ICollection<TicketTankRecord> TicketTankRecordBaseTemperatureUnits { get; set; } = new List<TicketTankRecord>();

    public virtual ICollection<TicketTankRecord> TicketTankRecordLevelUnits { get; set; } = new List<TicketTankRecord>();

    public virtual ICollection<TicketTankRecord> TicketTankRecordLiquidDensityUnits { get; set; } = new List<TicketTankRecord>();

    public virtual ICollection<TicketTankRecord> TicketTankRecordMassUnits { get; set; } = new List<TicketTankRecord>();

    public virtual ICollection<TicketTankRecord> TicketTankRecordObservedVolumeUnits { get; set; } = new List<TicketTankRecord>();

    public virtual ICollection<TicketTankRecord> TicketTankRecordPressureUnits { get; set; } = new List<TicketTankRecord>();

    public virtual ICollection<TicketTankRecord> TicketTankRecordStandardVolumeUnits { get; set; } = new List<TicketTankRecord>();

    public virtual ICollection<TicketTankRecord> TicketTankRecordTemperatureUnits { get; set; } = new List<TicketTankRecord>();

    public virtual ICollection<TicketTankRecord> TicketTankRecordVesselDraftUnits { get; set; } = new List<TicketTankRecord>();

    public virtual ICollection<Ticket> TicketTemperatureBaseUnits { get; set; } = new List<Ticket>();

    public virtual ICollection<Ticket> TicketViscosityUnits { get; set; } = new List<Ticket>();

    public virtual UnitClass UnitClass { get; set; } = null!;

    public virtual ICollection<UnitSet> UnitSets { get; set; } = new List<UnitSet>();

    public virtual ICollection<VolumetricHeatingValueUnit> VolumetricHeatingValueUnitEnergyUnits { get; set; } = new List<VolumetricHeatingValueUnit>();

    public virtual ICollection<VolumetricHeatingValueUnit> VolumetricHeatingValueUnitVolumeUnits { get; set; } = new List<VolumetricHeatingValueUnit>();

    public virtual ICollection<UnitSet> UnitSetsNavigation { get; set; } = new List<UnitSet>();
}
