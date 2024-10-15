using System;
using System.Collections.Generic;
using EnerFlow.Models;
using Microsoft.EntityFrameworkCore;

namespace EnerFlow.Data;

public partial class EnerFlowContext : DbContext
{
    public EnerFlowContext()
    {
    }

    public EnerFlowContext(DbContextOptions<EnerFlowContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Alarm> Alarms { get; set; }

    public virtual DbSet<AlarmNote> AlarmNotes { get; set; }

    public virtual DbSet<AlarmPriority> AlarmPriorities { get; set; }

    public virtual DbSet<AlarmStatus> AlarmStatuses { get; set; }

    public virtual DbSet<AlarmType> AlarmTypes { get; set; }

    public virtual DbSet<AlphaUnit> AlphaUnits { get; set; }

    public virtual DbSet<AnalogIoTag> AnalogIoTags { get; set; }

    public virtual DbSet<AnalogIoTagCurrentValue> AnalogIoTagCurrentValues { get; set; }

    public virtual DbSet<AnalogIoTagValueHistory> AnalogIoTagValueHistories { get; set; }

    public virtual DbSet<BatchType> BatchTypes { get; set; }

    public virtual DbSet<Calculation> Calculations { get; set; }

    public virtual DbSet<CalculationErrorMessageType> CalculationErrorMessageTypes { get; set; }

    public virtual DbSet<CompressibilityFactorUnit> CompressibilityFactorUnits { get; set; }

    public virtual DbSet<ConeType> ConeTypes { get; set; }

    public virtual DbSet<ContextTag> ContextTags { get; set; }

    public virtual DbSet<ContextTagProperty> ContextTagProperties { get; set; }

    public virtual DbSet<DailyGasFlowRecord> DailyGasFlowRecords { get; set; }

    public virtual DbSet<DailyLiquidFlowRecord> DailyLiquidFlowRecords { get; set; }

    public virtual DbSet<Device> Devices { get; set; }

    public virtual DbSet<DeviceCommand> DeviceCommands { get; set; }

    public virtual DbSet<DeviceCommandParameter> DeviceCommandParameters { get; set; }

    public virtual DbSet<DeviceCommandParameterDataType> DeviceCommandParameterDataTypes { get; set; }

    public virtual DbSet<DeviceType> DeviceTypes { get; set; }

    public virtual DbSet<Diagram> Diagrams { get; set; }

    public virtual DbSet<DigitalIoTag> DigitalIoTags { get; set; }

    public virtual DbSet<DigitalIoTagCurrentValue> DigitalIoTagCurrentValues { get; set; }

    public virtual DbSet<DigitalIoTagValueHistory> DigitalIoTagValueHistories { get; set; }

    public virtual DbSet<Document> Documents { get; set; }

    public virtual DbSet<EnergyDevelopmentCategoryType> EnergyDevelopmentCategoryTypes { get; set; }

    public virtual DbSet<Equipment> Equipment { get; set; }

    public virtual DbSet<EquipmentStatus> EquipmentStatuses { get; set; }

    public virtual DbSet<EquipmentSubType> EquipmentSubTypes { get; set; }

    public virtual DbSet<EquipmentType> EquipmentTypes { get; set; }

    public virtual DbSet<ExtensionDefinition> ExtensionDefinitions { get; set; }

    public virtual DbSet<Facility> Facilities { get; set; }

    public virtual DbSet<FacilityActivityType> FacilityActivityTypes { get; set; }

    public virtual DbSet<FacilityDailyActivity> FacilityDailyActivities { get; set; }

    public virtual DbSet<FacilityDailyFugitiveEmission> FacilityDailyFugitiveEmissions { get; set; }

    public virtual DbSet<FacilityDailyTransaction> FacilityDailyTransactions { get; set; }

    public virtual DbSet<FacilityMonthlyActivity> FacilityMonthlyActivities { get; set; }

    public virtual DbSet<FacilityMonthlyFugitiveEmission> FacilityMonthlyFugitiveEmissions { get; set; }

    public virtual DbSet<FacilityStatus> FacilityStatuses { get; set; }

    public virtual DbSet<FacilityStatusType> FacilityStatusTypes { get; set; }

    public virtual DbSet<FacilitySubType> FacilitySubTypes { get; set; }

    public virtual DbSet<FacilityType> FacilityTypes { get; set; }

    public virtual DbSet<FittingType> FittingTypes { get; set; }

    public virtual DbSet<FluidPhase> FluidPhases { get; set; }

    public virtual DbSet<FluidStandard> FluidStandards { get; set; }

    public virtual DbSet<FluidState> FluidStates { get; set; }

    public virtual DbSet<FluidType> FluidTypes { get; set; }

    public virtual DbSet<Folder> Folders { get; set; }

    public virtual DbSet<GasBatchRecord> GasBatchRecords { get; set; }

    public virtual DbSet<GasVolumeKfactorUnit> GasVolumeKfactorUnits { get; set; }

    public virtual DbSet<HeatingValueStandard> HeatingValueStandards { get; set; }

    public virtual DbSet<Hierarchy> Hierarchies { get; set; }

    public virtual DbSet<HourlyGasFlowRecord> HourlyGasFlowRecords { get; set; }

    public virtual DbSet<HourlyLiquidFlowRecord> HourlyLiquidFlowRecords { get; set; }

    public virtual DbSet<IpChannel> IpChannels { get; set; }

    public virtual DbSet<LinearMeterCalculationMode> LinearMeterCalculationModes { get; set; }

    public virtual DbSet<LinearMeterCalculationUnitType> LinearMeterCalculationUnitTypes { get; set; }

    public virtual DbSet<LiquidBatchRecord> LiquidBatchRecords { get; set; }

    public virtual DbSet<LiquidVolumeKfactorUnit> LiquidVolumeKfactorUnits { get; set; }

    public virtual DbSet<MaintenanceRecord> MaintenanceRecords { get; set; }

    public virtual DbSet<MaintenanceType> MaintenanceTypes { get; set; }

    public virtual DbSet<MassHeatingValueUnit> MassHeatingValueUnits { get; set; }

    public virtual DbSet<MassKfactorUnit> MassKfactorUnits { get; set; }

    public virtual DbSet<Material> Materials { get; set; }

    public virtual DbSet<Meter> Meters { get; set; }

    public virtual DbSet<MeterAlarm> MeterAlarms { get; set; }

    public virtual DbSet<MeterConfiguration> MeterConfigurations { get; set; }

    public virtual DbSet<MeterEvent> MeterEvents { get; set; }

    public virtual DbSet<MeterEventType> MeterEventTypes { get; set; }

    public virtual DbSet<MeterException> MeterExceptions { get; set; }

    public virtual DbSet<MeterExceptionResolutionType> MeterExceptionResolutionTypes { get; set; }

    public virtual DbSet<MeterExceptionType> MeterExceptionTypes { get; set; }

    public virtual DbSet<MeterExportType> MeterExportTypes { get; set; }

    public virtual DbSet<MeterFactorUsage> MeterFactorUsages { get; set; }

    public virtual DbSet<MeterPurpose> MeterPurposes { get; set; }

    public virtual DbSet<MeterRun> MeterRuns { get; set; }

    public virtual DbSet<MeterStandard> MeterStandards { get; set; }

    public virtual DbSet<NodeType> NodeTypes { get; set; }

    public virtual DbSet<NodeTypeDailyLogProperty> NodeTypeDailyLogProperties { get; set; }

    public virtual DbSet<NozzleType> NozzleTypes { get; set; }

    public virtual DbSet<Observation> Observations { get; set; }

    public virtual DbSet<PeriodicGasFlowRecord> PeriodicGasFlowRecords { get; set; }

    public virtual DbSet<PeriodicLiquidFlowRecord> PeriodicLiquidFlowRecords { get; set; }

    public virtual DbSet<PowerSource> PowerSources { get; set; }

    public virtual DbSet<ProductType> ProductTypes { get; set; }

    public virtual DbSet<PulseType> PulseTypes { get; set; }

    public virtual DbSet<Pump> Pumps { get; set; }

    public virtual DbSet<PumpDailyTransaction> PumpDailyTransactions { get; set; }

    public virtual DbSet<PumpType> PumpTypes { get; set; }

    public virtual DbSet<ReferenceEquation> ReferenceEquations { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    public virtual DbSet<RunSheet> RunSheets { get; set; }

    public virtual DbSet<RunSheetDailyLog> RunSheetDailyLogs { get; set; }

    public virtual DbSet<RunSheetDailyLogEntry> RunSheetDailyLogEntries { get; set; }

    public virtual DbSet<RunSheetItem> RunSheetItems { get; set; }

    public virtual DbSet<RunSheetItemCapturePoint> RunSheetItemCapturePoints { get; set; }

    public virtual DbSet<SampleType> SampleTypes { get; set; }

    public virtual DbSet<SaturationCondition> SaturationConditions { get; set; }

    public virtual DbSet<Screen> Screens { get; set; }

    public virtual DbSet<SerialPortChannel> SerialPortChannels { get; set; }

    public virtual DbSet<SignalType> SignalTypes { get; set; }

    public virtual DbSet<StaticPressureMeasurement> StaticPressureMeasurements { get; set; }

    public virtual DbSet<StaticTapType> StaticTapTypes { get; set; }

    public virtual DbSet<StringIoTag> StringIoTags { get; set; }

    public virtual DbSet<StringIoTagCurrentValue> StringIoTagCurrentValues { get; set; }

    public virtual DbSet<StringIoTagTrendValueDictionary> StringIoTagTrendValueDictionaries { get; set; }

    public virtual DbSet<StringIoTagTrendValueDictionaryItem> StringIoTagTrendValueDictionaryItems { get; set; }

    public virtual DbSet<StringIoTagValueHistory> StringIoTagValueHistories { get; set; }

    public virtual DbSet<TagValueEnumeration> TagValueEnumerations { get; set; }

    public virtual DbSet<TagValueEnumerationConstant> TagValueEnumerationConstants { get; set; }

    public virtual DbSet<Tank> Tanks { get; set; }

    public virtual DbSet<TankDailyTransaction> TankDailyTransactions { get; set; }

    public virtual DbSet<TankType> TankTypes { get; set; }

    public virtual DbSet<TapType> TapTypes { get; set; }

    public virtual DbSet<Ticket> Tickets { get; set; }

    public virtual DbSet<TicketComponentBasis> TicketComponentBases { get; set; }

    public virtual DbSet<TicketDeviceType> TicketDeviceTypes { get; set; }

    public virtual DbSet<TicketMeterCalculationMethod> TicketMeterCalculationMethods { get; set; }

    public virtual DbSet<TicketMeterRecord> TicketMeterRecords { get; set; }

    public virtual DbSet<TicketScaleRecord> TicketScaleRecords { get; set; }

    public virtual DbSet<TicketTankCalculationStandard> TicketTankCalculationStandards { get; set; }

    public virtual DbSet<TicketTankCustodyTransferCalculationMethod> TicketTankCustodyTransferCalculationMethods { get; set; }

    public virtual DbSet<TicketTankLevelType> TicketTankLevelTypes { get; set; }

    public virtual DbSet<TicketTankRecord> TicketTankRecords { get; set; }

    public virtual DbSet<TicketTankShellMaterial> TicketTankShellMaterials { get; set; }

    public virtual DbSet<TicketTransportMethod> TicketTransportMethods { get; set; }

    public virtual DbSet<TicketType> TicketTypes { get; set; }

    public virtual DbSet<TurbineRotorMode> TurbineRotorModes { get; set; }

    public virtual DbSet<UltrasonicDiagnosticHistory> UltrasonicDiagnosticHistories { get; set; }

    public virtual DbSet<Unit> Units { get; set; }

    public virtual DbSet<UnitClass> UnitClasses { get; set; }

    public virtual DbSet<UnitFormulaType> UnitFormulaTypes { get; set; }

    public virtual DbSet<UnitSet> UnitSets { get; set; }

    public virtual DbSet<User> Users { get; set; }

    public virtual DbSet<Vessel> Vessels { get; set; }

    public virtual DbSet<VesselType> VesselTypes { get; set; }

    public virtual DbSet<ViscosityEquation> ViscosityEquations { get; set; }

    public virtual DbSet<VolumetricHeatingValueUnit> VolumetricHeatingValueUnits { get; set; }

    public virtual DbSet<WasteCode> WasteCodes { get; set; }

    public virtual DbSet<WasteLocationType> WasteLocationTypes { get; set; }

    public virtual DbSet<WastePlantDailyActivity> WastePlantDailyActivities { get; set; }

    public virtual DbSet<WastePlantMonthlyActivity> WastePlantMonthlyActivities { get; set; }

    public virtual DbSet<WaterRegion> WaterRegions { get; set; }

    public virtual DbSet<Well> Wells { get; set; }

    public virtual DbSet<WellComminglingProcess> WellComminglingProcesses { get; set; }

    public virtual DbSet<WellComminglingStatus> WellComminglingStatuses { get; set; }

    public virtual DbSet<WellDailyProduction> WellDailyProductions { get; set; }

    public virtual DbSet<WellDirectionalDrilling> WellDirectionalDrillings { get; set; }

    public virtual DbSet<WellFluid> WellFluids { get; set; }

    public virtual DbSet<WellHistory> WellHistories { get; set; }

    public virtual DbSet<WellMode> WellModes { get; set; }

    public virtual DbSet<WellMonthlyProduction> WellMonthlyProductions { get; set; }

    public virtual DbSet<WellPerforationTreatment> WellPerforationTreatments { get; set; }

    public virtual DbSet<WellProductionDatum> WellProductionData { get; set; }

    public virtual DbSet<WellStatus> WellStatuses { get; set; }

    public virtual DbSet<WellStatusType> WellStatusTypes { get; set; }

    public virtual DbSet<WellStructure> WellStructures { get; set; }

    public virtual DbSet<WellTest> WellTests { get; set; }

    public virtual DbSet<WellType> WellTypes { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=(local);Initial Catalog=EnerFlow;TrustServerCertificate=True;Integrated Security=true", x => x.UseHierarchyId());

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Alarm>(entity =>
        {
            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.AlarmSource)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.AlarmStatusId).HasColumnName("AlarmStatusID");
            entity.Property(e => e.Description)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.HierarchyId).HasColumnName("HierarchyID");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.TimeStamp).HasColumnType("datetime");
            entity.Property(e => e.UnitId).HasColumnName("UnitID");
            entity.Property(e => e.Value).HasColumnType("sql_variant");

            entity.HasOne(d => d.AcknowledgedByUserNavigation).WithMany(p => p.Alarms)
                .HasForeignKey(d => d.AcknowledgedByUser)
                .HasConstraintName("FK_Alarms_Users");

            entity.HasOne(d => d.AlarmPriorityNavigation).WithMany(p => p.Alarms)
                .HasForeignKey(d => d.AlarmPriority)
                .HasConstraintName("FK_Alarms_AlarmPriorities");

            entity.HasOne(d => d.AlarmStatus).WithMany(p => p.Alarms)
                .HasForeignKey(d => d.AlarmStatusId)
                .HasConstraintName("FK_Alarms_AlarmStatuses");

            entity.HasOne(d => d.AlarmTypeNavigation).WithMany(p => p.Alarms)
                .HasForeignKey(d => d.AlarmType)
                .HasConstraintName("FK_Alarms_AlarmTypes");

            entity.HasOne(d => d.Unit).WithMany(p => p.Alarms)
                .HasForeignKey(d => d.UnitId)
                .HasConstraintName("FK_Alarms_Units");
        });

        modelBuilder.Entity<AlarmNote>(entity =>
        {
            entity.HasKey(e => new { e.AlarmId, e.TimeStamp });

            entity.Property(e => e.AlarmId).HasColumnName("AlarmID");
            entity.Property(e => e.TimeStamp).HasColumnType("datetime");
            entity.Property(e => e.Notes)
                .HasMaxLength(1024)
                .IsUnicode(false);

            entity.HasOne(d => d.Alarm).WithMany(p => p.AlarmNotes)
                .HasForeignKey(d => d.AlarmId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_AlarmNotes_Alarms");
        });

        modelBuilder.Entity<AlarmPriority>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(32)
                .IsUnicode(false);
        });

        modelBuilder.Entity<AlarmStatus>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(32)
                .IsUnicode(false);
        });

        modelBuilder.Entity<AlarmType>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(32)
                .IsUnicode(false);
        });

        modelBuilder.Entity<AlphaUnit>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Code)
                .HasMaxLength(1)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(32)
                .IsUnicode(false);
        });

        modelBuilder.Entity<AnalogIoTag>(entity =>
        {
            entity.HasKey(e => e.HierarchyId);

            entity.Property(e => e.HierarchyId)
                .ValueGeneratedNever()
                .HasColumnName("HierarchyID");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.HighAlarmPriorityId).HasColumnName("HighAlarmPriorityID");
            entity.Property(e => e.HighHighAlarmPriorityId).HasColumnName("HighHighAlarmPriorityID");
            entity.Property(e => e.HistoryAddress)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.LineColor)
                .HasMaxLength(64)
                .IsUnicode(false);
            entity.Property(e => e.LineStyle)
                .HasMaxLength(64)
                .IsUnicode(false);
            entity.Property(e => e.LowAlarmPriorityId).HasColumnName("LowAlarmPriorityID");
            entity.Property(e => e.LowLowAlarmPriorityId).HasColumnName("LowLowAlarmPriorityID");
            entity.Property(e => e.ReadAddress)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Script).IsUnicode(false);
            entity.Property(e => e.TagValueEnumerationId).HasColumnName("TagValueEnumerationID");
            entity.Property(e => e.UnitId).HasColumnName("UnitID");
            entity.Property(e => e.WriteAddress)
                .HasMaxLength(255)
                .IsUnicode(false);

            entity.HasOne(d => d.Hierarchy).WithOne(p => p.AnalogIoTag)
                .HasForeignKey<AnalogIoTag>(d => d.HierarchyId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_AnalogIoTags_Hierarchy");

            entity.HasOne(d => d.HighAlarmPriority).WithMany(p => p.AnalogIoTagHighAlarmPriorities)
                .HasForeignKey(d => d.HighAlarmPriorityId)
                .HasConstraintName("FK_AnalogIoTags_HighAlarmPriorities");

            entity.HasOne(d => d.HighHighAlarmPriority).WithMany(p => p.AnalogIoTagHighHighAlarmPriorities)
                .HasForeignKey(d => d.HighHighAlarmPriorityId)
                .HasConstraintName("FK_AnalogIoTags_HighHighAlarmPriorities");

            entity.HasOne(d => d.LowAlarmPriority).WithMany(p => p.AnalogIoTagLowAlarmPriorities)
                .HasForeignKey(d => d.LowAlarmPriorityId)
                .HasConstraintName("FK_AnalogIoTags_LowAlarmPriorities");

            entity.HasOne(d => d.LowLowAlarmPriority).WithMany(p => p.AnalogIoTagLowLowAlarmPriorities)
                .HasForeignKey(d => d.LowLowAlarmPriorityId)
                .HasConstraintName("FK_AnalogIoTags_LowLowAlarmPriorities");

            entity.HasOne(d => d.TagValueEnumeration).WithMany(p => p.AnalogIoTags)
                .HasForeignKey(d => d.TagValueEnumerationId)
                .HasConstraintName("FK_AnalogIoTags_TagValueEnumerations");

            entity.HasOne(d => d.Unit).WithMany(p => p.AnalogIoTags)
                .HasForeignKey(d => d.UnitId)
                .HasConstraintName("FK_AnalogIoTags_Units");
        });

        modelBuilder.Entity<AnalogIoTagCurrentValue>(entity =>
        {
            entity.HasKey(e => e.AnalogIoTagId);

            entity.Property(e => e.AnalogIoTagId).ValueGeneratedNever();
            entity.Property(e => e.TimeStamp).HasColumnType("datetime");

            entity.HasOne(d => d.AnalogIoTag).WithOne(p => p.AnalogIoTagCurrentValue)
                .HasForeignKey<AnalogIoTagCurrentValue>(d => d.AnalogIoTagId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_AnalogIoTagCurrentValues_AnalogIoTags");
        });

        modelBuilder.Entity<AnalogIoTagValueHistory>(entity =>
        {
            entity.HasKey(e => new { e.AnalogIoTagId, e.TimeStamp });

            entity.ToTable("AnalogIoTagValueHistory");

            entity.Property(e => e.AnalogIoTagId).HasColumnName("AnalogIoTagID");
            entity.Property(e => e.TimeStamp).HasColumnType("datetime");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");

            entity.HasOne(d => d.AnalogIoTag).WithMany(p => p.AnalogIoTagValueHistories)
                .HasForeignKey(d => d.AnalogIoTagId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_AnalogIoTagValueHistory_AnalogIoTags");
        });

        modelBuilder.Entity<BatchType>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(32)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Calculation>(entity =>
        {
            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.BaseFluidPhaseId).HasColumnName("BaseFluidPhaseID");
            entity.Property(e => e.BoreMaterialId).HasColumnName("BoreMaterialID");
            entity.Property(e => e.ConeTypeId).HasColumnName("ConeTypeID");
            entity.Property(e => e.Cplb).HasColumnName("CPLb");
            entity.Property(e => e.Cplf).HasColumnName("CPLf");
            entity.Property(e => e.Cplo).HasColumnName("CPLo");
            entity.Property(e => e.Cstar).HasColumnName("CStar");
            entity.Property(e => e.Ctlb).HasColumnName("CTLb");
            entity.Property(e => e.Ctlf).HasColumnName("CTLf");
            entity.Property(e => e.Ctlo).HasColumnName("CTLo");
            entity.Property(e => e.Ctplb).HasColumnName("CTPLb");
            entity.Property(e => e.Ctplf).HasColumnName("CTPLf");
            entity.Property(e => e.Ctplo).HasColumnName("CTPLo");
            entity.Property(e => e.Dp).HasColumnName("DP");
            entity.Property(e => e.Erb).HasColumnName("ERb");
            entity.Property(e => e.ErrorMessageTypeId).HasColumnName("ErrorMessageTypeID");
            entity.Property(e => e.FlowingFluidPhaseId).HasColumnName("FlowingFluidPhaseID");
            entity.Property(e => e.FluidStandardId).HasColumnName("FluidStandardID");
            entity.Property(e => e.FluidStateId).HasColumnName("FluidStateID");
            entity.Property(e => e.FluidTypeId).HasColumnName("FluidTypeID");
            entity.Property(e => e.HeatingValueStandardId).HasColumnName("HeatingValueStandardID");
            entity.Property(e => e.Hl).HasColumnName("HL");
            entity.Property(e => e.Hv).HasColumnName("HV");
            entity.Property(e => e.HvGross).HasColumnName("HV_Gross");
            entity.Property(e => e.HvIdealVol).HasColumnName("HV_Ideal_Vol");
            entity.Property(e => e.HvNet).HasColumnName("HV_Net");
            entity.Property(e => e.IButane).HasColumnName("iButane");
            entity.Property(e => e.IPentane).HasColumnName("iPentane");
            entity.Property(e => e.Jt).HasColumnName("JT");
            entity.Property(e => e.K).HasColumnName("k");
            entity.Property(e => e.Kfactor).HasColumnName("KFactor");
            entity.Property(e => e.LinearMeterCalculationModeId).HasColumnName("LinearMeterCalculationModeID");
            entity.Property(e => e.LinearMeterCalculationUnitTypeId).HasColumnName("LinearMeterCalculationUnitTypeID");
            entity.Property(e => e.MeterId).HasColumnName("MeterID");
            entity.Property(e => e.MeterStandardId).HasColumnName("MeterStandardID");
            entity.Property(e => e.NButane).HasColumnName("nButane");
            entity.Property(e => e.NPentane).HasColumnName("nPentane");
            entity.Property(e => e.NozzleTypeId).HasColumnName("NozzleTypeID");
            entity.Property(e => e.Pgr).HasColumnName("PGr");
            entity.Property(e => e.Phv).HasColumnName("PHv");
            entity.Property(e => e.PipeMaterialId).HasColumnName("PipeMaterialID");
            entity.Property(e => e.Prho).HasColumnName("PRho");
            entity.Property(e => e.PulseTypeId).HasColumnName("PulseTypeID");
            entity.Property(e => e.RdIdeal).HasColumnName("RD_Ideal");
            entity.Property(e => e.RdReal).HasColumnName("RD_Real");
            entity.Property(e => e.RdUser).HasColumnName("RD_User");
            entity.Property(e => e.ReferenceEquationId).HasColumnName("ReferenceEquationID");
            entity.Property(e => e.SensingKfactor).HasColumnName("SensingKFactor");
            entity.Property(e => e.SignalTypeId).HasColumnName("SignalTypeID");
            entity.Property(e => e.Sl).HasColumnName("SL");
            entity.Property(e => e.StaticTapId).HasColumnName("StaticTapID");
            entity.Property(e => e.Sv).HasColumnName("SV");
            entity.Property(e => e.TapTypeId).HasColumnName("TapTypeID");
            entity.Property(e => e.Tgr).HasColumnName("TGr");
            entity.Property(e => e.Thv).HasColumnName("THv");
            entity.Property(e => e.TimeStamp).HasColumnType("datetime");
            entity.Property(e => e.Trho).HasColumnName("TRho");
            entity.Property(e => e.TurbineRotorModeId).HasColumnName("TurbineRotorModeID");
            entity.Property(e => e.Ul).HasColumnName("UL");
            entity.Property(e => e.Uv).HasColumnName("UV");
            entity.Property(e => e.ViscosityEquationId).HasColumnName("ViscosityEquationID");
            entity.Property(e => e.WarningMessages)
                .HasMaxLength(64)
                .IsUnicode(false);
            entity.Property(e => e.WaterRegionId).HasColumnName("WaterRegionID");
            entity.Property(e => e.Wl).HasColumnName("WL");
            entity.Property(e => e.Wv).HasColumnName("WV");

            entity.HasOne(d => d.BaseFluidPhase).WithMany(p => p.CalculationBaseFluidPhases)
                .HasForeignKey(d => d.BaseFluidPhaseId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Calculations_BaseFluidPhases");

            entity.HasOne(d => d.BoreMaterial).WithMany(p => p.CalculationBoreMaterials)
                .HasForeignKey(d => d.BoreMaterialId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Calculations_BoreMaterials");

            entity.HasOne(d => d.ConeType).WithMany(p => p.Calculations)
                .HasForeignKey(d => d.ConeTypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Calculations_ConeTypes");

            entity.HasOne(d => d.ErrorMessageType).WithMany(p => p.Calculations)
                .HasForeignKey(d => d.ErrorMessageTypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Calculations_CalculationErrorMessageTypes");

            entity.HasOne(d => d.FlowingFluidPhase).WithMany(p => p.CalculationFlowingFluidPhases)
                .HasForeignKey(d => d.FlowingFluidPhaseId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Calculations_FlowingFluidPhases");

            entity.HasOne(d => d.FluidStandard).WithMany(p => p.Calculations)
                .HasForeignKey(d => d.FluidStandardId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Calculations_FluidStandards");

            entity.HasOne(d => d.FluidState).WithMany(p => p.Calculations)
                .HasForeignKey(d => d.FluidStateId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Calculations_FluidStates");

            entity.HasOne(d => d.FluidType).WithMany(p => p.Calculations)
                .HasForeignKey(d => d.FluidTypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Calculations_FluidTypes");

            entity.HasOne(d => d.HeatingValueStandard).WithMany(p => p.Calculations)
                .HasForeignKey(d => d.HeatingValueStandardId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Calculations_HeatingValueStandards");

            entity.HasOne(d => d.LinearMeterCalculationMode).WithMany(p => p.Calculations)
                .HasForeignKey(d => d.LinearMeterCalculationModeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Calculations_LinearMeterCalculationModes");

            entity.HasOne(d => d.LinearMeterCalculationUnitType).WithMany(p => p.Calculations)
                .HasForeignKey(d => d.LinearMeterCalculationUnitTypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Calculations_LinearMeterCalculationUnitTypes");

            entity.HasOne(d => d.MeterStandard).WithMany(p => p.Calculations)
                .HasForeignKey(d => d.MeterStandardId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Calculations_MeterStandards");

            entity.HasOne(d => d.NozzleType).WithMany(p => p.Calculations)
                .HasForeignKey(d => d.NozzleTypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Calculations_NozzleTypes");

            entity.HasOne(d => d.PipeMaterial).WithMany(p => p.CalculationPipeMaterials)
                .HasForeignKey(d => d.PipeMaterialId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Calculations_PipeMaterials");

            entity.HasOne(d => d.PulseType).WithMany(p => p.Calculations)
                .HasForeignKey(d => d.PulseTypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Calculations_PulseTypes");

            entity.HasOne(d => d.ReferenceEquation).WithMany(p => p.Calculations)
                .HasForeignKey(d => d.ReferenceEquationId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Calculations_ReferenceEquations");

            entity.HasOne(d => d.SignalType).WithMany(p => p.Calculations)
                .HasForeignKey(d => d.SignalTypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Calculations_SignalTypes");

            entity.HasOne(d => d.StaticTap).WithMany(p => p.Calculations)
                .HasForeignKey(d => d.StaticTapId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Calculations_StaticTapTypes");

            entity.HasOne(d => d.TapType).WithMany(p => p.Calculations)
                .HasForeignKey(d => d.TapTypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Calculations_TapTypes");

            entity.HasOne(d => d.TurbineRotorMode).WithMany(p => p.Calculations)
                .HasForeignKey(d => d.TurbineRotorModeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Calculations_TurbineRotorModes");

            entity.HasOne(d => d.ViscosityEquation).WithMany(p => p.Calculations)
                .HasForeignKey(d => d.ViscosityEquationId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Calculations_ViscosityEquations");

            entity.HasOne(d => d.WaterRegion).WithMany(p => p.Calculations)
                .HasForeignKey(d => d.WaterRegionId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Calculations_WaterRegions");
        });

        modelBuilder.Entity<CalculationErrorMessageType>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<CompressibilityFactorUnit>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Code)
                .HasMaxLength(1)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(32)
                .IsUnicode(false);
        });

        modelBuilder.Entity<ConeType>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<ContextTag>(entity =>
        {
            entity.HasKey(e => e.HierarchyId).HasName("PK_ContextTags_1");

            entity.Property(e => e.HierarchyId)
                .ValueGeneratedNever()
                .HasColumnName("HierarchyID");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");

            entity.HasOne(d => d.Hierarchy).WithOne(p => p.ContextTag)
                .HasForeignKey<ContextTag>(d => d.HierarchyId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_ContextTags_Hierarchy");
        });

        modelBuilder.Entity<ContextTagProperty>(entity =>
        {
            entity.HasIndex(e => new { e.ContextTagId, e.Name }, "IX_ContextTagProperties").IsUnique();

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.ContextTagId).HasColumnName("ContextTagID");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Description)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Value)
                .HasMaxLength(255)
                .IsUnicode(false);

            entity.HasOne(d => d.ContextTag).WithMany(p => p.ContextTagProperties)
                .HasForeignKey(d => d.ContextTagId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_ContextTagProperties_ContextTags");
        });

        modelBuilder.Entity<DailyGasFlowRecord>(entity =>
        {
            entity.HasKey(e => new { e.MeterId, e.TimeStamp });

            entity.Property(e => e.MeterId).HasColumnName("MeterID");
            entity.Property(e => e.TimeStamp).HasColumnType("datetime");
            entity.Property(e => e.CasingPressure).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.Cprime)
                .HasColumnType("decimal(38, 12)")
                .HasColumnName("CPrime");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Dp)
                .HasColumnType("decimal(38, 12)")
                .HasColumnName("DP");
            entity.Property(e => e.Energy).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.Extension).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.Fpv).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.LinePressure).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.Mass).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.Pf).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.PulseCount).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.Tf).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.TubingPressure).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.Volume).HasColumnType("decimal(38, 12)");

            entity.HasOne(d => d.Meter).WithMany(p => p.DailyGasFlowRecords)
                .HasForeignKey(d => d.MeterId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_DailyGasFlowRecords_Meters");
        });

        modelBuilder.Entity<DailyLiquidFlowRecord>(entity =>
        {
            entity.HasKey(e => new { e.MeterId, e.TimeStamp });

            entity.Property(e => e.MeterId).HasColumnName("MeterID");
            entity.Property(e => e.TimeStamp).HasColumnType("datetime");
            entity.Property(e => e.CasingPressure).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.CoriolisDriveGain).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.Cprime)
                .HasColumnType("decimal(38, 12)")
                .HasColumnName("CPrime");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Density).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.Dp)
                .HasColumnType("decimal(38, 12)")
                .HasColumnName("DP");
            entity.Property(e => e.Extension).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.GasEquivalentEnergy).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.GasEquivalentVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.GrossStandardVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.GrossVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.IndicatedVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.LinePressure).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.Mass).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.MeterPressure).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.MeterTemperature).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.NetStandardVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.PulseCount).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.SedimentAndWaterPercent).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.SedimentAndWaterVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.TubingPressure).HasColumnType("decimal(38, 12)");

            entity.HasOne(d => d.Meter).WithMany(p => p.DailyLiquidFlowRecords)
                .HasForeignKey(d => d.MeterId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_DailyLiquidFlowRecords_Meters");
        });

        modelBuilder.Entity<Device>(entity =>
        {
            entity.HasKey(e => e.HierarchyId).HasName("PK_Devices_1");

            entity.Property(e => e.HierarchyId)
                .ValueGeneratedNever()
                .HasColumnName("HierarchyID");
            entity.Property(e => e.DeviceTypeId).HasColumnName("DeviceTypeID");

            entity.HasOne(d => d.DeviceType).WithMany(p => p.Devices)
                .HasForeignKey(d => d.DeviceTypeId)
                .HasConstraintName("FK_Devices_DeviceTypes");

            entity.HasOne(d => d.Hierarchy).WithOne(p => p.Device)
                .HasForeignKey<Device>(d => d.HierarchyId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Devices_Hierarchy");
        });

        modelBuilder.Entity<DeviceCommand>(entity =>
        {
            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.DateTimeCreated).HasColumnType("datetime");
            entity.Property(e => e.Description)
                .HasMaxLength(64)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(64)
                .IsUnicode(false);
            entity.Property(e => e.Script).IsUnicode(false);
        });

        modelBuilder.Entity<DeviceCommandParameter>(entity =>
        {
            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.DateTimeCreated).HasColumnType("datetime");
            entity.Property(e => e.DefaultValue).HasColumnType("sql_variant");
            entity.Property(e => e.Description)
                .HasMaxLength(128)
                .IsUnicode(false);
            entity.Property(e => e.DeviceCommandId).HasColumnName("DeviceCommandID");
            entity.Property(e => e.DeviceCommandParameterDataTypeId).HasColumnName("DeviceCommandParameterDataTypeID");
            entity.Property(e => e.Name)
                .HasMaxLength(64)
                .IsUnicode(false);

            entity.HasOne(d => d.DeviceCommand).WithMany(p => p.DeviceCommandParameters)
                .HasForeignKey(d => d.DeviceCommandId)
                .HasConstraintName("FK_DeviceCommandParameters_DeviceCommands1");

            entity.HasOne(d => d.DeviceCommandParameterDataType).WithMany(p => p.DeviceCommandParameters)
                .HasForeignKey(d => d.DeviceCommandParameterDataTypeId)
                .HasConstraintName("FK_DeviceCommandParameters_DeviceCommandParameterDataTypes1");
        });

        modelBuilder.Entity<DeviceCommandParameterDataType>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Description)
                .HasMaxLength(64)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(64)
                .IsUnicode(false);
        });

        modelBuilder.Entity<DeviceType>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Description)
                .HasMaxLength(128)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(64)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Diagram>(entity =>
        {
            entity.HasKey(e => e.HierarchyId);

            entity.Property(e => e.HierarchyId)
                .ValueGeneratedNever()
                .HasColumnName("HierarchyID");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DiagramXml).HasColumnType("xml");

            entity.HasOne(d => d.Hierarchy).WithOne(p => p.Diagram)
                .HasForeignKey<Diagram>(d => d.HierarchyId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Diagrams_Hierarchy");
        });

        modelBuilder.Entity<DigitalIoTag>(entity =>
        {
            entity.HasKey(e => e.HierarchyId);

            entity.Property(e => e.HierarchyId)
                .ValueGeneratedNever()
                .HasColumnName("HierarchyID");
            entity.Property(e => e.AlarmPriorityId).HasColumnName("AlarmPriorityID");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.FalseValueText)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.HistoryAddress)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.LineColor)
                .HasMaxLength(64)
                .IsUnicode(false);
            entity.Property(e => e.LineStyle)
                .HasMaxLength(64)
                .IsUnicode(false);
            entity.Property(e => e.ReadAddress)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Script).IsUnicode(false);
            entity.Property(e => e.TrueValueText)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.WriteAddress)
                .HasMaxLength(255)
                .IsUnicode(false);

            entity.HasOne(d => d.AlarmPriority).WithMany(p => p.DigitalIoTags)
                .HasForeignKey(d => d.AlarmPriorityId)
                .HasConstraintName("FK_DigitalIoTags_AlarmPriorities");

            entity.HasOne(d => d.Hierarchy).WithOne(p => p.DigitalIoTag)
                .HasForeignKey<DigitalIoTag>(d => d.HierarchyId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_DigitalIoTags_Hierarchy");
        });

        modelBuilder.Entity<DigitalIoTagCurrentValue>(entity =>
        {
            entity.HasKey(e => e.DigitalIoTagId);

            entity.Property(e => e.DigitalIoTagId).ValueGeneratedNever();
            entity.Property(e => e.TimeStamp).HasColumnType("datetime");

            entity.HasOne(d => d.DigitalIoTag).WithOne(p => p.DigitalIoTagCurrentValue)
                .HasForeignKey<DigitalIoTagCurrentValue>(d => d.DigitalIoTagId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_DigitalIoTagCurrentValues_DigitalIoTags");
        });

        modelBuilder.Entity<DigitalIoTagValueHistory>(entity =>
        {
            entity.HasKey(e => new { e.DigitalIoTagId, e.TimeStamp });

            entity.ToTable("DigitalIoTagValueHistory");

            entity.Property(e => e.DigitalIoTagId).HasColumnName("DigitalIoTagID");
            entity.Property(e => e.TimeStamp).HasColumnType("datetime");

            entity.HasOne(d => d.DigitalIoTag).WithMany(p => p.DigitalIoTagValueHistories)
                .HasForeignKey(d => d.DigitalIoTagId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_DigitalIoTagValueHistory_DigitalIoTags");
        });

        modelBuilder.Entity<Document>(entity =>
        {
            entity.HasKey(e => e.HierarchyId);

            entity.Property(e => e.HierarchyId)
                .ValueGeneratedNever()
                .HasColumnName("HierarchyID");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");

            entity.HasOne(d => d.Hierarchy).WithOne(p => p.Document)
                .HasForeignKey<Document>(d => d.HierarchyId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Documents_Hierarchy");
        });

        modelBuilder.Entity<EnergyDevelopmentCategoryType>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Code)
                .HasMaxLength(32)
                .IsUnicode(false);
            entity.Property(e => e.Description)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Equipment>(entity =>
        {
            entity.HasKey(e => e.HierarchyId);

            entity.Property(e => e.HierarchyId)
                .ValueGeneratedNever()
                .HasColumnName("HierarchyID");
            entity.Property(e => e.AssetTag)
                .HasMaxLength(64)
                .IsUnicode(false);
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.EquipmentStatusId).HasColumnName("EquipmentStatusID");
            entity.Property(e => e.EquipmentSubTypeId).HasColumnName("EquipmentSubTypeID");
            entity.Property(e => e.Manufacturer)
                .HasMaxLength(64)
                .IsUnicode(false);
            entity.Property(e => e.Model)
                .HasMaxLength(64)
                .IsUnicode(false);
            entity.Property(e => e.Notes).IsUnicode(false);
            entity.Property(e => e.SerialNumber)
                .HasMaxLength(64)
                .IsUnicode(false);

            entity.HasOne(d => d.EquipmentStatus).WithMany(p => p.Equipment)
                .HasForeignKey(d => d.EquipmentStatusId)
                .HasConstraintName("FK_Equipment_EquipmentStatuses");

            entity.HasOne(d => d.EquipmentSubType).WithMany(p => p.Equipment)
                .HasForeignKey(d => d.EquipmentSubTypeId)
                .HasConstraintName("FK_Equipment_EquipmentSubTypes");

            entity.HasOne(d => d.Hierarchy).WithOne(p => p.Equipment)
                .HasForeignKey<Equipment>(d => d.HierarchyId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Equipment_Hierarchy");
        });

        modelBuilder.Entity<EquipmentStatus>(entity =>
        {
            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.Description)
                .HasMaxLength(128)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(64)
                .IsUnicode(false);
        });

        modelBuilder.Entity<EquipmentSubType>(entity =>
        {
            entity.HasIndex(e => new { e.EquipmentTypeId, e.Name }, "IX_EquipmentSubTypes");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Description)
                .HasMaxLength(128)
                .IsUnicode(false);
            entity.Property(e => e.EquipmentTypeId).HasColumnName("EquipmentTypeID");
            entity.Property(e => e.Name)
                .HasMaxLength(64)
                .IsUnicode(false);

            entity.HasOne(d => d.EquipmentType).WithMany(p => p.EquipmentSubTypes)
                .HasForeignKey(d => d.EquipmentTypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_EquipmentSubTypes_EquipmentTypes1");
        });

        modelBuilder.Entity<EquipmentType>(entity =>
        {
            entity.HasIndex(e => e.Name, "IX_EquipmentTypes");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Description)
                .HasMaxLength(128)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(64)
                .IsUnicode(false);
        });

        modelBuilder.Entity<ExtensionDefinition>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(32)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Facility>(entity =>
        {
            entity.HasKey(e => e.HierarchyId);

            entity.Property(e => e.HierarchyId)
                .ValueGeneratedNever()
                .HasColumnName("HierarchyID");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.EnergyDevelopmentCategoryTypeId).HasColumnName("EnergyDevelopmentCategoryTypeID");
            entity.Property(e => e.FacilitySubTypeId).HasColumnName("FacilitySubTypeID");
            entity.Property(e => e.LicenceNumber)
                .HasMaxLength(128)
                .IsUnicode(false);
            entity.Property(e => e.LicenseeCode)
                .HasMaxLength(128)
                .IsUnicode(false);
            entity.Property(e => e.LocationName)
                .HasMaxLength(128)
                .IsUnicode(false);
            entity.Property(e => e.OperatorCode)
                .HasMaxLength(128)
                .IsUnicode(false);
            entity.Property(e => e.OperatorName)
                .HasMaxLength(128)
                .IsUnicode(false);
            entity.Property(e => e.UniqueFacilityIdentifier)
                .HasMaxLength(128)
                .IsUnicode(false);
            entity.Property(e => e.WasteLocationTypeId).HasColumnName("WasteLocationTypeID");

            entity.HasOne(d => d.EnergyDevelopmentCategoryType).WithMany(p => p.Facilities)
                .HasForeignKey(d => d.EnergyDevelopmentCategoryTypeId)
                .HasConstraintName("FK_Facilities_EnergyDevelopmentCategoryTypes");

            entity.HasOne(d => d.FacilitySubType).WithMany(p => p.Facilities)
                .HasForeignKey(d => d.FacilitySubTypeId)
                .HasConstraintName("FK_Facilities_FacilitySubTypes");

            entity.HasOne(d => d.Hierarchy).WithOne(p => p.Facility)
                .HasForeignKey<Facility>(d => d.HierarchyId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Facilities_Hierarchy");

            entity.HasOne(d => d.WasteLocationType).WithMany(p => p.Facilities)
                .HasForeignKey(d => d.WasteLocationTypeId)
                .HasConstraintName("FK_Facilities_WasteLocationTypes");
        });

        modelBuilder.Entity<FacilityActivityType>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Code)
                .HasMaxLength(128)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(128)
                .IsUnicode(false);
        });

        modelBuilder.Entity<FacilityDailyActivity>(entity =>
        {
            entity.HasKey(e => new { e.FacilityId, e.ProductionDate, e.FacilityActivityTypeId, e.ProductTypeId, e.ActivityFacilityId, e.RecordVersion });

            entity.ToTable("FacilityDailyActivity");

            entity.Property(e => e.FacilityId).HasColumnName("FacilityID");
            entity.Property(e => e.FacilityActivityTypeId).HasColumnName("FacilityActivityTypeID");
            entity.Property(e => e.ProductTypeId).HasColumnName("ProductTypeID");
            entity.Property(e => e.ActivityFacilityId).HasColumnName("ActivityFacilityID");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Energy).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.Volume).HasColumnType("decimal(38, 12)");

            entity.HasOne(d => d.ActivityFacility).WithMany(p => p.FacilityDailyActivityActivityFacilities)
                .HasForeignKey(d => d.ActivityFacilityId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_DailyFacilityActivity_ActivityFacilities");

            entity.HasOne(d => d.FacilityActivityType).WithMany(p => p.FacilityDailyActivities)
                .HasForeignKey(d => d.FacilityActivityTypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_DailyFacilityActivity_FacilityActivityTypes");

            entity.HasOne(d => d.Facility).WithMany(p => p.FacilityDailyActivityFacilities)
                .HasForeignKey(d => d.FacilityId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_DailyFacilityActivity_Facilities");
        });

        modelBuilder.Entity<FacilityDailyFugitiveEmission>(entity =>
        {
            entity.HasKey(e => new { e.FacilityId, e.ProductionDate });

            entity.Property(e => e.FacilityId).HasColumnName("FacilityID");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Flare).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.Fuel).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.Vent).HasColumnType("decimal(38, 12)");

            entity.HasOne(d => d.Facility).WithMany(p => p.FacilityDailyFugitiveEmissions)
                .HasForeignKey(d => d.FacilityId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_FacilityDailyFugitiveEmissions_Facilities");
        });

        modelBuilder.Entity<FacilityDailyTransaction>(entity =>
        {
            entity.HasKey(e => new { e.FacilityId, e.ProductionDate });

            entity.Property(e => e.FacilityId).HasColumnName("FacilityID");
            entity.Property(e => e.BitumenAdjustedVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.BitumenClosingVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.BitumenLoadInjection).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.BitumenNetProductionVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.BitumenOpeningVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.BitumenProrationFactor).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.BitumenRecoveredVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.BitumenTransloadedInVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.BitumenTransloadedOutVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.BitumenWellEstimatedVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.BitumenWellMeasuredVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.CondensateAdjustedVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.CondensateClosingVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.CondensateLoadInjectionVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.CondensateNetProductionVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.CondensateOpeningVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.CondensateProrationFactor).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.CondensateRecoveredVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.CondensateTransloadedInVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.CondensateTransloadedOutVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.CondensateWellEstimatedVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.CondensateWellEstimatedVolume1).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.CondensateWellMeasuredVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.CondensateWellMeasuredVolume1).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DiluentAdjustedVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.DiluentClosingVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.DiluentLoadInjectionVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.DiluentNetProductionVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.DiluentOpeningVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.DiluentProrationFactor).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.DiluentRecoveredVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.DiluentTransloadedInVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.DiluentTransloadedOutVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.FluidClosingVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.FluidLoadInjectionVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.FluidNetProductionVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.FluidOpeningVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.FluidProrationFactor).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.FluidRecoveredVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.FluidTransloadedInVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.FluidTransloadedOutVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.FluidWellEstimatedVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.FluidWellMeasuredVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.GasFlareVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.GasFuelVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.GasFuelVolumeIn).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.GasGroupInletVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.GasProductionVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.GasProrationFactor).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.GasSalesVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.GasStvVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.GasTransloadInVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.GasVentVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.GasWellEffulentGasVoume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.GasWellEstimatedVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.GasWellGasLiftVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.GasWellGatheredVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.GasWellMeasuredVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.GasWellProducedVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.GasWellProratedVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.OilAdjustedVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.OilClosingVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.OilLoadInjection).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.OilNetProductionVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.OilOpeningVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.OilProrationFactor).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.OilRecoveredVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.OilTransloadedInVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.OilTransloadedOutVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.OilWellEstimatedVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.OilWellMeasuredVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.SandCloseVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.SandNetProductionVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.SandOpeningVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.SandTransloadedOutVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.SandWellEstimatedVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.SandWellMeasuredVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.WaterClosingVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.WaterInjectedVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.WaterLoadInjectionVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.WaterNetProductionVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.WaterOpeningVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.WaterProrationFactor).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.WaterRecoveredVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.WaterSourceVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.WaterTransloadedInVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.WaterTransloadedOutVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.WaterWellEstimatedVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.WaterWellMeasuredVolume).HasColumnType("decimal(38, 12)");

            entity.HasOne(d => d.Facility).WithMany(p => p.FacilityDailyTransactions)
                .HasForeignKey(d => d.FacilityId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_FacilityDailyTransactions_Facilities");
        });

        modelBuilder.Entity<FacilityMonthlyActivity>(entity =>
        {
            entity.HasKey(e => new { e.FacilityId, e.ProductionDate, e.FacilityActivityTypeId, e.ProductTypeId, e.ActivityFacilityId, e.RecordVersion }).HasName("PK_FacilityMonthlyActivity_1");

            entity.ToTable("FacilityMonthlyActivity");

            entity.Property(e => e.FacilityId).HasColumnName("FacilityID");
            entity.Property(e => e.FacilityActivityTypeId).HasColumnName("FacilityActivityTypeID");
            entity.Property(e => e.ProductTypeId).HasColumnName("ProductTypeID");
            entity.Property(e => e.ActivityFacilityId).HasColumnName("ActivityFacilityID");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Energy)
                .IsSparse()
                .HasColumnType("decimal(38, 12)");
            entity.Property(e => e.Volume).HasColumnType("decimal(38, 12)");

            entity.HasOne(d => d.ActivityFacility).WithMany(p => p.FacilityMonthlyActivityActivityFacilities)
                .HasForeignKey(d => d.ActivityFacilityId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_MonthlyFacilityActivity_ActivityFacilities");

            entity.HasOne(d => d.FacilityActivityType).WithMany(p => p.FacilityMonthlyActivities)
                .HasForeignKey(d => d.FacilityActivityTypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_MonthlyFacilityActivity_FacilityActivityTypes");

            entity.HasOne(d => d.Facility).WithMany(p => p.FacilityMonthlyActivityFacilities)
                .HasForeignKey(d => d.FacilityId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_MonthlyFacilityActivity_Facilities");
        });

        modelBuilder.Entity<FacilityMonthlyFugitiveEmission>(entity =>
        {
            entity.HasKey(e => new { e.FacilityId, e.ProductionDate });

            entity.Property(e => e.FacilityId).HasColumnName("FacilityID");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Flare).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.Fuel).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.Vent).HasColumnType("decimal(38, 12)");

            entity.HasOne(d => d.Facility).WithMany(p => p.FacilityMonthlyFugitiveEmissions)
                .HasForeignKey(d => d.FacilityId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_FacilityMonthlyFugitiveEmissions_Facilities");
        });

        modelBuilder.Entity<FacilityStatus>(entity =>
        {
            entity.HasKey(e => new { e.FacilityId, e.TimeStamp, e.FacilityStatusTypeId, e.RecordVersion }).HasName("PK_FacilityStatuses_1");

            entity.HasIndex(e => new { e.FacilityId, e.TimeStamp }, "PK_FacilityStatuses").IsUnique();

            entity.Property(e => e.FacilityId).HasColumnName("FacilityID");
            entity.Property(e => e.FacilityStatusTypeId).HasColumnName("FacilityStatusTypeID");

            entity.HasOne(d => d.Facility).WithMany(p => p.FacilityStatuses)
                .HasForeignKey(d => d.FacilityId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_FacilityStatuses_Facilities");

            entity.HasOne(d => d.FacilityStatusType).WithMany(p => p.FacilityStatuses)
                .HasForeignKey(d => d.FacilityStatusTypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_FacilityStatuses_FacilityStatusTypes");
        });

        modelBuilder.Entity<FacilityStatusType>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Code)
                .HasMaxLength(128)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(128)
                .IsUnicode(false);
        });

        modelBuilder.Entity<FacilitySubType>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Code)
                .HasMaxLength(64)
                .IsUnicode(false);
            entity.Property(e => e.FacilityTypeId).HasColumnName("FacilityTypeID");
            entity.Property(e => e.Name)
                .HasMaxLength(128)
                .IsUnicode(false);

            entity.HasOne(d => d.FacilityType).WithMany(p => p.FacilitySubTypes)
                .HasForeignKey(d => d.FacilityTypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_FacilitySubTypes_FacilityTypes");
        });

        modelBuilder.Entity<FacilityType>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Code)
                .HasMaxLength(64)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(128)
                .IsUnicode(false);
        });

        modelBuilder.Entity<FittingType>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Code)
                .HasMaxLength(1)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(32)
                .IsUnicode(false);
        });

        modelBuilder.Entity<FluidPhase>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<FluidStandard>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<FluidState>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<FluidType>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Folder>(entity =>
        {
            entity.HasKey(e => e.HierarchyId);

            entity.ToTable("Folder");

            entity.Property(e => e.HierarchyId)
                .ValueGeneratedNever()
                .HasColumnName("HierarchyID");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");

            entity.HasOne(d => d.Hierarchy).WithOne(p => p.Folder)
                .HasForeignKey<Folder>(d => d.HierarchyId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Folder_Hierarchy");
        });

        modelBuilder.Entity<GasBatchRecord>(entity =>
        {
            entity.Property(e => e.Apidegrees).HasColumnName("APIDegrees");
            entity.Property(e => e.Argon).HasComment("Mole %");
            entity.Property(e => e.BatchId)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("BatchID");
            entity.Property(e => e.BatchTypeId).HasColumnName("BatchTypeID");
            entity.Property(e => e.CarbonDioxide).HasComment("Mole %");
            entity.Property(e => e.CarbonMonoxide).HasComment("Mole %");
            entity.Property(e => e.CompressibilityFactorUnitId).HasColumnName("CompressibilityFactorUnitID");
            entity.Property(e => e.Consignee)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Consignor)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Cprime).HasColumnName("CPrime");
            entity.Property(e => e.CustomDate01).HasColumnType("datetime");
            entity.Property(e => e.CustomDate02).HasColumnType("datetime");
            entity.Property(e => e.CustomDate03).HasColumnType("datetime");
            entity.Property(e => e.CustomDate04).HasColumnType("datetime");
            entity.Property(e => e.CustomString01)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.CustomString02)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.CustomString03)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.CustomString04)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.CustomString05)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.CustomString06)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.CustomString07)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.CustomString08)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.CustomTimeStamp).HasColumnType("datetime");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Decane).HasComment("Mole %");
            entity.Property(e => e.Destination)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.DriverId)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("DriverID");
            entity.Property(e => e.EndTimeStamp).HasColumnType("datetime");
            entity.Property(e => e.Ethane).HasComment("Mole %");
            entity.Property(e => e.FacilityId).HasColumnName("FacilityID");
            entity.Property(e => e.FluidStandardId).HasColumnName("FluidStandardID");
            entity.Property(e => e.FluidTypeId).HasColumnName("FluidTypeID");
            entity.Property(e => e.Helium).HasComment("Mole %");
            entity.Property(e => e.Heptane).HasComment("Mole %");
            entity.Property(e => e.Hexane).HasComment("Mole %");
            entity.Property(e => e.Hydrogen).HasComment("Mole %");
            entity.Property(e => e.HydrogenSulfide).HasComment("Mole %");
            entity.Property(e => e.IButane).HasColumnName("iButane");
            entity.Property(e => e.IPentane).HasColumnName("iPentane");
            entity.Property(e => e.Kfactor).HasColumnName("KFactor");
            entity.Property(e => e.ManifestId)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("ManifestID");
            entity.Property(e => e.Methane).HasComment("Mole %");
            entity.Property(e => e.NButane)
                .HasComment("Mole %")
                .HasColumnName("nButane");
            entity.Property(e => e.NPentane)
                .HasComment("Mole %")
                .HasColumnName("nPentane");
            entity.Property(e => e.Nitrogen).HasComment("Mole %");
            entity.Property(e => e.Nonane).HasComment("Mole %");
            entity.Property(e => e.Octane).HasComment("Mole %");
            entity.Property(e => e.Origin)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Oxygen).HasComment("Mole %");
            entity.Property(e => e.Propane).HasComment("Mole %");
            entity.Property(e => e.Seal1Off)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Seal1On)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Seal2Off)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Seal2On)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.TemperatureBaseUnitId).HasColumnName("TemperatureBaseUnitID");
            entity.Property(e => e.TimeStamp).HasColumnType("datetime");
            entity.Property(e => e.TrailerNumber)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Transporter)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.VehicleId)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("VehicleID");
            entity.Property(e => e.Water).HasComment("Mole %");
            entity.Property(e => e.Witness)
                .HasMaxLength(255)
                .IsUnicode(false);

            entity.HasOne(d => d.Facility).WithMany(p => p.GasBatchRecords)
                .HasForeignKey(d => d.FacilityId)
                .HasConstraintName("FK_GasBatchRecords_Facilities");
        });

        modelBuilder.Entity<GasVolumeKfactorUnit>(entity =>
        {
            entity.ToTable("GasVolumeKFactorUnits");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Code)
                .HasMaxLength(1)
                .IsUnicode(false);
            entity.Property(e => e.Description)
                .HasMaxLength(64)
                .IsUnicode(false);
            entity.Property(e => e.Symbol)
                .HasMaxLength(32)
                .IsUnicode(false);
            entity.Property(e => e.UnitId).HasColumnName("UnitID");
        });

        modelBuilder.Entity<HeatingValueStandard>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Hierarchy>(entity =>
        {
            entity.ToTable("Hierarchy");

            entity.HasIndex(e => e.Node, "IX_Hierarchy").IsUnique();

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Description)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.NodeTypeId).HasColumnName("NodeTypeID");

            entity.HasOne(d => d.NodeType).WithMany(p => p.Hierarchies)
                .HasForeignKey(d => d.NodeTypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Hierarchy_NodeTypes");
        });

        modelBuilder.Entity<HourlyGasFlowRecord>(entity =>
        {
            entity.HasKey(e => new { e.MeterId, e.TimeStamp });

            entity.Property(e => e.MeterId).HasColumnName("MeterID");
            entity.Property(e => e.TimeStamp).HasColumnType("datetime");
            entity.Property(e => e.CasingPressure).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.Cprime)
                .HasColumnType("decimal(38, 12)")
                .HasColumnName("CPrime");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Dp)
                .HasColumnType("decimal(38, 12)")
                .HasColumnName("DP");
            entity.Property(e => e.Energy).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.Extension).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.Fpv).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.LinePressure).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.Mass).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.Pf).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.PulseCount).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.Tf).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.TubingPressure).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.Volume).HasColumnType("decimal(38, 12)");

            entity.HasOne(d => d.Meter).WithMany(p => p.HourlyGasFlowRecords)
                .HasForeignKey(d => d.MeterId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_HourlyGasFlowRecords_Meters");
        });

        modelBuilder.Entity<HourlyLiquidFlowRecord>(entity =>
        {
            entity.HasKey(e => new { e.MeterId, e.TimeStamp });

            entity.Property(e => e.MeterId).HasColumnName("MeterID");
            entity.Property(e => e.TimeStamp).HasColumnType("datetime");
            entity.Property(e => e.CasingPressure).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.CoriolisDriveGain).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.Cprime)
                .HasColumnType("decimal(38, 12)")
                .HasColumnName("CPrime");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Density).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.Dp)
                .HasColumnType("decimal(38, 12)")
                .HasColumnName("DP");
            entity.Property(e => e.Extension).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.GasEquivalentEnergy).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.GasEquivalentVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.GrossStandardVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.GrossVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.IndicatedVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.LinePressure).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.Mass).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.MeterPressure).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.MeterTemperature).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.NetStandardVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.PulseCount).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.SedimentAndWaterPercent).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.SedimentAndWaterVolume).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.TubingPressure).HasColumnType("decimal(38, 12)");

            entity.HasOne(d => d.Meter).WithMany(p => p.HourlyLiquidFlowRecords)
                .HasForeignKey(d => d.MeterId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_HourlyLiquidFlowRecords_Meters");
        });

        modelBuilder.Entity<IpChannel>(entity =>
        {
            entity.HasKey(e => e.HierarchyId).HasName("PK_IpChannels_1");

            entity.Property(e => e.HierarchyId)
                .ValueGeneratedNever()
                .HasColumnName("HierarchyID");
            entity.Property(e => e.HostName)
                .HasMaxLength(255)
                .IsUnicode(false);

            entity.HasOne(d => d.Hierarchy).WithOne(p => p.IpChannel)
                .HasForeignKey<IpChannel>(d => d.HierarchyId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_IpChannels_Hierarchy");
        });

        modelBuilder.Entity<LinearMeterCalculationMode>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<LinearMeterCalculationUnitType>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<LiquidBatchRecord>(entity =>
        {
            entity.Property(e => e.AlphaUnitId).HasColumnName("AlphaUnitID");
            entity.Property(e => e.Argon).HasComment("Mole %");
            entity.Property(e => e.BatchId)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("BatchID");
            entity.Property(e => e.BatchTypeId).HasColumnName("BatchTypeID");
            entity.Property(e => e.CarbonDioxide).HasComment("Mole %");
            entity.Property(e => e.CarbonMonoxide).HasComment("Mole %");
            entity.Property(e => e.Ccf).HasColumnName("CCF");
            entity.Property(e => e.CompressibilityFactorUnitId).HasColumnName("CompressibilityFactorUnitID");
            entity.Property(e => e.Consignee)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Consignor)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Cpl).HasColumnName("CPL");
            entity.Property(e => e.Cprime).HasColumnName("CPrime");
            entity.Property(e => e.Ctl).HasColumnName("CTL");
            entity.Property(e => e.Ctpl).HasColumnName("CTPL");
            entity.Property(e => e.CustomDate01).HasColumnType("datetime");
            entity.Property(e => e.CustomDate02).HasColumnType("datetime");
            entity.Property(e => e.CustomDate03).HasColumnType("datetime");
            entity.Property(e => e.CustomDate04).HasColumnType("datetime");
            entity.Property(e => e.CustomString01)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.CustomString02)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.CustomString03)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.CustomString04)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.CustomString05)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.CustomString06)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.CustomString07)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.CustomString08)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.CustomTimeStamp).HasColumnType("datetime");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Decane).HasComment("Mole %");
            entity.Property(e => e.DensityUnitId).HasColumnName("DensityUnitID");
            entity.Property(e => e.Destination)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.DriverId)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("DriverID");
            entity.Property(e => e.EndTimeStamp).HasColumnType("datetime");
            entity.Property(e => e.Ethane).HasComment("Mole %");
            entity.Property(e => e.EvpUnitId).HasColumnName("EvpUnitID");
            entity.Property(e => e.FacilityId).HasColumnName("FacilityID");
            entity.Property(e => e.FluidStandardId).HasColumnName("FluidStandardID");
            entity.Property(e => e.FluidTypeId).HasColumnName("FluidTypeID");
            entity.Property(e => e.Helium).HasComment("Mole %");
            entity.Property(e => e.Heptane).HasComment("Mole %");
            entity.Property(e => e.Hexane).HasComment("Mole %");
            entity.Property(e => e.Hydrogen).HasComment("Mole %");
            entity.Property(e => e.HydrogenSulfide).HasComment("Mole %");
            entity.Property(e => e.IButane).HasColumnName("iButane");
            entity.Property(e => e.IPentane).HasColumnName("iPentane");
            entity.Property(e => e.Kfactor).HasColumnName("KFactor");
            entity.Property(e => e.ManifestId)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("ManifestID");
            entity.Property(e => e.Methane).HasComment("Mole %");
            entity.Property(e => e.NButane)
                .HasComment("Mole %")
                .HasColumnName("nButane");
            entity.Property(e => e.NPentane)
                .HasComment("Mole %")
                .HasColumnName("nPentane");
            entity.Property(e => e.Nitrogen).HasComment("Mole %");
            entity.Property(e => e.Nonane).HasComment("Mole %");
            entity.Property(e => e.ObservedDensityApidegrees).HasColumnName("ObservedDensityAPIDegrees");
            entity.Property(e => e.Octane).HasComment("Mole %");
            entity.Property(e => e.Origin)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Oxygen).HasComment("Mole %");
            entity.Property(e => e.ProductName)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Propane).HasComment("Mole %");
            entity.Property(e => e.ProveDate).HasColumnType("datetime");
            entity.Property(e => e.PycDate).HasColumnType("datetime");
            entity.Property(e => e.Seal1Off)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Seal1On)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Seal2Off)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Seal2On)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.TemperatureBaseUnitId).HasColumnName("TemperatureBaseUnitID");
            entity.Property(e => e.TimeStamp).HasColumnType("datetime");
            entity.Property(e => e.TrailerNumber)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Transporter)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.VehicleId)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("VehicleID");
            entity.Property(e => e.Water).HasComment("Mole %");
            entity.Property(e => e.Witness)
                .HasMaxLength(255)
                .IsUnicode(false);

            entity.HasOne(d => d.AlphaUnit).WithMany(p => p.LiquidBatchRecords)
                .HasForeignKey(d => d.AlphaUnitId)
                .HasConstraintName("FK_BatchReports_AlphaUnits");

            entity.HasOne(d => d.BatchType).WithMany(p => p.LiquidBatchRecords)
                .HasForeignKey(d => d.BatchTypeId)
                .HasConstraintName("FK_BatchReports_BatchTypes");

            entity.HasOne(d => d.CompressibilityFactorUnit).WithMany(p => p.LiquidBatchRecords)
                .HasForeignKey(d => d.CompressibilityFactorUnitId)
                .HasConstraintName("FK_BatchReports_CompressibilityFactorUnits");

            entity.HasOne(d => d.DensityUnit).WithMany(p => p.LiquidBatchRecordDensityUnits)
                .HasForeignKey(d => d.DensityUnitId)
                .HasConstraintName("FK_BatchReports_DensityUnits");

            entity.HasOne(d => d.EvpUnit).WithMany(p => p.LiquidBatchRecordEvpUnits)
                .HasForeignKey(d => d.EvpUnitId)
                .HasConstraintName("FK_BatchReports_EvpUnits");

            entity.HasOne(d => d.Facility).WithMany(p => p.LiquidBatchRecords)
                .HasForeignKey(d => d.FacilityId)
                .HasConstraintName("FK_LiquidBatchRecords_Facilities");

            entity.HasOne(d => d.FluidStandard).WithMany(p => p.LiquidBatchRecords)
                .HasForeignKey(d => d.FluidStandardId)
                .HasConstraintName("FK_BatchReports_FluidStandards");

            entity.HasOne(d => d.FluidType).WithMany(p => p.LiquidBatchRecords)
                .HasForeignKey(d => d.FluidTypeId)
                .HasConstraintName("FK_BatchReports_FluidTypes");

            entity.HasOne(d => d.TemperatureBaseUnit).WithMany(p => p.LiquidBatchRecordTemperatureBaseUnits)
                .HasForeignKey(d => d.TemperatureBaseUnitId)
                .HasConstraintName("FK_BatchReports_TemperatureBaseUnits");
        });

        modelBuilder.Entity<LiquidVolumeKfactorUnit>(entity =>
        {
            entity.ToTable("LiquidVolumeKFactorUnits");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Code)
                .HasMaxLength(1)
                .IsUnicode(false);
            entity.Property(e => e.Description)
                .HasMaxLength(64)
                .IsUnicode(false);
            entity.Property(e => e.Symbol)
                .HasMaxLength(32)
                .IsUnicode(false);
            entity.Property(e => e.UnitId).HasColumnName("UnitID");
        });

        modelBuilder.Entity<MaintenanceRecord>(entity =>
        {
            entity.Property(e => e.Id)
                .HasDefaultValueSql("(newid())")
                .HasColumnName("ID");
            entity.Property(e => e.Actions).IsUnicode(false);
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Description).IsUnicode(false);
            entity.Property(e => e.HierarchyId).HasColumnName("HierarchyID");
            entity.Property(e => e.HourlyRate).HasColumnType("decimal(5, 2)");
            entity.Property(e => e.LaborHours).HasColumnType("decimal(5, 2)");
            entity.Property(e => e.MaintenanceTypeId).HasColumnName("MaintenanceTypeID");
            entity.Property(e => e.MaterialCost).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.NextScheduledDate).HasColumnType("datetime");
            entity.Property(e => e.PerformedByUserId).HasColumnName("PerformedByUserID");
            entity.Property(e => e.TimeStamp).HasColumnType("datetime");
            entity.Property(e => e.TotalCost)
                .HasComputedColumnSql("([LaborHours]*[HourlyRate]+[MaterialCost])", true)
                .HasColumnType("decimal(13, 4)");

            entity.HasOne(d => d.Hierarchy).WithMany(p => p.MaintenanceRecords)
                .HasForeignKey(d => d.HierarchyId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_MaintenanceRecords_Hierarchy");

            entity.HasOne(d => d.MaintenanceType).WithMany(p => p.MaintenanceRecords)
                .HasForeignKey(d => d.MaintenanceTypeId)
                .HasConstraintName("FK_MaintenanceRecords_MaintenanceTypes");
        });

        modelBuilder.Entity<MaintenanceType>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Description)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(64)
                .IsUnicode(false);
        });

        modelBuilder.Entity<MassHeatingValueUnit>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.EnergyUnitId).HasColumnName("EnergyUnitID");
            entity.Property(e => e.MassUnitId).HasColumnName("MassUnitID");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Symbol)
                .HasMaxLength(32)
                .IsUnicode(false);

            entity.HasOne(d => d.EnergyUnit).WithMany(p => p.MassHeatingValueUnitEnergyUnits)
                .HasForeignKey(d => d.EnergyUnitId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_MassHeatingValueUnits_EnergyUnits");

            entity.HasOne(d => d.MassUnit).WithMany(p => p.MassHeatingValueUnitMassUnits)
                .HasForeignKey(d => d.MassUnitId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_MassHeatingValueUnits_MassUnits");
        });

        modelBuilder.Entity<MassKfactorUnit>(entity =>
        {
            entity.ToTable("MassKFactorUnits");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Code)
                .HasMaxLength(1)
                .IsUnicode(false);
            entity.Property(e => e.Description)
                .HasMaxLength(64)
                .IsUnicode(false);
            entity.Property(e => e.Symbol)
                .HasMaxLength(32)
                .IsUnicode(false);
            entity.Property(e => e.UnitId).HasColumnName("UnitID");
        });

        modelBuilder.Entity<Material>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Meter>(entity =>
        {
            entity.HasKey(e => e.HierarchyId).HasName("PK_Meters_1");

            entity.Property(e => e.HierarchyId)
                .ValueGeneratedNever()
                .HasColumnName("HierarchyID");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Description)
                .HasMaxLength(64)
                .IsUnicode(false);
            entity.Property(e => e.FluidTypeId).HasColumnName("FluidTypeID");
            entity.Property(e => e.MeterPurposeId).HasColumnName("MeterPurposeID");
            entity.Property(e => e.Name)
                .HasMaxLength(32)
                .IsUnicode(false);

            entity.HasOne(d => d.FluidType).WithMany(p => p.Meters)
                .HasForeignKey(d => d.FluidTypeId)
                .HasConstraintName("FK_Meters_FluidTypes");

            entity.HasOne(d => d.Hierarchy).WithOne(p => p.Meter)
                .HasForeignKey<Meter>(d => d.HierarchyId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Meters_Hierarchy");

            entity.HasOne(d => d.MeterPurpose).WithMany(p => p.Meters)
                .HasForeignKey(d => d.MeterPurposeId)
                .HasConstraintName("FK_Meters_MeterPurposes");
        });

        modelBuilder.Entity<MeterAlarm>(entity =>
        {
            entity.HasKey(e => new { e.TimeStamp, e.MeterId, e.RecordIndex }).HasName("PK_MeterAlarms_1");

            entity.Property(e => e.TimeStamp).HasColumnType("datetime");
            entity.Property(e => e.MeterId).HasColumnName("MeterID");
            entity.Property(e => e.AlarmClass).HasMaxLength(255);
            entity.Property(e => e.AlarmCode).HasMaxLength(255);
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.State).HasMaxLength(255);
            entity.Property(e => e.Tag).HasMaxLength(255);

            entity.HasOne(d => d.Meter).WithMany(p => p.MeterAlarms)
                .HasForeignKey(d => d.MeterId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_MeterAlarms_Meters");
        });

        modelBuilder.Entity<MeterConfiguration>(entity =>
        {
            entity.HasKey(e => new { e.MeterId, e.TimeStamp }).HasName("PK_MeterConfigurations_1");

            entity.Property(e => e.MeterId).HasColumnName("MeterID");
            entity.Property(e => e.TimeStamp).HasColumnType("datetime");
            entity.Property(e => e.AlphaUnitId).HasColumnName("AlphaUnitID");
            entity.Property(e => e.Argon).HasComment("Mole %");
            entity.Property(e => e.AtmosphericPressureUnitId).HasColumnName("AtmosphericPressureUnitID");
            entity.Property(e => e.BoreDiameterUnitId).HasColumnName("BoreDiameterUnitID");
            entity.Property(e => e.BoreMaterialId).HasColumnName("BoreMaterialID");
            entity.Property(e => e.BoreReferenceTemperatureUnitId).HasColumnName("BoreReferenceTemperatureUnitID");
            entity.Property(e => e.CalibrationPressure).HasComment("Coriolis only. Pressure at which Peffect was determined");
            entity.Property(e => e.CarbonDioxide).HasComment("Mole %");
            entity.Property(e => e.CarbonMonoxide).HasComment("Mole %");
            entity.Property(e => e.ColdStartDate).HasColumnType("datetime");
            entity.Property(e => e.CompressibilityFactorUnitId).HasColumnName("CompressibilityFactorUnitID");
            entity.Property(e => e.ContractDay).HasComment("Between -5and 28, inclusive. If no value is provided in the file and the meter does not have a contract day specified in FLOWCAL, then a contract day of 1 will be used. If a contract day of 0 is specified, FLOWCAL will treat this the same as a contract day of 1.");
            entity.Property(e => e.ContractHour).HasComment("Between 0 and 23, inclusive. If no value is provided in the file and the meter does not have a contract hour specified in FLOWCAL, then the contract hour for the system that the meter belongs to will be used as the contract hour.");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Decane).HasComment("Mole %");
            entity.Property(e => e.DensityMeterFactor).HasComment("Densitometer Correction Factor, DCF, Pyc Factor");
            entity.Property(e => e.DensityUnitId).HasColumnName("DensityUnitID");
            entity.Property(e => e.DpcalibratedRangeHigh).HasColumnName("DPCalibratedRangeHigh");
            entity.Property(e => e.DpcalibratedRangeLow).HasColumnName("DPCalibratedRangeLow");
            entity.Property(e => e.DphighAlarmSetPoint).HasColumnName("DPHighAlarmSetPoint");
            entity.Property(e => e.DplowAlarmSetPoint).HasColumnName("DPLowAlarmSetPoint");
            entity.Property(e => e.DptransducerRangeHigh).HasColumnName("DPTransducerRangeHigh");
            entity.Property(e => e.DptransducerRangeLow).HasColumnName("DPTransducerRangeLow");
            entity.Property(e => e.EfmHeatingValueSaturationConditionId).HasColumnName("EfmHeatingValueSaturationConditionID");
            entity.Property(e => e.EfmRelativeDensitySaturationConditionId).HasColumnName("EfmRelativeDensitySaturationConditionID");
            entity.Property(e => e.EquilibriumVaporPressureUnitId).HasColumnName("EquilibriumVaporPressureUnitID");
            entity.Property(e => e.Ethane).HasComment("Mole %");
            entity.Property(e => e.Ethylene).HasComment("Mole %");
            entity.Property(e => e.ExtensionDefinitionId).HasColumnName("ExtensionDefinitionID");
            entity.Property(e => e.FactorFa).HasComment("Indicates that the Factor Fa is included in the AGA-3(1985) calculation of gas volume.");
            entity.Property(e => e.FactorFb).HasComment("Indicates that the Factor Fb is included in the AGA-3(1985) calculation of gas volume.");
            entity.Property(e => e.FactorFg).HasComment("Indicates that the Factor Fg is included in the AGA-3(1985) calculation of gas volume.");
            entity.Property(e => e.FactorFpv).HasComment("Indicates that the Factor Fpv is included in the AGA-3(1985) calculation of gas volume.");
            entity.Property(e => e.FactorFr).HasComment("Indicates that the Factor Fr is included in the AGA-3(1985) calculation of gas volume");
            entity.Property(e => e.FactorFt).HasComment("Indicates that the Factor Ft is included in the AGA-3(1985) calculation of gas volume.");
            entity.Property(e => e.FactorFws).HasComment("Indicates that the Full Well Stream Factor has been applied to the\r\ngas volume.");
            entity.Property(e => e.FactorFwv).HasComment("Indicates that water vapor correction has been calculated and\r\napplied to the gas volume.");
            entity.Property(e => e.FactorY).HasComment("Indicates that the Factor Y is included in the AGA-3(1985) calculation of gas volume.");
            entity.Property(e => e.FirstDeliveryDate).HasColumnType("datetime");
            entity.Property(e => e.FittingTypeId).HasColumnName("FittingTypeID");
            entity.Property(e => e.FixedFactor).HasComment("Null and zero are treated as 1\r\n; Coefficient of Discharge for Cone meters");
            entity.Property(e => e.FlowComputerId)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasComment("Flow computer Identification for product mapping")
                .HasColumnName("FlowComputerID");
            entity.Property(e => e.FlowingPressureEffect).HasComment("Coriolis only. Given as a percent of rate per unit pressure");
            entity.Property(e => e.FlowingPressureEnabled).HasComment("Coriolis only. Indicates that the Correction for Flow Pressure Effect, Ffpe, is used in the mass calculation.");
            entity.Property(e => e.FluidStandardId).HasColumnName("FluidStandardID");
            entity.Property(e => e.FluidTypeId).HasColumnName("FluidTypeID");
            entity.Property(e => e.FullWellStreamFactor).HasComment("Null and zero are treated as 1");
            entity.Property(e => e.GasPressureBaseUnitId).HasColumnName("GasPressureBaseUnitID");
            entity.Property(e => e.GasRelativeDensity).HasComment("Gas Relative Density at base conditions");
            entity.Property(e => e.GasVolumeKfactorUnitId).HasColumnName("GasVolumeKFactorUnitID");
            entity.Property(e => e.GrossStandardVolumeUnitId).HasColumnName("GrossStandardVolumeUnitID");
            entity.Property(e => e.GrossVolumeUnitId).HasColumnName("GrossVolumeUnitID");
            entity.Property(e => e.HasDefaultTemperature).HasComment("Indicates default temperature is used in the gas volume calculation.");
            entity.Property(e => e.HasRtd)
                .HasComment("Indicates that an RTD is attached.")
                .HasColumnName("HasRTD");
            entity.Property(e => e.Helium).HasComment("Mole %");
            entity.Property(e => e.Heptane).HasComment("Mole %");
            entity.Property(e => e.Hexane).HasComment("Mole %");
            entity.Property(e => e.Hydrogen).HasComment("Mole %");
            entity.Property(e => e.HydrogenSulfide).HasComment("Mole %");
            entity.Property(e => e.HydrogenSulfideContent).HasComment("H2S content in ppm");
            entity.Property(e => e.IButane).HasColumnName("iButane");
            entity.Property(e => e.IPentane).HasColumnName("iPentane");
            entity.Property(e => e.IndicatedVolumeUnitId).HasColumnName("IndicatedVolumeUnitID");
            entity.Property(e => e.Kfactor)
                .HasComment("Linear meters.")
                .HasColumnName("KFactor");
            entity.Property(e => e.LiquidVolumeKfactorUnitId).HasColumnName("LiquidVolumeKFactorUnitID");
            entity.Property(e => e.MassHeatingValueUnitId).HasColumnName("MassHeatingValueUnitID");
            entity.Property(e => e.MassKfactorUnitId).HasColumnName("MassKFactorUnitID");
            entity.Property(e => e.MassUnitId).HasColumnName("MassUnitID");
            entity.Property(e => e.MeterAccessDate).HasColumnType("datetime");
            entity.Property(e => e.MeterFactor).HasComment("Linear meters.");
            entity.Property(e => e.MeterFactorKfactorCurveIsAveraged)
                .HasComment("Coriolis only.")
                .HasColumnName("MeterFactorKFactorCurveIsAveraged");
            entity.Property(e => e.MeterFactorUsageId).HasColumnName("MeterFactorUsageID");
            entity.Property(e => e.MeterNumber)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.MeterSerialNumber)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.MeterStandardId).HasColumnName("MeterStandardID");
            entity.Property(e => e.Methane).HasComment("Mole %");
            entity.Property(e => e.NButane)
                .HasComment("Mole %")
                .HasColumnName("nButane");
            entity.Property(e => e.NPentane)
                .HasComment("Mole %")
                .HasColumnName("nPentane");
            entity.Property(e => e.NetStandardVolumeUnitId).HasColumnName("NetStandardVolumeUnitID");
            entity.Property(e => e.Nitrogen).HasComment("Mole %");
            entity.Property(e => e.Nonane).HasComment("Mole %");
            entity.Property(e => e.NumberOfDialsTotalizerDigits).HasComment("Dials (or digits) are used to determine when an index reading has\r\n“rolled over”.");
            entity.Property(e => e.ObservedDensityUnitId).HasColumnName("ObservedDensityUnitID");
            entity.Property(e => e.Octane).HasComment("Mole %");
            entity.Property(e => e.Oxygen).HasComment("Mole %");
            entity.Property(e => e.Pb).HasComment("Pressure base for measured gas volume or gas equivalent volume");
            entity.Property(e => e.PipeDiameterUnitId).HasColumnName("PipeDiameterUnitID");
            entity.Property(e => e.PipeLength).HasComment("Line Pack only.");
            entity.Property(e => e.PipeLengthUnitId).HasColumnName("PipeLengthUnitID");
            entity.Property(e => e.PipeMaterialId).HasColumnName("PipeMaterialID");
            entity.Property(e => e.PipeReferenceTemperatureUnitId).HasColumnName("PipeReferenceTemperatureUnitID");
            entity.Property(e => e.PowerSourceId).HasColumnName("PowerSourceID");
            entity.Property(e => e.PressureCompenstated).HasComment("Indicates if the volume is already corrected for pressure.");
            entity.Property(e => e.ProductName)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Propane).HasComment("Mole %");
            entity.Property(e => e.Propylene).HasComment("Mole %");
            entity.Property(e => e.ProveDate).HasColumnType("datetime");
            entity.Property(e => e.PycDate).HasColumnType("datetime");
            entity.Property(e => e.Rotation).HasComment("Number of days for a chart");
            entity.Property(e => e.SampleDate).HasColumnType("datetime");
            entity.Property(e => e.SampleTypeId).HasColumnName("SampleTypeID");
            entity.Property(e => e.ShrinkFactor).HasComment("Shrink factor to calculate theoretical production on liquid meters.");
            entity.Property(e => e.SpcalibratedRangeHigh).HasColumnName("SPCalibratedRangeHigh");
            entity.Property(e => e.SpcalibratedRangeLow).HasColumnName("SPCalibratedRangeLow");
            entity.Property(e => e.SphighAlarmSetPoint).HasColumnName("SPHighAlarmSetPoint");
            entity.Property(e => e.SplowAlarmSetPoint).HasColumnName("SPLowAlarmSetPoint");
            entity.Property(e => e.SptransducerRangeHigh).HasColumnName("SPTransducerRangeHigh");
            entity.Property(e => e.SptransducerRangeLow).HasColumnName("SPTransducerRangeLow");
            entity.Property(e => e.StaticPressureMeasurementId).HasColumnName("StaticPressureMeasurementID");
            entity.Property(e => e.StaticTapTypeId).HasColumnName("StaticTapTypeID");
            entity.Property(e => e.StockTankDensity).HasComment("Density at stock tank conditions to calculate theoretical production on\r\nliquid meters.");
            entity.Property(e => e.StockTankSedimentAndWaterPercent).HasComment("S&W% at stock tank conditions to calculate theoretical production on\r\nliquid meters.");
            entity.Property(e => e.TapTypeId).HasColumnName("TapTypeID");
            entity.Property(e => e.Tb).HasComment("Temperature base for measured gas volume or gas equivalent volume");
            entity.Property(e => e.TemperatureBaseUnitId).HasColumnName("TemperatureBaseUnitID");
            entity.Property(e => e.TemperatureCompensated).HasComment("Indicates if the volume is already corrected for temperature.");
            entity.Property(e => e.UseRtd)
                .HasComment("Indicates that an attached RTD is in use. Has RTD and Use RTD are not stored in FLOWCAL but an exception will be generated if these two fields do not match.")
                .HasColumnName("UseRTD");
            entity.Property(e => e.UserCharacteristic01)
                .HasMaxLength(32)
                .IsUnicode(false);
            entity.Property(e => e.UserCharacteristic02)
                .HasMaxLength(32)
                .IsUnicode(false);
            entity.Property(e => e.UserCharacteristic03)
                .HasMaxLength(32)
                .IsUnicode(false);
            entity.Property(e => e.UserCharacteristic04)
                .HasMaxLength(32)
                .IsUnicode(false);
            entity.Property(e => e.UserCharacteristic05)
                .HasMaxLength(32)
                .IsUnicode(false);
            entity.Property(e => e.UserCharacteristic06)
                .HasMaxLength(32)
                .IsUnicode(false);
            entity.Property(e => e.UserCharacteristic07)
                .HasMaxLength(32)
                .IsUnicode(false);
            entity.Property(e => e.UserCharacteristic08)
                .HasMaxLength(32)
                .IsUnicode(false);
            entity.Property(e => e.UserCharacteristic09)
                .HasMaxLength(32)
                .IsUnicode(false);
            entity.Property(e => e.UserCharacteristic10)
                .HasMaxLength(32)
                .IsUnicode(false);
            entity.Property(e => e.UserCharacteristic11)
                .HasMaxLength(32)
                .IsUnicode(false);
            entity.Property(e => e.UserCharacteristic12)
                .HasMaxLength(32)
                .IsUnicode(false);
            entity.Property(e => e.UserCharacteristic13)
                .HasMaxLength(32)
                .IsUnicode(false);
            entity.Property(e => e.UserCharacteristic14)
                .HasMaxLength(32)
                .IsUnicode(false);
            entity.Property(e => e.UserCharacteristic15)
                .HasMaxLength(32)
                .IsUnicode(false);
            entity.Property(e => e.UserCharacteristic16)
                .HasMaxLength(32)
                .IsUnicode(false);
            entity.Property(e => e.UserCharacteristic17)
                .HasMaxLength(32)
                .IsUnicode(false);
            entity.Property(e => e.UserCharacteristic18)
                .HasMaxLength(32)
                .IsUnicode(false);
            entity.Property(e => e.UserCharacteristic19)
                .HasMaxLength(32)
                .IsUnicode(false);
            entity.Property(e => e.UserCharacteristic20)
                .HasMaxLength(32)
                .IsUnicode(false);
            entity.Property(e => e.UserCharacteristic21)
                .HasMaxLength(32)
                .IsUnicode(false);
            entity.Property(e => e.UserCharacteristic22)
                .HasMaxLength(32)
                .IsUnicode(false);
            entity.Property(e => e.UserCharacteristic23)
                .HasMaxLength(32)
                .IsUnicode(false);
            entity.Property(e => e.UserCharacteristic24)
                .HasMaxLength(32)
                .IsUnicode(false);
            entity.Property(e => e.UserCharacteristic25)
                .HasMaxLength(32)
                .IsUnicode(false);
            entity.Property(e => e.UserCharacteristic26)
                .HasMaxLength(32)
                .IsUnicode(false);
            entity.Property(e => e.UserCharacteristic27)
                .HasMaxLength(32)
                .IsUnicode(false);
            entity.Property(e => e.UserCharacteristic28)
                .HasMaxLength(32)
                .IsUnicode(false);
            entity.Property(e => e.UserCharacteristic29)
                .HasMaxLength(32)
                .IsUnicode(false);
            entity.Property(e => e.UserCharacteristic30)
                .HasMaxLength(32)
                .IsUnicode(false);
            entity.Property(e => e.ViscosityUnitId).HasColumnName("ViscosityUnitID");
            entity.Property(e => e.VolumetricHeatingValueUnitId).HasColumnName("VolumetricHeatingValueUnitID");
            entity.Property(e => e.WarmStartDate).HasColumnType("datetime");
            entity.Property(e => e.Water).HasComment("Mole %");
            entity.Property(e => e.WaterContent).HasComment("Amount of water per unit volume. For example, lbs/MMscf");

            entity.HasOne(d => d.AlphaUnit).WithMany(p => p.MeterConfigurations)
                .HasForeignKey(d => d.AlphaUnitId)
                .HasConstraintName("FK_MeterConfigurations_AlphaUnits1");

            entity.HasOne(d => d.AlphaUnitNavigation).WithMany(p => p.MeterConfigurationAlphaUnitNavigations)
                .HasForeignKey(d => d.AlphaUnitId)
                .HasConstraintName("FK_MeterConfigurations_AlphaUnits");

            entity.HasOne(d => d.AtmosphericPressureUnit).WithMany(p => p.MeterConfigurationAtmosphericPressureUnits)
                .HasForeignKey(d => d.AtmosphericPressureUnitId)
                .HasConstraintName("FK_MeterConfigurations_AtmosphericPressureUnits");

            entity.HasOne(d => d.BoreDiameterUnit).WithMany(p => p.MeterConfigurationBoreDiameterUnits)
                .HasForeignKey(d => d.BoreDiameterUnitId)
                .HasConstraintName("FK_MeterConfigurations_BoreDiameterUnits");

            entity.HasOne(d => d.BoreMaterial).WithMany(p => p.MeterConfigurationBoreMaterials)
                .HasForeignKey(d => d.BoreMaterialId)
                .HasConstraintName("FK_MeterConfigurations_BoreMaterials");

            entity.HasOne(d => d.BoreReferenceTemperatureUnit).WithMany(p => p.MeterConfigurationBoreReferenceTemperatureUnits)
                .HasForeignKey(d => d.BoreReferenceTemperatureUnitId)
                .HasConstraintName("FK_MeterConfigurations_BoreReferenceTemperatureUnits");

            entity.HasOne(d => d.CompressibilityFactorUnit).WithMany(p => p.MeterConfigurations)
                .HasForeignKey(d => d.CompressibilityFactorUnitId)
                .HasConstraintName("FK_MeterConfigurations_CompressibilityFactorUnits");

            entity.HasOne(d => d.DensityUnit).WithMany(p => p.MeterConfigurationDensityUnits)
                .HasForeignKey(d => d.DensityUnitId)
                .HasConstraintName("FK_MeterConfigurations_DensityUnits");

            entity.HasOne(d => d.DifferentialPressureUnitNavigation).WithMany(p => p.MeterConfigurationDifferentialPressureUnitNavigations)
                .HasForeignKey(d => d.DifferentialPressureUnit)
                .HasConstraintName("FK_MeterConfigurations_DifferentialPressureUnits");

            entity.HasOne(d => d.EfmHeatingValueSaturationCondition).WithMany(p => p.MeterConfigurationEfmHeatingValueSaturationConditions)
                .HasForeignKey(d => d.EfmHeatingValueSaturationConditionId)
                .HasConstraintName("FK_MeterConfigurations_HeatingValueSaturationConditions");

            entity.HasOne(d => d.EfmRelativeDensitySaturationCondition).WithMany(p => p.MeterConfigurationEfmRelativeDensitySaturationConditions)
                .HasForeignKey(d => d.EfmRelativeDensitySaturationConditionId)
                .HasConstraintName("FK_MeterConfigurations_RelativeDensitySaturationConditions");

            entity.HasOne(d => d.EnergyUnitNavigation).WithMany(p => p.MeterConfigurationEnergyUnitNavigations)
                .HasForeignKey(d => d.EnergyUnit)
                .HasConstraintName("FK_MeterConfigurations_EnergyUnits");

            entity.HasOne(d => d.EquilibriumVaporPressureUnit).WithMany(p => p.MeterConfigurationEquilibriumVaporPressureUnits)
                .HasForeignKey(d => d.EquilibriumVaporPressureUnitId)
                .HasConstraintName("FK_MeterConfigurations_EvpUnits");

            entity.HasOne(d => d.ExtensionDefinition).WithMany(p => p.MeterConfigurations)
                .HasForeignKey(d => d.ExtensionDefinitionId)
                .HasConstraintName("FK_MeterConfigurations_ExtensionDefinitions");

            entity.HasOne(d => d.FittingType).WithMany(p => p.MeterConfigurations)
                .HasForeignKey(d => d.FittingTypeId)
                .HasConstraintName("FK_MeterConfigurations_FittingTypes");

            entity.HasOne(d => d.FluidStandard).WithMany(p => p.MeterConfigurations)
                .HasForeignKey(d => d.FluidStandardId)
                .HasConstraintName("FK_MeterConfigurations_FluidStandards");

            entity.HasOne(d => d.FluidType).WithMany(p => p.MeterConfigurations)
                .HasForeignKey(d => d.FluidTypeId)
                .HasConstraintName("FK_MeterConfigurations_FluidTypes");

            entity.HasOne(d => d.GasPressureBaseUnit).WithMany(p => p.MeterConfigurationGasPressureBaseUnits)
                .HasForeignKey(d => d.GasPressureBaseUnitId)
                .HasConstraintName("FK_MeterConfigurations_GasPressureBaseUnits");

            entity.HasOne(d => d.GasVolumeKfactorUnit).WithMany(p => p.MeterConfigurations)
                .HasForeignKey(d => d.GasVolumeKfactorUnitId)
                .HasConstraintName("FK_MeterConfigurations_GasVolumeKFactorUnits");

            entity.HasOne(d => d.GrossStandardVolumeUnit).WithMany(p => p.MeterConfigurationGrossStandardVolumeUnits)
                .HasForeignKey(d => d.GrossStandardVolumeUnitId)
                .HasConstraintName("FK_MeterConfigurations_GrossStandardVolumeUnits");

            entity.HasOne(d => d.GrossVolumeUnit).WithMany(p => p.MeterConfigurationGrossVolumeUnits)
                .HasForeignKey(d => d.GrossVolumeUnitId)
                .HasConstraintName("FK_MeterConfigurations_GrossVolumeUnits");

            entity.HasOne(d => d.IndicatedVolumeUnit).WithMany(p => p.MeterConfigurationIndicatedVolumeUnits)
                .HasForeignKey(d => d.IndicatedVolumeUnitId)
                .HasConstraintName("FK_MeterConfigurations_IndicatedVolumeUnits");

            entity.HasOne(d => d.LiquidVolumeKfactorUnit).WithMany(p => p.MeterConfigurations)
                .HasForeignKey(d => d.LiquidVolumeKfactorUnitId)
                .HasConstraintName("FK_MeterConfigurations_LiquidVolumeKFactorUnits");

            entity.HasOne(d => d.MassHeatingValueUnit).WithMany(p => p.MeterConfigurations)
                .HasForeignKey(d => d.MassHeatingValueUnitId)
                .HasConstraintName("FK_MeterConfigurations_MassHeatingValueUnits");

            entity.HasOne(d => d.MassKfactorUnit).WithMany(p => p.MeterConfigurations)
                .HasForeignKey(d => d.MassKfactorUnitId)
                .HasConstraintName("FK_MeterConfigurations_MassKFactorUnits");

            entity.HasOne(d => d.MassUnit).WithMany(p => p.MeterConfigurationMassUnits)
                .HasForeignKey(d => d.MassUnitId)
                .HasConstraintName("FK_MeterConfigurations_MassUnits");

            entity.HasOne(d => d.MeasuredVolumeUnitNavigation).WithMany(p => p.MeterConfigurationMeasuredVolumeUnitNavigations)
                .HasForeignKey(d => d.MeasuredVolumeUnit)
                .HasConstraintName("FK_MeterConfigurations_MeasuredVolumeUnits");

            entity.HasOne(d => d.MeterFactorUsage).WithMany(p => p.MeterConfigurations)
                .HasForeignKey(d => d.MeterFactorUsageId)
                .HasConstraintName("FK_MeterConfigurations_MeterFactorUsages");

            entity.HasOne(d => d.MeterStandard).WithMany(p => p.MeterConfigurations)
                .HasForeignKey(d => d.MeterStandardId)
                .HasConstraintName("FK_MeterConfigurations_MeterStandards");

            entity.HasOne(d => d.NetStandardVolumeUnit).WithMany(p => p.MeterConfigurationNetStandardVolumeUnits)
                .HasForeignKey(d => d.NetStandardVolumeUnitId)
                .HasConstraintName("FK_MeterConfigurations_NetStandardVolumeUnits");

            entity.HasOne(d => d.ObservedDensityUnit).WithMany(p => p.MeterConfigurationObservedDensityUnits)
                .HasForeignKey(d => d.ObservedDensityUnitId)
                .HasConstraintName("FK_MeterConfigurations_ObservedDensityUnits");

            entity.HasOne(d => d.PipeDiameterUnit).WithMany(p => p.MeterConfigurationPipeDiameterUnits)
                .HasForeignKey(d => d.PipeDiameterUnitId)
                .HasConstraintName("FK_MeterConfigurations_PipeDiameterUnits");

            entity.HasOne(d => d.PipeLengthUnit).WithMany(p => p.MeterConfigurationPipeLengthUnits)
                .HasForeignKey(d => d.PipeLengthUnitId)
                .HasConstraintName("FK_MeterConfigurations_PipeLengthUnits");

            entity.HasOne(d => d.PipeMaterial).WithMany(p => p.MeterConfigurationPipeMaterials)
                .HasForeignKey(d => d.PipeMaterialId)
                .HasConstraintName("FK_MeterConfigurations_PipeMaterials");

            entity.HasOne(d => d.PipeReferenceTemperatureUnit).WithMany(p => p.MeterConfigurationPipeReferenceTemperatureUnits)
                .HasForeignKey(d => d.PipeReferenceTemperatureUnitId)
                .HasConstraintName("FK_MeterConfigurations_PipeReferenceTemperatureUnits");

            entity.HasOne(d => d.PowerSource).WithMany(p => p.MeterConfigurations)
                .HasForeignKey(d => d.PowerSourceId)
                .HasConstraintName("FK_MeterConfigurations_PowerSources");

            entity.HasOne(d => d.RawVolumeUnitNavigation).WithMany(p => p.MeterConfigurationRawVolumeUnitNavigations)
                .HasForeignKey(d => d.RawVolumeUnit)
                .HasConstraintName("FK_MeterConfigurations_RawVolumeUnits");

            entity.HasOne(d => d.SampleType).WithMany(p => p.MeterConfigurations)
                .HasForeignKey(d => d.SampleTypeId)
                .HasConstraintName("FK_MeterConfigurations_SampleTypes");

            entity.HasOne(d => d.StaticPressureMeasurement).WithMany(p => p.MeterConfigurations)
                .HasForeignKey(d => d.StaticPressureMeasurementId)
                .HasConstraintName("FK_MeterConfigurations_StaticPressureMeasurements");

            entity.HasOne(d => d.StaticPressureUnitNavigation).WithMany(p => p.MeterConfigurationStaticPressureUnitNavigations)
                .HasForeignKey(d => d.StaticPressureUnit)
                .HasConstraintName("FK_MeterConfigurations_StaticPressureUnits");

            entity.HasOne(d => d.StaticTapType).WithMany(p => p.MeterConfigurations)
                .HasForeignKey(d => d.StaticTapTypeId)
                .HasConstraintName("FK_MeterConfigurations_StaticTapTypes");

            entity.HasOne(d => d.TapType).WithMany(p => p.MeterConfigurations)
                .HasForeignKey(d => d.TapTypeId)
                .HasConstraintName("FK_MeterConfigurations_TapTypes");

            entity.HasOne(d => d.TemperatureBaseUnit).WithMany(p => p.MeterConfigurationTemperatureBaseUnits)
                .HasForeignKey(d => d.TemperatureBaseUnitId)
                .HasConstraintName("FK_MeterConfigurations_TemperatureBaseUnits");

            entity.HasOne(d => d.TemperatureUnitNavigation).WithMany(p => p.MeterConfigurationTemperatureUnitNavigations)
                .HasForeignKey(d => d.TemperatureUnit)
                .HasConstraintName("FK_MeterConfigurations_TemperatureUnits");

            entity.HasOne(d => d.ViscosityUnit).WithMany(p => p.MeterConfigurationViscosityUnits)
                .HasForeignKey(d => d.ViscosityUnitId)
                .HasConstraintName("FK_MeterConfigurations_ViscosityUnits");

            entity.HasOne(d => d.VolumetricHeatingValueUnit).WithMany(p => p.MeterConfigurations)
                .HasForeignKey(d => d.VolumetricHeatingValueUnitId)
                .HasConstraintName("FK_MeterConfigurations_VolumetricHeatingValueUnits");
        });

        modelBuilder.Entity<MeterEvent>(entity =>
        {
            entity.HasKey(e => new { e.TimeStamp, e.MeterId, e.RecordIndex }).HasName("PK_MeterEvents_1");

            entity.Property(e => e.TimeStamp).HasColumnType("datetime");
            entity.Property(e => e.MeterId).HasColumnName("MeterID");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.EventCode).HasMaxLength(255);
            entity.Property(e => e.EventSource).HasMaxLength(255);
            entity.Property(e => e.EventText).HasMaxLength(255);
            entity.Property(e => e.MeterEventTypeId).HasColumnName("MeterEventTypeID");
            entity.Property(e => e.OperatorId)
                .HasMaxLength(255)
                .HasColumnName("OperatorID");

            entity.HasOne(d => d.MeterEventType).WithMany(p => p.MeterEvents)
                .HasForeignKey(d => d.MeterEventTypeId)
                .HasConstraintName("FK_MeterEvents_MeterEventTypes");

            entity.HasOne(d => d.Meter).WithMany(p => p.MeterEvents)
                .HasForeignKey(d => d.MeterId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_MeterEvents_Meters");
        });

        modelBuilder.Entity<MeterEventType>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(64)
                .IsUnicode(false);
        });

        modelBuilder.Entity<MeterException>(entity =>
        {
            entity.HasKey(e => new { e.MeterId, e.TimeStamp, e.MeterExceptionTypeId });

            entity.Property(e => e.MeterId).HasColumnName("MeterID");
            entity.Property(e => e.TimeStamp).HasColumnType("datetime");
            entity.Property(e => e.MeterExceptionTypeId).HasColumnName("MeterExceptionTypeID");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.MeterExceptionResolutionTypeId).HasColumnName("MeterExceptionResolutionTypeID");
            entity.Property(e => e.ResolvedByUserId).HasColumnName("ResolvedByUserID");

            entity.HasOne(d => d.MeterExceptionResolutionType).WithMany(p => p.MeterExceptions)
                .HasForeignKey(d => d.MeterExceptionResolutionTypeId)
                .HasConstraintName("FK_MeterExceptions_MeterExceptionResolutionTypes");

            entity.HasOne(d => d.MeterExceptionType).WithMany(p => p.MeterExceptions)
                .HasForeignKey(d => d.MeterExceptionTypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_MeterExceptions_MeterExceptionTypes");

            entity.HasOne(d => d.Meter).WithMany(p => p.MeterExceptions)
                .HasForeignKey(d => d.MeterId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_MeterExceptions_Meters");

            entity.HasOne(d => d.ResolvedByUser).WithMany(p => p.MeterExceptions)
                .HasForeignKey(d => d.ResolvedByUserId)
                .HasConstraintName("FK_MeterExceptions_Users");
        });

        modelBuilder.Entity<MeterExceptionResolutionType>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(64)
                .IsUnicode(false);
        });

        modelBuilder.Entity<MeterExceptionType>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(64)
                .IsUnicode(false);
        });

        modelBuilder.Entity<MeterExportType>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(32)
                .IsUnicode(false);
        });

        modelBuilder.Entity<MeterFactorUsage>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(32)
                .IsUnicode(false);
        });

        modelBuilder.Entity<MeterPurpose>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(32)
                .IsUnicode(false);
        });

        modelBuilder.Entity<MeterRun>(entity =>
        {
            entity.HasKey(e => e.HierarchyId);

            entity.HasIndex(e => e.MeterId, "IX_MeterRuns").IsUnique();

            entity.Property(e => e.HierarchyId)
                .ValueGeneratedNever()
                .HasColumnName("HierarchyID");
            entity.Property(e => e.AutoPollLastRunDateTime).HasColumnType("datetime");
            entity.Property(e => e.AutoPollOffsetDateTime).HasColumnType("datetime");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.ExportArchiveFolder).HasMaxLength(1024);
            entity.Property(e => e.ExportLastRunDateTime).HasColumnType("datetime");
            entity.Property(e => e.ExportOffsetDateTime).HasColumnType("datetime");
            entity.Property(e => e.ExportPrimaryFolder).HasMaxLength(1024);
            entity.Property(e => e.LastExportDateTime).HasColumnType("datetime");
            entity.Property(e => e.LastPollDateTime).HasColumnType("datetime");
            entity.Property(e => e.MeterDescription).HasMaxLength(255);
            entity.Property(e => e.MeterExportTypeId).HasColumnName("MeterExportTypeID");
            entity.Property(e => e.MeterId).HasColumnName("MeterID");
            entity.Property(e => e.MeterTag).HasMaxLength(255);

            entity.HasOne(d => d.Hierarchy).WithOne(p => p.MeterRun)
                .HasForeignKey<MeterRun>(d => d.HierarchyId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_MeterRuns_Hierarchy");

            entity.HasOne(d => d.MeterExportType).WithMany(p => p.MeterRuns)
                .HasForeignKey(d => d.MeterExportTypeId)
                .HasConstraintName("FK_MeterRuns_MeterExportTypes");

            entity.HasOne(d => d.Meter).WithOne(p => p.MeterRun)
                .HasForeignKey<MeterRun>(d => d.MeterId)
                .HasConstraintName("FK_MeterRuns_Meters");
        });

        modelBuilder.Entity<MeterStandard>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<NodeType>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<NodeTypeDailyLogProperty>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.EntityName)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.NodeTypeId).HasColumnName("NodeTypeID");
            entity.Property(e => e.PropertyName)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.UnitId).HasColumnName("UnitID");

            entity.HasOne(d => d.NodeType).WithMany(p => p.NodeTypeDailyLogProperties)
                .HasForeignKey(d => d.NodeTypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_NodeTypeDailyLogProperties_NodeTypes");

            entity.HasOne(d => d.Unit).WithMany(p => p.NodeTypeDailyLogProperties)
                .HasForeignKey(d => d.UnitId)
                .HasConstraintName("FK_NodeTypeDailyLogProperties_Units");
        });

        modelBuilder.Entity<NozzleType>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Observation>(entity =>
        {
            entity.Property(e => e.Id)
                .HasDefaultValueSql("(newid())")
                .HasColumnName("ID");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Notes).IsUnicode(false);
            entity.Property(e => e.RunSheetId).HasColumnName("RunSheetID");
            entity.Property(e => e.TimeStamp).HasColumnType("datetime");
            entity.Property(e => e.UserId).HasColumnName("UserID");

            entity.HasOne(d => d.RunSheet).WithMany(p => p.Observations)
                .HasForeignKey(d => d.RunSheetId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Observations_RunSheets");
        });

        modelBuilder.Entity<PeriodicGasFlowRecord>(entity =>
        {
            entity.HasKey(e => new { e.MeterId, e.TimeStamp, e.Duration, e.RecordIndex });

            entity.Property(e => e.MeterId).HasColumnName("MeterID");
            entity.Property(e => e.TimeStamp).HasColumnType("datetime");
            entity.Property(e => e.Argon).HasComment("Mole %");
            entity.Property(e => e.CarbonDioxide).HasComment("Mole %");
            entity.Property(e => e.CarbonMonoxide).HasComment("Mole %");
            entity.Property(e => e.Cprime).HasColumnName("CPrime");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Decane).HasComment("Mole %");
            entity.Property(e => e.Dp).HasColumnName("DP");
            entity.Property(e => e.Ethane).HasComment("Mole %");
            entity.Property(e => e.Helium).HasComment("Mole %");
            entity.Property(e => e.Heptane).HasComment("Mole %");
            entity.Property(e => e.Hexane).HasComment("Mole %");
            entity.Property(e => e.Hydrogen).HasComment("Mole %");
            entity.Property(e => e.HydrogenSulfide).HasComment("Mole %");
            entity.Property(e => e.IButane).HasColumnName("iButane");
            entity.Property(e => e.IPentane).HasColumnName("iPentane");
            entity.Property(e => e.Kfactor).HasColumnName("KFactor");
            entity.Property(e => e.Methane).HasComment("Mole %");
            entity.Property(e => e.NButane)
                .HasComment("Mole %")
                .HasColumnName("nButane");
            entity.Property(e => e.NPentane)
                .HasComment("Mole %")
                .HasColumnName("nPentane");
            entity.Property(e => e.Nitrogen).HasComment("Mole %");
            entity.Property(e => e.Nonane).HasComment("Mole %");
            entity.Property(e => e.Octane).HasComment("Mole %");
            entity.Property(e => e.Oxygen).HasComment("Mole %");
            entity.Property(e => e.Propane).HasComment("Mole %");
            entity.Property(e => e.UserDefined09)
                .HasMaxLength(32)
                .IsUnicode(false);
            entity.Property(e => e.UserDefined10)
                .HasMaxLength(32)
                .IsUnicode(false);
            entity.Property(e => e.Water).HasComment("Mole %");

            entity.HasOne(d => d.Meter).WithMany(p => p.PeriodicGasFlowRecords)
                .HasForeignKey(d => d.MeterId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_PeriodicGasFlowRecords_Meters");
        });

        modelBuilder.Entity<PeriodicLiquidFlowRecord>(entity =>
        {
            entity.HasKey(e => new { e.MeterId, e.TimeStamp, e.Duration, e.RecordIndex });

            entity.Property(e => e.MeterId).HasColumnName("MeterID");
            entity.Property(e => e.TimeStamp).HasColumnType("datetime");
            entity.Property(e => e.AlphaUnitId).HasColumnName("AlphaUnitID");
            entity.Property(e => e.Apidegrees).HasColumnName("APIDegrees");
            entity.Property(e => e.Argon).HasComment("Mole %");
            entity.Property(e => e.CarbonDioxide).HasComment("Mole %");
            entity.Property(e => e.CarbonMonoxide).HasComment("Mole %");
            entity.Property(e => e.Ccf).HasColumnName("CCF");
            entity.Property(e => e.CompressibilityFactorUnitId).HasColumnName("CompressibilityFactorUnitID");
            entity.Property(e => e.Cpl).HasColumnName("CPL");
            entity.Property(e => e.Cprime).HasColumnName("CPrime");
            entity.Property(e => e.Ctl).HasColumnName("CTL");
            entity.Property(e => e.Ctpl).HasColumnName("CTPL");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Decane).HasComment("Mole %");
            entity.Property(e => e.DensityUnitId).HasColumnName("DensityUnitID");
            entity.Property(e => e.Dp).HasColumnName("DP");
            entity.Property(e => e.Ethane).HasComment("Mole %");
            entity.Property(e => e.EvpUnitId).HasColumnName("EvpUnitID");
            entity.Property(e => e.FluidStandardId).HasColumnName("FluidStandardID");
            entity.Property(e => e.FluidTypeId).HasColumnName("FluidTypeID");
            entity.Property(e => e.Helium).HasComment("Mole %");
            entity.Property(e => e.Heptane).HasComment("Mole %");
            entity.Property(e => e.Hexane).HasComment("Mole %");
            entity.Property(e => e.Hydrogen).HasComment("Mole %");
            entity.Property(e => e.HydrogenSulfide).HasComment("Mole %");
            entity.Property(e => e.IButane).HasColumnName("iButane");
            entity.Property(e => e.IPentane).HasColumnName("iPentane");
            entity.Property(e => e.Kfactor).HasColumnName("KFactor");
            entity.Property(e => e.NButane)
                .HasComment("Mole %")
                .HasColumnName("nButane");
            entity.Property(e => e.NPentane)
                .HasComment("Mole %")
                .HasColumnName("nPentane");
            entity.Property(e => e.Nitrogen).HasComment("Mole %");
            entity.Property(e => e.Nonane).HasComment("Mole %");
            entity.Property(e => e.Octane).HasComment("Mole %");
            entity.Property(e => e.Oxygen).HasComment("Mole %");
            entity.Property(e => e.ProductName)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Propane).HasComment("Mole %");
            entity.Property(e => e.ProveDate).HasColumnType("datetime");
            entity.Property(e => e.PycDate).HasColumnType("datetime");
            entity.Property(e => e.TemperatureBaseUnitId).HasColumnName("TemperatureBaseUnitID");
            entity.Property(e => e.UserDefined010)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.UserDefined09)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Water).HasComment("Mole %");

            entity.HasOne(d => d.AlphaUnit).WithMany(p => p.PeriodicLiquidFlowRecords)
                .HasForeignKey(d => d.AlphaUnitId)
                .HasConstraintName("FK_PeriodicLiquidFlowRecords_AlphaUnits");

            entity.HasOne(d => d.CompressibilityFactorUnit).WithMany(p => p.PeriodicLiquidFlowRecords)
                .HasForeignKey(d => d.CompressibilityFactorUnitId)
                .HasConstraintName("FK_PeriodicLiquidFlowRecords_CompressibilityFactorUnits");

            entity.HasOne(d => d.DensityUnit).WithMany(p => p.PeriodicLiquidFlowRecordDensityUnits)
                .HasForeignKey(d => d.DensityUnitId)
                .HasConstraintName("FK_PeriodicLiquidFlowRecords_DensityUnits");

            entity.HasOne(d => d.FluidStandard).WithMany(p => p.PeriodicLiquidFlowRecords)
                .HasForeignKey(d => d.FluidStandardId)
                .HasConstraintName("FK_PeriodicLiquidFlowRecords_FluidStandards");

            entity.HasOne(d => d.FluidType).WithMany(p => p.PeriodicLiquidFlowRecords)
                .HasForeignKey(d => d.FluidTypeId)
                .HasConstraintName("FK_PeriodicLiquidFlowRecords_FluidTypes");

            entity.HasOne(d => d.Meter).WithMany(p => p.PeriodicLiquidFlowRecords)
                .HasForeignKey(d => d.MeterId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_PeriodicLiquidFlowRecords_Meters");

            entity.HasOne(d => d.TemperatureBaseUnit).WithMany(p => p.PeriodicLiquidFlowRecordTemperatureBaseUnits)
                .HasForeignKey(d => d.TemperatureBaseUnitId)
                .HasConstraintName("FK_PeriodicLiquidFlowRecords_TemperatureBaseUnits");
        });

        modelBuilder.Entity<PowerSource>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Code)
                .HasMaxLength(1)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(32)
                .IsUnicode(false);
        });

        modelBuilder.Entity<ProductType>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Code)
                .HasMaxLength(64)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(128)
                .IsUnicode(false);
        });

        modelBuilder.Entity<PulseType>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Pump>(entity =>
        {
            entity.HasKey(e => e.HierarchyId);

            entity.Property(e => e.HierarchyId)
                .ValueGeneratedNever()
                .HasColumnName("HierarchyID");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Name)
                .HasMaxLength(32)
                .IsUnicode(false);
            entity.Property(e => e.PumpTypeId).HasColumnName("PumpTypeID");

            entity.HasOne(d => d.Hierarchy).WithOne(p => p.Pump)
                .HasForeignKey<Pump>(d => d.HierarchyId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Pumps_Hierarchy");

            entity.HasOne(d => d.PumpType).WithMany(p => p.Pumps)
                .HasForeignKey(d => d.PumpTypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Pumps_PumpTypes");
        });

        modelBuilder.Entity<PumpDailyTransaction>(entity =>
        {
            entity.HasKey(e => new { e.PumpId, e.TimeStamp });

            entity.Property(e => e.PumpId).HasColumnName("PumpID");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.HoursOn).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.Rpm)
                .HasColumnType("decimal(38, 12)")
                .HasColumnName("RPM");
            entity.Property(e => e.StrokesPerMinute).HasColumnType("decimal(38, 12)");
        });

        modelBuilder.Entity<PumpType>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(32)
                .IsUnicode(false);
        });

        modelBuilder.Entity<ReferenceEquation>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Role>(entity =>
        {
            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Description)
                .HasMaxLength(64)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(32)
                .IsUnicode(false);
        });

        modelBuilder.Entity<RunSheet>(entity =>
        {
            entity.HasKey(e => e.HierarchyId).HasName("PK_RunSheets_1");

            entity.Property(e => e.HierarchyId)
                .ValueGeneratedNever()
                .HasColumnName("HierarchyID");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");

            entity.HasOne(d => d.Hierarchy).WithOne(p => p.RunSheet)
                .HasForeignKey<RunSheet>(d => d.HierarchyId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_RunSheets_Hierarchy");

            entity.HasMany(d => d.Users).WithMany(p => p.RunSheets)
                .UsingEntity<Dictionary<string, object>>(
                    "RunSheetUser",
                    r => r.HasOne<User>().WithMany()
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK_RunSheetUsers_Users"),
                    l => l.HasOne<RunSheet>().WithMany()
                        .HasForeignKey("RunSheetId")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK_RunSheetUsers_RunSheets"),
                    j =>
                    {
                        j.HasKey("RunSheetId", "UserId");
                        j.ToTable("RunSheetUsers");
                        j.IndexerProperty<int>("RunSheetId").HasColumnName("RunSheetID");
                        j.IndexerProperty<int>("UserId").HasColumnName("UserID");
                    });
        });

        modelBuilder.Entity<RunSheetDailyLog>(entity =>
        {
            entity.HasKey(e => new { e.RunSheetId, e.TimeStamp });

            entity.Property(e => e.RunSheetId).HasColumnName("RunSheetID");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");

            entity.HasOne(d => d.RunSheet).WithMany(p => p.RunSheetDailyLogs)
                .HasForeignKey(d => d.RunSheetId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_RunSheetDailyLogs_RunSheets");
        });

        modelBuilder.Entity<RunSheetDailyLogEntry>(entity =>
        {
            entity.HasKey(e => new { e.RunSheetId, e.TimeStamp, e.HierarchyId, e.NodeTypeDailyLogPropertyId });

            entity.Property(e => e.RunSheetId).HasColumnName("RunSheetID");
            entity.Property(e => e.HierarchyId).HasColumnName("HierarchyID");
            entity.Property(e => e.NodeTypeDailyLogPropertyId).HasColumnName("NodeTypeDailyLogPropertyID");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.UserId).HasColumnName("UserID");
            entity.Property(e => e.Value).HasColumnType("sql_variant");

            entity.HasOne(d => d.Hierarchy).WithMany(p => p.RunSheetDailyLogEntries)
                .HasForeignKey(d => d.HierarchyId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_RunSheetDailyLogEntries_Hierarchy");

            entity.HasOne(d => d.NodeTypeDailyLogProperty).WithMany(p => p.RunSheetDailyLogEntries)
                .HasForeignKey(d => d.NodeTypeDailyLogPropertyId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_RunSheetDailyLogEntries_NodeTypeDailyLogProperties");

            entity.HasOne(d => d.RunSheetDailyLog).WithMany(p => p.RunSheetDailyLogEntries)
                .HasForeignKey(d => new { d.RunSheetId, d.TimeStamp })
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_RunSheetDailyLogEntries_RunSheetDailyLogs");
        });

        modelBuilder.Entity<RunSheetItem>(entity =>
        {
            entity.HasKey(e => new { e.RunSheetId, e.HierarchyId });

            entity.HasIndex(e => new { e.RunSheetId, e.HierarchyId, e.Ordinal }, "IX_RunSheetItems").IsUnique();

            entity.Property(e => e.RunSheetId).HasColumnName("RunSheetID");
            entity.Property(e => e.HierarchyId).HasColumnName("HierarchyID");

            entity.HasOne(d => d.Hierarchy).WithMany(p => p.RunSheetItems)
                .HasForeignKey(d => d.HierarchyId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_RunSheetItems_Hierarchy");

            entity.HasOne(d => d.RunSheet).WithMany(p => p.RunSheetItems)
                .HasForeignKey(d => d.RunSheetId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_RunSheetItems_RunSheets");
        });

        modelBuilder.Entity<RunSheetItemCapturePoint>(entity =>
        {
            entity.HasKey(e => new { e.RunSheetId, e.HierarchyId, e.NodeTypeDailyLogPropertyId });

            entity.HasIndex(e => new { e.RunSheetId, e.HierarchyId, e.NodeTypeDailyLogPropertyId, e.Ordinal }, "IX_RunSheetItemCapturePoints").IsUnique();

            entity.Property(e => e.RunSheetId).HasColumnName("RunSheetID");
            entity.Property(e => e.HierarchyId).HasColumnName("HierarchyID");
            entity.Property(e => e.NodeTypeDailyLogPropertyId).HasColumnName("NodeTypeDailyLogPropertyID");

            entity.HasOne(d => d.NodeTypeDailyLogProperty).WithMany(p => p.RunSheetItemCapturePoints)
                .HasForeignKey(d => d.NodeTypeDailyLogPropertyId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_RunSheetItemCapturePoints_NodeTypeDailyLogProperties");

            entity.HasOne(d => d.RunSheetItem).WithMany(p => p.RunSheetItemCapturePoints)
                .HasForeignKey(d => new { d.RunSheetId, d.HierarchyId })
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_RunSheetItemCapturePoints_RunSheetItems");
        });

        modelBuilder.Entity<SampleType>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Code)
                .HasMaxLength(1)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(32)
                .IsUnicode(false);
        });

        modelBuilder.Entity<SaturationCondition>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Code)
                .HasMaxLength(1)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(32)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Screen>(entity =>
        {
            entity.HasKey(e => e.HierarchyId);

            entity.Property(e => e.HierarchyId)
                .ValueGeneratedNever()
                .HasColumnName("HierarchyID");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.ScreenXml).HasColumnType("xml");

            entity.HasOne(d => d.Hierarchy).WithOne(p => p.Screen)
                .HasForeignKey<Screen>(d => d.HierarchyId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Screens_Hierarchy");
        });

        modelBuilder.Entity<SerialPortChannel>(entity =>
        {
            entity.HasKey(e => e.HierarchyId).HasName("PK_SerialPortChannels_1");

            entity.Property(e => e.HierarchyId)
                .ValueGeneratedNever()
                .HasColumnName("HierarchyID");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.PortName)
                .HasMaxLength(255)
                .IsUnicode(false);

            entity.HasOne(d => d.Hierarchy).WithOne(p => p.SerialPortChannel)
                .HasForeignKey<SerialPortChannel>(d => d.HierarchyId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_SerialPortChannels_Hierarchy");
        });

        modelBuilder.Entity<SignalType>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<StaticPressureMeasurement>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Code)
                .HasMaxLength(1)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(32)
                .IsUnicode(false);
        });

        modelBuilder.Entity<StaticTapType>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<StringIoTag>(entity =>
        {
            entity.HasKey(e => e.HierarchyId);

            entity.Property(e => e.HierarchyId)
                .ValueGeneratedNever()
                .HasColumnName("HierarchyID");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.LineColor)
                .HasMaxLength(64)
                .IsUnicode(false);
            entity.Property(e => e.LineStyle)
                .HasMaxLength(64)
                .IsUnicode(false);
            entity.Property(e => e.PaddingCharacter)
                .HasMaxLength(1)
                .IsUnicode(false);
            entity.Property(e => e.ReadAddress)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Script).IsUnicode(false);
            entity.Property(e => e.StringIoTagTrendValueDictionaryId).HasColumnName("StringIoTagTrendValueDictionaryID");
            entity.Property(e => e.WriteAddress)
                .HasMaxLength(255)
                .IsUnicode(false);

            entity.HasOne(d => d.Hierarchy).WithOne(p => p.StringIoTag)
                .HasForeignKey<StringIoTag>(d => d.HierarchyId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_StringIoTags_Hierarchy");

            entity.HasOne(d => d.StringIoTagTrendValueDictionary).WithMany(p => p.StringIoTags)
                .HasForeignKey(d => d.StringIoTagTrendValueDictionaryId)
                .HasConstraintName("FK_StringIoTags_StringIoTagTrendValueDictionaries");
        });

        modelBuilder.Entity<StringIoTagCurrentValue>(entity =>
        {
            entity.HasKey(e => e.StringIoTagId);

            entity.Property(e => e.StringIoTagId).ValueGeneratedNever();
            entity.Property(e => e.TimeStamp).HasColumnType("datetime");
            entity.Property(e => e.Value)
                .HasMaxLength(255)
                .IsUnicode(false);

            entity.HasOne(d => d.StringIoTag).WithOne(p => p.StringIoTagCurrentValue)
                .HasForeignKey<StringIoTagCurrentValue>(d => d.StringIoTagId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_StringIoTagCurrentValues_StringIoTags");
        });

        modelBuilder.Entity<StringIoTagTrendValueDictionary>(entity =>
        {
            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Description)
                .HasMaxLength(128)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(64)
                .IsUnicode(false);
        });

        modelBuilder.Entity<StringIoTagTrendValueDictionaryItem>(entity =>
        {
            entity.HasKey(e => new { e.StringIoTagTrendValueDictionariesId, e.ItemKey });

            entity.Property(e => e.StringIoTagTrendValueDictionariesId).HasColumnName("StringIoTagTrendValueDictionariesID");
            entity.Property(e => e.ItemValue)
                .HasMaxLength(255)
                .IsUnicode(false);

            entity.HasOne(d => d.StringIoTagTrendValueDictionaries).WithMany(p => p.StringIoTagTrendValueDictionaryItems)
                .HasForeignKey(d => d.StringIoTagTrendValueDictionariesId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_StringIoTagTrendValueDictionaryItems_StringIoTagTrendValueDictionaries");
        });

        modelBuilder.Entity<StringIoTagValueHistory>(entity =>
        {
            entity.HasKey(e => new { e.StringIoTagId, e.TimeStamp });

            entity.ToTable("StringIoTagValueHistory");

            entity.Property(e => e.StringIoTagId).HasColumnName("StringIoTagID");
            entity.Property(e => e.TimeStamp).HasColumnType("datetime");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Value)
                .HasMaxLength(255)
                .IsUnicode(false);

            entity.HasOne(d => d.StringIoTag).WithMany(p => p.StringIoTagValueHistories)
                .HasForeignKey(d => d.StringIoTagId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_StringIoTagValueHistory_StringIoTags");
        });

        modelBuilder.Entity<TagValueEnumeration>(entity =>
        {
            entity.HasIndex(e => e.Name, "IX_TagValueEnumerations").IsUnique();

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Description)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TagValueEnumerationConstant>(entity =>
        {
            entity.HasKey(e => new { e.TagValueEnumerationId, e.Name });

            entity.HasIndex(e => new { e.TagValueEnumerationId, e.Name, e.Value }, "IX_TagValueEnumerationConstants").IsUnique();

            entity.Property(e => e.TagValueEnumerationId).HasColumnName("TagValueEnumerationID");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Description)
                .HasMaxLength(255)
                .IsUnicode(false);

            entity.HasOne(d => d.TagValueEnumeration).WithMany(p => p.TagValueEnumerationConstants)
                .HasForeignKey(d => d.TagValueEnumerationId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_TagValueEnumerationConstants_TagValueEnumerations");
        });

        modelBuilder.Entity<Tank>(entity =>
        {
            entity.HasKey(e => e.HierarchyId);

            entity.Property(e => e.HierarchyId)
                .ValueGeneratedNever()
                .HasColumnName("HierarchyID");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.TankTypeId).HasColumnName("TankTypeID");

            entity.HasOne(d => d.Hierarchy).WithOne(p => p.Tank)
                .HasForeignKey<Tank>(d => d.HierarchyId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Tanks_Hierarchy");

            entity.HasOne(d => d.TankType).WithMany(p => p.Tanks)
                .HasForeignKey(d => d.TankTypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Tanks_TankTypes");
        });

        modelBuilder.Entity<TankDailyTransaction>(entity =>
        {
            entity.HasKey(e => new { e.TankId, e.TimeStamp });

            entity.Property(e => e.TankId).HasColumnName("TankID");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.TankLevel).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.TankTemperature).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.TankVolume).HasColumnType("decimal(38, 12)");

            entity.HasOne(d => d.Tank).WithMany(p => p.TankDailyTransactions)
                .HasForeignKey(d => d.TankId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_TankDailyTransactions_Tanks");
        });

        modelBuilder.Entity<TankType>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(64)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TapType>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Ticket>(entity =>
        {
            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.AlphaUnitId).HasColumnName("AlphaUnitID");
            entity.Property(e => e.BatchNumber)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Class)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.CompressibilityFactorUnitId).HasColumnName("CompressibilityFactorUnitID");
            entity.Property(e => e.CustomerName)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DensityUnitId).HasColumnName("DensityUnitID");
            entity.Property(e => e.Destination)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.DestinationFacilityId).HasColumnName("DestinationFacilityID");
            entity.Property(e => e.DeviceNumber)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Direction)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.DriverId)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("DriverID");
            entity.Property(e => e.EndDate).HasColumnType("datetime");
            entity.Property(e => e.EvpUnitId).HasColumnName("EvpUnitID");
            entity.Property(e => e.FluidStandardId).HasColumnName("FluidStandardID");
            entity.Property(e => e.FluidTypeId).HasColumnName("FluidTypeID");
            entity.Property(e => e.IButane).HasColumnName("iButane");
            entity.Property(e => e.IPentane).HasColumnName("iPentane");
            entity.Property(e => e.Kfactor).HasColumnName("KFactor");
            entity.Property(e => e.ManifestId)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("ManifestID");
            entity.Property(e => e.NButane).HasColumnName("nButane");
            entity.Property(e => e.NPentane).HasColumnName("nPentane");
            entity.Property(e => e.OdorantUnitId).HasColumnName("OdorantUnitID");
            entity.Property(e => e.Origin)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.OriginFacilityId).HasColumnName("OriginFacilityID");
            entity.Property(e => e.ProductName)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.ProveDate).HasColumnType("datetime");
            entity.Property(e => e.PycDate).HasColumnType("datetime");
            entity.Property(e => e.SampleId)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("SampleID");
            entity.Property(e => e.Seal1Off)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Seal1On)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Seal2Off)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Seal2On)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.SecondTrailerNumber)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Shipper)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.StartDate).HasColumnType("datetime");
            entity.Property(e => e.TemperatureBaseUnitId).HasColumnName("TemperatureBaseUnitID");
            entity.Property(e => e.TicketComponentBasisId).HasColumnName("TicketComponentBasisID");
            entity.Property(e => e.TicketDeviceTypeId).HasColumnName("TicketDeviceTypeID");
            entity.Property(e => e.TicketTransportMethodId).HasColumnName("TicketTransportMethodID");
            entity.Property(e => e.TicketTypeId).HasColumnName("TicketTypeID");
            entity.Property(e => e.TimeStamp).HasColumnType("datetime");
            entity.Property(e => e.TrailerNumber)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Transporter)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.VehicleId)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("VehicleID");
            entity.Property(e => e.ViscosityUnitId).HasColumnName("ViscosityUnitID");

            entity.HasOne(d => d.AlphaUnit).WithMany(p => p.Tickets)
                .HasForeignKey(d => d.AlphaUnitId)
                .HasConstraintName("FK_Tickets_AlphaUnits");

            entity.HasOne(d => d.CompressibilityFactorUnit).WithMany(p => p.TicketCompressibilityFactorUnits)
                .HasForeignKey(d => d.CompressibilityFactorUnitId)
                .HasConstraintName("FK_Tickets_CompressibilityFactorUnits");

            entity.HasOne(d => d.DensityUnit).WithMany(p => p.TicketDensityUnits)
                .HasForeignKey(d => d.DensityUnitId)
                .HasConstraintName("FK_Tickets_DensityUnits");

            entity.HasOne(d => d.DestinationFacility).WithMany(p => p.TicketDestinationFacilities)
                .HasForeignKey(d => d.DestinationFacilityId)
                .HasConstraintName("FK_Tickets_DestinationFacilities");

            entity.HasOne(d => d.FluidStandard).WithMany(p => p.Tickets)
                .HasForeignKey(d => d.FluidStandardId)
                .HasConstraintName("FK_Tickets_FluidStandards");

            entity.HasOne(d => d.FluidType).WithMany(p => p.Tickets)
                .HasForeignKey(d => d.FluidTypeId)
                .HasConstraintName("FK_Tickets_FluidTypes");

            entity.HasOne(d => d.OdorantUnit).WithMany(p => p.TicketOdorantUnits)
                .HasForeignKey(d => d.OdorantUnitId)
                .HasConstraintName("FK_Tickets_OdorantUnits");

            entity.HasOne(d => d.OriginFacility).WithMany(p => p.TicketOriginFacilities)
                .HasForeignKey(d => d.OriginFacilityId)
                .HasConstraintName("FK_Tickets_OriginFacilities");

            entity.HasOne(d => d.TemperatureBaseUnit).WithMany(p => p.TicketTemperatureBaseUnits)
                .HasForeignKey(d => d.TemperatureBaseUnitId)
                .HasConstraintName("FK_Tickets_TemperatureBaseUnits");

            entity.HasOne(d => d.TicketComponentBasis).WithMany(p => p.Tickets)
                .HasForeignKey(d => d.TicketComponentBasisId)
                .HasConstraintName("FK_Tickets_TicketComponentBases");

            entity.HasOne(d => d.TicketDeviceType).WithMany(p => p.Tickets)
                .HasForeignKey(d => d.TicketDeviceTypeId)
                .HasConstraintName("FK_Tickets_TicketDeviceTypes");

            entity.HasOne(d => d.TicketTransportMethod).WithMany(p => p.Tickets)
                .HasForeignKey(d => d.TicketTransportMethodId)
                .HasConstraintName("FK_Tickets_TicketTransportMethods");

            entity.HasOne(d => d.TicketType).WithMany(p => p.Tickets)
                .HasForeignKey(d => d.TicketTypeId)
                .HasConstraintName("FK_Tickets_TicketTypes");

            entity.HasOne(d => d.ViscosityUnit).WithMany(p => p.TicketViscosityUnits)
                .HasForeignKey(d => d.ViscosityUnitId)
                .HasConstraintName("FK_Tickets_ViscosityUnits");
        });

        modelBuilder.Entity<TicketComponentBasis>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Code)
                .HasMaxLength(1)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(32)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TicketDeviceType>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Code)
                .HasMaxLength(1)
                .IsUnicode(false);
            entity.Property(e => e.Description)
                .HasMaxLength(64)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(32)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TicketMeterCalculationMethod>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Code)
                .HasMaxLength(1)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(32)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TicketMeterRecord>(entity =>
        {
            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.BoreMaterialId).HasColumnName("BoreMaterialID");
            entity.Property(e => e.BoreReferenceTemperatureUnitId).HasColumnName("BoreReferenceTemperatureUnitID");
            entity.Property(e => e.ClosingGvindex).HasColumnName("ClosingGVIndex");
            entity.Property(e => e.ClosingIvindex).HasColumnName("ClosingIVIndex");
            entity.Property(e => e.ClosingSwindex).HasColumnName("ClosingSWIndex");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DensityUnitId).HasColumnName("DensityUnitID");
            entity.Property(e => e.DifferentialPressureUnitId).HasColumnName("DifferentialPressureUnitID");
            entity.Property(e => e.ExtensionDefinitionId).HasColumnName("ExtensionDefinitionID");
            entity.Property(e => e.Kfactor).HasColumnName("KFactor");
            entity.Property(e => e.MassKfactorUnitId).HasColumnName("MassKFactorUnitID");
            entity.Property(e => e.MassUnitId).HasColumnName("MassUnitID");
            entity.Property(e => e.MeterId)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("MeterID");
            entity.Property(e => e.MeterStandardId).HasColumnName("MeterStandardID");
            entity.Property(e => e.OpeningGvindex).HasColumnName("OpeningGVIndex");
            entity.Property(e => e.OpeningIvindex).HasColumnName("OpeningIVIndex");
            entity.Property(e => e.OpeningSwindex).HasColumnName("OpeningSWIndex");
            entity.Property(e => e.PipeMaterialId).HasColumnName("PipeMaterialID");
            entity.Property(e => e.PipeReferenceTemperatureUnitId).HasColumnName("PipeReferenceTemperatureUnitID");
            entity.Property(e => e.PressureUnitId).HasColumnName("PressureUnitID");
            entity.Property(e => e.StaticPressureMeasurementId).HasColumnName("StaticPressureMeasurementID");
            entity.Property(e => e.StaticTapTypeId).HasColumnName("StaticTapTypeID");
            entity.Property(e => e.TapTypeId).HasColumnName("TapTypeID");
            entity.Property(e => e.TemperatureUnitId).HasColumnName("TemperatureUnitID");
            entity.Property(e => e.TicketId).HasColumnName("TicketID");
            entity.Property(e => e.TicketMeterCalculationMethodId).HasColumnName("TicketMeterCalculationMethodID");
            entity.Property(e => e.VolumeKfactorUnitId).HasColumnName("VolumeKFactorUnitID");
            entity.Property(e => e.VolumeUnitId).HasColumnName("VolumeUnitID");

            entity.HasOne(d => d.AtmosphericPressureUnitNavigation).WithMany(p => p.TicketMeterRecordAtmosphericPressureUnitNavigations)
                .HasForeignKey(d => d.AtmosphericPressureUnit)
                .HasConstraintName("FK_TicketMeterRecords_AtmosphericPressureUnits");

            entity.HasOne(d => d.BoreDiameterUnitNavigation).WithMany(p => p.TicketMeterRecordBoreDiameterUnitNavigations)
                .HasForeignKey(d => d.BoreDiameterUnit)
                .HasConstraintName("FK_TicketMeterRecords_BoreDiameterUnits");

            entity.HasOne(d => d.BoreMaterial).WithMany(p => p.TicketMeterRecordBoreMaterials)
                .HasForeignKey(d => d.BoreMaterialId)
                .HasConstraintName("FK_TicketMeterRecords_BoreMaterials");

            entity.HasOne(d => d.BoreReferenceTemperatureUnit).WithMany(p => p.TicketMeterRecordBoreReferenceTemperatureUnits)
                .HasForeignKey(d => d.BoreReferenceTemperatureUnitId)
                .HasConstraintName("FK_TicketMeterRecords_BoreReferenceTemperatureUnits");

            entity.HasOne(d => d.DensityUnit).WithMany(p => p.TicketMeterRecordDensityUnits)
                .HasForeignKey(d => d.DensityUnitId)
                .HasConstraintName("FK_TicketMeterRecords_DensityUnits");

            entity.HasOne(d => d.DifferentialPressureUnit).WithMany(p => p.TicketMeterRecordDifferentialPressureUnits)
                .HasForeignKey(d => d.DifferentialPressureUnitId)
                .HasConstraintName("FK_TicketMeterRecords_DifferentialPressureUnits");

            entity.HasOne(d => d.ExtensionDefinition).WithMany(p => p.TicketMeterRecords)
                .HasForeignKey(d => d.ExtensionDefinitionId)
                .HasConstraintName("FK_TicketMeterRecords_ExtensionDefinitions");

            entity.HasOne(d => d.MeterStandard).WithMany(p => p.TicketMeterRecords)
                .HasForeignKey(d => d.MeterStandardId)
                .HasConstraintName("FK_TicketMeterRecords_MeterStandards");

            entity.HasOne(d => d.PipeDiameterUnitNavigation).WithMany(p => p.TicketMeterRecordPipeDiameterUnitNavigations)
                .HasForeignKey(d => d.PipeDiameterUnit)
                .HasConstraintName("FK_TicketMeterRecords_PipeDiameterUnits");

            entity.HasOne(d => d.PipeLengthUnitNavigation).WithMany(p => p.TicketMeterRecordPipeLengthUnitNavigations)
                .HasForeignKey(d => d.PipeLengthUnit)
                .HasConstraintName("FK_TicketMeterRecords_PipeLengthUnits");

            entity.HasOne(d => d.PipeMaterial).WithMany(p => p.TicketMeterRecordPipeMaterials)
                .HasForeignKey(d => d.PipeMaterialId)
                .HasConstraintName("FK_TicketMeterRecords_PipeMaterials");

            entity.HasOne(d => d.PipeReferenceTemperatureUnit).WithMany(p => p.TicketMeterRecordPipeReferenceTemperatureUnits)
                .HasForeignKey(d => d.PipeReferenceTemperatureUnitId)
                .HasConstraintName("FK_TicketMeterRecords_PipeReferenceTemperatureUnits");

            entity.HasOne(d => d.PressureUnit).WithMany(p => p.TicketMeterRecordPressureUnits)
                .HasForeignKey(d => d.PressureUnitId)
                .HasConstraintName("FK_TicketMeterRecords_PressureUnits");

            entity.HasOne(d => d.StaticPressureMeasurement).WithMany(p => p.TicketMeterRecords)
                .HasForeignKey(d => d.StaticPressureMeasurementId)
                .HasConstraintName("FK_TicketMeterRecords_StaticPressureMeasurements");

            entity.HasOne(d => d.StaticTapType).WithMany(p => p.TicketMeterRecords)
                .HasForeignKey(d => d.StaticTapTypeId)
                .HasConstraintName("FK_TicketMeterRecords_StaticTapTypes");

            entity.HasOne(d => d.TapType).WithMany(p => p.TicketMeterRecords)
                .HasForeignKey(d => d.TapTypeId)
                .HasConstraintName("FK_TicketMeterRecords_TapTypes");

            entity.HasOne(d => d.TemperatureUnit).WithMany(p => p.TicketMeterRecordTemperatureUnits)
                .HasForeignKey(d => d.TemperatureUnitId)
                .HasConstraintName("FK_TicketMeterRecords_TemperatureUnits");

            entity.HasOne(d => d.Ticket).WithMany(p => p.TicketMeterRecords)
                .HasForeignKey(d => d.TicketId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_TicketMeterRecords_Tickets");

            entity.HasOne(d => d.TicketMeterCalculationMethod).WithMany(p => p.TicketMeterRecords)
                .HasForeignKey(d => d.TicketMeterCalculationMethodId)
                .HasConstraintName("FK_TicketMeterRecords_TicketMeterCalculationMethods");
        });

        modelBuilder.Entity<TicketScaleRecord>(entity =>
        {
            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.DensityUnitId).HasColumnName("DensityUnitID");
            entity.Property(e => e.InScaleId)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("InScaleID");
            entity.Property(e => e.OutScaleId)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("OutScaleID");
            entity.Property(e => e.TemperatureUnitId).HasColumnName("TemperatureUnitID");
            entity.Property(e => e.TicketId).HasColumnName("TicketID");
            entity.Property(e => e.WeightUnitId).HasColumnName("WeightUnitID");

            entity.HasOne(d => d.DensityUnit).WithMany(p => p.TicketScaleRecordDensityUnits)
                .HasForeignKey(d => d.DensityUnitId)
                .HasConstraintName("FK_TicketScaleRecords_DensityUnits");

            entity.HasOne(d => d.StandardVolumeUnitNavigation).WithMany(p => p.TicketScaleRecordStandardVolumeUnitNavigations)
                .HasForeignKey(d => d.StandardVolumeUnit)
                .HasConstraintName("FK_TicketScaleRecords_StandardVolumeUnits");

            entity.HasOne(d => d.TemperatureUnit).WithMany(p => p.TicketScaleRecordTemperatureUnits)
                .HasForeignKey(d => d.TemperatureUnitId)
                .HasConstraintName("FK_TicketScaleRecords_TemperatureUnits");

            entity.HasOne(d => d.Ticket).WithMany(p => p.TicketScaleRecords)
                .HasForeignKey(d => d.TicketId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_TicketScaleRecords_Tickets");

            entity.HasOne(d => d.WeightUnit).WithMany(p => p.TicketScaleRecordWeightUnits)
                .HasForeignKey(d => d.WeightUnitId)
                .HasConstraintName("FK_TicketScaleRecords_WeightUnits");
        });

        modelBuilder.Entity<TicketTankCalculationStandard>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Code)
                .HasMaxLength(1)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(32)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TicketTankCustodyTransferCalculationMethod>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(64)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TicketTankLevelType>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(96)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TicketTankRecord>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_TicketTankRecords_1");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.BaseTemperatureUnitId).HasColumnName("BaseTemperatureUnitID");
            entity.Property(e => e.ClosingAndCurrentSwcorrection).HasColumnName("ClosingAndCurrentSWCorrection");
            entity.Property(e => e.ClosingAndCurrentSwpercent).HasColumnName("ClosingAndCurrentSWPercent");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.LevelUnitId).HasColumnName("LevelUnitID");
            entity.Property(e => e.LiquidDensityUnitId).HasColumnName("LiquidDensityUnitID");
            entity.Property(e => e.MassUnitId).HasColumnName("MassUnitID");
            entity.Property(e => e.ObservedVolumeUnitId).HasColumnName("ObservedVolumeUnitID");
            entity.Property(e => e.OpeningSwcorrection).HasColumnName("OpeningSWCorrection");
            entity.Property(e => e.OpeningSwpercent).HasColumnName("OpeningSWPercent");
            entity.Property(e => e.PressureUnitId).HasColumnName("PressureUnitID");
            entity.Property(e => e.StandardVolumeUnitId).HasColumnName("StandardVolumeUnitID");
            entity.Property(e => e.TemperatureUnitId).HasColumnName("TemperatureUnitID");
            entity.Property(e => e.TicketId).HasColumnName("TicketID");
            entity.Property(e => e.TicketTankCalculationStandardId).HasColumnName("TicketTankCalculationStandardID");
            entity.Property(e => e.TicketTankCustodyTransferCalculationMethodId).HasColumnName("TicketTankCustodyTransferCalculationMethodID");
            entity.Property(e => e.TicketTankLevelTypeId).HasColumnName("TicketTankLevelTypeID");
            entity.Property(e => e.TicketTankShellMaterialId).HasColumnName("TicketTankShellMaterialID");
            entity.Property(e => e.TicketTankTypeId).HasColumnName("TicketTankTypeID");
            entity.Property(e => e.VesselDraftUnitId).HasColumnName("VesselDraftUnitID");

            entity.HasOne(d => d.BaseTemperatureUnit).WithMany(p => p.TicketTankRecordBaseTemperatureUnits)
                .HasForeignKey(d => d.BaseTemperatureUnitId)
                .HasConstraintName("FK_TicketTankRecords_BaseTemperatureUnits");

            entity.HasOne(d => d.LevelUnit).WithMany(p => p.TicketTankRecordLevelUnits)
                .HasForeignKey(d => d.LevelUnitId)
                .HasConstraintName("FK_TicketTankRecords_LevelUnits");

            entity.HasOne(d => d.LiquidDensityUnit).WithMany(p => p.TicketTankRecordLiquidDensityUnits)
                .HasForeignKey(d => d.LiquidDensityUnitId)
                .HasConstraintName("FK_TicketTankRecords_LiquidDensityUnits");

            entity.HasOne(d => d.MassUnit).WithMany(p => p.TicketTankRecordMassUnits)
                .HasForeignKey(d => d.MassUnitId)
                .HasConstraintName("FK_TicketTankRecords_MassUnits");

            entity.HasOne(d => d.ObservedVolumeUnit).WithMany(p => p.TicketTankRecordObservedVolumeUnits)
                .HasForeignKey(d => d.ObservedVolumeUnitId)
                .HasConstraintName("FK_TicketTankRecords_ObservedVolumeUnits");

            entity.HasOne(d => d.PressureUnit).WithMany(p => p.TicketTankRecordPressureUnits)
                .HasForeignKey(d => d.PressureUnitId)
                .HasConstraintName("FK_TicketTankRecords_PressureUnits");

            entity.HasOne(d => d.StandardVolumeUnit).WithMany(p => p.TicketTankRecordStandardVolumeUnits)
                .HasForeignKey(d => d.StandardVolumeUnitId)
                .HasConstraintName("FK_TicketTankRecords_StandardVolumeUnits");

            entity.HasOne(d => d.TemperatureUnit).WithMany(p => p.TicketTankRecordTemperatureUnits)
                .HasForeignKey(d => d.TemperatureUnitId)
                .HasConstraintName("FK_TicketTankRecords_TemperatureUnits");

            entity.HasOne(d => d.Ticket).WithMany(p => p.TicketTankRecords)
                .HasForeignKey(d => d.TicketId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_TicketTankRecords_Tickets");

            entity.HasOne(d => d.TicketTankCalculationStandard).WithMany(p => p.TicketTankRecords)
                .HasForeignKey(d => d.TicketTankCalculationStandardId)
                .HasConstraintName("FK_TicketTankRecords_TicketTankCalculationStandards");

            entity.HasOne(d => d.TicketTankCustodyTransferCalculationMethod).WithMany(p => p.TicketTankRecords)
                .HasForeignKey(d => d.TicketTankCustodyTransferCalculationMethodId)
                .HasConstraintName("FK_TicketTankRecords_TicketTankCustodyTransferCalculationMethods");

            entity.HasOne(d => d.TicketTankLevelType).WithMany(p => p.TicketTankRecords)
                .HasForeignKey(d => d.TicketTankLevelTypeId)
                .HasConstraintName("FK_TicketTankRecords_TicketTankLevelTypes");

            entity.HasOne(d => d.TicketTankShellMaterial).WithMany(p => p.TicketTankRecords)
                .HasForeignKey(d => d.TicketTankShellMaterialId)
                .HasConstraintName("FK_TicketTankRecords_TicketTankShellMaterials");

            entity.HasOne(d => d.TicketTankType).WithMany(p => p.TicketTankRecords)
                .HasForeignKey(d => d.TicketTankTypeId)
                .HasConstraintName("FK_TicketTankRecords_TankTypes");

            entity.HasOne(d => d.VesselDraftUnit).WithMany(p => p.TicketTankRecordVesselDraftUnits)
                .HasForeignKey(d => d.VesselDraftUnitId)
                .HasConstraintName("FK_TicketTankRecords_VesselDraftUnits");
        });

        modelBuilder.Entity<TicketTankShellMaterial>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Code)
                .HasMaxLength(1)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(32)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TicketTransportMethod>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Code)
                .HasMaxLength(1)
                .IsUnicode(false);
            entity.Property(e => e.Description)
                .HasMaxLength(64)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(32)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TicketType>(entity =>
        {
            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TurbineRotorMode>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<UltrasonicDiagnosticHistory>(entity =>
        {
            entity.HasKey(e => new { e.MeterId, e.TimeStamp });

            entity.ToTable("UltrasonicDiagnosticHistory");

            entity.Property(e => e.MeterId).HasColumnName("MeterID");
            entity.Property(e => e.TimeStamp).HasColumnType("datetime");

            entity.HasOne(d => d.Meter).WithMany(p => p.UltrasonicDiagnosticHistories)
                .HasForeignKey(d => d.MeterId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_UltrasonicDiagnosticHistory_Meters");
        });

        modelBuilder.Entity<Unit>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.BaseUnitId).HasColumnName("BaseUnitID");
            entity.Property(e => e.ConvertFrom)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.ConvertTo)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.FormulaTypeId).HasColumnName("FormulaTypeID");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Symbol)
                .HasMaxLength(32)
                .IsUnicode(false);
            entity.Property(e => e.UnitClassId).HasColumnName("UnitClassID");

            entity.HasOne(d => d.BaseUnit).WithMany(p => p.InverseBaseUnit)
                .HasForeignKey(d => d.BaseUnitId)
                .HasConstraintName("FK_Units_Units");

            entity.HasOne(d => d.FormulaType).WithMany(p => p.Units)
                .HasForeignKey(d => d.FormulaTypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Units_UnitFormulaTypes");

            entity.HasOne(d => d.UnitClass).WithMany(p => p.Units)
                .HasForeignKey(d => d.UnitClassId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Units_UnitClasses");
        });

        modelBuilder.Entity<UnitClass>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<UnitFormulaType>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<UnitSet>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(64)
                .IsUnicode(false);
            entity.Property(e => e.SystemDefaultUnitId).HasColumnName("SystemDefaultUnitID");

            entity.HasOne(d => d.SystemDefaultUnit).WithMany(p => p.UnitSets)
                .HasForeignKey(d => d.SystemDefaultUnitId)
                .HasConstraintName("FK_UnitSets_Units");

            entity.HasMany(d => d.Units).WithMany(p => p.UnitSetsNavigation)
                .UsingEntity<Dictionary<string, object>>(
                    "UnitSetUnit",
                    r => r.HasOne<Unit>().WithMany()
                        .HasForeignKey("UnitId")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK_UnitSetUnits_Units"),
                    l => l.HasOne<UnitSet>().WithMany()
                        .HasForeignKey("UnitSetId")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK_UnitSetUnits_UnitSets"),
                    j =>
                    {
                        j.HasKey("UnitSetId", "UnitId");
                        j.ToTable("UnitSetUnits");
                        j.IndexerProperty<int>("UnitSetId").HasColumnName("UnitSetID");
                        j.IndexerProperty<int>("UnitId").HasColumnName("UnitID");
                    });
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.FullName)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.UserName)
                .HasMaxLength(255)
                .IsUnicode(false);

            entity.HasMany(d => d.Roles).WithMany(p => p.Users)
                .UsingEntity<Dictionary<string, object>>(
                    "UserRole",
                    r => r.HasOne<Role>().WithMany()
                        .HasForeignKey("RoleId")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK_UserRoles_Roles"),
                    l => l.HasOne<User>().WithMany()
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK_UserRoles_Users"),
                    j =>
                    {
                        j.HasKey("UserId", "RoleId");
                        j.ToTable("UserRoles");
                        j.IndexerProperty<int>("UserId").HasColumnName("UserID");
                        j.IndexerProperty<int>("RoleId").HasColumnName("RoleID");
                    });
        });

        modelBuilder.Entity<Vessel>(entity =>
        {
            entity.HasKey(e => e.HierarchyId);

            entity.Property(e => e.HierarchyId)
                .ValueGeneratedNever()
                .HasColumnName("HierarchyID");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.VesselTypeId).HasColumnName("VesselTypeID");

            entity.HasOne(d => d.Hierarchy).WithOne(p => p.Vessel)
                .HasForeignKey<Vessel>(d => d.HierarchyId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Vessels_Hierarchy");

            entity.HasOne(d => d.VesselType).WithMany(p => p.Vessels)
                .HasForeignKey(d => d.VesselTypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Vessels_VesselTypes");
        });

        modelBuilder.Entity<VesselType>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(64)
                .IsUnicode(false);
        });

        modelBuilder.Entity<ViscosityEquation>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<VolumetricHeatingValueUnit>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.EnergyUnitId).HasColumnName("EnergyUnitID");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Symbol)
                .HasMaxLength(32)
                .IsUnicode(false);
            entity.Property(e => e.VolumeUnitId).HasColumnName("VolumeUnitID");

            entity.HasOne(d => d.EnergyUnit).WithMany(p => p.VolumetricHeatingValueUnitEnergyUnits)
                .HasForeignKey(d => d.EnergyUnitId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_VolumetricHeatingValueUnits_EnergyUnits");

            entity.HasOne(d => d.VolumeUnit).WithMany(p => p.VolumetricHeatingValueUnitVolumeUnits)
                .HasForeignKey(d => d.VolumeUnitId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_VolumetricHeatingValueUnits_VolumeUnits");
        });

        modelBuilder.Entity<WasteCode>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Code)
                .HasMaxLength(128)
                .IsUnicode(false);
            entity.Property(e => e.Description)
                .HasMaxLength(256)
                .IsUnicode(false);
        });

        modelBuilder.Entity<WasteLocationType>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(128)
                .IsUnicode(false);
        });

        modelBuilder.Entity<WastePlantDailyActivity>(entity =>
        {
            entity.HasKey(e => new { e.FacilityId, e.ProductionDate, e.ActivityFacilityId, e.ActivityWellId });

            entity.ToTable("WastePlantDailyActivity");

            entity.HasIndex(e => new { e.FacilityId, e.ProductionDate, e.ActivityFacilityId, e.ActivityWellId, e.FacilityActivityTypeId }, "PK_DailyWastePlantActivity").IsUnique();

            entity.Property(e => e.FacilityId).HasColumnName("FacilityID");
            entity.Property(e => e.ActivityFacilityId).HasColumnName("ActivityFacilityID");
            entity.Property(e => e.ActivityWellId).HasColumnName("ActivityWellID");
            entity.Property(e => e.FacilityActivityTypeId).HasColumnName("FacilityActivityTypeID");
            entity.Property(e => e.WasteCodeId).HasColumnName("WasteCodeID");

            entity.HasOne(d => d.ActivityFacility).WithMany(p => p.WastePlantDailyActivityActivityFacilities)
                .HasForeignKey(d => d.ActivityFacilityId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_DailyWastePlantActivity_ActivityFacilities");

            entity.HasOne(d => d.ActivityWell).WithMany(p => p.WastePlantDailyActivities)
                .HasForeignKey(d => d.ActivityWellId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_DailyWastePlantActivity_Wells");

            entity.HasOne(d => d.FacilityActivityType).WithMany(p => p.WastePlantDailyActivities)
                .HasForeignKey(d => d.FacilityActivityTypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_DailyWastePlantActivity_FacilityActivityTypes");

            entity.HasOne(d => d.Facility).WithMany(p => p.WastePlantDailyActivityFacilities)
                .HasForeignKey(d => d.FacilityId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_DailyWastePlantActivity_Facilities");

            entity.HasOne(d => d.WasteCode).WithMany(p => p.WastePlantDailyActivities)
                .HasForeignKey(d => d.WasteCodeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_DailyWastePlantActivity_WasteCodes");
        });

        modelBuilder.Entity<WastePlantMonthlyActivity>(entity =>
        {
            entity.HasKey(e => new { e.FacilityId, e.ProductionDate, e.ActivityFacilityId, e.ActivityWellId, e.FacilityActivityTypeId, e.WasteCodeId, e.RecordVersion });

            entity.ToTable("WastePlantMonthlyActivity");

            entity.Property(e => e.FacilityId).HasColumnName("FacilityID");
            entity.Property(e => e.ActivityFacilityId).HasColumnName("ActivityFacilityID");
            entity.Property(e => e.ActivityWellId).HasColumnName("ActivityWellID");
            entity.Property(e => e.FacilityActivityTypeId).HasColumnName("FacilityActivityTypeID");
            entity.Property(e => e.WasteCodeId).HasColumnName("WasteCodeID");
            entity.Property(e => e.GasVolume)
                .IsSparse()
                .HasColumnType("decimal(38, 12)");
            entity.Property(e => e.OilVolume)
                .IsSparse()
                .HasColumnType("decimal(38, 12)");
            entity.Property(e => e.SolidsVolume)
                .IsSparse()
                .HasColumnType("decimal(38, 12)");
            entity.Property(e => e.WaterVolume)
                .IsSparse()
                .HasColumnType("decimal(38, 12)");

            entity.HasOne(d => d.ActivityFacility).WithMany(p => p.WastePlantMonthlyActivityActivityFacilities)
                .HasForeignKey(d => d.ActivityFacilityId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_MonthlyWastePlantActivity_ActivityFacilities");

            entity.HasOne(d => d.ActivityWell).WithMany(p => p.WastePlantMonthlyActivities)
                .HasForeignKey(d => d.ActivityWellId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_MonthlyWastePlantActivity_Wells");

            entity.HasOne(d => d.FacilityActivityType).WithMany(p => p.WastePlantMonthlyActivities)
                .HasForeignKey(d => d.FacilityActivityTypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_MonthlyWastePlantActivity_FacilityActivityTypes");

            entity.HasOne(d => d.Facility).WithMany(p => p.WastePlantMonthlyActivityFacilities)
                .HasForeignKey(d => d.FacilityId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_MonthlyWastePlantActivity_Facilities");

            entity.HasOne(d => d.WasteCode).WithMany(p => p.WastePlantMonthlyActivities)
                .HasForeignKey(d => d.WasteCodeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_MonthlyWastePlantActivity_WasteCodes");
        });

        modelBuilder.Entity<WaterRegion>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Well>(entity =>
        {
            entity.HasKey(e => e.HierarchyId);

            entity.Property(e => e.HierarchyId)
                .ValueGeneratedNever()
                .HasColumnName("HierarchyID");
            entity.Property(e => e.AgentCode)
                .HasMaxLength(128)
                .IsUnicode(false);
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DownholeLocation)
                .HasMaxLength(128)
                .IsUnicode(false);
            entity.Property(e => e.FieldCode)
                .HasMaxLength(128)
                .IsUnicode(false);
            entity.Property(e => e.FormattedUwi)
                .HasMaxLength(128)
                .IsUnicode(false);
            entity.Property(e => e.LicenseNumber)
                .HasMaxLength(128)
                .IsUnicode(false);
            entity.Property(e => e.LicenseStatus)
                .HasMaxLength(128)
                .IsUnicode(false);
            entity.Property(e => e.LicenseeCode)
                .HasMaxLength(128)
                .IsUnicode(false);
            entity.Property(e => e.Location)
                .HasMaxLength(128)
                .IsUnicode(false);
            entity.Property(e => e.LocationAlias)
                .HasMaxLength(128)
                .IsUnicode(false);
            entity.Property(e => e.LocationAlternateAlias)
                .HasMaxLength(128)
                .IsUnicode(false);
            entity.Property(e => e.OperatorCode)
                .HasMaxLength(128)
                .IsUnicode(false);
            entity.Property(e => e.OperatorName)
                .HasMaxLength(128)
                .IsUnicode(false);
            entity.Property(e => e.PoolCode)
                .HasMaxLength(128)
                .IsUnicode(false);
            entity.Property(e => e.SurfaceLocation)
                .HasMaxLength(128)
                .IsUnicode(false);
            entity.Property(e => e.UnformattedUwi)
                .HasMaxLength(128)
                .IsUnicode(false);
            entity.Property(e => e.WellIdentifier)
                .HasMaxLength(128)
                .IsUnicode(false);
            entity.Property(e => e.WellName)
                .HasMaxLength(128)
                .IsUnicode(false);

            entity.HasOne(d => d.Hierarchy).WithOne(p => p.Well)
                .HasForeignKey<Well>(d => d.HierarchyId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Wells_Hierarchy");
        });

        modelBuilder.Entity<WellComminglingProcess>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Code)
                .HasMaxLength(128)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(128)
                .IsUnicode(false);
        });

        modelBuilder.Entity<WellComminglingStatus>(entity =>
        {
            entity.HasKey(e => new { e.CommingledWellId, e.TimeStamp }).HasName("PK_WellComminglingStatuses_1");

            entity.HasIndex(e => new { e.CommingledWellId, e.TimeStamp }, "PK_WellComminglingStatuses").IsUnique();

            entity.Property(e => e.CommingledWellId).HasColumnName("CommingledWellID");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.ProductionWellId).HasColumnName("ProductionWellID");
            entity.Property(e => e.WellComminglingProcessId).HasColumnName("WellComminglingProcessID");

            entity.HasOne(d => d.CommingledWell).WithMany(p => p.WellComminglingStatusCommingledWells)
                .HasForeignKey(d => d.CommingledWellId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_WellComminglingStatuses_Wells");

            entity.HasOne(d => d.ProductionWell).WithMany(p => p.WellComminglingStatusProductionWells)
                .HasForeignKey(d => d.ProductionWellId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_WellComminglingStatuses_ProductionWells");

            entity.HasOne(d => d.WellComminglingProcess).WithMany(p => p.WellComminglingStatuses)
                .HasForeignKey(d => d.WellComminglingProcessId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_WellComminglingStatuses_WellComminglingProcesses");
        });

        modelBuilder.Entity<WellDailyProduction>(entity =>
        {
            entity.HasKey(e => new { e.WellId, e.ProductionDate, e.ProductTypeId, e.WellStatusTypeId, e.RecordVersion });

            entity.ToTable("WellDailyProduction");

            entity.Property(e => e.WellId).HasColumnName("WellID");
            entity.Property(e => e.ProductTypeId).HasColumnName("ProductTypeID");
            entity.Property(e => e.WellStatusTypeId).HasColumnName("WellStatusTypeID");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Energy).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.HoursOn).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.Volume).HasColumnType("decimal(38, 12)");

            entity.HasOne(d => d.ProductType).WithMany(p => p.WellDailyProductions)
                .HasForeignKey(d => d.ProductTypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_DailyWellProduction_ProductTypes");

            entity.HasOne(d => d.Well).WithMany(p => p.WellDailyProductions)
                .HasForeignKey(d => d.WellId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_DailyWellProduction_Wells");

            entity.HasOne(d => d.WellStatusType).WithMany(p => p.WellDailyProductions)
                .HasForeignKey(d => d.WellStatusTypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_DailyWellProduction_WellStatusTypes");
        });

        modelBuilder.Entity<WellDirectionalDrilling>(entity =>
        {
            entity.ToTable("WellDirectionalDrilling");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Reason)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.WellId).HasColumnName("WellID");

            entity.HasOne(d => d.Well).WithMany(p => p.WellDirectionalDrillings)
                .HasForeignKey(d => d.WellId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_WellDirectionalDrilling_Wells");
        });

        modelBuilder.Entity<WellFluid>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Code)
                .HasMaxLength(128)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(128)
                .IsUnicode(false);
        });

        modelBuilder.Entity<WellHistory>(entity =>
        {
            entity.ToTable("WellHistory");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Event)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.WellId).HasColumnName("WellID");

            entity.HasOne(d => d.Well).WithMany(p => p.WellHistories)
                .HasForeignKey(d => d.WellId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_WellHistory_Wells");
        });

        modelBuilder.Entity<WellMode>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Code)
                .HasMaxLength(128)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(128)
                .IsUnicode(false);
        });

        modelBuilder.Entity<WellMonthlyProduction>(entity =>
        {
            entity.HasKey(e => new { e.WellId, e.ProductionDate, e.ProductTypeId, e.WellStatusTypeId });

            entity.ToTable("WellMonthlyProduction");

            entity.HasIndex(e => new { e.WellId, e.ProductionDate, e.ProductTypeId, e.WellStatusTypeId }, "PK_MonthlyWellProduction").IsUnique();

            entity.Property(e => e.WellId).HasColumnName("WellID");
            entity.Property(e => e.ProductTypeId).HasColumnName("ProductTypeID");
            entity.Property(e => e.WellStatusTypeId).HasColumnName("WellStatusTypeID");
            entity.Property(e => e.CciCode).IsSparse();
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Energy)
                .IsSparse()
                .HasColumnType("decimal(38, 12)");
            entity.Property(e => e.HoursOn).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.Volume).HasColumnType("decimal(38, 12)");

            entity.HasOne(d => d.ProductType).WithMany(p => p.WellMonthlyProductions)
                .HasForeignKey(d => d.ProductTypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_MonthlyWellProduction_ProductTypes");

            entity.HasOne(d => d.Well).WithMany(p => p.WellMonthlyProductions)
                .HasForeignKey(d => d.WellId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_MonthlyWellProduction_Wells");
        });

        modelBuilder.Entity<WellPerforationTreatment>(entity =>
        {
            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.PerforationType)
                .HasMaxLength(128)
                .IsUnicode(false);
            entity.Property(e => e.WellId).HasColumnName("WellID");

            entity.HasOne(d => d.Well).WithMany(p => p.WellPerforationTreatments)
                .HasForeignKey(d => d.WellId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_WellPerforationTreatments_Wells");
        });

        modelBuilder.Entity<WellProductionDatum>(entity =>
        {
            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.WellId).HasColumnName("WellID");

            entity.HasOne(d => d.Well).WithMany(p => p.WellProductionData)
                .HasForeignKey(d => d.WellId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_WellProductionData_Wells");
        });

        modelBuilder.Entity<WellStatus>(entity =>
        {
            entity.HasKey(e => new { e.WellId, e.TimeStamp, e.RecordVersion });

            entity.Property(e => e.WellId).HasColumnName("WellID");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.PrimaryLinkedFacilityId).HasColumnName("PrimaryLinkedFacilityID");
            entity.Property(e => e.SecondaryLinkedFacilityId).HasColumnName("SecondaryLinkedFacilityID");
            entity.Property(e => e.WellFluidId).HasColumnName("WellFluidID");
            entity.Property(e => e.WellModeId).HasColumnName("WellModeID");
            entity.Property(e => e.WellStructureId).HasColumnName("WellStructureID");
            entity.Property(e => e.WellTypeId).HasColumnName("WellTypeID");

            entity.HasOne(d => d.PrimaryLinkedFacility).WithMany(p => p.WellStatusPrimaryLinkedFacilities)
                .HasForeignKey(d => d.PrimaryLinkedFacilityId)
                .HasConstraintName("FK_WellStatuses_Facilities");

            entity.HasOne(d => d.SecondaryLinkedFacility).WithMany(p => p.WellStatusSecondaryLinkedFacilities)
                .HasForeignKey(d => d.SecondaryLinkedFacilityId)
                .HasConstraintName("FK_WellStatuses_SecondaryFacilities");

            entity.HasOne(d => d.WellFluid).WithMany(p => p.WellStatuses)
                .HasForeignKey(d => d.WellFluidId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_WellStatuses_WellFluids");

            entity.HasOne(d => d.Well).WithMany(p => p.WellStatuses)
                .HasForeignKey(d => d.WellId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_WellStatuses_Wells");

            entity.HasOne(d => d.WellMode).WithMany(p => p.WellStatuses)
                .HasForeignKey(d => d.WellModeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_WellStatuses_WellModes");

            entity.HasOne(d => d.WellStructure).WithMany(p => p.WellStatuses)
                .HasForeignKey(d => d.WellStructureId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_WellStatuses_WellStructures");

            entity.HasOne(d => d.WellType).WithMany(p => p.WellStatuses)
                .HasForeignKey(d => d.WellTypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_WellStatuses_WellTypes");
        });

        modelBuilder.Entity<WellStatusType>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Code)
                .HasMaxLength(64)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(128)
                .IsUnicode(false);
        });

        modelBuilder.Entity<WellStructure>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Code)
                .HasMaxLength(128)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(128)
                .IsUnicode(false);
        });

        modelBuilder.Entity<WellTest>(entity =>
        {
            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.AverageCasingPressure).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.AverageLinePressure).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.AverageTubingPressure).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.DateTimeCreated)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.EndDate).HasColumnType("datetime");
            entity.Property(e => e.Notes)
                .HasMaxLength(1024)
                .IsUnicode(false);
            entity.Property(e => e.SatelliteFlowRunId).HasColumnName("SatelliteFlowRunID");
            entity.Property(e => e.StartDate).HasColumnType("datetime");
            entity.Property(e => e.TestNumber)
                .HasMaxLength(64)
                .IsUnicode(false);
            entity.Property(e => e.TestedBy)
                .HasMaxLength(64)
                .IsUnicode(false);
            entity.Property(e => e.TotalGas).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.TotalOil).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.TotalWater).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.WaterCut).HasColumnType("decimal(38, 12)");
            entity.Property(e => e.WellId).HasColumnName("WellID");
        });

        modelBuilder.Entity<WellType>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Code)
                .HasMaxLength(128)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(128)
                .IsUnicode(false);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
