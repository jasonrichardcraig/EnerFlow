using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class Ticket
{
    public int Id { get; set; }

    public int? OriginFacilityId { get; set; }

    public int? DestinationFacilityId { get; set; }

    public DateTime? TimeStamp { get; set; }

    public int? SequenceNumber { get; set; }

    public int? TicketDeviceTypeId { get; set; }

    public string? DeviceNumber { get; set; }

    public int? TicketTypeId { get; set; }

    public string? Origin { get; set; }

    public string? Destination { get; set; }

    public string? Shipper { get; set; }

    public string? Transporter { get; set; }

    public int? TicketTransportMethodId { get; set; }

    public DateTime? StartDate { get; set; }

    public DateTime? EndDate { get; set; }

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

    public double? Kfactor { get; set; }

    public double? MeterFactor { get; set; }

    public double? DensityCorrectionFactor { get; set; }

    public DateTime? ProveDate { get; set; }

    public DateTime? PycDate { get; set; }

    public string? SampleId { get; set; }

    public string? BatchNumber { get; set; }

    public string? VehicleId { get; set; }

    public string? ManifestId { get; set; }

    public string? Seal1Off { get; set; }

    public string? Seal1On { get; set; }

    public string? Seal2Off { get; set; }

    public string? Seal2On { get; set; }

    public string? Direction { get; set; }

    public string? Class { get; set; }

    public string? CustomerName { get; set; }

    public string? DriverId { get; set; }

    public string? TrailerNumber { get; set; }

    public string? SecondTrailerNumber { get; set; }

    public bool? Odorized { get; set; }

    public bool? ReadOnly { get; set; }

    public int? TicketComponentBasisId { get; set; }

    public double Methane { get; set; }

    public double Nitrogen { get; set; }

    public double CarbonDioxide { get; set; }

    public double Ethane { get; set; }

    public double Propane { get; set; }

    public double Water { get; set; }

    public double HydrogenSulfide { get; set; }

    public double Hydrogen { get; set; }

    public double CarbonMonoxide { get; set; }

    public double Oxygen { get; set; }

    public double IButane { get; set; }

    public double NButane { get; set; }

    public double IPentane { get; set; }

    public double NPentane { get; set; }

    public double Hexane { get; set; }

    public double Heptane { get; set; }

    public double Octane { get; set; }

    public double Nonane { get; set; }

    public double Decane { get; set; }

    public double Helium { get; set; }

    public double Argon { get; set; }

    public double? Viscosity { get; set; }

    public double? Kappa { get; set; }

    public double? ReidVaporPressure { get; set; }

    public double? OdorantAmount { get; set; }

    public int? OdorantUnitId { get; set; }

    public int? ViscosityUnitId { get; set; }

    public DateTime? DateTimeCreated { get; set; }

    public virtual AlphaUnit? AlphaUnit { get; set; }

    public virtual Unit? CompressibilityFactorUnit { get; set; }

    public virtual Unit? DensityUnit { get; set; }

    public virtual Facility? DestinationFacility { get; set; }

    public virtual FluidStandard? FluidStandard { get; set; }

    public virtual FluidType? FluidType { get; set; }

    public virtual Unit? OdorantUnit { get; set; }

    public virtual Facility? OriginFacility { get; set; }

    public virtual Unit? TemperatureBaseUnit { get; set; }

    public virtual TicketComponentBasis? TicketComponentBasis { get; set; }

    public virtual TicketDeviceType? TicketDeviceType { get; set; }

    public virtual ICollection<TicketMeterRecord> TicketMeterRecords { get; set; } = new List<TicketMeterRecord>();

    public virtual ICollection<TicketScaleRecord> TicketScaleRecords { get; set; } = new List<TicketScaleRecord>();

    public virtual ICollection<TicketTankRecord> TicketTankRecords { get; set; } = new List<TicketTankRecord>();

    public virtual TicketTransportMethod? TicketTransportMethod { get; set; }

    public virtual TicketType? TicketType { get; set; }

    public virtual Unit? ViscosityUnit { get; set; }
}
