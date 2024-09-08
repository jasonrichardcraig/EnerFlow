using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class Facility
{
    public int Id { get; set; }

    public int HierarchyId { get; set; }

    public int FacilitySubTypeId { get; set; }

    public string? Name { get; set; }

    public string? UniqueFacilityIdentifier { get; set; }

    public string? Location { get; set; }

    public double? Latitude { get; set; }

    public double? Longitude { get; set; }

    public string? OperatorCode { get; set; }

    public string? OperatorName { get; set; }

    public string? LicenceNumber { get; set; }

    public string? LicenseeCode { get; set; }

    public int? WasteLocationTypeId { get; set; }

    public DateTime? DateTimeCreated { get; set; }

    public virtual ICollection<Equipment> Equipment { get; set; } = new List<Equipment>();

    public virtual ICollection<FacilityDailyActivity> FacilityDailyActivityActivityFacilities { get; set; } = new List<FacilityDailyActivity>();

    public virtual ICollection<FacilityDailyActivity> FacilityDailyActivityFacilities { get; set; } = new List<FacilityDailyActivity>();

    public virtual ICollection<FacilityDailyFugitiveEmission> FacilityDailyFugitiveEmissions { get; set; } = new List<FacilityDailyFugitiveEmission>();

    public virtual ICollection<FacilityDailyTransaction> FacilityDailyTransactions { get; set; } = new List<FacilityDailyTransaction>();

    public virtual ICollection<FacilityMonthlyActivity> FacilityMonthlyActivityActivityFacilities { get; set; } = new List<FacilityMonthlyActivity>();

    public virtual ICollection<FacilityMonthlyActivity> FacilityMonthlyActivityFacilities { get; set; } = new List<FacilityMonthlyActivity>();

    public virtual ICollection<FacilityMonthlyFugitiveEmission> FacilityMonthlyFugitiveEmissions { get; set; } = new List<FacilityMonthlyFugitiveEmission>();

    public virtual ICollection<FacilityStatus> FacilityStatuses { get; set; } = new List<FacilityStatus>();

    public virtual FacilitySubType FacilitySubType { get; set; } = null!;

    public virtual ICollection<GasBatchRecord> GasBatchRecords { get; set; } = new List<GasBatchRecord>();

    public virtual Hierarchy Hierarchy { get; set; } = null!;

    public virtual ICollection<LiquidBatchRecord> LiquidBatchRecords { get; set; } = new List<LiquidBatchRecord>();

    public virtual ICollection<Meter> Meters { get; set; } = new List<Meter>();

    public virtual ICollection<Pump> Pumps { get; set; } = new List<Pump>();

    public virtual Tank? Tank { get; set; }

    public virtual ICollection<Ticket> TicketDestinationFacilities { get; set; } = new List<Ticket>();

    public virtual ICollection<Ticket> TicketOriginFacilities { get; set; } = new List<Ticket>();

    public virtual WasteLocationType? WasteLocationType { get; set; }

    public virtual ICollection<WastePlantDailyActivity> WastePlantDailyActivityActivityFacilities { get; set; } = new List<WastePlantDailyActivity>();

    public virtual ICollection<WastePlantDailyActivity> WastePlantDailyActivityFacilities { get; set; } = new List<WastePlantDailyActivity>();

    public virtual ICollection<WastePlantMonthlyActivity> WastePlantMonthlyActivityActivityFacilities { get; set; } = new List<WastePlantMonthlyActivity>();

    public virtual ICollection<WastePlantMonthlyActivity> WastePlantMonthlyActivityFacilities { get; set; } = new List<WastePlantMonthlyActivity>();

    public virtual ICollection<WellStatus> WellStatusPrimaryLinkedFacilities { get; set; } = new List<WellStatus>();

    public virtual ICollection<WellStatus> WellStatusSecondaryLinkedFacilities { get; set; } = new List<WellStatus>();

    public virtual ICollection<Well> Wells { get; set; } = new List<Well>();
}
