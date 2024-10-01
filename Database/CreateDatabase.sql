USE [master]
GO
/****** Object:  Database [EnerFlow]    Script Date: 2024-09-30 11:44:24 PM ******/
CREATE DATABASE [EnerFlow]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EnerFlow', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\EnerFlow.mdf' , SIZE = 92736KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EnerFlow_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\EnerFlow_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [EnerFlow] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EnerFlow].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EnerFlow] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EnerFlow] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EnerFlow] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EnerFlow] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EnerFlow] SET ARITHABORT OFF 
GO
ALTER DATABASE [EnerFlow] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EnerFlow] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EnerFlow] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EnerFlow] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EnerFlow] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EnerFlow] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EnerFlow] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EnerFlow] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EnerFlow] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EnerFlow] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EnerFlow] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EnerFlow] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EnerFlow] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EnerFlow] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EnerFlow] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EnerFlow] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EnerFlow] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EnerFlow] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EnerFlow] SET  MULTI_USER 
GO
ALTER DATABASE [EnerFlow] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EnerFlow] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EnerFlow] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EnerFlow] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EnerFlow] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EnerFlow] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'EnerFlow', N'ON'
GO
ALTER DATABASE [EnerFlow] SET QUERY_STORE = ON
GO
ALTER DATABASE [EnerFlow] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [EnerFlow]
GO
/****** Object:  Table [dbo].[AlarmNotes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlarmNotes](
	[AlarmID] [int] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[Notes] [varchar](1024) NOT NULL,
 CONSTRAINT [PK_AlarmNotes] PRIMARY KEY CLUSTERED 
(
	[AlarmID] ASC,
	[TimeStamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlarmPriorities]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlarmPriorities](
	[ID] [int] NOT NULL,
	[Name] [varchar](32) NOT NULL,
 CONSTRAINT [PK_AlarmPriorities] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Alarms]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alarms](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TimeStamp] [datetime] NULL,
	[AlarmType] [int] NULL,
	[AlarmPriority] [int] NULL,
	[AlarmStatusID] [int] NULL,
	[HierarchyID] [int] NOT NULL,
	[DigitalIoTagID] [int] NOT NULL,
	[AnalogIoTagID] [int] NOT NULL,
	[Name] [varchar](255) NULL,
	[Description] [varchar](255) NULL,
	[NumericValue] [float] NULL,
	[StringValue] [varchar](255) NULL,
	[Setpoint] [float] NULL,
	[UnitID] [int] NULL,
	[HasNotes] [bit] NULL,
	[AlarmSource] [varchar](255) NULL,
	[AcknowledgedByUser] [int] NULL,
 CONSTRAINT [PK_Alarms] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlarmStatuses]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlarmStatuses](
	[ID] [int] NOT NULL,
	[Name] [varchar](32) NOT NULL,
 CONSTRAINT [PK_AlarmStatuses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlarmTypes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlarmTypes](
	[ID] [int] NOT NULL,
	[Name] [varchar](32) NOT NULL,
 CONSTRAINT [PK_AlarmTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlphaUnits]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlphaUnits](
	[ID] [int] NOT NULL,
	[Code] [varchar](1) NOT NULL,
	[Name] [varchar](32) NOT NULL,
 CONSTRAINT [PK_AlphaUnits] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnalogIoTags]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnalogIoTags](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HierarchyID] [int] NOT NULL,
	[ByteSwap] [bit] NULL,
	[WordSwap] [bit] NULL,
	[Deadband] [float] NULL,
	[ReadAddress] [varchar](255) NULL,
	[ReadAddressScanInterval] [int] NULL,
	[HistoryAddress] [varchar](255) NULL,
	[HistoryAddressScanInterval] [int] NULL,
	[WriteAddress] [varchar](255) NULL,
	[IsCalculated] [bit] NULL,
	[Script] [varchar](max) NULL,
	[UnscaledMinimum] [float] NULL,
	[UnscaledMaximum] [float] NULL,
	[ScaledMinimum] [float] NULL,
	[ScaledMaximum] [float] NULL,
	[ClampScaledValue] [bit] NULL,
	[EnableLogging] [bit] NULL,
	[HighHighAlarmPriorityID] [int] NULL,
	[HighHighAlarmDelay] [int] NULL,
	[HighHighAlarmSetpoint] [float] NULL,
	[HighHighAlarmDeadband] [float] NULL,
	[HighHighAlarmDisable] [bit] NULL,
	[HighAlarmPriorityID] [int] NULL,
	[HighAlarmDelay] [int] NULL,
	[HighAlarmSetpoint] [float] NULL,
	[HighAlarmDeadband] [float] NULL,
	[HighAlarmDisable] [bit] NULL,
	[LowAlarmPriorityID] [int] NULL,
	[LowAlarmDelay] [int] NULL,
	[LowAlarmSetpoint] [float] NULL,
	[LowAlarmDeadband] [float] NULL,
	[LowAlarmDisable] [bit] NULL,
	[LowLowAlarmPriorityID] [int] NULL,
	[LowLowAlarmDelay] [int] NULL,
	[LowLowAlarmSetpoint] [float] NULL,
	[LowLowAlarmDeadband] [float] NULL,
	[LowLowAlarmDisable] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[NumberOfDigitsAfterDecimal] [int] NULL,
	[UnitID] [int] NULL,
	[TagValueEnumerationID] [int] NULL,
	[IsBadQuality] [bit] NULL,
	[ManualData] [float] NULL,
	[Value] [float] NULL,
	[DateTimeCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_AnalogIoTags] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnalogIoTagValueHistory]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnalogIoTagValueHistory](
	[AnalogIoTagID] [int] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[Value] [float] NULL,
	[DateTimeCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_AnalogIoTagValueHistory] PRIMARY KEY CLUSTERED 
(
	[AnalogIoTagID] ASC,
	[TimeStamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BatchTypes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BatchTypes](
	[ID] [int] NOT NULL,
	[Name] [varchar](32) NOT NULL,
 CONSTRAINT [PK_BatchTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CalculationErrorMessageTypes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CalculationErrorMessageTypes](
	[ID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_CalculationErrorMessageTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Calculations]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calculations](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[MeterID] [bigint] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[AtmosphericPressureCalculated] [bit] NOT NULL,
	[ReferenceEquationID] [int] NOT NULL,
	[Patm] [float] NOT NULL,
	[AccelerationCalculated] [bit] NOT NULL,
	[G] [float] NOT NULL,
	[Elevation] [float] NOT NULL,
	[Degrees] [float] NOT NULL,
	[Minutes] [float] NOT NULL,
	[Seconds] [float] NOT NULL,
	[MeterStandardID] [int] NOT NULL,
	[IsSuccessful] [bit] NOT NULL,
	[ErrorMessageTypeID] [int] NOT NULL,
	[WarningEnabled] [bit] NOT NULL,
	[WarningMessages] [varchar](64) NOT NULL,
	[FluidTypeID] [int] NOT NULL,
	[FluidStandardID] [int] NOT NULL,
	[FluidStateID] [int] NOT NULL,
	[BaseFluidPhaseID] [int] NOT NULL,
	[FlowingFluidPhaseID] [int] NOT NULL,
	[WaterRegionID] [int] NOT NULL,
	[Pb] [float] NOT NULL,
	[Tb] [float] NOT NULL,
	[Pf] [float] NOT NULL,
	[Tf] [float] NOT NULL,
	[FlowDuration] [float] NOT NULL,
	[DP] [float] NOT NULL,
	[MeasuredBeta] [float] NOT NULL,
	[CalculatedBeta] [float] NOT NULL,
	[MeterFactor] [float] NOT NULL,
	[PipeMaterialID] [int] NOT NULL,
	[MeasuredPipeDiameter] [float] NOT NULL,
	[CalculatedPipeDiameter] [float] NOT NULL,
	[PipeReferenceTemperature] [float] NOT NULL,
	[PipeExpansionCoefficient] [float] NOT NULL,
	[BoreMaterialID] [int] NOT NULL,
	[MeasuredBoreDiameter] [float] NOT NULL,
	[CalculatedBoreDiameter] [float] NOT NULL,
	[BoreReferenceTemperature] [float] NOT NULL,
	[BoreExpansionCoefficient] [float] NOT NULL,
	[Rhob] [float] NOT NULL,
	[Rhof] [float] NOT NULL,
	[Qf] [float] NOT NULL,
	[Qv] [float] NOT NULL,
	[Qm] [float] NOT NULL,
	[ERb] [float] NOT NULL,
	[PipeVelolcity] [float] NOT NULL,
	[PipeReynoldsNumber] [float] NOT NULL,
	[OrificeReynoldsNumber] [float] NOT NULL,
	[Y] [float] NOT NULL,
	[Cd] [float] NOT NULL,
	[Mass] [float] NOT NULL,
	[UncorrectedGrossVolume] [float] NOT NULL,
	[CorrectedNetVolume] [float] NOT NULL,
	[Energy] [float] NOT NULL,
	[PressureLoss] [float] NOT NULL,
	[Fe] [float] NOT NULL,
	[Ev] [float] NOT NULL,
	[StaticTapID] [int] NOT NULL,
	[TapTypeID] [int] NOT NULL,
	[Zf1] [float] NOT NULL,
	[Zf2] [float] NOT NULL,
	[ConeTypeID] [int] NOT NULL,
	[NozzleTypeID] [int] NOT NULL,
	[DivAngle] [float] NOT NULL,
	[CdCalculated] [bit] NOT NULL,
	[PulseTypeID] [int] NOT NULL,
	[LinearMeterCalculationModeID] [int] NOT NULL,
	[SignalTypeID] [int] NOT NULL,
	[LinearMeterCalculationUnitTypeID] [int] NOT NULL,
	[TurbineRotorModeID] [int] NOT NULL,
	[PulseCount] [float] NOT NULL,
	[Frequency] [float] NOT NULL,
	[KFactor] [float] NOT NULL,
	[Ql] [float] NOT NULL,
	[Qu] [float] NOT NULL,
	[Cl] [float] NOT NULL,
	[Cu] [float] NOT NULL,
	[C] [float] NOT NULL,
	[PressureLossCoefficient] [float] NOT NULL,
	[SensingPulseCount] [float] NOT NULL,
	[SensingFrequency] [float] NOT NULL,
	[SensingKFactor] [float] NOT NULL,
	[AverageVelocity] [float] NOT NULL,
	[Methane] [float] NOT NULL,
	[Nitrogen] [float] NOT NULL,
	[CarbonDioxide] [float] NOT NULL,
	[Ethane] [float] NOT NULL,
	[Propane] [float] NOT NULL,
	[Water] [float] NOT NULL,
	[HydrogenSulfide] [float] NOT NULL,
	[Hydrogen] [float] NOT NULL,
	[CarbonMonoxide] [float] NOT NULL,
	[Oxygen] [float] NOT NULL,
	[iButane] [float] NOT NULL,
	[nButane] [float] NOT NULL,
	[iPentane] [float] NOT NULL,
	[nPentane] [float] NOT NULL,
	[Hexane] [float] NOT NULL,
	[Heptane] [float] NOT NULL,
	[Octane] [float] NOT NULL,
	[Nonane] [float] NOT NULL,
	[Decane] [float] NOT NULL,
	[Helium] [float] NOT NULL,
	[Argon] [float] NOT NULL,
	[MolarMass] [float] NOT NULL,
	[PGr] [float] NOT NULL,
	[TGr] [float] NOT NULL,
	[PHv] [float] NOT NULL,
	[THv] [float] NOT NULL,
	[PRho] [float] NOT NULL,
	[TRho] [float] NOT NULL,
	[Zb] [float] NOT NULL,
	[Zf] [float] NOT NULL,
	[Fpv] [float] NOT NULL,
	[KappaCalculated] [bit] NOT NULL,
	[Kappa] [float] NOT NULL,
	[ViscosityCalculated] [bit] NOT NULL,
	[ViscosityEquationID] [int] NOT NULL,
	[Viscosity] [float] NOT NULL,
	[Db] [float] NOT NULL,
	[Df] [float] NOT NULL,
	[RD_User] [float] NOT NULL,
	[RD_Ideal] [float] NOT NULL,
	[RD_Real] [float] NOT NULL,
	[Za] [float] NOT NULL,
	[HeatingValueStandardID] [int] NOT NULL,
	[IdealHeatingValue] [float] NOT NULL,
	[HV_Ideal_Vol] [float] NOT NULL,
	[HV_Net] [float] NOT NULL,
	[HV_Gross] [float] NOT NULL,
	[U] [float] NOT NULL,
	[H] [float] NOT NULL,
	[S] [float] NOT NULL,
	[Cp] [float] NOT NULL,
	[Cv] [float] NOT NULL,
	[W] [float] NOT NULL,
	[JT] [float] NOT NULL,
	[CStar] [float] NOT NULL,
	[Ho] [float] NOT NULL,
	[Cpi] [float] NOT NULL,
	[k] [float] NOT NULL,
	[VaporPressureCalculated] [bit] NOT NULL,
	[Pe] [float] NOT NULL,
	[IsPeExisting] [bit] NOT NULL,
	[GlassHydrometer] [bit] NOT NULL,
	[Rhor] [float] NOT NULL,
	[Rhoo] [float] NOT NULL,
	[To] [float] NOT NULL,
	[Po] [float] NOT NULL,
	[CPLf] [float] NOT NULL,
	[CTLf] [float] NOT NULL,
	[CTPLf] [float] NOT NULL,
	[CPLb] [float] NOT NULL,
	[CTLb] [float] NOT NULL,
	[CTPLb] [float] NOT NULL,
	[CPLo] [float] NOT NULL,
	[CTLo] [float] NOT NULL,
	[CTPLo] [float] NOT NULL,
	[Csw] [float] NOT NULL,
	[Hyc] [float] NOT NULL,
	[Bsw] [float] NOT NULL,
	[Tc] [float] NOT NULL,
	[Pc] [float] NOT NULL,
	[Rhoc] [float] NOT NULL,
	[Tt] [float] NOT NULL,
	[Pt] [float] NOT NULL,
	[Omega] [float] NOT NULL,
	[IsMeterCalcVapor] [bit] NOT NULL,
	[RhofV] [float] NOT NULL,
	[ZfV] [float] NOT NULL,
	[ViscosityV] [float] NOT NULL,
	[KappaV] [float] NOT NULL,
	[SV] [float] NOT NULL,
	[UV] [float] NOT NULL,
	[CvV] [float] NOT NULL,
	[HV] [float] NOT NULL,
	[CpV] [float] NOT NULL,
	[WV] [float] NOT NULL,
	[MiuV] [float] NOT NULL,
	[RhofL] [float] NOT NULL,
	[ZfL] [float] NOT NULL,
	[ViscosityL] [float] NOT NULL,
	[KappaL] [float] NOT NULL,
	[SL] [float] NOT NULL,
	[UL] [float] NOT NULL,
	[CvL] [float] NOT NULL,
	[HL] [float] NOT NULL,
	[CpL] [float] NOT NULL,
	[WL] [float] NOT NULL,
	[MiuL] [float] NOT NULL,
 CONSTRAINT [PK_Calculations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompressibilityFactorUnits]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompressibilityFactorUnits](
	[ID] [int] NOT NULL,
	[Code] [varchar](1) NOT NULL,
	[Name] [varchar](32) NOT NULL,
 CONSTRAINT [PK_CompressibilityFactorUnits] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConeTypes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConeTypes](
	[ID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_ConeTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContextTagProperties]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContextTagProperties](
	[ContextTagID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Description] [varchar](255) NULL,
	[Value] [varchar](255) NULL,
	[DateTimeCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_ContextTagProperties] PRIMARY KEY CLUSTERED 
(
	[ContextTagID] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContextTags]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContextTags](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HierarchyID] [int] NOT NULL,
	[DateTimeCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_ContextTags] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DailyGasFlowRecords]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailyGasFlowRecords](
	[MeterID] [int] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[FlowTime] [int] NULL,
	[DP] [decimal](38, 12) NULL,
	[PulseCount] [decimal](38, 12) NULL,
	[Pf] [decimal](38, 12) NULL,
	[Tf] [decimal](38, 12) NULL,
	[Extension] [decimal](38, 12) NULL,
	[CPrime] [decimal](38, 12) NULL,
	[Volume] [decimal](38, 12) NULL,
	[Energy] [decimal](38, 12) NULL,
	[Mass] [decimal](38, 12) NULL,
	[Fpv] [decimal](38, 12) NULL,
	[CasingPressure] [decimal](38, 12) NULL,
	[TubingPressure] [decimal](38, 12) NULL,
	[LinePressure] [decimal](38, 12) NULL,
	[DateTimeCreated] [datetime] NULL,
 CONSTRAINT [PK_DailyGasFlowRecords] PRIMARY KEY CLUSTERED 
(
	[MeterID] ASC,
	[TimeStamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DailyLiquidFlowRecords]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailyLiquidFlowRecords](
	[MeterID] [int] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[FlowTime] [int] NULL,
	[Density] [decimal](38, 12) NULL,
	[MeterTemperature] [decimal](38, 12) NULL,
	[MeterPressure] [decimal](38, 12) NULL,
	[DP] [decimal](38, 12) NULL,
	[Extension] [decimal](38, 12) NULL,
	[CPrime] [decimal](38, 12) NULL,
	[PulseCount] [decimal](38, 12) NULL,
	[IndicatedVolume] [decimal](38, 12) NULL,
	[GrossVolume] [decimal](38, 12) NULL,
	[GrossStandardVolume] [decimal](38, 12) NULL,
	[NetStandardVolume] [decimal](38, 12) NULL,
	[SedimentAndWaterVolume] [decimal](38, 12) NULL,
	[SedimentAndWaterPercent] [decimal](38, 12) NULL,
	[Mass] [decimal](38, 12) NULL,
	[GasEquivalentVolume] [decimal](38, 12) NULL,
	[GasEquivalentEnergy] [decimal](38, 12) NULL,
	[CoriolisDriveGain] [decimal](38, 12) NULL,
	[CasingPressure] [decimal](38, 12) NULL,
	[TubingPressure] [decimal](38, 12) NULL,
	[LinePressure] [decimal](38, 12) NULL,
	[DateTimeCreated] [datetime] NULL,
 CONSTRAINT [PK_DailyLiquidFlowRecords] PRIMARY KEY CLUSTERED 
(
	[MeterID] ASC,
	[TimeStamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeviceCommandParameterDataTypes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceCommandParameterDataTypes](
	[ID] [int] NOT NULL,
	[Name] [varchar](64) NOT NULL,
	[Description] [varchar](64) NOT NULL,
 CONSTRAINT [PK_DeviceCommandParameterDataTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeviceCommandParameters]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceCommandParameters](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DeviceCommandID] [int] NULL,
	[DeviceCommandParameterDataTypeID] [int] NULL,
	[Name] [varchar](64) NULL,
	[Description] [varchar](128) NULL,
	[DefaultValue] [sql_variant] NULL,
	[Ordinal] [int] NULL,
	[DateTimeCreated] [datetime] NULL,
 CONSTRAINT [PK_DeviceCommandParameters] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeviceCommands]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceCommands](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](64) NULL,
	[Description] [varchar](64) NULL,
	[Script] [varchar](max) NULL,
	[DateTimeCreated] [datetime] NULL,
 CONSTRAINT [PK_DeviceCommands] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Devices]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Devices](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HierarchyID] [int] NOT NULL,
	[InterPollDelay] [int] NULL,
	[ReadTimeout] [int] NULL,
	[Retries] [int] NULL,
	[WaitToRetry] [int] NULL,
	[DeviceTypeID] [int] NULL,
	[DeviceAddress] [int] NULL,
	[RocDeviceGroup] [int] NULL,
	[RocSourceAddress] [int] NULL,
	[RocSourceGroup] [int] NULL,
 CONSTRAINT [PK_Devices] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeviceTypes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceTypes](
	[ID] [int] NOT NULL,
	[Name] [varchar](64) NOT NULL,
	[Description] [varchar](128) NOT NULL,
 CONSTRAINT [PK_DeviceTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Diagrams]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diagrams](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HierarchyID] [int] NULL,
	[DiagramXml] [xml] NULL,
	[DateTimeCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Diagrams] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DigitalIoTags]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DigitalIoTags](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HierarchyID] [int] NOT NULL,
	[ReadAddress] [varchar](255) NULL,
	[ReadAddressScanInterval] [int] NULL,
	[HistoryAddress] [varchar](255) NULL,
	[HistoryAddressScanInterval] [int] NULL,
	[WriteAddress] [varchar](255) NULL,
	[IsCalculated] [bit] NULL,
	[Script] [varchar](max) NULL,
	[AlarmPriorityID] [int] NULL,
	[AlarmDisabled] [bit] NULL,
	[TrueValueText] [varchar](255) NULL,
	[FalseValueText] [varchar](255) NULL,
	[IsBadQuality] [bit] NULL,
	[ManualData] [bit] NULL,
	[Value] [bit] NULL,
	[DateTimeCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_DigitalIoTags] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DigitalIoTagValueHistory]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DigitalIoTagValueHistory](
	[DigitalIoTagID] [int] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[Value] [bit] NOT NULL,
	[DateTimeCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_DigitalIoTagValueHistory] PRIMARY KEY CLUSTERED 
(
	[DigitalIoTagID] ASC,
	[TimeStamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Documents]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documents](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HierarchyID] [int] NULL,
	[DocumentData] [varbinary](max) NULL,
	[DateTimeCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Documents] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnergyDevelopmentCategoryTypes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnergyDevelopmentCategoryTypes](
	[ID] [int] NOT NULL,
	[Code] [varchar](32) NOT NULL,
	[Description] [varchar](255) NOT NULL,
 CONSTRAINT [PK_EnergyDevelopmentCategoryTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[ID] [int] NOT NULL,
	[HierarchyID] [int] NOT NULL,
	[EquipmentSubTypeID] [int] NOT NULL,
 CONSTRAINT [PK_Equipment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquipmentSubTypes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquipmentSubTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](64) NOT NULL,
	[Description] [varchar](128) NOT NULL,
	[EquipmentTypeID] [int] NOT NULL,
	[DateTimeCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_EquipmentSubTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquipmentTypes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquipmentTypes](
	[ID] [int] NOT NULL,
	[Name] [varchar](64) NOT NULL,
	[Description] [varchar](128) NOT NULL,
 CONSTRAINT [PK_EquipmentTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExtensionDefinitions]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExtensionDefinitions](
	[ID] [int] NOT NULL,
	[Name] [varchar](32) NOT NULL,
 CONSTRAINT [PK_ExtensionDefinitions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facilities]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facilities](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HierarchyID] [int] NOT NULL,
	[FacilitySubTypeID] [int] NULL,
	[EnergyDevelopmentCategoryTypeID] [int] NULL,
	[UniqueFacilityIdentifier] [varchar](128) NULL,
	[LocationName] [varchar](128) NULL,
	[OperatorCode] [varchar](128) NULL,
	[OperatorName] [varchar](128) NULL,
	[LicenceNumber] [varchar](128) NULL,
	[LicenseeCode] [varchar](128) NULL,
	[WasteLocationTypeID] [int] NULL,
	[DateTimeCreated] [datetime] NULL,
 CONSTRAINT [PK_Facilities] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacilityActivityTypes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacilityActivityTypes](
	[ID] [int] NOT NULL,
	[Code] [varchar](128) NOT NULL,
	[Name] [varchar](128) NOT NULL,
 CONSTRAINT [PK_FacilityActivityTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacilityDailyActivity]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacilityDailyActivity](
	[FacilityID] [int] NOT NULL,
	[ProductionDate] [date] NOT NULL,
	[FacilityActivityTypeID] [int] NOT NULL,
	[ProductTypeID] [int] NOT NULL,
	[ActivityFacilityID] [int] NOT NULL,
	[RecordVersion] [int] NOT NULL,
	[Volume] [decimal](38, 12) NOT NULL,
	[Energy] [decimal](38, 12) NULL,
	[DateTimeCreated] [datetime] NULL,
 CONSTRAINT [PK_FacilityDailyActivity] PRIMARY KEY CLUSTERED 
(
	[FacilityID] ASC,
	[ProductionDate] ASC,
	[FacilityActivityTypeID] ASC,
	[ProductTypeID] ASC,
	[ActivityFacilityID] ASC,
	[RecordVersion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacilityDailyFugitiveEmissions]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacilityDailyFugitiveEmissions](
	[FacilityID] [int] NOT NULL,
	[ProductionDate] [date] NOT NULL,
	[Fuel] [decimal](38, 12) NOT NULL,
	[Flare] [decimal](38, 12) NOT NULL,
	[Vent] [decimal](38, 12) NOT NULL,
	[DateTimeCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_FacilityDailyFugitiveEmissions] PRIMARY KEY CLUSTERED 
(
	[FacilityID] ASC,
	[ProductionDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacilityDailyTransactions]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacilityDailyTransactions](
	[FacilityID] [int] NOT NULL,
	[ProductionDate] [date] NOT NULL,
	[OilClosingVolume] [decimal](38, 12) NULL,
	[OilTransloadedOutVolume] [decimal](38, 12) NULL,
	[OilLoadInjection] [decimal](38, 12) NULL,
	[OilOpeningVolume] [decimal](38, 12) NULL,
	[OilTransloadedInVolume] [decimal](38, 12) NULL,
	[OilRecoveredVolume] [decimal](38, 12) NULL,
	[OilAdjustedVolume] [decimal](38, 12) NULL,
	[OilNetProductionVolume] [decimal](38, 12) NULL,
	[OilProrationFactor] [decimal](38, 12) NULL,
	[OilWellEstimatedVolume] [decimal](38, 12) NULL,
	[OilWellMeasuredVolume] [decimal](38, 12) NULL,
	[CondensateClosingVolume] [decimal](38, 12) NULL,
	[CondensateTransloadedOutVolume] [decimal](38, 12) NULL,
	[CondensateLoadInjectionVolume] [decimal](38, 12) NULL,
	[CondensateOpeningVolume] [decimal](38, 12) NULL,
	[CondensateTransloadedInVolume] [decimal](38, 12) NULL,
	[CondensateRecoveredVolume] [decimal](38, 12) NULL,
	[CondensateAdjustedVolume] [decimal](38, 12) NULL,
	[CondensateNetProductionVolume] [decimal](38, 12) NULL,
	[CondensateProrationFactor] [decimal](38, 12) NULL,
	[CondensateWellEstimatedVolume] [decimal](38, 12) NULL,
	[CondensateWellMeasuredVolume] [decimal](38, 12) NULL,
	[WaterClosingVolume] [decimal](38, 12) NULL,
	[WaterTransloadedOutVolume] [decimal](38, 12) NULL,
	[WaterLoadInjectionVolume] [decimal](38, 12) NULL,
	[WaterOpeningVolume] [decimal](38, 12) NULL,
	[WaterTransloadedInVolume] [decimal](38, 12) NULL,
	[WaterRecoveredVolume] [decimal](38, 12) NULL,
	[WaterSourceVolume] [decimal](38, 12) NULL,
	[WaterInjectedVolume] [decimal](38, 12) NULL,
	[WaterNetProductionVolume] [decimal](38, 12) NULL,
	[WaterProrationFactor] [decimal](38, 12) NULL,
	[WaterWellEstimatedVolume] [decimal](38, 12) NULL,
	[WaterWellMeasuredVolume] [decimal](38, 12) NULL,
	[SandCloseVolume] [decimal](38, 12) NULL,
	[SandTransloadedOutVolume] [decimal](38, 12) NULL,
	[SandOpeningVolume] [decimal](38, 12) NULL,
	[SandNetProductionVolume] [decimal](38, 12) NULL,
	[SandWellEstimatedVolume] [decimal](38, 12) NULL,
	[SandWellMeasuredVolume] [decimal](38, 12) NULL,
	[FluidClosingVolume] [decimal](38, 12) NULL,
	[FluidTransloadedOutVolume] [decimal](38, 12) NULL,
	[FluidLoadInjectionVolume] [decimal](38, 12) NULL,
	[FluidOpeningVolume] [decimal](38, 12) NULL,
	[FluidTransloadedInVolume] [decimal](38, 12) NULL,
	[FluidRecoveredVolume] [decimal](38, 12) NULL,
	[FluidNetProductionVolume] [decimal](38, 12) NULL,
	[FluidProrationFactor] [decimal](38, 12) NULL,
	[FluidWellEstimatedVolume] [decimal](38, 12) NULL,
	[FluidWellMeasuredVolume] [decimal](38, 12) NULL,
	[GasFuelVolume] [decimal](38, 12) NULL,
	[GasFlareVolume] [decimal](38, 12) NULL,
	[GasVentVolume] [decimal](38, 12) NULL,
	[GasGroupInletVolume] [decimal](38, 12) NULL,
	[GasSalesVolume] [decimal](38, 12) NULL,
	[GasTransloadInVolume] [decimal](38, 12) NULL,
	[GasFuelVolumeIn] [decimal](38, 12) NULL,
	[GasStvVolume] [decimal](38, 12) NULL,
	[GasProductionVolume] [decimal](38, 12) NULL,
	[GasProrationFactor] [decimal](38, 12) NULL,
	[GasWellProratedVolume] [decimal](38, 12) NULL,
	[GasWellEstimatedVolume] [decimal](38, 12) NULL,
	[GasWellMeasuredVolume] [decimal](38, 12) NULL,
	[GasWellGatheredVolume] [decimal](38, 12) NULL,
	[GasWellProducedVolume] [decimal](38, 12) NULL,
	[GasWellGasLiftVolume] [decimal](38, 12) NULL,
	[GasWellEffulentGasVoume] [decimal](38, 12) NULL,
	[DateTimeCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_FacilityDailyTransactions] PRIMARY KEY CLUSTERED 
(
	[FacilityID] ASC,
	[ProductionDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacilityMonthlyActivity]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacilityMonthlyActivity](
	[FacilityID] [int] NOT NULL,
	[ProductionDate] [date] NOT NULL,
	[FacilityActivityTypeID] [int] NOT NULL,
	[ProductTypeID] [int] NOT NULL,
	[ActivityFacilityID] [int] NOT NULL,
	[RecordVersion] [int] NOT NULL,
	[Volume] [decimal](38, 12) NOT NULL,
	[Energy] [decimal](38, 12) SPARSE  NULL,
	[DateTimeCreated] [datetime] NULL,
 CONSTRAINT [PK_FacilityMonthlyActivity_1] PRIMARY KEY CLUSTERED 
(
	[FacilityID] ASC,
	[ProductionDate] ASC,
	[FacilityActivityTypeID] ASC,
	[ProductTypeID] ASC,
	[ActivityFacilityID] ASC,
	[RecordVersion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacilityMonthlyFugitiveEmissions]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacilityMonthlyFugitiveEmissions](
	[FacilityID] [int] NOT NULL,
	[ProductionDate] [date] NOT NULL,
	[HoursOn] [int] NOT NULL,
	[Fuel] [decimal](38, 12) NOT NULL,
	[Flare] [decimal](38, 12) NOT NULL,
	[Vent] [decimal](38, 12) NOT NULL,
	[DateTimeCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_FacilityMonthlyFugitiveEmissions] PRIMARY KEY CLUSTERED 
(
	[FacilityID] ASC,
	[ProductionDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacilityStatuses]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacilityStatuses](
	[FacilityID] [int] NOT NULL,
	[TimeStamp] [date] NOT NULL,
	[FacilityStatusTypeID] [int] NOT NULL,
	[RecordVersion] [int] NOT NULL,
 CONSTRAINT [PK_FacilityStatuses_1] PRIMARY KEY CLUSTERED 
(
	[FacilityID] ASC,
	[TimeStamp] ASC,
	[FacilityStatusTypeID] ASC,
	[RecordVersion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacilityStatusTypes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacilityStatusTypes](
	[ID] [int] NOT NULL,
	[Code] [varchar](128) NOT NULL,
	[Name] [varchar](128) NOT NULL,
 CONSTRAINT [PK_FacilityStatusTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacilitySubTypes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacilitySubTypes](
	[ID] [int] NOT NULL,
	[FacilityTypeID] [int] NOT NULL,
	[Code] [varchar](64) NOT NULL,
	[Name] [varchar](128) NOT NULL,
 CONSTRAINT [PK_FacilitySubTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacilityTypes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacilityTypes](
	[ID] [int] NOT NULL,
	[Code] [varchar](64) NOT NULL,
	[Name] [varchar](128) NOT NULL,
 CONSTRAINT [PK_FacilityTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FittingTypes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FittingTypes](
	[ID] [int] NOT NULL,
	[Code] [varchar](1) NOT NULL,
	[Name] [varchar](32) NOT NULL,
 CONSTRAINT [PK_FittingTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FluidPhases]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FluidPhases](
	[ID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_FluidPhases] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FluidStandards]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FluidStandards](
	[ID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_FluidStandards] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FluidStates]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FluidStates](
	[ID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_FluidStates] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FluidTypes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FluidTypes](
	[ID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_FluidTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Folder]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Folder](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HierarchyID] [int] NOT NULL,
	[DateTimeCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Folder] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GasBatchRecords]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GasBatchRecords](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FacilityID] [int] NULL,
	[TimeStamp] [datetime] NULL,
	[EndTimeStamp] [datetime] NULL,
	[BatchTypeID] [int] NULL,
	[FluidStandardID] [int] NULL,
	[FluidTypeID] [int] NULL,
	[TemperatureBaseUnitID] [int] NULL,
	[TemperatureBase] [float] NULL,
	[CompressibilityFactor] [float] NULL,
	[CompressibilityFactorUnitID] [int] NULL,
	[BatchID] [varchar](255) NULL,
	[ReportNumber] [int] NULL,
	[UncorrectedDensity] [real] NULL,
	[MeterFlowingDensity] [real] NULL,
	[MeterTemperature] [real] NULL,
	[MeterPressure] [real] NULL,
	[MeterFactor] [real] NULL,
	[KFactor] [real] NULL,
	[Dp] [float] NULL,
	[Extension] [float] NULL,
	[CPrime] [float] NULL,
	[PulseCount] [float] NULL,
	[PulseIndexStart] [float] NULL,
	[PulseIndexEnd] [float] NULL,
	[Mass] [float] NULL,
	[MassIndexStart] [float] NULL,
	[MassIndexEnd] [float] NULL,
	[Viscosity] [float] NULL,
	[Kappa] [float] NULL,
	[Methane] [float] NULL,
	[Nitrogen] [float] NULL,
	[CarbonDioxide] [float] NULL,
	[Ethane] [float] NULL,
	[Propane] [float] NULL,
	[Water] [float] NULL,
	[HydrogenSulfide] [float] NULL,
	[Hydrogen] [float] NULL,
	[CarbonMonoxide] [float] NULL,
	[Oxygen] [float] NULL,
	[iButane] [float] NULL,
	[nButane] [float] NULL,
	[iPentane] [float] NULL,
	[nPentane] [float] NULL,
	[Hexane] [float] NULL,
	[Heptane] [float] NULL,
	[Octane] [float] NULL,
	[Nonane] [float] NULL,
	[Decane] [float] NULL,
	[Helium] [float] NULL,
	[Argon] [float] NULL,
	[RelativeDensity] [float] NULL,
	[APIDegrees] [float] NULL,
	[FlowTime] [int] NULL,
	[Witness] [varchar](255) NULL,
	[Transporter] [varchar](255) NULL,
	[ManifestID] [varchar](255) NULL,
	[Origin] [varchar](255) NULL,
	[Destination] [varchar](255) NULL,
	[VehicleID] [varchar](255) NULL,
	[DriverID] [varchar](255) NULL,
	[TrailerNumber] [varchar](255) NULL,
	[Consignee] [varchar](255) NULL,
	[Consignor] [varchar](255) NULL,
	[Seal1On] [varchar](255) NULL,
	[Seal1Off] [varchar](255) NULL,
	[Seal2On] [varchar](255) NULL,
	[Seal2Off] [varchar](255) NULL,
	[CustomTimeStamp] [datetime] NULL,
	[CustomString01] [varchar](255) NULL,
	[CustomString02] [varchar](255) NULL,
	[CustomString03] [varchar](255) NULL,
	[CustomString04] [varchar](255) NULL,
	[CustomString05] [varchar](255) NULL,
	[CustomString06] [varchar](255) NULL,
	[CustomString07] [varchar](255) NULL,
	[CustomString08] [varchar](255) NULL,
	[CustomNumeric01] [float] NULL,
	[CustomNumeric02] [float] NULL,
	[CustomNumeric03] [float] NULL,
	[CustomNumeric04] [float] NULL,
	[CustomNumeric05] [float] NULL,
	[CustomNumeric06] [float] NULL,
	[CustomNumeric07] [float] NULL,
	[CustomNumeric08] [float] NULL,
	[CustomDate01] [datetime] NULL,
	[CustomDate02] [datetime] NULL,
	[CustomDate03] [datetime] NULL,
	[CustomDate04] [datetime] NULL,
	[DateTimeCreated] [datetime] NULL,
 CONSTRAINT [PK_GasBatchRecords] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GasVolumeKFactorUnits]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GasVolumeKFactorUnits](
	[ID] [int] NOT NULL,
	[Code] [varchar](1) NOT NULL,
	[IsUnitPerPulse] [bit] NOT NULL,
	[UnitID] [int] NOT NULL,
	[Symbol] [varchar](32) NOT NULL,
	[Description] [varchar](64) NOT NULL,
 CONSTRAINT [PK_GasVolumeKFactorUnits] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HeatingValueStandards]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HeatingValueStandards](
	[ID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_HeatingValueStandards] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hierarchy]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hierarchy](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Node] [hierarchyid] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Description] [varchar](255) NULL,
	[IsDisabled] [bit] NOT NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
	[DefaultZoomLevel] [int] NULL,
	[NodeTypeID] [int] NOT NULL,
	[DateTimeCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Hierarchy] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HourlyGasFlowRecords]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HourlyGasFlowRecords](
	[MeterID] [int] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[FlowTime] [int] NULL,
	[DP] [decimal](38, 12) NULL,
	[PulseCount] [decimal](38, 12) NULL,
	[Pf] [decimal](38, 12) NULL,
	[Tf] [decimal](38, 12) NULL,
	[Extension] [decimal](38, 12) NULL,
	[CPrime] [decimal](38, 12) NULL,
	[Volume] [decimal](38, 12) NULL,
	[Energy] [decimal](38, 12) NULL,
	[Mass] [decimal](38, 12) NULL,
	[Fpv] [decimal](38, 12) NULL,
	[CasingPressure] [decimal](38, 12) NULL,
	[TubingPressure] [decimal](38, 12) NULL,
	[LinePressure] [decimal](38, 12) NULL,
	[DateTimeCreated] [datetime] NULL,
 CONSTRAINT [PK_HourlyGasFlowRecords] PRIMARY KEY CLUSTERED 
(
	[MeterID] ASC,
	[TimeStamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HourlyLiquidFlowRecords]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HourlyLiquidFlowRecords](
	[MeterID] [int] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[FlowTime] [int] NULL,
	[Density] [decimal](38, 12) NULL,
	[MeterTemperature] [decimal](38, 12) NULL,
	[MeterPressure] [decimal](38, 12) NULL,
	[DP] [decimal](38, 12) NULL,
	[Extension] [decimal](38, 12) NULL,
	[CPrime] [decimal](38, 12) NULL,
	[PulseCount] [decimal](38, 12) NULL,
	[IndicatedVolume] [decimal](38, 12) NULL,
	[GrossVolume] [decimal](38, 12) NULL,
	[GrossStandardVolume] [decimal](38, 12) NULL,
	[NetStandardVolume] [decimal](38, 12) NULL,
	[SedimentAndWaterVolume] [decimal](38, 12) NULL,
	[SedimentAndWaterPercent] [decimal](38, 12) NULL,
	[Mass] [decimal](38, 12) NULL,
	[GasEquivalentVolume] [decimal](38, 12) NULL,
	[GasEquivalentEnergy] [decimal](38, 12) NULL,
	[CoriolisDriveGain] [decimal](38, 12) NULL,
	[CasingPressure] [decimal](38, 12) NULL,
	[TubingPressure] [decimal](38, 12) NULL,
	[LinePressure] [decimal](38, 12) NULL,
	[DateTimeCreated] [datetime] NULL,
 CONSTRAINT [PK_HourlyLiquidFlowRecords] PRIMARY KEY CLUSTERED 
(
	[MeterID] ASC,
	[TimeStamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IpChannels]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IpChannels](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HierarchyID] [int] NOT NULL,
	[IsUdp] [bit] NULL,
	[HostName] [varchar](255) NULL,
	[HostPort] [int] NULL,
	[ConnectionAttempts] [int] NULL,
	[ConnectionRetryDelay] [int] NULL,
	[IdleDisconnectDelay] [int] NULL,
	[MaximumConnections] [int] NULL,
	[TracingEnabled] [bit] NULL,
	[ReadTimeout] [int] NULL,
	[WriteTimeout] [int] NULL,
 CONSTRAINT [PK_IpChannels] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LinearMeterCalculationModes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LinearMeterCalculationModes](
	[ID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_LinearMeterCalculationModes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LinearMeterCalculationUnitTypes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LinearMeterCalculationUnitTypes](
	[ID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_LinearMeterCalculationUnitTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LiquidBatchRecords]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LiquidBatchRecords](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FacilityID] [int] NULL,
	[TimeStamp] [datetime] NULL,
	[EndTimeStamp] [datetime] NULL,
	[BatchTypeID] [int] NULL,
	[ProductName] [varchar](255) NULL,
	[FluidStandardID] [int] NULL,
	[FluidTypeID] [int] NULL,
	[TemperatureBaseUnitID] [int] NULL,
	[TemperatureBase] [float] NULL,
	[CompressibilityFactor] [float] NULL,
	[CompressibilityFactorUnitID] [int] NULL,
	[BaseDensityOverride] [float] NULL,
	[DensityUnitID] [int] NULL,
	[Alpha] [float] NULL,
	[AlphaUnitID] [int] NULL,
	[Evp] [float] NULL,
	[EvpUnitID] [int] NULL,
	[DensityCorrectionFactor] [float] NULL,
	[ProveDate] [datetime] NULL,
	[PycDate] [datetime] NULL,
	[BatchID] [varchar](255) NULL,
	[ReportNumber] [int] NULL,
	[MeterFactorIsInGrossStandardVolume] [bit] NULL,
	[ObservedDensity] [float] NULL,
	[CorrectedDensity] [float] NULL,
	[DensityTemperature] [real] NULL,
	[DensityPressure] [real] NULL,
	[DensityMeterFactor] [real] NULL,
	[UncorrectedDensity] [real] NULL,
	[MeterFlowingDensity] [real] NULL,
	[MeterTemperature] [real] NULL,
	[MeterPressure] [real] NULL,
	[MeterFactor] [real] NULL,
	[KFactor] [real] NULL,
	[EquilibriumVaporPressure] [real] NULL,
	[CTL] [real] NULL,
	[CPL] [real] NULL,
	[CTPL] [real] NULL,
	[CCF] [real] NULL,
	[Dp] [float] NULL,
	[Extension] [float] NULL,
	[CPrime] [float] NULL,
	[PulseCount] [float] NULL,
	[PulseIndexStart] [float] NULL,
	[PulseIndexEnd] [float] NULL,
	[IndicatedVolume] [float] NULL,
	[IndicatedVolumeIndexStart] [float] NULL,
	[IndicatedVolumeIndexEnd] [float] NULL,
	[GrossVolume] [float] NULL,
	[GrossVolumeIndexStart] [float] NULL,
	[GrossVolumeIndexEnd] [float] NULL,
	[NetStandardVolume] [float] NULL,
	[NetStandardVolumeIndexStart] [float] NULL,
	[NetStandardVolumeIndexEnd] [float] NULL,
	[SedimentAndWaterVolume] [float] NULL,
	[SedimentAndWaterIndexStart] [float] NULL,
	[SedimentAndWaterIndexEnd] [float] NULL,
	[SedimentAndWaterPercent] [float] NULL,
	[SedimentAndWaterCorrection] [float] NULL,
	[Mass] [float] NULL,
	[MassIndexStart] [float] NULL,
	[MassIndexEnd] [float] NULL,
	[GasEquivalentVolume] [float] NULL,
	[GasEquivalentEnergy] [float] NULL,
	[Viscosity] [float] NULL,
	[Kappa] [float] NULL,
	[Methane] [float] NULL,
	[Nitrogen] [float] NULL,
	[CarbonDioxide] [float] NULL,
	[Ethane] [float] NULL,
	[Propane] [float] NULL,
	[Water] [float] NULL,
	[HydrogenSulfide] [float] NULL,
	[Hydrogen] [float] NULL,
	[CarbonMonoxide] [float] NULL,
	[Oxygen] [float] NULL,
	[iButane] [float] NULL,
	[nButane] [float] NULL,
	[iPentane] [float] NULL,
	[nPentane] [float] NULL,
	[Hexane] [float] NULL,
	[Heptane] [float] NULL,
	[Octane] [float] NULL,
	[Nonane] [float] NULL,
	[Decane] [float] NULL,
	[Helium] [float] NULL,
	[Argon] [float] NULL,
	[Butylene] [float] NULL,
	[RelativeDensity] [float] NULL,
	[ObservedRelativeDensity] [float] NULL,
	[ObservedDensityAPIDegrees] [float] NULL,
	[FlowTime] [int] NULL,
	[Witness] [varchar](255) NULL,
	[Transporter] [varchar](255) NULL,
	[ManifestID] [varchar](255) NULL,
	[Origin] [varchar](255) NULL,
	[Destination] [varchar](255) NULL,
	[VehicleID] [varchar](255) NULL,
	[DriverID] [varchar](255) NULL,
	[TrailerNumber] [varchar](255) NULL,
	[Consignee] [varchar](255) NULL,
	[Consignor] [varchar](255) NULL,
	[Seal1On] [varchar](255) NULL,
	[Seal1Off] [varchar](255) NULL,
	[Seal2On] [varchar](255) NULL,
	[Seal2Off] [varchar](255) NULL,
	[CustomTimeStamp] [datetime] NULL,
	[CustomString01] [varchar](255) NULL,
	[CustomString02] [varchar](255) NULL,
	[CustomString03] [varchar](255) NULL,
	[CustomString04] [varchar](255) NULL,
	[CustomString05] [varchar](255) NULL,
	[CustomString06] [varchar](255) NULL,
	[CustomString07] [varchar](255) NULL,
	[CustomString08] [varchar](255) NULL,
	[CustomNumeric01] [float] NULL,
	[CustomNumeric02] [float] NULL,
	[CustomNumeric03] [float] NULL,
	[CustomNumeric04] [float] NULL,
	[CustomNumeric05] [float] NULL,
	[CustomNumeric06] [float] NULL,
	[CustomNumeric07] [float] NULL,
	[CustomNumeric08] [float] NULL,
	[CustomDate01] [datetime] NULL,
	[CustomDate02] [datetime] NULL,
	[CustomDate03] [datetime] NULL,
	[CustomDate04] [datetime] NULL,
	[DateTimeCreated] [datetime] NULL,
 CONSTRAINT [PK_LiquidBatchRecords] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LiquidVolumeKFactorUnits]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LiquidVolumeKFactorUnits](
	[ID] [int] NOT NULL,
	[Code] [varchar](1) NOT NULL,
	[IsUnitPerPulse] [bit] NOT NULL,
	[UnitID] [int] NOT NULL,
	[Symbol] [varchar](32) NOT NULL,
	[Description] [varchar](64) NOT NULL,
 CONSTRAINT [PK_LiquidVolumeKFactorUnits] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaintenanceRecords]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaintenanceRecords](
	[ID] [uniqueidentifier] NOT NULL,
	[HierarchyID] [int] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[PerformedByUserID] [int] NULL,
	[MaintenanceTypeID] [int] NULL,
	[Description] [varchar](max) NULL,
	[Actions] [varchar](max) NULL,
	[NextScheduledDate] [datetime] NULL,
	[LaborHours] [decimal](5, 2) NULL,
	[HourlyRate] [decimal](5, 2) NULL,
	[MaterialCost] [decimal](10, 2) NULL,
	[TotalCost]  AS ([LaborHours]*[HourlyRate]+[MaterialCost]) PERSISTED,
	[DateTimeCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_MaintenanceRecords] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaintenanceTypes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaintenanceTypes](
	[ID] [int] NOT NULL,
	[Name] [varchar](64) NOT NULL,
	[Description] [varchar](255) NOT NULL,
 CONSTRAINT [PK_MaintenanceTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MassHeatingValueUnits]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MassHeatingValueUnits](
	[ID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Symbol] [varchar](32) NOT NULL,
	[MassUnitID] [int] NOT NULL,
	[EnergyUnitID] [int] NOT NULL,
 CONSTRAINT [PK_MassHeatingValueUnits] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MassKFactorUnits]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MassKFactorUnits](
	[ID] [int] NOT NULL,
	[Code] [varchar](1) NOT NULL,
	[IsUnitPerPulse] [bit] NOT NULL,
	[UnitID] [int] NOT NULL,
	[Symbol] [varchar](32) NOT NULL,
	[Description] [varchar](64) NOT NULL,
 CONSTRAINT [PK_MassKFactorUnits] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materials]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materials](
	[ID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Materials] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MeterAlarms]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeterAlarms](
	[TimeStamp] [datetime] NOT NULL,
	[MeterID] [int] NOT NULL,
	[RecordIndex] [int] NOT NULL,
	[AlarmClass] [nvarchar](255) NULL,
	[AlarmCode] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Tag] [nvarchar](255) NULL,
	[Value] [float] NULL,
	[DateTimeCreated] [datetime] NULL,
 CONSTRAINT [PK_MeterAlarms_1] PRIMARY KEY CLUSTERED 
(
	[TimeStamp] ASC,
	[MeterID] ASC,
	[RecordIndex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MeterConfigurations]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeterConfigurations](
	[MeterID] [int] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[MeterNumber] [varchar](255) NULL,
	[MeterStandardID] [int] NULL,
	[FluidStandardID] [int] NULL,
	[DataResolution] [int] NULL,
	[DataSpanIsLeading] [bit] NULL,
	[StaticPressureMeasurementID] [int] NULL,
	[Pb] [float] NULL,
	[Tb] [float] NULL,
	[AtmosphericPressure] [float] NULL,
	[Altitude] [float] NULL,
	[Latitude] [float] NULL,
	[DensityMeterFactor] [float] NULL,
	[FactorFwv] [bit] NULL,
	[FactorFws] [bit] NULL,
	[FullWellStreamFactor] [float] NULL,
	[FixedFactor] [float] NULL,
	[EfmRelativeDensitySaturationConditionID] [int] NULL,
	[EfmHeatingValueSaturationConditionID] [int] NULL,
	[HasDefaultTemperature] [bit] NULL,
	[DefaultTemperature] [float] NULL,
	[ShrinkFactor] [float] NULL,
	[StockTankDensity] [float] NULL,
	[StockTankSedimentAndWaterPercent] [float] NULL,
	[ProductName] [varchar](255) NULL,
	[FluidTypeID] [int] NULL,
	[CompressibilityFactor] [float] NULL,
	[CompressibilityFactorUnitID] [int] NULL,
	[BaseDensityOverride] [float] NULL,
	[DensityUnitID] [int] NULL,
	[Alpha] [float] NULL,
	[AlphaUnitID] [int] NULL,
	[EquilibriumVaporPressure] [float] NULL,
	[EquilibriumVaporPressureUnitID] [int] NULL,
	[DensityCorrectionFactor] [float] NULL,
	[ProveDate] [datetime] NULL,
	[PycDate] [datetime] NULL,
	[NumberOfDialsTotalizerDigits] [smallint] NULL,
	[PressureCompenstated] [bit] NULL,
	[TemperatureCompensated] [bit] NULL,
	[MeterFactorUsageID] [int] NULL,
	[MeterFactor] [float] NULL,
	[KFactor] [float] NULL,
	[PipeLength] [float] NULL,
	[MeterFactorKFactorCurveIsAveraged] [bit] NULL,
	[FlowingPressureEnabled] [bit] NULL,
	[FlowingPressureEffect] [float] NULL,
	[CalibrationPressure] [float] NULL,
	[MeasuredPipeDiameter] [float] NULL,
	[PipeReferenceTemperature] [float] NULL,
	[PipeMaterialID] [int] NULL,
	[MeasuredBoreDiameter] [float] NULL,
	[BoreReferenceTemperature] [float] NULL,
	[BoreMaterialID] [int] NULL,
	[TapTypeID] [int] NULL,
	[StaticTapTypeID] [int] NULL,
	[ExtensionDefinitionID] [int] NULL,
	[FactorFa] [bit] NULL,
	[FactorFb] [bit] NULL,
	[FactorFg] [bit] NULL,
	[FactorFpv] [bit] NULL,
	[FactorFr] [bit] NULL,
	[FactorFt] [bit] NULL,
	[FactorY] [bit] NULL,
	[LowFlowCutoffSetPoint] [float] NULL,
	[BackflowAlarmSetPoint] [float] NULL,
	[DPLowAlarmSetPoint] [float] NULL,
	[DPHighAlarmSetPoint] [float] NULL,
	[DPCalibratedRangeLow] [float] NULL,
	[DPCalibratedRangeHigh] [float] NULL,
	[DPTransducerRangeLow] [float] NULL,
	[DPTransducerRangeHigh] [float] NULL,
	[SPLowAlarmSetPoint] [float] NULL,
	[SPHighAlarmSetPoint] [float] NULL,
	[SPCalibratedRangeLow] [float] NULL,
	[SPCalibratedRangeHigh] [float] NULL,
	[SPTransducerRangeLow] [float] NULL,
	[SPTransducerRangeHigh] [float] NULL,
	[TmpLowAlarmSetPoint] [float] NULL,
	[TmpHighAlarmSetPoint] [float] NULL,
	[TmpCalibratedRangeLow] [float] NULL,
	[TmpCalibratedRangeHigh] [float] NULL,
	[TmpTransducerRangeLow] [float] NULL,
	[TmpTransducerRangeHigh] [float] NULL,
	[FlowComputerID] [varchar](255) NULL,
	[MeterSerialNumber] [varchar](255) NULL,
	[FirstDeliveryDate] [datetime] NULL,
	[PowerSourceID] [int] NULL,
	[LiveAnalysis] [bit] NULL,
	[LiveHeatingValue] [bit] NULL,
	[LiveGravity] [bit] NULL,
	[LiveTemperature] [bit] NULL,
	[FittingTypeID] [int] NULL,
	[ContractHour] [int] NULL,
	[ContractDay] [int] NULL,
	[MeterAccessDate] [datetime] NULL,
	[ColdStartDate] [datetime] NULL,
	[WarmStartDate] [datetime] NULL,
	[HasRTD] [bit] NULL,
	[UseRTD] [bit] NULL,
	[Rotation] [int] NULL,
	[IsChart] [bit] NULL,
	[SampleDate] [datetime] NULL,
	[SampleTypeID] [int] NULL,
	[HeatingValue] [float] NULL,
	[GasRelativeDensity] [float] NULL,
	[Viscosity] [float] NULL,
	[Kappa] [float] NULL,
	[Methane] [float] NULL,
	[Nitrogen] [float] NULL,
	[CarbonDioxide] [float] NULL,
	[Ethane] [float] NULL,
	[Propane] [float] NULL,
	[Water] [float] NULL,
	[HydrogenSulfide] [float] NULL,
	[Hydrogen] [float] NULL,
	[CarbonMonoxide] [float] NULL,
	[Oxygen] [float] NULL,
	[iButane] [float] NULL,
	[nButane] [float] NULL,
	[iPentane] [float] NULL,
	[nPentane] [float] NULL,
	[Hexane] [float] NULL,
	[Heptane] [float] NULL,
	[Octane] [float] NULL,
	[Nonane] [float] NULL,
	[Decane] [float] NULL,
	[Helium] [float] NULL,
	[Argon] [float] NULL,
	[Ethylene] [float] NULL,
	[Propylene] [float] NULL,
	[WaterContent] [float] NULL,
	[HydrogenSulfideContent] [float] NULL,
	[DifferentialPressureUnit] [int] NULL,
	[StaticPressureUnit] [int] NULL,
	[TemperatureUnit] [int] NULL,
	[RawVolumeUnit] [int] NULL,
	[MeasuredVolumeUnit] [int] NULL,
	[EnergyUnit] [int] NULL,
	[TemperatureBaseUnitID] [int] NULL,
	[GasPressureBaseUnitID] [int] NULL,
	[AtmosphericPressureUnitID] [int] NULL,
	[GasVolumeKFactorUnitID] [int] NULL,
	[LiquidVolumeKFactorUnitID] [int] NULL,
	[MassKFactorUnitID] [int] NULL,
	[BoreReferenceTemperatureUnitID] [int] NULL,
	[PipeReferenceTemperatureUnitID] [int] NULL,
	[BoreDiameterUnitID] [int] NULL,
	[PipeDiameterUnitID] [int] NULL,
	[VolumetricHeatingValueUnitID] [int] NULL,
	[ViscosityUnitID] [int] NULL,
	[MassHeatingValueUnitID] [int] NULL,
	[PipeLengthUnitID] [int] NULL,
	[MassUnitID] [int] NULL,
	[ObservedDensityUnitID] [int] NULL,
	[IndicatedVolumeUnitID] [int] NULL,
	[GrossVolumeUnitID] [int] NULL,
	[GrossStandardVolumeUnitID] [int] NULL,
	[NetStandardVolumeUnitID] [int] NULL,
	[UserCharacteristic01] [varchar](32) NULL,
	[UserCharacteristic02] [varchar](32) NULL,
	[UserCharacteristic03] [varchar](32) NULL,
	[UserCharacteristic04] [varchar](32) NULL,
	[UserCharacteristic05] [varchar](32) NULL,
	[UserCharacteristic06] [varchar](32) NULL,
	[UserCharacteristic07] [varchar](32) NULL,
	[UserCharacteristic08] [varchar](32) NULL,
	[UserCharacteristic09] [varchar](32) NULL,
	[UserCharacteristic10] [varchar](32) NULL,
	[UserCharacteristic11] [varchar](32) NULL,
	[UserCharacteristic12] [varchar](32) NULL,
	[UserCharacteristic13] [varchar](32) NULL,
	[UserCharacteristic14] [varchar](32) NULL,
	[UserCharacteristic15] [varchar](32) NULL,
	[UserCharacteristic16] [varchar](32) NULL,
	[UserCharacteristic17] [varchar](32) NULL,
	[UserCharacteristic18] [varchar](32) NULL,
	[UserCharacteristic19] [varchar](32) NULL,
	[UserCharacteristic20] [varchar](32) NULL,
	[UserCharacteristic21] [varchar](32) NULL,
	[UserCharacteristic22] [varchar](32) NULL,
	[UserCharacteristic23] [varchar](32) NULL,
	[UserCharacteristic24] [varchar](32) NULL,
	[UserCharacteristic25] [varchar](32) NULL,
	[UserCharacteristic26] [varchar](32) NULL,
	[UserCharacteristic27] [varchar](32) NULL,
	[UserCharacteristic28] [varchar](32) NULL,
	[UserCharacteristic29] [varchar](32) NULL,
	[UserCharacteristic30] [varchar](32) NULL,
	[DateTimeCreated] [datetime] NULL,
 CONSTRAINT [PK_MeterConfigurations_1] PRIMARY KEY CLUSTERED 
(
	[MeterID] ASC,
	[TimeStamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MeterEvents]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeterEvents](
	[TimeStamp] [datetime] NOT NULL,
	[MeterID] [int] NOT NULL,
	[RecordIndex] [int] NOT NULL,
	[OperatorID] [nvarchar](255) NULL,
	[EventSource] [nvarchar](255) NULL,
	[EventCode] [nvarchar](255) NULL,
	[EventText] [nvarchar](255) NULL,
	[OldValue] [float] NULL,
	[NewValue] [float] NULL,
	[MeterEventTypeID] [int] NULL,
	[DateTimeCreated] [datetime] NULL,
 CONSTRAINT [PK_MeterEvents_1] PRIMARY KEY CLUSTERED 
(
	[TimeStamp] ASC,
	[MeterID] ASC,
	[RecordIndex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MeterEventTypes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeterEventTypes](
	[ID] [int] NOT NULL,
	[Name] [varchar](64) NOT NULL,
 CONSTRAINT [PK_MeterEventTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MeterExceptionResolutionTypes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeterExceptionResolutionTypes](
	[ID] [int] NOT NULL,
	[Name] [varchar](64) NULL,
 CONSTRAINT [PK_MeterExceptionResolutionTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MeterExceptions]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeterExceptions](
	[MeterID] [int] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[MeterExceptionTypeID] [int] NOT NULL,
	[MeterExceptionResolutionTypeID] [int] NULL,
	[ResolvedByUserID] [int] NULL,
	[DateTimeCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_MeterExceptions] PRIMARY KEY CLUSTERED 
(
	[MeterID] ASC,
	[TimeStamp] ASC,
	[MeterExceptionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MeterExceptionTypes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeterExceptionTypes](
	[ID] [int] NOT NULL,
	[Name] [varchar](64) NULL,
 CONSTRAINT [PK_MeterExceptionTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MeterExportTypes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeterExportTypes](
	[ID] [int] NOT NULL,
	[Name] [varchar](32) NULL,
 CONSTRAINT [PK_MeterExportTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MeterFactorUsages]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeterFactorUsages](
	[ID] [int] NOT NULL,
	[Name] [varchar](32) NOT NULL,
 CONSTRAINT [PK_MeterFactorUsages] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MeterPurposes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeterPurposes](
	[ID] [int] NOT NULL,
	[Name] [varchar](32) NOT NULL,
 CONSTRAINT [PK_MeterPurposes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MeterRuns]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeterRuns](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HierarchyID] [int] NOT NULL,
	[MeterTag] [nvarchar](255) NULL,
	[MeterDescription] [nvarchar](255) NULL,
	[LastPollDateTime] [datetime] NULL,
	[LastExportDateTime] [datetime] NULL,
	[MeterRunNumber] [int] NULL,
	[CollectHourlyHistory] [bit] NULL,
	[CollectAlarms] [bit] NULL,
	[CollectEvents] [bit] NULL,
	[LastHourlyIndex] [int] NULL,
	[LastEventIndex] [int] NULL,
	[LastAlarmIndex] [int] NULL,
	[AutoPollIsEnabled] [bit] NULL,
	[AutoPollOffsetDateTime] [datetime] NULL,
	[AutoPollIntervalSeconds] [int] NULL,
	[AutoPollLastRunDateTime] [datetime] NULL,
	[MeterExportTypeID] [int] NULL,
	[ExportIsEnabled] [bit] NULL,
	[ExportOffsetDateTime] [datetime] NULL,
	[ExportIntervalSeconds] [int] NULL,
	[ExportPrimaryFolder] [nvarchar](1024) NULL,
	[ExportArchiveFolder] [nvarchar](1024) NULL,
	[ExportLastRunDateTime] [datetime] NULL,
	[DateTimeCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_MeterRuns] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Meters]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meters](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HierarchyID] [int] NOT NULL,
	[MeterRunID] [int] NULL,
	[IsChart] [bit] NULL,
	[Name] [varchar](32) NULL,
	[Description] [varchar](64) NULL,
	[IsLiquidMeter] [bit] NULL,
	[MeterPurposeID] [int] NULL,
	[FluidTypeID] [int] NULL,
	[DateTimeCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Meters] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MeterStandards]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeterStandards](
	[ID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_MeterStandards] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NodeTypeDailyLogProperties]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NodeTypeDailyLogProperties](
	[ID] [int] NOT NULL,
	[NodeTypeID] [int] NOT NULL,
	[EntityName] [varchar](255) NOT NULL,
	[PropertyName] [varchar](255) NOT NULL,
	[UnitID] [int] NULL,
 CONSTRAINT [PK_NodeTypeDailyLogProperties] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NodeTypes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NodeTypes](
	[ID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_NodeTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NozzleTypes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NozzleTypes](
	[ID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_NozzleTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Observations]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Observations](
	[ID] [uniqueidentifier] NOT NULL,
	[RunSheetID] [int] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[Notes] [varchar](max) NOT NULL,
	[UserID] [int] NOT NULL,
	[DateTimeCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Observations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PeriodicGasFlowRecords]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PeriodicGasFlowRecords](
	[MeterID] [int] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[Duration] [int] NOT NULL,
	[RecordIndex] [int] NOT NULL,
	[FlowTime] [int] NULL,
	[DP] [float] NULL,
	[PulseCount] [float] NULL,
	[Pf] [float] NULL,
	[Tf] [float] NULL,
	[Extension] [float] NULL,
	[CPrime] [float] NULL,
	[Volume] [float] NULL,
	[Energy] [float] NULL,
	[Mass] [float] NULL,
	[KFactor] [float] NULL,
	[Fpv] [float] NULL,
	[PulseIndexStart] [int] NULL,
	[PulseIndexEnd] [int] NULL,
	[RawVolumeIndexStart] [int] NULL,
	[RawVolumeIndexEnd] [int] NULL,
	[VolumeIndexStart] [int] NULL,
	[VolumeIndexEnd] [int] NULL,
	[MassIndexStart] [int] NULL,
	[MassIndexEnd] [int] NULL,
	[UserDefined01] [float] NULL,
	[UserDefined02] [float] NULL,
	[UserDefined03] [float] NULL,
	[UserDefined04] [float] NULL,
	[UserDefined05] [float] NULL,
	[UserDefined06] [float] NULL,
	[UserDefined07] [float] NULL,
	[UserDefined08] [float] NULL,
	[UserDefined09] [varchar](32) NULL,
	[UserDefined10] [varchar](32) NULL,
	[DifferentialPressureY] [float] NULL,
	[Kappa] [real] NULL,
	[Viscosity] [real] NULL,
	[HeatingValue] [real] NULL,
	[RelativeDensity] [real] NULL,
	[Methane] [float] NULL,
	[Nitrogen] [float] NULL,
	[CarbonDioxide] [float] NULL,
	[Ethane] [float] NULL,
	[Propane] [float] NULL,
	[Water] [float] NULL,
	[HydrogenSulfide] [float] NULL,
	[Hydrogen] [float] NULL,
	[CarbonMonoxide] [float] NULL,
	[Oxygen] [float] NULL,
	[iButane] [float] NULL,
	[nButane] [float] NULL,
	[iPentane] [float] NULL,
	[nPentane] [float] NULL,
	[Hexane] [float] NULL,
	[Heptane] [float] NULL,
	[Octane] [float] NULL,
	[Nonane] [float] NULL,
	[Decane] [float] NULL,
	[Helium] [float] NULL,
	[Argon] [float] NULL,
	[VolumeCorrelationFactor] [float] NULL,
	[CasingPressure] [float] NULL,
	[TubingPressure] [float] NULL,
	[LinePressure] [float] NULL,
	[DateTimeCreated] [datetime] NULL,
 CONSTRAINT [PK_PeriodicGasFlowRecords] PRIMARY KEY CLUSTERED 
(
	[MeterID] ASC,
	[TimeStamp] ASC,
	[Duration] ASC,
	[RecordIndex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PeriodicLiquidFlowRecords]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PeriodicLiquidFlowRecords](
	[MeterID] [int] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[Duration] [int] NOT NULL,
	[RecordIndex] [int] NOT NULL,
	[FlowTime] [int] NULL,
	[ObservedDensity] [float] NULL,
	[DensityTemperature] [float] NULL,
	[DensityPressure] [float] NULL,
	[UncorrectedDensity] [float] NULL,
	[MeterFlowingDensity] [float] NULL,
	[MeterTemperature] [float] NULL,
	[MeterPressure] [float] NULL,
	[IndicatedVolume] [float] NULL,
	[IndicatedVolumeIndexStart] [float] NULL,
	[IndicatedVolumeIndexEnd] [float] NULL,
	[GrossVolume] [float] NULL,
	[GrossVolumeIndexStart] [float] NULL,
	[GrossVolumeIndexEnd] [float] NULL,
	[GrossStandardVolume] [float] NULL,
	[GrossStandardVolumeIndexStart] [float] NULL,
	[GrossStandardVolumeIndexEnd] [float] NULL,
	[Mass] [float] NULL,
	[MassIndexStart] [float] NULL,
	[MassIndexEnd] [float] NULL,
	[UserDefined01] [float] NULL,
	[UserDefined02] [float] NULL,
	[UserDefined03] [float] NULL,
	[UserDefined04] [float] NULL,
	[UserDefined05] [float] NULL,
	[UserDefined06] [float] NULL,
	[UserDefined07] [float] NULL,
	[UserDefined08] [float] NULL,
	[UserDefined09] [varchar](255) NULL,
	[UserDefined010] [varchar](255) NULL,
	[RelativeDensity] [float] NULL,
	[APIDegrees] [float] NULL,
	[ProductName] [varchar](255) NULL,
	[FluidStandardID] [int] NULL,
	[FluidTypeID] [int] NULL,
	[TemperatureBaseUnitID] [int] NULL,
	[TemperatureBase] [float] NULL,
	[CompressibilityFactor] [float] NULL,
	[CompressibilityFactorUnitID] [int] NULL,
	[BaseDensityOverride] [float] NULL,
	[DensityUnitID] [int] NULL,
	[Alpha] [float] NULL,
	[AlphaUnitID] [int] NULL,
	[Evp] [float] NULL,
	[EvpUnitID] [int] NULL,
	[DensityCorrectionFactor] [float] NULL,
	[ProveDate] [datetime] NULL,
	[PycDate] [datetime] NULL,
	[CoriolisDriveGain] [float] NULL,
	[NetStandardVolume] [float] NULL,
	[NetStandardVolumeIndexStart] [float] NULL,
	[NetStandardVolumeIndexEnd] [float] NULL,
	[SedimentAndWaterVolume] [float] NULL,
	[SedimentAndWaterIndexStart] [float] NULL,
	[SedimentAndWaterIndexEnd] [float] NULL,
	[SedimentAndWaterPercent] [float] NULL,
	[SedimentAndWaterCorrection] [float] NULL,
	[DP] [float] NULL,
	[Extension] [float] NULL,
	[CPrime] [float] NULL,
	[PulseCount] [float] NULL,
	[PulseIndexStart] [float] NULL,
	[PulseIndexEnd] [float] NULL,
	[GasEquivalentVolume] [float] NULL,
	[GasEquivalentEnergy] [float] NULL,
	[DensityMeterFactor] [float] NULL,
	[MeterFactor] [float] NULL,
	[KFactor] [float] NULL,
	[EquilibriumVaporPressure] [float] NULL,
	[CTL] [float] NULL,
	[CPL] [float] NULL,
	[CTPL] [float] NULL,
	[CCF] [float] NULL,
	[Viscosity] [float] NULL,
	[Kappa] [float] NULL,
	[Nitrogen] [float] NULL,
	[CarbonDioxide] [float] NULL,
	[Ethane] [float] NULL,
	[Propane] [float] NULL,
	[Water] [float] NULL,
	[HydrogenSulfide] [float] NULL,
	[Hydrogen] [float] NULL,
	[CarbonMonoxide] [float] NULL,
	[Oxygen] [float] NULL,
	[iButane] [float] NULL,
	[nButane] [float] NULL,
	[iPentane] [float] NULL,
	[nPentane] [float] NULL,
	[Hexane] [float] NULL,
	[Heptane] [float] NULL,
	[Octane] [float] NULL,
	[Nonane] [float] NULL,
	[Decane] [float] NULL,
	[Helium] [float] NULL,
	[Argon] [float] NULL,
	[Ethylene] [real] NULL,
	[Propylene] [real] NULL,
	[Butylene] [real] NULL,
	[VolumeCorrelationFactor] [float] NULL,
	[CasingPressure] [float] NULL,
	[TubingPressure] [float] NULL,
	[LinePressure] [float] NULL,
	[DateTimeCreated] [datetime] NULL,
 CONSTRAINT [PK_PeriodicLiquidFlowRecords] PRIMARY KEY CLUSTERED 
(
	[MeterID] ASC,
	[TimeStamp] ASC,
	[Duration] ASC,
	[RecordIndex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PowerSources]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PowerSources](
	[ID] [int] NOT NULL,
	[Code] [varchar](1) NOT NULL,
	[Name] [varchar](32) NOT NULL,
 CONSTRAINT [PK_PowerSources] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTypes](
	[ID] [int] NOT NULL,
	[Code] [varchar](64) NOT NULL,
	[Name] [varchar](128) NOT NULL,
 CONSTRAINT [PK_ProductTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PulseTypes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PulseTypes](
	[ID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_PulseTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PumpDailyTransactions]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PumpDailyTransactions](
	[PumpID] [int] NOT NULL,
	[TimeStamp] [date] NOT NULL,
	[StrokesPerMinute] [decimal](38, 12) NULL,
	[RPM] [decimal](38, 12) NULL,
	[HoursOn] [decimal](38, 12) NULL,
	[DateTimeCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_PumpDailyTransactions] PRIMARY KEY CLUSTERED 
(
	[PumpID] ASC,
	[TimeStamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pumps]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pumps](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HierarchyID] [int] NOT NULL,
	[PumpTypeID] [int] NOT NULL,
	[StrokeRpmFactor] [float] NOT NULL,
	[Name] [varchar](32) NOT NULL,
	[DateTimeCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Pumps] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PumpTypes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PumpTypes](
	[ID] [int] NOT NULL,
	[Name] [varchar](32) NOT NULL,
 CONSTRAINT [PK_PumpTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReferenceEquations]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReferenceEquations](
	[ID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_ReferenceEquations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](32) NOT NULL,
	[Description] [varchar](64) NOT NULL,
	[ManageAccounts] [bit] NOT NULL,
	[ManageTags] [bit] NOT NULL,
	[ManageAlarms] [bit] NOT NULL,
	[ManageHistoricalData] [bit] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RunSheetDailyLogEntries]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RunSheetDailyLogEntries](
	[RunSheetID] [int] NOT NULL,
	[TimeStamp] [date] NOT NULL,
	[HierarchyID] [int] NOT NULL,
	[NodeTypeDailyLogPropertyID] [int] NOT NULL,
	[Value] [sql_variant] NULL,
	[UserID] [int] NOT NULL,
	[DateTimeCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_RunSheetDailyLogEntries] PRIMARY KEY CLUSTERED 
(
	[RunSheetID] ASC,
	[TimeStamp] ASC,
	[HierarchyID] ASC,
	[NodeTypeDailyLogPropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RunSheetDailyLogs]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RunSheetDailyLogs](
	[RunSheetID] [int] NOT NULL,
	[TimeStamp] [date] NOT NULL,
	[DateTimeCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_RunSheetDailyLogs] PRIMARY KEY CLUSTERED 
(
	[RunSheetID] ASC,
	[TimeStamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RunSheetItemCapturePoints]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RunSheetItemCapturePoints](
	[RunSheetID] [int] NOT NULL,
	[HierarchyID] [int] NOT NULL,
	[NodeTypeDailyLogPropertyID] [int] NOT NULL,
	[Ordinal] [int] NULL,
 CONSTRAINT [PK_RunSheetItemCapturePoints] PRIMARY KEY CLUSTERED 
(
	[RunSheetID] ASC,
	[HierarchyID] ASC,
	[NodeTypeDailyLogPropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RunSheetItems]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RunSheetItems](
	[RunSheetID] [int] NOT NULL,
	[HierarchyID] [int] NOT NULL,
	[Ordinal] [int] NOT NULL,
 CONSTRAINT [PK_RunSheetItems] PRIMARY KEY CLUSTERED 
(
	[RunSheetID] ASC,
	[HierarchyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RunSheets]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RunSheets](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HierarchyID] [int] NOT NULL,
	[DateTimeCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_RunSheets] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RunSheetUsers]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RunSheetUsers](
	[RunSheetID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_RunSheetUsers] PRIMARY KEY CLUSTERED 
(
	[RunSheetID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SampleTypes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SampleTypes](
	[ID] [int] NOT NULL,
	[Code] [varchar](1) NOT NULL,
	[Name] [varchar](32) NOT NULL,
 CONSTRAINT [PK_SampleTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SaturationConditions]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaturationConditions](
	[ID] [int] NOT NULL,
	[Code] [varchar](1) NULL,
	[Name] [varchar](32) NULL,
 CONSTRAINT [PK_SaturationConditions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Screens]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Screens](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HierarchyID] [int] NULL,
	[ScreenXml] [xml] NULL,
	[DateTimeCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Screens] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SerialPortChannels]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SerialPortChannels](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HierarchyID] [int] NOT NULL,
	[Name] [varchar](255) NULL,
	[PortName] [varchar](255) NULL,
	[BaudRate] [int] NULL,
	[DataBits] [int] NULL,
	[Parity] [int] NULL,
	[StopBits] [int] NULL,
	[ReadTimeout] [int] NULL,
	[WriteTimeout] [int] NULL,
	[SerialChannelDisabled] [bit] NULL,
 CONSTRAINT [PK_SerialPortChannels] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SignalTypes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SignalTypes](
	[ID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_SignalTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StaticPressureMeasurements]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaticPressureMeasurements](
	[ID] [int] NOT NULL,
	[Code] [varchar](1) NOT NULL,
	[Name] [varchar](32) NOT NULL,
 CONSTRAINT [PK_StaticPressureMeasurements] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StaticTapTypes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaticTapTypes](
	[ID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_StaticTapTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StringIoTags]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StringIoTags](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HierarchyID] [int] NOT NULL,
	[ReadAddress] [varchar](255) NULL,
	[ReadAddressScanInterval] [int] NULL,
	[Length] [int] NULL,
	[PaddingCharacter] [varchar](1) NULL,
	[WriteAddress] [varchar](255) NULL,
	[DateTimeCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_StringIoTags] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StringTagValueHistory]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StringTagValueHistory](
	[StringTagID] [int] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[Value] [varchar](255) NULL,
	[DateTimeCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_StringTagValueHistory] PRIMARY KEY CLUSTERED 
(
	[StringTagID] ASC,
	[TimeStamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagValueEnumerationConstants]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagValueEnumerationConstants](
	[TagValueEnumerationID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Value] [int] NOT NULL,
	[Description] [varchar](255) NULL,
	[DateTimeCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_TagValueEnumerationConstants] PRIMARY KEY CLUSTERED 
(
	[TagValueEnumerationID] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagValueEnumerations]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagValueEnumerations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Description] [varchar](255) NULL,
	[DateTimeCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_TagValueEnumerations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TankDailyTransactions]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TankDailyTransactions](
	[TankID] [int] NOT NULL,
	[TimeStamp] [date] NOT NULL,
	[TankLevel] [decimal](38, 12) NULL,
	[TankVolume] [decimal](38, 12) NULL,
	[TankTemperature] [decimal](38, 12) NULL,
	[DateTimeCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_TankDailyTransactions] PRIMARY KEY CLUSTERED 
(
	[TankID] ASC,
	[TimeStamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tanks]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tanks](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HierarchyID] [int] NOT NULL,
	[TankTypeID] [int] NOT NULL,
	[TankHeight] [float] NOT NULL,
	[TankVolume] [float] NOT NULL,
	[TankFactor] [float] NOT NULL,
	[DateTimeCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Tanks] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TankTypes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TankTypes](
	[ID] [int] NOT NULL,
	[Name] [varchar](64) NOT NULL,
 CONSTRAINT [PK_TankTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TapTypes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TapTypes](
	[ID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_TapTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketComponentBases]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketComponentBases](
	[ID] [int] NOT NULL,
	[Code] [varchar](1) NOT NULL,
	[Name] [varchar](32) NOT NULL,
 CONSTRAINT [PK_TicketComponentBases] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketDeviceTypes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketDeviceTypes](
	[ID] [int] NOT NULL,
	[Code] [varchar](1) NOT NULL,
	[Name] [varchar](32) NOT NULL,
	[Description] [varchar](64) NULL,
 CONSTRAINT [PK_TicketDeviceTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketMeterCalculationMethods]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketMeterCalculationMethods](
	[ID] [int] NOT NULL,
	[Code] [varchar](1) NOT NULL,
	[Name] [varchar](32) NOT NULL,
 CONSTRAINT [PK_TicketMeterCalculationMethods] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketMeterRecords]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketMeterRecords](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MeterStandardID] [int] NULL,
	[TicketMeterCalculationMethodID] [int] NULL,
	[ObservedDensityCorrectedDensity] [float] NULL,
	[DensityTemperature] [float] NULL,
	[DensityPressure] [float] NULL,
	[DensityMeterFactor] [float] NULL,
	[UncorrectedDensity] [float] NULL,
	[MeterFlowingDensity] [float] NULL,
	[MeterTemperature] [float] NULL,
	[MeterPressure] [float] NULL,
	[MeterFactor] [float] NULL,
	[KFactor] [float] NULL,
	[EquilibriumVaporPressure] [float] NULL,
	[Ctl] [float] NULL,
	[Cpl] [float] NULL,
	[Ctpl] [float] NULL,
	[Ccf] [float] NULL,
	[Dp] [float] NULL,
	[PulseCount] [float] NULL,
	[OpeningPulseIndex] [float] NULL,
	[ClosingPulseIndex] [float] NULL,
	[IndicatedVolume] [float] NULL,
	[OpeningIVIndex] [float] NULL,
	[ClosingIVIndex] [float] NULL,
	[GrossVolume] [float] NULL,
	[OpeningGVIndex] [float] NULL,
	[ClosingGVIndex] [float] NULL,
	[GrossStdVolume] [float] NULL,
	[OpeningGsvIndex] [float] NULL,
	[ClosingGsvIndex] [float] NULL,
	[NetStdVolume] [float] NULL,
	[OpeningNsvIndex] [float] NULL,
	[ClosingNsvIndex] [float] NULL,
	[SwVolume] [float] NULL,
	[OpeningSWIndex] [float] NULL,
	[ClosingSWIndex] [float] NULL,
	[SwPercent] [float] NULL,
	[SwCorrection] [float] NULL,
	[Mass] [float] NULL,
	[OpeningMassIndex] [float] NULL,
	[ClosingMassIndex] [float] NULL,
	[TotalizerDigits] [float] NULL,
	[FixedFactor] [float] NULL,
	[DensityUnitID] [int] NULL,
	[TemperatureUnitID] [int] NULL,
	[PressureUnitID] [int] NULL,
	[VolumeKFactorUnitID] [int] NULL,
	[MassKFactorUnitID] [int] NULL,
	[VolumeUnitID] [int] NULL,
	[MassUnitID] [int] NULL,
	[DifferentialPressureUnitID] [int] NULL,
	[PipeReferenceTemperatureUnitID] [int] NULL,
	[BoreReferenceTemperatureUnitID] [int] NULL,
	[BoreDiameterUnit] [int] NULL,
	[PipeDiameterUnit] [int] NULL,
	[PipeLengthUnit] [int] NULL,
	[AtmosphericPressureUnit] [int] NULL,
	[StaticPressureMeasurementID] [int] NULL,
	[AtmosphericPressure] [float] NULL,
	[PipeDiameter] [float] NULL,
	[PipeRefTemp] [float] NULL,
	[PipeMaterialID] [int] NULL,
	[BoreDiameter] [float] NULL,
	[PlateReferenceTemp] [float] NULL,
	[BoreMaterialID] [int] NULL,
	[TapTypeID] [int] NULL,
	[StaticTapTypeID] [int] NULL,
	[ExtensionDefinitionID] [int] NULL,
	[FlowingPressureEnabled] [bit] NULL,
	[FlowingPressureEffect] [float] NULL,
	[CalibrationPressure] [float] NULL,
	[PressureCompensated] [bit] NULL,
	[TemperatureCompensated] [bit] NULL,
	[PipeLength] [float] NULL,
	[MeterID] [varchar](255) NULL,
	[TicketID] [int] NOT NULL,
	[DateTimeCreated] [datetime] NULL,
 CONSTRAINT [PK_TicketMeterRecords] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OriginFacilityID] [int] NULL,
	[DestinationFacilityID] [int] NULL,
	[TimeStamp] [datetime] NULL,
	[SequenceNumber] [int] NULL,
	[TicketDeviceTypeID] [int] NULL,
	[DeviceNumber] [varchar](255) NULL,
	[TicketTypeID] [int] NULL,
	[Origin] [varchar](255) NULL,
	[Destination] [varchar](255) NULL,
	[Shipper] [varchar](255) NULL,
	[Transporter] [varchar](255) NULL,
	[TicketTransportMethodID] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[ProductName] [varchar](255) NULL,
	[FluidStandardID] [int] NULL,
	[FluidTypeID] [int] NULL,
	[TemperatureBaseUnitID] [int] NULL,
	[TemperatureBase] [float] NULL,
	[CompressibilityFactor] [float] NULL,
	[CompressibilityFactorUnitID] [int] NULL,
	[BaseDensityOverride] [float] NULL,
	[DensityUnitID] [int] NULL,
	[Alpha] [float] NULL,
	[AlphaUnitID] [int] NULL,
	[Evp] [float] NULL,
	[EvpUnitID] [int] NULL,
	[KFactor] [float] NULL,
	[MeterFactor] [float] NULL,
	[DensityCorrectionFactor] [float] NULL,
	[ProveDate] [datetime] NULL,
	[PycDate] [datetime] NULL,
	[SampleID] [varchar](255) NULL,
	[BatchNumber] [varchar](255) NULL,
	[VehicleID] [varchar](255) NULL,
	[ManifestID] [varchar](255) NULL,
	[Seal1Off] [varchar](255) NULL,
	[Seal1On] [varchar](255) NULL,
	[Seal2Off] [varchar](255) NULL,
	[Seal2On] [varchar](255) NULL,
	[Direction] [varchar](255) NULL,
	[Class] [varchar](255) NULL,
	[CustomerName] [varchar](255) NULL,
	[DriverID] [varchar](255) NULL,
	[TrailerNumber] [varchar](255) NULL,
	[SecondTrailerNumber] [varchar](255) NULL,
	[Odorized] [bit] NULL,
	[ReadOnly] [bit] NULL,
	[TicketComponentBasisID] [int] NULL,
	[Methane] [float] NOT NULL,
	[Nitrogen] [float] NOT NULL,
	[CarbonDioxide] [float] NOT NULL,
	[Ethane] [float] NOT NULL,
	[Propane] [float] NOT NULL,
	[Water] [float] NOT NULL,
	[HydrogenSulfide] [float] NOT NULL,
	[Hydrogen] [float] NOT NULL,
	[CarbonMonoxide] [float] NOT NULL,
	[Oxygen] [float] NOT NULL,
	[iButane] [float] NOT NULL,
	[nButane] [float] NOT NULL,
	[iPentane] [float] NOT NULL,
	[nPentane] [float] NOT NULL,
	[Hexane] [float] NOT NULL,
	[Heptane] [float] NOT NULL,
	[Octane] [float] NOT NULL,
	[Nonane] [float] NOT NULL,
	[Decane] [float] NOT NULL,
	[Helium] [float] NOT NULL,
	[Argon] [float] NOT NULL,
	[Viscosity] [float] NULL,
	[Kappa] [float] NULL,
	[ReidVaporPressure] [float] NULL,
	[OdorantAmount] [float] NULL,
	[OdorantUnitID] [int] NULL,
	[ViscosityUnitID] [int] NULL,
	[DateTimeCreated] [datetime] NULL,
 CONSTRAINT [PK_Tickets] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketScaleRecords]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketScaleRecords](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GrossWeight] [float] NULL,
	[TareWeight] [float] NULL,
	[NetWeight] [float] NULL,
	[WeightIn] [float] NULL,
	[InScaleID] [varchar](255) NULL,
	[WeightOut] [float] NULL,
	[OutScaleID] [varchar](255) NULL,
	[ObservedDensity] [float] NULL,
	[ObsDensityTemperature] [float] NULL,
	[NetStandardVolume] [float] NULL,
	[GrossStandardVolume] [float] NULL,
	[SedimentWaterPercent] [float] NULL,
	[WeightUnitID] [int] NULL,
	[DensityUnitID] [int] NULL,
	[TemperatureUnitID] [int] NULL,
	[StandardVolumeUnit] [int] NULL,
	[TicketID] [int] NOT NULL,
 CONSTRAINT [PK_TicketScaleRecords] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketTankCalculationStandards]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketTankCalculationStandards](
	[ID] [int] NOT NULL,
	[Code] [varchar](1) NOT NULL,
	[Name] [varchar](32) NOT NULL,
 CONSTRAINT [PK_TicketTankCalculationStandards] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketTankCustodyTransferCalculationMethods]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketTankCustodyTransferCalculationMethods](
	[ID] [int] NOT NULL,
	[Name] [varchar](64) NOT NULL,
 CONSTRAINT [PK_TicketTankCustodyTransferCalculationMethods] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketTankLevelTypes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketTankLevelTypes](
	[ID] [int] NOT NULL,
	[Name] [varchar](96) NOT NULL,
 CONSTRAINT [PK_TicketTankLevelTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketTankRecords]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketTankRecords](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TicketTankTypeID] [int] NULL,
	[TicketTankCalculationStandardID] [int] NULL,
	[TicketTankLevelTypeID] [int] NULL,
	[TankIsInsulated] [bit] NULL,
	[TicketTankShellMaterialID] [int] NULL,
	[TicketTankCustodyTransferCalculationMethodID] [int] NULL,
	[OpeningLiquidLevel] [float] NULL,
	[OpeningFreeWaterLevel] [float] NULL,
	[VesselForwardDraft] [float] NULL,
	[VesselAfterDraft] [float] NULL,
	[VesselTrim] [float] NULL,
	[VesselList] [float] NULL,
	[LiquidTemperature] [float] NULL,
	[AmbientTemperature] [float] NULL,
	[ShellTemperature] [float] NULL,
	[TankPressure] [float] NULL,
	[ObservedDensity] [float] NULL,
	[ObsDensityTemperature] [float] NULL,
	[ObsDensityPressure] [float] NULL,
	[OpeningTotalObservedVolume] [float] NULL,
	[OpeningTotalFreeWater] [float] NULL,
	[GasDensity] [float] NULL,
	[FloatingRoofAdjustment] [float] NULL,
	[ShellTemperatureCorrection] [float] NULL,
	[OpeningGrossObserved] [float] NULL,
	[LiquidTempCorrection] [float] NULL,
	[OpeningGrossStandard] [float] NULL,
	[OpeningSWPercent] [float] NULL,
	[OpeningSWCorrection] [float] NULL,
	[OpeningNetStandardVolume] [float] NULL,
	[OpeningSedimentWaterVolume] [float] NULL,
	[OpeningWeightConversionFactor] [float] NULL,
	[OpeningNetStandardWeight] [float] NULL,
	[OpeningLiquidMass] [float] NULL,
	[ClosingOrCurrentLiquidLevel] [float] NULL,
	[ClosingOrCurrentFreeWaterLevel] [float] NULL,
	[ClosingVesselForwardDraft] [float] NULL,
	[ClosingVesselAfterDraft] [float] NULL,
	[ClosingVesselTrim] [float] NULL,
	[ClosingVesselList] [float] NULL,
	[ClosingLiquidTemperature] [float] NULL,
	[ClosingAmbientTemperature] [float] NULL,
	[ClosingShellTemperature] [float] NULL,
	[ClosingTankPressure] [float] NULL,
	[ClosingObservedDensity] [float] NULL,
	[ClosingObsDensityTemperature] [float] NULL,
	[ClosingObsDensityPressure] [float] NULL,
	[ClosingOrCurrentTotalObservedVolume] [float] NULL,
	[ClosingTotalFreeWater] [float] NULL,
	[ClosingGasDensity] [float] NULL,
	[ClosingFloatingRoofAdjustment] [float] NULL,
	[TankShellTemperatureCorrection] [float] NULL,
	[ClosingGrossObservedVolume] [float] NULL,
	[ClosingLiquidTempCorrection] [float] NULL,
	[ClosingGrossStandardVolume] [float] NULL,
	[ClosingAndCurrentSWPercent] [float] NULL,
	[ClosingAndCurrentSWCorrection] [float] NULL,
	[ClosingNetStandardVolume] [float] NULL,
	[ClosingSedimentAndWater] [float] NULL,
	[ClosingWeightConversionFactor] [float] NULL,
	[ClosingNetStandardWeight] [float] NULL,
	[ClosingLiquidMass] [float] NULL,
	[TotalObservedVolume] [float] NULL,
	[GrossObservedVolume] [float] NULL,
	[GrossStandardVolume] [float] NULL,
	[SwPercent] [float] NULL,
	[SwCorrection] [float] NULL,
	[NetStandardVolume] [float] NULL,
	[SedimentAndWaterVolume] [float] NULL,
	[WeightConversionFactor] [float] NULL,
	[NetStandardWeight] [float] NULL,
	[LiquidMass] [float] NULL,
	[LevelUnitID] [int] NULL,
	[VesselDraftUnitID] [int] NULL,
	[TemperatureUnitID] [int] NULL,
	[BaseTemperatureUnitID] [int] NULL,
	[PressureUnitID] [int] NULL,
	[LiquidDensityUnitID] [int] NULL,
	[ObservedVolumeUnitID] [int] NULL,
	[StandardVolumeUnitID] [int] NULL,
	[MassUnitID] [int] NULL,
	[TicketID] [int] NOT NULL,
	[DateTimeCreated] [datetime] NULL,
 CONSTRAINT [PK_TicketTankRecords_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketTankShellMaterials]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketTankShellMaterials](
	[ID] [int] NOT NULL,
	[Code] [varchar](1) NOT NULL,
	[Name] [varchar](32) NOT NULL,
 CONSTRAINT [PK_TicketTankShellMaterials] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketTransportMethods]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketTransportMethods](
	[ID] [int] NOT NULL,
	[Code] [varchar](1) NOT NULL,
	[Name] [varchar](32) NOT NULL,
	[Description] [varchar](64) NULL,
 CONSTRAINT [PK_TicketTransportMethods] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketTypes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NULL,
 CONSTRAINT [PK_TicketTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TurbineRotorModes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TurbineRotorModes](
	[ID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_TurbineRotorModes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UltrasonicDiagnosticHistory]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UltrasonicDiagnosticHistory](
	[MeterID] [int] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[Pressure] [float] NULL,
	[Temperature] [float] NULL,
	[SpeedOfSound] [float] NULL,
	[SpeedOfSoundPath1] [float] NULL,
	[SpeedOfSoundPath2] [float] NULL,
	[SpeedOfSoundPath3] [float] NULL,
	[SpeedOfSoundPath4] [float] NULL,
	[SpeedOfSoundPath5] [float] NULL,
	[SpeedOfSoundPath6] [float] NULL,
	[GainPath1a] [float] NULL,
	[GainPath1b] [float] NULL,
	[GainPath2a] [float] NULL,
	[GainPath2b] [float] NULL,
	[GainPath3a] [float] NULL,
	[GainPath3b] [float] NULL,
	[GainPath4a] [float] NULL,
	[GainPath4b] [float] NULL,
	[GainPath5a] [float] NULL,
	[GainPath5b] [float] NULL,
	[GainPath6a] [float] NULL,
	[GainPath6b] [float] NULL,
	[FlowVelocity] [float] NULL,
	[FlowVelocityPath1] [float] NULL,
	[FlowVelocityPath2] [float] NULL,
	[FlowVelocityPath3] [float] NULL,
	[FlowVelocityPath4] [float] NULL,
	[FlowVelocityPath5] [float] NULL,
	[FlowVelocityPath6] [float] NULL,
	[StandardDeviationOfFlowVelocity1] [float] NULL,
	[StandardDeviationOfFlowVelocity2] [float] NULL,
	[StandardDeviationOfFlowVelocity3] [float] NULL,
	[StandardDeviationOfFlowVelocity4] [float] NULL,
	[StandardDeviationOfFlowVelocity5] [float] NULL,
	[StandardDeviationOfFlowVelocity6] [float] NULL,
	[StandardDeviationOfSpeedOfSound1] [float] NULL,
	[StandardDeviationOfSpeedOfSound2] [float] NULL,
	[StandardDeviationOfSpeedOfSound3] [float] NULL,
	[StandardDeviationOfSpeedOfSound4] [float] NULL,
	[StandardDeviationOfSpeedOfSound5] [float] NULL,
	[StandardDeviationOfSpeedOfSound6] [float] NULL,
 CONSTRAINT [PK_UltrasonicDiagnosticHistory] PRIMARY KEY CLUSTERED 
(
	[MeterID] ASC,
	[TimeStamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnitClasses]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitClasses](
	[ID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_UnitClasses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnitFormulaTypes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitFormulaTypes](
	[ID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_UnitFormulaTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Units]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Units](
	[ID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Symbol] [varchar](32) NOT NULL,
	[ConvertFrom] [varchar](255) NOT NULL,
	[ConvertTo] [varchar](255) NULL,
	[BaseUnitID] [int] NULL,
	[FormulaTypeID] [int] NOT NULL,
	[UnitClassID] [int] NOT NULL,
 CONSTRAINT [PK_Units] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnitSets]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitSets](
	[ID] [int] NOT NULL,
	[Name] [varchar](64) NOT NULL,
	[SystemDefaultUnitID] [int] NULL,
 CONSTRAINT [PK_UnitSets] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnitSetUnits]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitSetUnits](
	[UnitSetID] [int] NOT NULL,
	[UnitID] [int] NOT NULL,
 CONSTRAINT [PK_UnitSetUnits] PRIMARY KEY CLUSTERED 
(
	[UnitSetID] ASC,
	[UnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](255) NOT NULL,
	[FullName] [varchar](255) NOT NULL,
	[AccountDisabled] [bit] NOT NULL,
	[IsSystemAdministrator] [bit] NOT NULL,
	[DateTimeCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vessels]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vessels](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HierarchyID] [int] NOT NULL,
	[VesselTypeID] [int] NOT NULL,
	[VesselHeight] [float] NOT NULL,
	[VesselVolume] [float] NOT NULL,
	[VesselFactor] [float] NOT NULL,
	[DateTimeCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Vessels] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VesselTypes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VesselTypes](
	[ID] [int] NOT NULL,
	[Name] [varchar](64) NULL,
 CONSTRAINT [PK_VesselTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ViscosityEquations]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ViscosityEquations](
	[ID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_ViscosityEquations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VolumetricHeatingValueUnits]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VolumetricHeatingValueUnits](
	[ID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Symbol] [varchar](32) NOT NULL,
	[VolumeUnitID] [int] NOT NULL,
	[EnergyUnitID] [int] NOT NULL,
 CONSTRAINT [PK_VolumetricHeatingValueUnits] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WasteCodes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WasteCodes](
	[ID] [int] NOT NULL,
	[Code] [varchar](128) NOT NULL,
	[Description] [varchar](256) NOT NULL,
 CONSTRAINT [PK_WasteCodes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WasteLocationTypes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WasteLocationTypes](
	[ID] [int] NOT NULL,
	[IsReciever] [bit] NOT NULL,
	[Name] [varchar](128) NOT NULL,
 CONSTRAINT [PK_WasteLocationTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WastePlantDailyActivity]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WastePlantDailyActivity](
	[FacilityID] [int] NOT NULL,
	[ProductionDate] [date] NOT NULL,
	[ActivityFacilityID] [int] NOT NULL,
	[ActivityWellID] [int] NOT NULL,
	[FacilityActivityTypeID] [int] NOT NULL,
	[WasteCodeID] [int] NOT NULL,
	[IsDangerousWaste] [bit] NULL,
	[OilVolume] [float] NULL,
	[WaterVolume] [float] NULL,
	[SolidsVolume] [float] NULL,
	[GasVolume] [float] NULL,
 CONSTRAINT [PK_WastePlantDailyActivity] PRIMARY KEY CLUSTERED 
(
	[FacilityID] ASC,
	[ProductionDate] ASC,
	[ActivityFacilityID] ASC,
	[ActivityWellID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WastePlantMonthlyActivity]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WastePlantMonthlyActivity](
	[FacilityID] [int] NOT NULL,
	[ProductionDate] [date] NOT NULL,
	[ActivityFacilityID] [int] NOT NULL,
	[ActivityWellID] [int] NOT NULL,
	[FacilityActivityTypeID] [int] NOT NULL,
	[WasteCodeID] [int] NOT NULL,
	[RecordVersion] [int] NOT NULL,
	[SystemTimeStamp] [datetime2](7) NOT NULL,
	[IsDangerousWaste] [bit] NULL,
	[OilVolume] [decimal](38, 12) SPARSE  NULL,
	[WaterVolume] [decimal](38, 12) SPARSE  NULL,
	[SolidsVolume] [decimal](38, 12) SPARSE  NULL,
	[GasVolume] [decimal](38, 12) SPARSE  NULL,
 CONSTRAINT [PK_WastePlantMonthlyActivity] PRIMARY KEY CLUSTERED 
(
	[FacilityID] ASC,
	[ProductionDate] ASC,
	[ActivityFacilityID] ASC,
	[ActivityWellID] ASC,
	[FacilityActivityTypeID] ASC,
	[WasteCodeID] ASC,
	[RecordVersion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WaterRegions]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WaterRegions](
	[ID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_WaterRegions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WellComminglingProcesses]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WellComminglingProcesses](
	[ID] [int] NOT NULL,
	[Code] [varchar](128) NOT NULL,
	[Name] [varchar](128) NOT NULL,
 CONSTRAINT [PK_WellComminglingProcesses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WellComminglingStatuses]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WellComminglingStatuses](
	[CommingledWellID] [int] NOT NULL,
	[TimeStamp] [date] NOT NULL,
	[WellComminglingProcessID] [int] NOT NULL,
	[ProductionWellID] [int] NOT NULL,
	[DateTimeCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_WellComminglingStatuses_1] PRIMARY KEY CLUSTERED 
(
	[CommingledWellID] ASC,
	[TimeStamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WellDailyProduction]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WellDailyProduction](
	[WellID] [int] NOT NULL,
	[ProductionDate] [date] NOT NULL,
	[ProductTypeID] [int] NOT NULL,
	[WellStatusTypeID] [int] NOT NULL,
	[RecordVersion] [int] NOT NULL,
	[HoursOn] [decimal](38, 12) NOT NULL,
	[Volume] [decimal](38, 12) NOT NULL,
	[Energy] [decimal](38, 12) NOT NULL,
	[CciCode] [int] NULL,
	[DateTimeCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_WellDailyProduction] PRIMARY KEY CLUSTERED 
(
	[WellID] ASC,
	[ProductionDate] ASC,
	[ProductTypeID] ASC,
	[WellStatusTypeID] ASC,
	[RecordVersion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WellFluids]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WellFluids](
	[ID] [int] NOT NULL,
	[Code] [varchar](128) NOT NULL,
	[Name] [varchar](128) NOT NULL,
 CONSTRAINT [PK_WellFluids] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WellModes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WellModes](
	[ID] [int] NOT NULL,
	[Code] [varchar](128) NOT NULL,
	[Name] [varchar](128) NOT NULL,
 CONSTRAINT [PK_WellModes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WellMonthlyProduction]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WellMonthlyProduction](
	[WellID] [int] NOT NULL,
	[ProductionDate] [date] NOT NULL,
	[ProductTypeID] [int] NOT NULL,
	[WellStatusTypeID] [int] NOT NULL,
	[HoursOn] [decimal](38, 12) NOT NULL,
	[Volume] [decimal](38, 12) NOT NULL,
	[Energy] [decimal](38, 12) SPARSE  NULL,
	[CciCode] [int] SPARSE  NULL,
	[DateTimeCreated] [datetime] NULL,
 CONSTRAINT [PK_WellMonthlyProduction] PRIMARY KEY CLUSTERED 
(
	[WellID] ASC,
	[ProductionDate] ASC,
	[ProductTypeID] ASC,
	[WellStatusTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wells]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wells](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HierarchyID] [int] NOT NULL,
	[FormattedUwi] [varchar](128) NULL,
	[UnformattedUwi] [varchar](128) NULL,
	[SurfaceLocation] [varchar](128) NULL,
	[DownholeLocation] [varchar](128) NULL,
	[FieldCode] [varchar](128) NULL,
	[PoolCode] [varchar](128) NULL,
	[LicenseNumber] [varchar](128) NULL,
	[LicenseeCode] [varchar](128) NULL,
	[AgentCode] [varchar](128) NULL,
	[OperatorCode] [varchar](128) NULL,
	[DateTimeCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Wells] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WellStatuses]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WellStatuses](
	[WellID] [int] NOT NULL,
	[TimeStamp] [date] NOT NULL,
	[RecordVersion] [int] NOT NULL,
	[WellFluidID] [int] NOT NULL,
	[WellModeID] [int] NOT NULL,
	[WellTypeID] [int] NOT NULL,
	[WellStructureID] [int] NOT NULL,
	[PrimaryLinkedFacilityID] [int] NULL,
	[SecondaryLinkedFacilityID] [int] NULL,
	[DateTimeCreated] [datetime] NULL,
 CONSTRAINT [PK_WellStatuses] PRIMARY KEY CLUSTERED 
(
	[WellID] ASC,
	[TimeStamp] ASC,
	[RecordVersion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WellStatusTypes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WellStatusTypes](
	[ID] [int] NOT NULL,
	[Code] [varchar](64) NOT NULL,
	[Name] [varchar](128) NOT NULL,
 CONSTRAINT [PK_WellStatusTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WellStructures]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WellStructures](
	[ID] [int] NOT NULL,
	[Code] [varchar](128) NOT NULL,
	[Name] [varchar](128) NOT NULL,
 CONSTRAINT [PK_WellStructures] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WellTests]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WellTests](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WellID] [int] NULL,
	[SatelliteFlowRunID] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Duration] [int] NULL,
	[TestNumber] [varchar](64) NULL,
	[TestedBy] [varchar](64) NULL,
	[HoursOn] [int] NULL,
	[TotalGas] [decimal](38, 12) NULL,
	[TotalOil] [decimal](38, 12) NULL,
	[TotalWater] [decimal](38, 12) NULL,
	[WaterCut] [decimal](38, 12) NULL,
	[AverageCasingPressure] [decimal](38, 12) NULL,
	[AverageTubingPressure] [decimal](38, 12) NULL,
	[AverageLinePressure] [decimal](38, 12) NULL,
	[Notes] [varchar](1024) NULL,
	[DateTimeCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_WellTests] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WellTypes]    Script Date: 2024-09-30 11:44:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WellTypes](
	[ID] [int] NOT NULL,
	[Code] [varchar](128) NOT NULL,
	[Name] [varchar](128) NOT NULL,
 CONSTRAINT [PK_WellTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AlarmPriorities] ([ID], [Name]) VALUES (0, N'None')
GO
INSERT [dbo].[AlarmPriorities] ([ID], [Name]) VALUES (1, N'Event')
GO
INSERT [dbo].[AlarmPriorities] ([ID], [Name]) VALUES (2, N'Critical Alarm')
GO
INSERT [dbo].[AlarmPriorities] ([ID], [Name]) VALUES (3, N'High Alarm')
GO
INSERT [dbo].[AlarmPriorities] ([ID], [Name]) VALUES (4, N'Warning Alarm')
GO
INSERT [dbo].[AlarmPriorities] ([ID], [Name]) VALUES (5, N'Notice Alarm')
GO
INSERT [dbo].[AlarmStatuses] ([ID], [Name]) VALUES (1, N'Alarm')
GO
INSERT [dbo].[AlarmStatuses] ([ID], [Name]) VALUES (2, N'Normal')
GO
INSERT [dbo].[AlarmStatuses] ([ID], [Name]) VALUES (3, N'Shelved')
GO
INSERT [dbo].[AlarmStatuses] ([ID], [Name]) VALUES (4, N'Disabled')
GO
INSERT [dbo].[AlarmTypes] ([ID], [Name]) VALUES (1, N'Alarm')
GO
INSERT [dbo].[AlarmTypes] ([ID], [Name]) VALUES (2, N'High High Alarm')
GO
INSERT [dbo].[AlarmTypes] ([ID], [Name]) VALUES (3, N'High Alarm')
GO
INSERT [dbo].[AlarmTypes] ([ID], [Name]) VALUES (4, N'Low Alarm')
GO
INSERT [dbo].[AlarmTypes] ([ID], [Name]) VALUES (5, N'Low Low Alarm')
GO
INSERT [dbo].[AlphaUnits] ([ID], [Code], [Name]) VALUES (1, N'F', N'1/Deg F')
GO
INSERT [dbo].[AlphaUnits] ([ID], [Code], [Name]) VALUES (2, N'C', N'1/Deg C')
GO
SET IDENTITY_INSERT [dbo].[AnalogIoTags] ON 
GO
INSERT [dbo].[AnalogIoTags] ([ID], [HierarchyID], [ByteSwap], [WordSwap], [Deadband], [ReadAddress], [ReadAddressScanInterval], [HistoryAddress], [HistoryAddressScanInterval], [WriteAddress], [IsCalculated], [Script], [UnscaledMinimum], [UnscaledMaximum], [ScaledMinimum], [ScaledMaximum], [ClampScaledValue], [EnableLogging], [HighHighAlarmPriorityID], [HighHighAlarmDelay], [HighHighAlarmSetpoint], [HighHighAlarmDeadband], [HighHighAlarmDisable], [HighAlarmPriorityID], [HighAlarmDelay], [HighAlarmSetpoint], [HighAlarmDeadband], [HighAlarmDisable], [LowAlarmPriorityID], [LowAlarmDelay], [LowAlarmSetpoint], [LowAlarmDeadband], [LowAlarmDisable], [LowLowAlarmPriorityID], [LowLowAlarmDelay], [LowLowAlarmSetpoint], [LowLowAlarmDeadband], [LowLowAlarmDisable], [DisplayOrder], [NumberOfDigitsAfterDecimal], [UnitID], [TagValueEnumerationID], [IsBadQuality], [ManualData], [Value], [DateTimeCreated]) VALUES (1, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-09-30T16:25:01.793' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[AnalogIoTags] OFF
GO
INSERT [dbo].[BatchTypes] ([ID], [Name]) VALUES (0, N'Unknown')
GO
INSERT [dbo].[BatchTypes] ([ID], [Name]) VALUES (1, N'Normal')
GO
INSERT [dbo].[BatchTypes] ([ID], [Name]) VALUES (2, N'Maintenance')
GO
INSERT [dbo].[BatchTypes] ([ID], [Name]) VALUES (3, N'Unauthorized')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (10000, N'General Calculation Successful ')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (20000, N'Elevation Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (20001, N'Latitude Degrees Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (20002, N'Latitude Minutes Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (20003, N'Latitude Seconds Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (20004, N'Atmospheric Pressure Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (20005, N'Acceleration Of Gravity Out Of Range ')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (20006, N'Base Pressure Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (20007, N'Base Temperature Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (30000, N'General Calculation Failure ')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (31000, N'Density Calculation Failure ')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (31001, N'Negative Density Derivative ')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (31002, N'Maximum Density In Braket Exceeded ')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (31003, N'Maximum Number Of Iterations Exceeded ')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (31004, N'Natural Gas Two Phase Calculation Failure ')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (31010, N'Methane Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (31011, N'Nitrogen Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (31012, N'Carbon Dioxide Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (31013, N'Ethane Our Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (31014, N'Propane Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (31015, N'Water Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (31016, N'Hydrogen Sulfide Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (31017, N'Hydrogen Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (31018, N'Carbon Monoxide Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (31019, N'Oxygen Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (31020, N'iButane Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (31021, N'Butane Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (31022, N'iPentane Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (31023, N'Pentane Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (31024, N'Hexane Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (31025, N'Heptane Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (31026, N'Octane Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (31027, N'Nonane Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (31028, N'Decane Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (31029, N'Helium Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (31030, N'Argon Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (31100, N'User Specific Gravity Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (31101, N'Specific Gravity Reference Pressure Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (31102, N'Specific Gravity Reference Temperature Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (31103, N'Gross Heating Value Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (31104, N'Gross Heating Value Reference Pressure Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (31105, N'Gross Heating Value Reference Temperature Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (31106, N'Molar Density Reference Pressure Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (31107, N'Molar Density Reference Temperature Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (32000, N'API MPMS 11.1 (2004) Calculation Failure ')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (32001, N'API MPMS 11.1 (198x) Calculation Failure')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (32002, N'API MPMS 11.1 (2007) Calculation Failure')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (32003, N'Observed Density Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (32004, N'Base Density Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (32005, N'Flowing Density Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (32006, N'Density At 15C Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (32007, N'Density At 20C Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (32008, N'Density At 60F Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (32009, N'Observed Temperature Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (32010, N'Observed Pressure Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (33000, N'Bound Pressure Calculation Failure')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (33001, N'Bound Temperare Calculation Failure ')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (33003, N'Saturation Pressure Calculation Failure')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (33004, N'Saturation Temperature Calculation Failure')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (34000, N'Two Phase Base Flow Calculation Not Supported')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (34001, N'Two Phase Flowing Calculation Not Supported')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (34002, N'Selected Fluid Not Pure Fluid ')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (40000, N'Meter Factor Smaller Than Minimum Allowed Value')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (40001, N'Flowing Pressure Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (40002, N'Flowing Tempurature Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (40003, N'Flowing Duration Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (40004, N'Isentropic Exponent Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (40005, N'Vapor Viscosity Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (40006, N'Liquid Viscosity Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (40007, N'Vapor Pressure Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (40008, N'Pipe Diameter Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (40009, N'Pipe Diamer Reference Temperature')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (41000, N'Differential Pressure Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (41001, N'Differential Pressure >= Upstream Pressure')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (41002, N'Bore Diameter >= Pipe Diameter')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (41100, N'Corner Taps Are Not Supported In AGA-3 (1985)')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (41101, N'Only Flange Taps Are Supported In AGA-3 (1990)')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (41102, N'Only Flange Taps Are Supported In AGA-3 (2012)')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (41700, N'Downstream Taps Are Not Supported By Restriction Orifice')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (41800, N'Nozzle Calculation Failure')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (41801, N'Flow Must Not Be SubSonic')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (41802, N'Nozzle Sonic Calculation Failure ')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (41803, N'Downstream Taps Are Not Supported By Nozzle')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (41900, N'Downstream Taps Are Not Supported By Cone')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (42000, N'Linear K-Factor Volume Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (42001, N'Linear K-Factor Mass Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (42002, N'Linear Pulse Frequency Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (42003, N'Linear Pulse Count Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (42100, N'Turbine Main K-Factor Volume Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (42101, N'Turbine Main K-Factor Mass Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (42102, N'Turbine Main Pulse Frequency Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (42103, N'Turbine Main Pulse Count Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (42104, N'Turbine Sensing K_Factor Volume Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (42105, N'Turbine Sensing K-Factor Mass Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (42106, N'Turbine Sensing Pulse Frequency Out Of Range')
GO
INSERT [dbo].[CalculationErrorMessageTypes] ([ID], [Name]) VALUES (42107, N'Turbine Sensing Pulse Count Out Of Range')
GO
INSERT [dbo].[CompressibilityFactorUnits] ([ID], [Code], [Name]) VALUES (1, N'E', N'1/Bar')
GO
INSERT [dbo].[CompressibilityFactorUnits] ([ID], [Code], [Name]) VALUES (2, N'N', N'1/(kg/cm2
)')
GO
INSERT [dbo].[CompressibilityFactorUnits] ([ID], [Code], [Name]) VALUES (3, N'P', N'1/kPa')
GO
INSERT [dbo].[CompressibilityFactorUnits] ([ID], [Code], [Name]) VALUES (4, N'Q', N'1/psi')
GO
INSERT [dbo].[ConeTypes] ([ID], [Name]) VALUES (800, N'V-Cone ')
GO
INSERT [dbo].[ConeTypes] ([ID], [Name]) VALUES (801, N'Wafer Cone ')
GO
INSERT [dbo].[ConeTypes] ([ID], [Name]) VALUES (899, N'Unknown')
GO
SET IDENTITY_INSERT [dbo].[ContextTags] ON 
GO
INSERT [dbo].[ContextTags] ([ID], [HierarchyID], [DateTimeCreated]) VALUES (3, 63, CAST(N'2024-09-30T16:25:21.610' AS DateTime))
GO
INSERT [dbo].[ContextTags] ([ID], [HierarchyID], [DateTimeCreated]) VALUES (4, 65, CAST(N'2024-09-30T16:25:54.333' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[ContextTags] OFF
GO
SET IDENTITY_INSERT [dbo].[Devices] ON 
GO
INSERT [dbo].[Devices] ([ID], [HierarchyID], [InterPollDelay], [ReadTimeout], [Retries], [WaitToRetry], [DeviceTypeID], [DeviceAddress], [RocDeviceGroup], [RocSourceAddress], [RocSourceGroup]) VALUES (3, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Devices] OFF
GO
INSERT [dbo].[DeviceTypes] ([ID], [Name], [Description]) VALUES (1, N'FloBoss 103', N'FloBoss 103')
GO
INSERT [dbo].[DeviceTypes] ([ID], [Name], [Description]) VALUES (2, N'FloBoss 107', N'FloBoss 107')
GO
INSERT [dbo].[DeviceTypes] ([ID], [Name], [Description]) VALUES (3, N'ROC 300 (FlashPack)', N'ROC 300 (FlashPack)')
GO
INSERT [dbo].[DeviceTypes] ([ID], [Name], [Description]) VALUES (4, N'ROC 800', N'ROC 800')
GO
INSERT [dbo].[DeviceTypes] ([ID], [Name], [Description]) VALUES (5, N'CalScan Hawk / DCR', N'CalScan Hawk / DCR')
GO
INSERT [dbo].[DeviceTypes] ([ID], [Name], [Description]) VALUES (6, N'SCADAPack (Enron Modbus)', N'SCADAPack (Enron Modbus)')
GO
INSERT [dbo].[DeviceTypes] ([ID], [Name], [Description]) VALUES (7, N'Barton 1140 (Enron Modbus)', N'Barton 1140 (Enron Modbus)')
GO
SET IDENTITY_INSERT [dbo].[DigitalIoTags] ON 
GO
INSERT [dbo].[DigitalIoTags] ([ID], [HierarchyID], [ReadAddress], [ReadAddressScanInterval], [HistoryAddress], [HistoryAddressScanInterval], [WriteAddress], [IsCalculated], [Script], [AlarmPriorityID], [AlarmDisabled], [TrueValueText], [FalseValueText], [IsBadQuality], [ManualData], [Value], [DateTimeCreated]) VALUES (1, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-09-30T16:24:42.877' AS DateTime))
GO
INSERT [dbo].[DigitalIoTags] ([ID], [HierarchyID], [ReadAddress], [ReadAddressScanInterval], [HistoryAddress], [HistoryAddressScanInterval], [WriteAddress], [IsCalculated], [Script], [AlarmPriorityID], [AlarmDisabled], [TrueValueText], [FalseValueText], [IsBadQuality], [ManualData], [Value], [DateTimeCreated]) VALUES (2, 64, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-09-30T16:25:48.093' AS DateTime))
GO
INSERT [dbo].[DigitalIoTags] ([ID], [HierarchyID], [ReadAddress], [ReadAddressScanInterval], [HistoryAddress], [HistoryAddressScanInterval], [WriteAddress], [IsCalculated], [Script], [AlarmPriorityID], [AlarmDisabled], [TrueValueText], [FalseValueText], [IsBadQuality], [ManualData], [Value], [DateTimeCreated]) VALUES (3, 67, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-09-30T16:29:47.427' AS DateTime))
GO
INSERT [dbo].[DigitalIoTags] ([ID], [HierarchyID], [ReadAddress], [ReadAddressScanInterval], [HistoryAddress], [HistoryAddressScanInterval], [WriteAddress], [IsCalculated], [Script], [AlarmPriorityID], [AlarmDisabled], [TrueValueText], [FalseValueText], [IsBadQuality], [ManualData], [Value], [DateTimeCreated]) VALUES (4, 68, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-09-30T16:29:50.377' AS DateTime))
GO
INSERT [dbo].[DigitalIoTags] ([ID], [HierarchyID], [ReadAddress], [ReadAddressScanInterval], [HistoryAddress], [HistoryAddressScanInterval], [WriteAddress], [IsCalculated], [Script], [AlarmPriorityID], [AlarmDisabled], [TrueValueText], [FalseValueText], [IsBadQuality], [ManualData], [Value], [DateTimeCreated]) VALUES (5, 69, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-09-30T16:29:53.773' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[DigitalIoTags] OFF
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (0, N'NA', N'N/A')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (1, N'10', N'Gas processing plant - Facilities< 0.01 mol/kmol H2S in inlet stream')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (2, N'11', N'Gas fractionating plant - Facilities< 0.01 mol/kmol H2S in inlet stream')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (3, N'20', N'Gas battery - multiwell - Facilities< 0.01 mol/kmol H2S in inlet stream')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (4, N'30', N'Oil battery - multiwell - Facilities< 0.01 mol/kmol H2S in inlet stream')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (5, N'31', N'Bitumen battery - multiwell - Facilities< 0.01 mol/kmol H2S in inlet stream')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (6, N'40', N'Compressor station - Facilities< 0.01 mol/kmol H2S in inlet stream')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (7, N'70', N'Oil Satellite - multiwell - Facilities< 0.01 mol/kmol H2S in inlet stream')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (8, N'71', N'Bitumen satellite - multiwell - Facilities< 0.01 mol/kmol H2S in inlet stream')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (9, N'80', N'Custom treating facility - Facilities< 0.01 mol/kmol H2S in inlet stream')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (10, N'90', N'Injection/disposal facility - water - Facilities< 0.01 mol/kmol H2S in inlet stream')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (11, N'91', N'Injection/disposal facility - EOR - Facilities< 0.01 mol/kmol H2S in inlet stream')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (12, N'140', N'Single Well with 0.00 mol/kmol H2S')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (13, N'141', N'Commercial or Source Water Well with 0.00 mol/kmol H2S')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (14, N'150', N'Commercial or Source Water Well with 0.00 mol/kmol H2S')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (15, N'200', N'Straddle Plant - Facilities< 0.01 mol/kmol H2S in inlet stream')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (16, N'280', N'Single Well with >0.00 mol/kmol H2S and < 0.01 m3/s H2S release rate')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (17, N'290', N'Multiwell Pad with >0.00 mol/kmol H2S and < 0.01 m3/s H2S release rate')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (18, N'300', N'Gas processing plant')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (19, N'301', N'Gas fractionating plant - Facilities> 0.01 mol/kmol and < 1 t/d sulphur inlet')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (20, N'302', N'Straddle plant - Facilities> 0.01 mol/kmol and < 1 t/d sulphur inlet')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (21, N'310', N'Gas battery - single well - Facilities> 0.01 mol/kmol and < 1 t/d sulphur inlet')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (22, N'311', N'Gas battery - multiwell - Facilities> 0.01 mol/kmol and < 1 t/d sulphur inlet')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (23, N'320', N'Oil battery - single well - Facilities> 0.01 mol/kmol and < 1 t/d sulphur inlet')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (24, N'321', N'Oil battery - multiwell - Facilities> 0.01 mol/kmol and < 1 t/d sulphur inlet')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (25, N'330', N'Bitumen battery - ingle well - Facilities> 0.01 mol/kmol and < 1 t/d sulphur inlet')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (26, N'331', N'Bitumen battery - multiwell - Facilities> 0.01 mol/kmol and < 1 t/d sulphur inlet')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (27, N'340', N'Compressor station - Facilities> 0.01 mol/kmol and < 1 t/d sulphur inlet')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (28, N'350', N'Oil satellite - single or multiwell - Facilities> 0.01 mol/kmol and < 1 t/d sulphur inlet')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (29, N'351', N'Bitumen satellite - single or multiwell - Facilities> 0.01 mol/kmol and < 1 t/d sulphur inlet')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (30, N'352', N'Line heater with > 1 t/d sulphur inlet')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (31, N'360', N'Single Well with > 0.01 m3/s but < 0.3 m3/s H2S release rate')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (32, N'370', N'Multiwell Pad with > 0.01 m3/s but < 0.3 m3/s H2S release rate')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (33, N'400', N'Gas processing plant - deemed nonroutine for new gas plants only')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (34, N'401', N'Gas Fractionation Plant')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (35, N'410', N'Gas battery - single well')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (36, N'411', N'Gas battery - multiwell')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (37, N'420', N'Oil battery - single well')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (38, N'421', N'Oil battery - multiwell')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (39, N'430', N'Bitumen battery - single well')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (40, N'431', N'Bitumen battery - multiwell')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (41, N'440', N'Compressor station')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (42, N'450', N'Oil Satellite - single or multiwell')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (43, N'451', N'Bitumen Satellite - single or multiwell')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (44, N'470', N'Line heater with > 1 t/d sulphur inlet')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (45, N'570', N'Single Well with > 0.3 m3/s but< 2.0 m3/s H2S release rate')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (46, N'600', N'Gas processing plant - deemed nonroutine')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (47, N'610', N'Single Well with > 2.0 m3/s H2S release rate (Deemed nonroutine)')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (48, N'620', N'Proximity critical well with > 0.01 but < 0.1 m3/s release rate and well is within 0.5 km of urban center (Deemed nonroutine)')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (49, N'621', N'Proximity critical well with > 0.1 but < 0.3 m3/s release rate and well is within 1.5 km of urban center (Deemed nonroutine)')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (50, N'622', N'Proximity critical well with > 0.3 but < 2.0 m3/s release rate and well is within 5.0 km of urban center (Deemed nonroutine)')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (51, N'A00', N'Error correction - all facilities')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (52, N'B01', N'Gas-processing / fractionating facility - Facilities < 0.01 mol/kmol H2S inlet stream')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (53, N'B02', N'Gas battery - multi-well - Facilities < 0.01 mol/kmol H2S inlet stream')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (54, N'B03', N'Oil/bitumen battery multi-well - Facilities < 0.01 mol/kmol H2S inlet stream')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (55, N'B04', N'Compressor station - Facilities < 0.01 mol/kmol H2S inlet stream')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (56, N'B05', N'Pump station - Facilities < 0.01 mol/kmol H2S inlet stream')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (57, N'B06', N'Tank farm / Oil loading and unloading terminal - Facilities < 0.01 mol/kmol H2S inlet stream')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (58, N'B07', N'Oil / bitumen battery - satellite - Facilities < 0.01 mol/kmol H2S inlet stream')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (59, N'B08', N'Custom treating plant - Facilities < 0.01 mol/kmol H2S inlet stream')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (60, N'B09', N'Injection / disposal facility - Facilities < 0.01 mol/kmol H2S inlet stream')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (61, N'B10', N'Pipeline <= 5 km - Pipelines < 10 mol/kmol H2S')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (62, N'B11', N'Pipeline > 5 km - Pipelines < 10 mol/kmol H2S')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (63, N'B14', N'Sweet single well - Sweet Wells 0.00 mol/kmol H2S')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (64, N'B15', N'Sweet multi-well pad - Sweet Wells 0.00 mol/kmol H2S')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (65, N'B20', N'Straddle gas plant - < 0.01 mol/kmol H2S in inlet stream')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (66, N'B28', N'Single well - Wells > 0.00 mol/kmol H2S content and < 0.01 m3/s H2S release rate')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (67, N'B29', N'Multi-well pad - Wells > 0.00 mol/kmol H2S content and < 0.01 m3/s H2S release rate')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (68, N'BWL', N'BWL historic wells')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (69, N'C30', N'Gas processing / fractionating facility - Sour Facilities < 1 t/d sulphur inlet')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (70, N'C31', N'Gas battery - single or multi-well - Sour Facilities < 1 t/d sulphur inlet')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (71, N'C32', N'Oil / bitumen battery single well - Sour Facilities < 1 t/d sulphur inlet')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (72, N'C33', N'Oil / bitumen battery multi-well - Sour Facilities < 1 t/d sulphur inlet')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (73, N'C34', N'Compressor station - Sour Facilities < 1 t/d sulphur inlet')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (74, N'C35', N'Oil / bitumen battery - satellite - Sour Facilities < 1 t/d sulphur inlet')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (75, N'C36', N'Sour single well - Sour Wells >= 0.01 m3/s H2S release rate')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (76, N'C37', N'Sour multi-well pad - Sour Wells >= 0.01 m3/s H2S release rate')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (77, N'D39', N'Oil / bitumen battery - satellite - Sour Facilities >= 1 t/d sulphur inlet')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (78, N'D40', N'Gas-processing / fractionating facility - Sour Facilities >= 1 t/d sulphur inlet')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (79, N'D41', N'Gas battery - single or multi-well - Sour Facilities >= 1 t/d sulphur inlet')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (80, N'D42', N'Oil / bitumen battery single-well - Sour Facilities >= 1 t/d sulphur inlet')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (81, N'D43', N'Oil / bitumen battery multi-well - Sour Facilities >= 1 t/d sulphur inlet')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (82, N'D44', N'Compressor station - Sour Facilities >= 1 t/d sulphur inlet')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (83, N'D45', N'Sour natural gas <= 5 km - Sour Natural Gas Pipelines >= 10 mol/kmol H2S')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (84, N'D46', N'Sour natural gas > 5 km - Sour Natural Gas Pipelines >= 10 mol/kmol H2S')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (85, N'D53', N'HVP pipelines <= 5 km - High-Vapour-Pressure Pipelines')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (86, N'D54', N'HVP pipelines > 5 km - High-Vapour-Pressure Pipelines')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (87, N'D55', N'Hydrocarbon pipeline <= 5 km with outside diameter >= 324 mm and maximum operating pressure >= 3475 kPa - Large Diameter, High Pressured Hydrocarbon Pipelines')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (88, N'D56', N'Hydrocarbon pipeline > 5km  with outside diameter >= 324 mm and maximum operating pressure >= 3475 kPa - Large Diameter, High Pressured Hydrocarbon Pipelines')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (89, N'D57', N'Sour well >= 0.3 m3/s but < 2.0 m3/s H2S release rate')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (90, N'E60', N'Gas-processing facility - Sulphur Recovery Facilities')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (91, N'E61', N'Sour wells > 2.0 m3/s H2S release rate')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (92, N'E62', N'Proximity Critical Sour Well - Release rate is > 0.3 m3/s but < 2.0 m3/s and within 5.0 km of an urban centre OR is > 0.1 m3/s but < 0.3 m3/s and within 1.5 km of an urban centre OR is > 0.01 m3/s but < 0.1 m3/s and within 0.5 km of an urban centre')
GO
INSERT [dbo].[EnergyDevelopmentCategoryTypes] ([ID], [Code], [Description]) VALUES (93, N'PPL', N'PPL Historical Pipelines')
GO
INSERT [dbo].[ExtensionDefinitions] ([ID], [Name]) VALUES (1, N'Sqrt(hw * Pf')
GO
INSERT [dbo].[ExtensionDefinitions] ([ID], [Name]) VALUES (2, N'Sqrt(hw * Pf/Tf')
GO
INSERT [dbo].[ExtensionDefinitions] ([ID], [Name]) VALUES (3, N'Sqrt(hw * Pf) * FT')
GO
INSERT [dbo].[ExtensionDefinitions] ([ID], [Name]) VALUES (4, N'Sqrt(hw * Pf/Tf) * FT')
GO
SET IDENTITY_INSERT [dbo].[Facilities] ON 
GO
INSERT [dbo].[Facilities] ([ID], [HierarchyID], [FacilitySubTypeID], [EnergyDevelopmentCategoryTypeID], [UniqueFacilityIdentifier], [LocationName], [OperatorCode], [OperatorName], [LicenceNumber], [LicenseeCode], [WasteLocationTypeID], [DateTimeCreated]) VALUES (1, 16, 2, 24, NULL, NULL, NULL, NULL, NULL, NULL, 0, CAST(N'2024-09-17T20:52:59.867' AS DateTime))
GO
INSERT [dbo].[Facilities] ([ID], [HierarchyID], [FacilitySubTypeID], [EnergyDevelopmentCategoryTypeID], [UniqueFacilityIdentifier], [LocationName], [OperatorCode], [OperatorName], [LicenceNumber], [LicenseeCode], [WasteLocationTypeID], [DateTimeCreated]) VALUES (8, 37, 50, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, CAST(N'2024-09-24T20:11:48.827' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Facilities] OFF
GO
INSERT [dbo].[FacilityActivityTypes] ([ID], [Code], [Name]) VALUES (1, N'DIFF ', N'Metering difference  ')
GO
INSERT [dbo].[FacilityActivityTypes] ([ID], [Code], [Name]) VALUES (2, N'DISP ', N'Disposition ')
GO
INSERT [dbo].[FacilityActivityTypes] ([ID], [Code], [Name]) VALUES (3, N'EMIS ', N'Emissions ')
GO
INSERT [dbo].[FacilityActivityTypes] ([ID], [Code], [Name]) VALUES (4, N'FLARE ', N'Flare ')
GO
INSERT [dbo].[FacilityActivityTypes] ([ID], [Code], [Name]) VALUES (5, N'FRAC ', N'Fractionation yield ')
GO
INSERT [dbo].[FacilityActivityTypes] ([ID], [Code], [Name]) VALUES (6, N'FUEL ', N'Fuel ')
GO
INSERT [dbo].[FacilityActivityTypes] ([ID], [Code], [Name]) VALUES (7, N'IMBAL ', N'Imbalance ')
GO
INSERT [dbo].[FacilityActivityTypes] ([ID], [Code], [Name]) VALUES (8, N'INJ ', N'Well injection ')
GO
INSERT [dbo].[FacilityActivityTypes] ([ID], [Code], [Name]) VALUES (9, N'INVADJ ', N'Inventory adjustment ')
GO
INSERT [dbo].[FacilityActivityTypes] ([ID], [Code], [Name]) VALUES (10, N'INVCL ', N'Closing inventory ')
GO
INSERT [dbo].[FacilityActivityTypes] ([ID], [Code], [Name]) VALUES (11, N'INVOP ', N'Opening inventory ')
GO
INSERT [dbo].[FacilityActivityTypes] ([ID], [Code], [Name]) VALUES (12, N'LDINJ ', N'Load fluid injected ')
GO
INSERT [dbo].[FacilityActivityTypes] ([ID], [Code], [Name]) VALUES (13, N'LDINVADJ ', N'Load fluid inventory adjustment ')
GO
INSERT [dbo].[FacilityActivityTypes] ([ID], [Code], [Name]) VALUES (14, N'LDINVOP ', N'Load fluid opening inventory  ')
GO
INSERT [dbo].[FacilityActivityTypes] ([ID], [Code], [Name]) VALUES (15, N'LDINVCL ', N'Load fluid closing inventory ')
GO
INSERT [dbo].[FacilityActivityTypes] ([ID], [Code], [Name]) VALUES (16, N'LDREC ', N'Load fluid recovered ')
GO
INSERT [dbo].[FacilityActivityTypes] ([ID], [Code], [Name]) VALUES (17, N'PLTUSE ', N'Plant use ')
GO
INSERT [dbo].[FacilityActivityTypes] ([ID], [Code], [Name]) VALUES (18, N'PROC  ', N'Plant process  ')
GO
INSERT [dbo].[FacilityActivityTypes] ([ID], [Code], [Name]) VALUES (19, N'PROD ', N'Well production ')
GO
INSERT [dbo].[FacilityActivityTypes] ([ID], [Code], [Name]) VALUES (20, N'PURREC ', N'Purchase receipt ')
GO
INSERT [dbo].[FacilityActivityTypes] ([ID], [Code], [Name]) VALUES (21, N'PURDISP ', N'Purchase disposition ')
GO
INSERT [dbo].[FacilityActivityTypes] ([ID], [Code], [Name]) VALUES (22, N'REC ', N'Receipt ')
GO
INSERT [dbo].[FacilityActivityTypes] ([ID], [Code], [Name]) VALUES (23, N'RECYC ', N'Recycle ')
GO
INSERT [dbo].[FacilityActivityTypes] ([ID], [Code], [Name]) VALUES (24, N'SHR ', N'Shrinkage ')
GO
INSERT [dbo].[FacilityActivityTypes] ([ID], [Code], [Name]) VALUES (25, N'SHUTIN ', N'Shut-in ')
GO
INSERT [dbo].[FacilityActivityTypes] ([ID], [Code], [Name]) VALUES (26, N'UTIL ', N'Utility ')
GO
INSERT [dbo].[FacilityActivityTypes] ([ID], [Code], [Name]) VALUES (27, N'VENT ', N'Vent ')
GO
INSERT [dbo].[FacilityStatusTypes] ([ID], [Code], [Name]) VALUES (1, N'New', N'New')
GO
INSERT [dbo].[FacilityStatusTypes] ([ID], [Code], [Name]) VALUES (2, N'Active', N'Active')
GO
INSERT [dbo].[FacilityStatusTypes] ([ID], [Code], [Name]) VALUES (3, N'Suspended', N'Suspended')
GO
INSERT [dbo].[FacilityStatusTypes] ([ID], [Code], [Name]) VALUES (4, N'Retired', N'Retired')
GO
INSERT [dbo].[FacilityStatusTypes] ([ID], [Code], [Name]) VALUES (5, N'Abandoned', N'Abandoned')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (0, 0, N'0', N'Non Reporting')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (1, 1, N'311', N'Crude oil single-well battery ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (2, 1, N'321', N'Crude oil multiwell group battery ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (3, 1, N'322', N'Crude oil multiwell proration battery ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (4, 1, N'331', N'Crude bitumen single-well battery ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (5, 1, N'341', N'Crude bitumen multiwell group battery ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (6, 1, N'342', N'Crude bitumen multiwell proration battery ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (7, 1, N'343', N'Crude bitumen administrative grouping ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (8, 1, N'344', N'In situ oil sands ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (9, 1, N'345', N'Sulphur reporting at oil sands ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (10, 1, N'351', N'Gas single-well battery ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (11, 1, N'361', N'Gas multiwell group battery ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (12, 1, N'362', N'Gas multiwell effluent measurement battery')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (13, 1, N'363', N'Gas multiwell proration SE Alberta battery')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (14, 1, N'364', N'Gas multiwell proration outside SE Alberta battery ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (15, 1, N'365', N'Gas multiwell group battery ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (16, 1, N'366', N'Gas multiwell proration SE Alberta battery ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (17, 1, N'367', N'Gas multiwell proration outside SE Alberta battery ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (18, 1, N'371', N'Gas testing battery ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (19, 1, N'381', N'Drilling and completing  ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (20, 1, N'601', N'Compressor station ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (21, 1, N'611', N'Custom treating facility')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (22, 1, N'612', N'Custom treating facility approved as part of an oilfield waste management facility (OWMF)')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (23, 2, N'501', N'Enhanced recovery scheme ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (24, 2, N'502', N'Concurrent production/cycling scheme')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (25, 2, N'503', N'Disposal ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (26, 2, N'504', N'Acid gas disposal ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (27, 2, N'505', N'Underground gas storage ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (28, 2, N'506', N'In situ oil sands ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (29, 2, N'507', N'Disposal (approved as part of a waste plant facility) ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (30, 2, N'508', N'Enhanced recovery scheme ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (31, 2, N'509', N'Disposal ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (32, 3, N'401', N'Gas plant – sweet ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (33, 3, N'402', N'Gas plant – acid gas flaring <1.0 t/d sulphur ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (34, 3, N'403', N'Gas plant –acid gas flaring =1.0 t/d sulphur ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (35, 3, N'404', N'Gas plant – acid gas injection ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (36, 3, N'405', N'Gas plant – sulphur recovery ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (37, 3, N'406', N'Gas plant – mainline straddle ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (38, 3, N'407', N'Gas plant – fractionation ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (39, 5, N'621', N'Gas gathering system ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (40, 5, N'622', N'Gas gathering system  ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (41, 6, N'631', N'Field receipt meter station ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (42, 6, N'632', N'Interconnect receipt meter station ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (43, 6, N'633', N'Interconnect disposition meter station ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (44, 6, N'634', N'Interconnect nonreconciled meter station ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (45, 6, N'637', N'NEB-regulated field receipt meter station ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (46, 6, N'638', N'NEB-regulated interconnect receipt meter station ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (47, 6, N'639', N'NEB-regulated interconnect disposition meter station ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (48, 6, N'640', N'Interconnect PL to PL disposition meter station ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (49, 7, N'801', N'Oil sands processing plant ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (50, 8, N'204', N'Gas transporter ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (51, 8, N'206', N'Gas distributor ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (52, 8, N'207', N'Oil pipeline ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (53, 8, N'208', N'NGL pipeline ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (54, 8, N'209', N'National Energy Board (NEB) regulated pipeline ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (55, 9, N'651', N'Refinery ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (56, 10, N'671', N'Tank farm/oil loading and unloading terminal ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (57, 10, N'672', N'NEB-regulated terminal ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (58, 10, N'673', N'Third-party tank farm/oil loading and unloading terminal ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (59, 10, N'675', N'Railcar/oil loading and unloading terminal ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (60, 11, N'701', N'Waste processing facility')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (61, 11, N'702', N'Cavern waste plants ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (62, 11, N'901', N'Water source  ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (63, 11, N'902', N'Water source battery ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (64, 11, N'903', N'Brine production ')
GO
INSERT [dbo].[FacilitySubTypes] ([ID], [FacilityTypeID], [Code], [Name]) VALUES (65, 4, N'0', N'N/A')
GO
INSERT [dbo].[FacilityTypes] ([ID], [Code], [Name]) VALUES (0, N'NA', N'Non Reporting')
GO
INSERT [dbo].[FacilityTypes] ([ID], [Code], [Name]) VALUES (1, N'BT', N'Battery')
GO
INSERT [dbo].[FacilityTypes] ([ID], [Code], [Name]) VALUES (2, N'IF', N'Injection facility')
GO
INSERT [dbo].[FacilityTypes] ([ID], [Code], [Name]) VALUES (3, N'GP', N'Gas plant')
GO
INSERT [dbo].[FacilityTypes] ([ID], [Code], [Name]) VALUES (4, N'GS', N'Gas gathering system ')
GO
INSERT [dbo].[FacilityTypes] ([ID], [Code], [Name]) VALUES (5, N'CT', N'Custom treating facility')
GO
INSERT [dbo].[FacilityTypes] ([ID], [Code], [Name]) VALUES (6, N'MS', N'Meter station')
GO
INSERT [dbo].[FacilityTypes] ([ID], [Code], [Name]) VALUES (7, N'OS', N'Oil sands')
GO
INSERT [dbo].[FacilityTypes] ([ID], [Code], [Name]) VALUES (8, N'PL', N'Pipeline')
GO
INSERT [dbo].[FacilityTypes] ([ID], [Code], [Name]) VALUES (9, N'RF', N'Refinery')
GO
INSERT [dbo].[FacilityTypes] ([ID], [Code], [Name]) VALUES (10, N'TM', N'Terminal')
GO
INSERT [dbo].[FacilityTypes] ([ID], [Code], [Name]) VALUES (11, N'WP', N'Waste plant')
GO
INSERT [dbo].[FittingTypes] ([ID], [Code], [Name]) VALUES (1, N'J', N'Junior')
GO
INSERT [dbo].[FittingTypes] ([ID], [Code], [Name]) VALUES (2, N'S', N'Senior')
GO
INSERT [dbo].[FittingTypes] ([ID], [Code], [Name]) VALUES (3, N'X', N'Simplex')
GO
INSERT [dbo].[FluidPhases] ([ID], [Name]) VALUES (200, N'Vapor')
GO
INSERT [dbo].[FluidPhases] ([ID], [Name]) VALUES (201, N'Liquid')
GO
INSERT [dbo].[FluidPhases] ([ID], [Name]) VALUES (202, N'Two Phase')
GO
INSERT [dbo].[FluidPhases] ([ID], [Name]) VALUES (203, N'Supercritical ')
GO
INSERT [dbo].[FluidPhases] ([ID], [Name]) VALUES (299, N'Unknown')
GO
INSERT [dbo].[FluidStandards] ([ID], [Name]) VALUES (5100, N'AGA-8 (1994) Detail ')
GO
INSERT [dbo].[FluidStandards] ([ID], [Name]) VALUES (5101, N'AGA-8 (1994) Gross 1 [Sg/Hv/Co2]')
GO
INSERT [dbo].[FluidStandards] ([ID], [Name]) VALUES (5102, N'AGA-8 (1994) Gross 2 [Sg/N2/Co2]')
GO
INSERT [dbo].[FluidStandards] ([ID], [Name]) VALUES (5103, N'AGA-8 (1985) Primary ')
GO
INSERT [dbo].[FluidStandards] ([ID], [Name]) VALUES (5104, N'AGA-8 (1985) [Sg/Hv/Co2]')
GO
INSERT [dbo].[FluidStandards] ([ID], [Name]) VALUES (5105, N'AGA-8 (1985) [Sg/Hv/N2/Co2]')
GO
INSERT [dbo].[FluidStandards] ([ID], [Name]) VALUES (5106, N'AGA-8 (1985) [Sg/Co2/N2]')
GO
INSERT [dbo].[FluidStandards] ([ID], [Name]) VALUES (5107, N'AGA-8 (1985) [Hv/Co2/N2]')
GO
INSERT [dbo].[FluidStandards] ([ID], [Name]) VALUES (5108, N'AGA-8 (1985) [Sg/C1/N2/Co2] ')
GO
INSERT [dbo].[FluidStandards] ([ID], [Name]) VALUES (5109, N'AGA Par NX19 (1962) Analysis ')
GO
INSERT [dbo].[FluidStandards] ([ID], [Name]) VALUES (5110, N'AGA Par NX19 (1962) [Sg/N2/Co2] ')
GO
INSERT [dbo].[FluidStandards] ([ID], [Name]) VALUES (5111, N'AGA Par NX19 (1962) [Sg/C1/N2/Co2] ')
GO
INSERT [dbo].[FluidStandards] ([ID], [Name]) VALUES (5112, N'AGA Par NX19 (1962) HvN2Co2 ')
GO
INSERT [dbo].[FluidStandards] ([ID], [Name]) VALUES (5113, N'Redlich-Kwong ')
GO
INSERT [dbo].[FluidStandards] ([ID], [Name]) VALUES (5114, N'Redlich-Kwong / Wichert-Aziz ')
GO
INSERT [dbo].[FluidStandards] ([ID], [Name]) VALUES (5115, N'GERG (2008)')
GO
INSERT [dbo].[FluidStandards] ([ID], [Name]) VALUES (5200, N'API MPMS 11.1 (198x) [Table 2324]')
GO
INSERT [dbo].[FluidStandards] ([ID], [Name]) VALUES (5201, N'API MPMS 11.1 (198x) [Table 5354]')
GO
INSERT [dbo].[FluidStandards] ([ID], [Name]) VALUES (5202, N'API MPMS 11.1 (2004) [Table 2324]')
GO
INSERT [dbo].[FluidStandards] ([ID], [Name]) VALUES (5203, N'API MPMS 11.1 (2004) [Table 5354]')
GO
INSERT [dbo].[FluidStandards] ([ID], [Name]) VALUES (5204, N'API MPMS 11.1 (2004) [Table 5960]')
GO
INSERT [dbo].[FluidStandards] ([ID], [Name]) VALUES (5205, N'API MPMS 11.1 (2007) [Table 2324]')
GO
INSERT [dbo].[FluidStandards] ([ID], [Name]) VALUES (5206, N'API MPMS 11.1 (2007) [Table 5354]')
GO
INSERT [dbo].[FluidStandards] ([ID], [Name]) VALUES (5207, N'API MPMS 11.1 (2007) [Table 5960]')
GO
INSERT [dbo].[FluidStandards] ([ID], [Name]) VALUES (5300, N'IAPWS Industrial Formulation')
GO
INSERT [dbo].[FluidStandards] ([ID], [Name]) VALUES (5999, N'Unknown')
GO
INSERT [dbo].[FluidStates] ([ID], [Name]) VALUES (100, N'Gas')
GO
INSERT [dbo].[FluidStates] ([ID], [Name]) VALUES (101, N'Liquid')
GO
INSERT [dbo].[FluidStates] ([ID], [Name]) VALUES (199, N'Unknown')
GO
INSERT [dbo].[FluidTypes] ([ID], [Name]) VALUES (2100, N'Natural Gas ')
GO
INSERT [dbo].[FluidTypes] ([ID], [Name]) VALUES (2201, N'NGL / LPG')
GO
INSERT [dbo].[FluidTypes] ([ID], [Name]) VALUES (2202, N'Crude Oil ')
GO
INSERT [dbo].[FluidTypes] ([ID], [Name]) VALUES (2203, N'Condensate ')
GO
INSERT [dbo].[FluidTypes] ([ID], [Name]) VALUES (2204, N'Gasoline ')
GO
INSERT [dbo].[FluidTypes] ([ID], [Name]) VALUES (2205, N'Napthene ')
GO
INSERT [dbo].[FluidTypes] ([ID], [Name]) VALUES (2206, N'Jet Fuel ')
GO
INSERT [dbo].[FluidTypes] ([ID], [Name]) VALUES (2207, N'Kerosene ')
GO
INSERT [dbo].[FluidTypes] ([ID], [Name]) VALUES (2208, N'Diesel Fuel ')
GO
INSERT [dbo].[FluidTypes] ([ID], [Name]) VALUES (2209, N'Fuel Oil ')
GO
INSERT [dbo].[FluidTypes] ([ID], [Name]) VALUES (2210, N'Lube Oil ')
GO
INSERT [dbo].[FluidTypes] ([ID], [Name]) VALUES (2301, N'Water ')
GO
INSERT [dbo].[FluidTypes] ([ID], [Name]) VALUES (2302, N'Methane ')
GO
INSERT [dbo].[FluidTypes] ([ID], [Name]) VALUES (2303, N'Ethane ')
GO
INSERT [dbo].[FluidTypes] ([ID], [Name]) VALUES (2304, N'Propane ')
GO
INSERT [dbo].[FluidTypes] ([ID], [Name]) VALUES (2305, N'Nbutane ')
GO
INSERT [dbo].[FluidTypes] ([ID], [Name]) VALUES (2306, N'Npentane ')
GO
INSERT [dbo].[FluidTypes] ([ID], [Name]) VALUES (2307, N'Nhexane ')
GO
INSERT [dbo].[FluidTypes] ([ID], [Name]) VALUES (2308, N'Nheptane ')
GO
INSERT [dbo].[FluidTypes] ([ID], [Name]) VALUES (2309, N'Noctane ')
GO
INSERT [dbo].[FluidTypes] ([ID], [Name]) VALUES (2310, N'Argon ')
GO
INSERT [dbo].[FluidTypes] ([ID], [Name]) VALUES (2311, N'Oxygen ')
GO
INSERT [dbo].[FluidTypes] ([ID], [Name]) VALUES (2312, N'Nitrogen ')
GO
INSERT [dbo].[FluidTypes] ([ID], [Name]) VALUES (2313, N'Ethylene ')
GO
INSERT [dbo].[FluidTypes] ([ID], [Name]) VALUES (2314, N'Isobutane ')
GO
INSERT [dbo].[FluidTypes] ([ID], [Name]) VALUES (2315, N'Cyclohexane ')
GO
INSERT [dbo].[FluidTypes] ([ID], [Name]) VALUES (2316, N'Sulfur Hexafluoride ')
GO
INSERT [dbo].[FluidTypes] ([ID], [Name]) VALUES (2317, N'CFC-11 ')
GO
INSERT [dbo].[FluidTypes] ([ID], [Name]) VALUES (2318, N'CFC-12 ')
GO
INSERT [dbo].[FluidTypes] ([ID], [Name]) VALUES (2319, N'HCFC-22')
GO
INSERT [dbo].[FluidTypes] ([ID], [Name]) VALUES (2320, N'HFC-32')
GO
INSERT [dbo].[FluidTypes] ([ID], [Name]) VALUES (2321, N'CFC-113')
GO
INSERT [dbo].[FluidTypes] ([ID], [Name]) VALUES (2322, N'HCFC-123')
GO
INSERT [dbo].[FluidTypes] ([ID], [Name]) VALUES (2323, N'HFC-125')
GO
INSERT [dbo].[FluidTypes] ([ID], [Name]) VALUES (2324, N'HFC-134a')
GO
INSERT [dbo].[FluidTypes] ([ID], [Name]) VALUES (2325, N'HFC-143a ')
GO
INSERT [dbo].[FluidTypes] ([ID], [Name]) VALUES (2326, N'HFC-152a')
GO
INSERT [dbo].[FluidTypes] ([ID], [Name]) VALUES (2327, N'Carbon Dioxide ')
GO
INSERT [dbo].[FluidTypes] ([ID], [Name]) VALUES (2328, N'Ammonia ')
GO
INSERT [dbo].[FluidTypes] ([ID], [Name]) VALUES (2999, N'Unknown')
GO
INSERT [dbo].[GasVolumeKFactorUnits] ([ID], [Code], [IsUnitPerPulse], [UnitID], [Symbol], [Description]) VALUES (1, N'c', 0, 39025, N'pulses/acf', N'Pulses per actual cubic foot')
GO
INSERT [dbo].[GasVolumeKFactorUnits] ([ID], [Code], [IsUnitPerPulse], [UnitID], [Symbol], [Description]) VALUES (2, N'd', 0, 39065, N'pulses/E6M3', N'Pulses per million cubic meters')
GO
INSERT [dbo].[GasVolumeKFactorUnits] ([ID], [Code], [IsUnitPerPulse], [UnitID], [Symbol], [Description]) VALUES (3, N'h', 0, 39066, N'pulses/102m3', N'Pulses per hundred cubic meters')
GO
INSERT [dbo].[GasVolumeKFactorUnits] ([ID], [Code], [IsUnitPerPulse], [UnitID], [Symbol], [Description]) VALUES (4, N'n', 1, 39025, N'acf/pulse', N'Actual cubic feet per pulse')
GO
INSERT [dbo].[GasVolumeKFactorUnits] ([ID], [Code], [IsUnitPerPulse], [UnitID], [Symbol], [Description]) VALUES (5, N'q', 0, 39021, N'pulses/m3', N'Pulses per actual cubic meter')
GO
INSERT [dbo].[GasVolumeKFactorUnits] ([ID], [Code], [IsUnitPerPulse], [UnitID], [Symbol], [Description]) VALUES (6, N'S', 0, 39062, N'pulses/Mmacf', N'Pulses per million cubic feet')
GO
INSERT [dbo].[GasVolumeKFactorUnits] ([ID], [Code], [IsUnitPerPulse], [UnitID], [Symbol], [Description]) VALUES (7, N'T', 0, 39064, N'pulses/E3M3', N'Pulses per thousand cubic meters')
GO
INSERT [dbo].[GasVolumeKFactorUnits] ([ID], [Code], [IsUnitPerPulse], [UnitID], [Symbol], [Description]) VALUES (8, N'v', 1, 39064, N'E3M3/pulse', N'Thousand cubic meters per pulse')
GO
INSERT [dbo].[GasVolumeKFactorUnits] ([ID], [Code], [IsUnitPerPulse], [UnitID], [Symbol], [Description]) VALUES (9, N'w', 1, 39066, N'102m3/pulse', N'Hundred cubic meters per pulse')
GO
INSERT [dbo].[GasVolumeKFactorUnits] ([ID], [Code], [IsUnitPerPulse], [UnitID], [Symbol], [Description]) VALUES (10, N'x', 1, 39021, N'm3/pulse', N'Actual cubic meters per pulse')
GO
INSERT [dbo].[GasVolumeKFactorUnits] ([ID], [Code], [IsUnitPerPulse], [UnitID], [Symbol], [Description]) VALUES (11, N'y', 1, 39061, N'Macf/pulse', N'Thousand cubic feet per pulse')
GO
INSERT [dbo].[GasVolumeKFactorUnits] ([ID], [Code], [IsUnitPerPulse], [UnitID], [Symbol], [Description]) VALUES (12, N'z', 1, 39067, N'Cacf/pulse', N'Hundred cubic feet per pulse')
GO
INSERT [dbo].[HeatingValueStandards] ([ID], [Name]) VALUES (6000, N'GPA 2172 (1996)')
GO
INSERT [dbo].[HeatingValueStandards] ([ID], [Name]) VALUES (6001, N'GPA 2172 (2009)')
GO
INSERT [dbo].[HeatingValueStandards] ([ID], [Name]) VALUES (6002, N'AGA-5 (1985)')
GO
INSERT [dbo].[HeatingValueStandards] ([ID], [Name]) VALUES (6003, N'AGA-5 (2009)')
GO
INSERT [dbo].[HeatingValueStandards] ([ID], [Name]) VALUES (6099, N'Unknown')
GO
SET IDENTITY_INSERT [dbo].[Hierarchy] ON 
GO
INSERT [dbo].[Hierarchy] ([ID], [Node], [Name], [Description], [IsDisabled], [Latitude], [Longitude], [DefaultZoomLevel], [NodeTypeID], [DateTimeCreated]) VALUES (4, N'/', N'System', NULL, 0, 54.557235717773438, -114.89519500732422, 3, 1, CAST(N'2024-09-09T10:01:02.943' AS DateTime))
GO
INSERT [dbo].[Hierarchy] ([ID], [Node], [Name], [Description], [IsDisabled], [Latitude], [Longitude], [DefaultZoomLevel], [NodeTypeID], [DateTimeCreated]) VALUES (5, N'/0/', N'Contoso Energy', N'Contoso Energy Canada Ltd.', 0, 54.587574005126953, -115.35380554199219, 4, 2, CAST(N'2024-09-09T10:03:19.187' AS DateTime))
GO
INSERT [dbo].[Hierarchy] ([ID], [Node], [Name], [Description], [IsDisabled], [Latitude], [Longitude], [DefaultZoomLevel], [NodeTypeID], [DateTimeCreated]) VALUES (6, N'/0/0/', N'Alberta', N'Alberta', 0, 54.587574005126953, -115.35380554199219, 6, 3, CAST(N'2024-09-09T10:06:07.057' AS DateTime))
GO
INSERT [dbo].[Hierarchy] ([ID], [Node], [Name], [Description], [IsDisabled], [Latitude], [Longitude], [DefaultZoomLevel], [NodeTypeID], [DateTimeCreated]) VALUES (7, N'/0/0/0/', N'Southern AB', N'Southern AB', 0, 50.611484527587891, -112.44448852539063, 8, 4, CAST(N'2024-09-09T10:06:26.530' AS DateTime))
GO
INSERT [dbo].[Hierarchy] ([ID], [Node], [Name], [Description], [IsDisabled], [Latitude], [Longitude], [DefaultZoomLevel], [NodeTypeID], [DateTimeCreated]) VALUES (8, N'/0/0/0/0/', N'Hussar', N'Hussar', 0, 51.041496276855469, -112.68318176269531, 10, 5, CAST(N'2024-09-09T10:07:32.230' AS DateTime))
GO
INSERT [dbo].[Hierarchy] ([ID], [Node], [Name], [Description], [IsDisabled], [Latitude], [Longitude], [DefaultZoomLevel], [NodeTypeID], [DateTimeCreated]) VALUES (16, N'/0/0/0/0/0/', N'Parflesh 12-12-25-22W4 Battery', N'Parflesh 12-12-25-22W4 Battery', 0, 51.119669, -112.955721, 12, 6, CAST(N'2024-09-17T20:34:44.750' AS DateTime))
GO
INSERT [dbo].[Hierarchy] ([ID], [Node], [Name], [Description], [IsDisabled], [Latitude], [Longitude], [DefaultZoomLevel], [NodeTypeID], [DateTimeCreated]) VALUES (37, N'/0/0/0/0/0/2/', N'New Facility', NULL, 0, NULL, NULL, NULL, 6, CAST(N'2024-09-24T20:11:48.803' AS DateTime))
GO
INSERT [dbo].[Hierarchy] ([ID], [Node], [Name], [Description], [IsDisabled], [Latitude], [Longitude], [DefaultZoomLevel], [NodeTypeID], [DateTimeCreated]) VALUES (49, N'/0/0/0/0/0/2/1/', N'01-02-003-04W5', NULL, 0, NULL, NULL, NULL, 7, CAST(N'2024-09-29T21:49:43.503' AS DateTime))
GO
INSERT [dbo].[Hierarchy] ([ID], [Node], [Name], [Description], [IsDisabled], [Latitude], [Longitude], [DefaultZoomLevel], [NodeTypeID], [DateTimeCreated]) VALUES (55, N'/0/0/0/0/0/3/', N'New Serial Port Channel', NULL, 0, NULL, NULL, NULL, 14, CAST(N'2024-09-30T15:51:22.340' AS DateTime))
GO
INSERT [dbo].[Hierarchy] ([ID], [Node], [Name], [Description], [IsDisabled], [Latitude], [Longitude], [DefaultZoomLevel], [NodeTypeID], [DateTimeCreated]) VALUES (56, N'/0/0/0/0/0/3/1/', N'New Device', NULL, 0, NULL, NULL, NULL, 16, CAST(N'2024-09-30T15:51:27.500' AS DateTime))
GO
INSERT [dbo].[Hierarchy] ([ID], [Node], [Name], [Description], [IsDisabled], [Latitude], [Longitude], [DefaultZoomLevel], [NodeTypeID], [DateTimeCreated]) VALUES (59, N'/0/0/0/0/0/3/1/1/', N'New Digital IO Tag', NULL, 0, NULL, NULL, NULL, 17, CAST(N'2024-09-30T16:24:42.860' AS DateTime))
GO
INSERT [dbo].[Hierarchy] ([ID], [Node], [Name], [Description], [IsDisabled], [Latitude], [Longitude], [DefaultZoomLevel], [NodeTypeID], [DateTimeCreated]) VALUES (60, N'/0/0/0/0/0/3/1/2/', N'New Analog IO Tag', NULL, 0, NULL, NULL, NULL, 18, CAST(N'2024-09-30T16:25:01.780' AS DateTime))
GO
INSERT [dbo].[Hierarchy] ([ID], [Node], [Name], [Description], [IsDisabled], [Latitude], [Longitude], [DefaultZoomLevel], [NodeTypeID], [DateTimeCreated]) VALUES (61, N'/0/0/0/0/0/3/1/3/', N'New String IO Tag', NULL, 0, NULL, NULL, NULL, 19, CAST(N'2024-09-30T16:25:11.347' AS DateTime))
GO
INSERT [dbo].[Hierarchy] ([ID], [Node], [Name], [Description], [IsDisabled], [Latitude], [Longitude], [DefaultZoomLevel], [NodeTypeID], [DateTimeCreated]) VALUES (62, N'/0/0/0/0/0/3/1/4/', N'New String IO Tag', NULL, 0, NULL, NULL, NULL, 19, CAST(N'2024-09-30T16:25:17.507' AS DateTime))
GO
INSERT [dbo].[Hierarchy] ([ID], [Node], [Name], [Description], [IsDisabled], [Latitude], [Longitude], [DefaultZoomLevel], [NodeTypeID], [DateTimeCreated]) VALUES (63, N'/0/0/0/0/0/3/1/5/', N'New Context Tag', NULL, 0, NULL, NULL, NULL, 20, CAST(N'2024-09-30T16:25:21.603' AS DateTime))
GO
INSERT [dbo].[Hierarchy] ([ID], [Node], [Name], [Description], [IsDisabled], [Latitude], [Longitude], [DefaultZoomLevel], [NodeTypeID], [DateTimeCreated]) VALUES (64, N'/0/0/0/0/0/3/1/5/1/', N'New Digital IO Tag', NULL, 0, NULL, NULL, NULL, 17, CAST(N'2024-09-30T16:25:48.090' AS DateTime))
GO
INSERT [dbo].[Hierarchy] ([ID], [Node], [Name], [Description], [IsDisabled], [Latitude], [Longitude], [DefaultZoomLevel], [NodeTypeID], [DateTimeCreated]) VALUES (65, N'/0/0/0/0/0/3/1/5/2/', N'New Context Tag', NULL, 0, NULL, NULL, NULL, 20, CAST(N'2024-09-30T16:25:54.330' AS DateTime))
GO
INSERT [dbo].[Hierarchy] ([ID], [Node], [Name], [Description], [IsDisabled], [Latitude], [Longitude], [DefaultZoomLevel], [NodeTypeID], [DateTimeCreated]) VALUES (66, N'/0/0/0/0/0/3/1/5/2/1/', N'New String IO Tag', NULL, 0, NULL, NULL, NULL, 19, CAST(N'2024-09-30T16:25:59.520' AS DateTime))
GO
INSERT [dbo].[Hierarchy] ([ID], [Node], [Name], [Description], [IsDisabled], [Latitude], [Longitude], [DefaultZoomLevel], [NodeTypeID], [DateTimeCreated]) VALUES (67, N'/0/0/0/0/0/3/1/6/', N'New Digital IO Tag', NULL, 0, NULL, NULL, NULL, 17, CAST(N'2024-09-30T16:29:47.423' AS DateTime))
GO
INSERT [dbo].[Hierarchy] ([ID], [Node], [Name], [Description], [IsDisabled], [Latitude], [Longitude], [DefaultZoomLevel], [NodeTypeID], [DateTimeCreated]) VALUES (68, N'/0/0/0/0/0/3/1/7/', N'New Digital IO Tag', NULL, 0, NULL, NULL, NULL, 17, CAST(N'2024-09-30T16:29:50.373' AS DateTime))
GO
INSERT [dbo].[Hierarchy] ([ID], [Node], [Name], [Description], [IsDisabled], [Latitude], [Longitude], [DefaultZoomLevel], [NodeTypeID], [DateTimeCreated]) VALUES (69, N'/0/0/0/0/0/3/1/8/', N'New Digital IO Tag', NULL, 0, NULL, NULL, NULL, 17, CAST(N'2024-09-30T16:29:53.770' AS DateTime))
GO
INSERT [dbo].[Hierarchy] ([ID], [Node], [Name], [Description], [IsDisabled], [Latitude], [Longitude], [DefaultZoomLevel], [NodeTypeID], [DateTimeCreated]) VALUES (76, N'/0/0/0/0/0/3/1/9/', N'New Meter Run', NULL, 0, NULL, NULL, NULL, 21, CAST(N'2024-09-30T18:58:12.380' AS DateTime))
GO
INSERT [dbo].[Hierarchy] ([ID], [Node], [Name], [Description], [IsDisabled], [Latitude], [Longitude], [DefaultZoomLevel], [NodeTypeID], [DateTimeCreated]) VALUES (77, N'/0/0/0/0/0/3/1/10/', N'New Meter Run', NULL, 0, NULL, NULL, NULL, 21, CAST(N'2024-09-30T19:00:59.717' AS DateTime))
GO
INSERT [dbo].[Hierarchy] ([ID], [Node], [Name], [Description], [IsDisabled], [Latitude], [Longitude], [DefaultZoomLevel], [NodeTypeID], [DateTimeCreated]) VALUES (78, N'/0/0/0/0/0/3/1/11/', N'New Meter Run', NULL, 0, NULL, NULL, NULL, 21, CAST(N'2024-09-30T19:03:26.987' AS DateTime))
GO
INSERT [dbo].[Hierarchy] ([ID], [Node], [Name], [Description], [IsDisabled], [Latitude], [Longitude], [DefaultZoomLevel], [NodeTypeID], [DateTimeCreated]) VALUES (79, N'/0/0/0/0/0/3/1/12/', N'New Meter Run', NULL, 0, NULL, NULL, NULL, 21, CAST(N'2024-09-30T19:33:47.490' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Hierarchy] OFF
GO
INSERT [dbo].[LinearMeterCalculationModes] ([ID], [Name]) VALUES (1100, N'Pulse')
GO
INSERT [dbo].[LinearMeterCalculationModes] ([ID], [Name]) VALUES (1101, N'Signal')
GO
INSERT [dbo].[LinearMeterCalculationModes] ([ID], [Name]) VALUES (1102, N'Chordal Velocity')
GO
INSERT [dbo].[LinearMeterCalculationModes] ([ID], [Name]) VALUES (1199, N'Unknown ')
GO
INSERT [dbo].[LinearMeterCalculationUnitTypes] ([ID], [Name]) VALUES (1000, N'Mass')
GO
INSERT [dbo].[LinearMeterCalculationUnitTypes] ([ID], [Name]) VALUES (1001, N'Volume')
GO
INSERT [dbo].[LinearMeterCalculationUnitTypes] ([ID], [Name]) VALUES (1099, N'Unknown')
GO
INSERT [dbo].[LiquidVolumeKFactorUnits] ([ID], [Code], [IsUnitPerPulse], [UnitID], [Symbol], [Description]) VALUES (1, N'b', 0, 39052, N'pulses/bbl', N'Pulses per barrel')
GO
INSERT [dbo].[LiquidVolumeKFactorUnits] ([ID], [Code], [IsUnitPerPulse], [UnitID], [Symbol], [Description]) VALUES (2, N'g', 0, 39030, N'pulses/gal', N'Pulses per gallon')
GO
INSERT [dbo].[LiquidVolumeKFactorUnits] ([ID], [Code], [IsUnitPerPulse], [UnitID], [Symbol], [Description]) VALUES (3, N'l', 0, 39000, N'pulses/L', N'Pulses per liter')
GO
INSERT [dbo].[LiquidVolumeKFactorUnits] ([ID], [Code], [IsUnitPerPulse], [UnitID], [Symbol], [Description]) VALUES (4, N'q', 0, 39021, N'pulses/m3', N'Pulses per cubic meter')
GO
INSERT [dbo].[MaintenanceTypes] ([ID], [Name], [Description]) VALUES (1, N'Routine Inspection', N'Regularly scheduled inspection and maintenance')
GO
INSERT [dbo].[MaintenanceTypes] ([ID], [Name], [Description]) VALUES (2, N'Emergency Repair', N'Unscheduled repair due to equipment failure')
GO
INSERT [dbo].[MaintenanceTypes] ([ID], [Name], [Description]) VALUES (3, N'Preventive Maintenance', N'Maintenance performed to prevent failures')
GO
INSERT [dbo].[MaintenanceTypes] ([ID], [Name], [Description]) VALUES (4, N'Calibration', N'Calibration of instruments and sensors')
GO
INSERT [dbo].[MassHeatingValueUnits] ([ID], [Name], [Symbol], [MassUnitID], [EnergyUnitID]) VALUES (1, N'Megajoules per kilogram', N'MJ/kg', 26008, 14007)
GO
INSERT [dbo].[MassHeatingValueUnits] ([ID], [Name], [Symbol], [MassUnitID], [EnergyUnitID]) VALUES (2, N'Btu per pound', N'Btu/lbm', 26021, 14021)
GO
INSERT [dbo].[MassKFactorUnits] ([ID], [Code], [IsUnitPerPulse], [UnitID], [Symbol], [Description]) VALUES (1, N'3', 0, 26008, N'pulses/kg', N'Pulses per kilogram')
GO
INSERT [dbo].[MassKFactorUnits] ([ID], [Code], [IsUnitPerPulse], [UnitID], [Symbol], [Description]) VALUES (2, N'4', 0, 26021, N'pulses/lbm', N'Pulses per pound-mass')
GO
INSERT [dbo].[Materials] ([ID], [Name]) VALUES (400, N'Carbon Steel ')
GO
INSERT [dbo].[Materials] ([ID], [Name]) VALUES (401, N'316 Stainless Steel ')
GO
INSERT [dbo].[Materials] ([ID], [Name]) VALUES (402, N'C276 Alloy')
GO
INSERT [dbo].[Materials] ([ID], [Name]) VALUES (403, N'400 Alloy')
GO
INSERT [dbo].[Materials] ([ID], [Name]) VALUES (404, N'304 Stainless Steel ')
GO
INSERT [dbo].[Materials] ([ID], [Name]) VALUES (405, N'DIN 14571316ti ')
GO
INSERT [dbo].[Materials] ([ID], [Name]) VALUES (499, N'Unknown ')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (1, N'MeterNumber')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (2, N'MeterStandardID')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (3, N'FluidStandardID')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (4, N'DataResolution')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (5, N'DataSpanIsLeading')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (6, N'StaticPressureMeasurementID')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (7, N'Pb')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (8, N'Tb')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (9, N'AtmosphericPressure')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (10, N'Altitude')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (11, N'Latitude')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (12, N'DensityMeterFactor')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (13, N'FactorFwv')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (14, N'FactorFws')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (15, N'FullWellStreamFactor')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (16, N'FixedFactor')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (17, N'EfmRelativeDensitySaturationConditionID')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (18, N'EfmHeatingValueSaturationConditionID')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (19, N'HasDefaultTemperature')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (20, N'DefaultTemperature')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (21, N'ShrinkFactor')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (22, N'StockTankDensity')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (23, N'StockTankSedimentAndWaterPercent')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (24, N'ProductName')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (25, N'FluidTypeID')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (26, N'CompressibilityFactor')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (27, N'CompressibilityFactorUnitID')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (28, N'BaseDensityOverride')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (29, N'DensityUnitID')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (30, N'Alpha')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (31, N'AlphaUnitID')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (32, N'EquilibriumVaporPressure')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (33, N'EquilibriumVaporPressureUnitID')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (34, N'DensityCorrectionFactor')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (35, N'ProveDate')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (36, N'PycDate')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (37, N'NumberOfDialsTotalizerDigits')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (38, N'PressureCompenstated')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (39, N'TemperatureCompensated')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (40, N'MeterFactorUsageID')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (41, N'MeterFactor')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (42, N'KFactor')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (43, N'PipeLength')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (44, N'MeterFactorKFactorCurveIsAveraged')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (45, N'FlowingPressureEnabled')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (46, N'FlowingPressureEffect')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (47, N'CalibrationPressure')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (48, N'MeasuredPipeDiameter')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (49, N'PipeReferenceTemperature')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (50, N'PipeMaterialID')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (51, N'MeasuredBoreDiameter')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (52, N'BoreReferenceTemperature')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (53, N'BoreMaterialID')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (54, N'TapTypeID')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (55, N'StaticTapTypeID')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (56, N'ExtensionDefinitionID')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (57, N'FactorFa')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (58, N'FactorFb')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (59, N'FactorFg')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (60, N'FactorFpv')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (61, N'FactorFr')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (62, N'FactorFt')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (63, N'FactorY')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (64, N'LowFlowCutoffSetPoint')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (65, N'BackflowAlarmSetPoint')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (66, N'DPLowAlarmSetPoint')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (67, N'DPHighAlarmSetPoint')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (68, N'DPCalibratedRangeLow')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (69, N'DPCalibratedRangeHigh')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (70, N'DPTransducerRangeLow')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (71, N'DPTransducerRangeHigh')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (72, N'SPLowAlarmSetPoint')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (73, N'SPHighAlarmSetPoint')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (74, N'SPCalibratedRangeLow')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (75, N'SPCalibratedRangeHigh')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (76, N'SPTransducerRangeLow')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (77, N'SPTransducerRangeHigh')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (78, N'TmpLowAlarmSetPoint')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (79, N'TmpHighAlarmSetPoint')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (80, N'TmpCalibratedRangeLow')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (81, N'TmpCalibratedRangeHigh')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (82, N'TmpTransducerRangeLow')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (83, N'TmpTransducerRangeHigh')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (84, N'FlowComputerID')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (85, N'MeterSerialNumber')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (86, N'FirstDeliveryDate')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (87, N'PowerSourceID')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (88, N'LiveAnalysis')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (89, N'LiveHeatingValue')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (90, N'LiveGravity')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (91, N'LiveTemperature')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (92, N'FittingTypeID')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (93, N'ContractHour')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (94, N'ContractDay')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (95, N'MeterAccessDate')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (96, N'ColdStartDate')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (97, N'WarmStartDate')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (98, N'HasRTD')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (99, N'UseRTD')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (100, N'Rotation')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (101, N'IsChart')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (102, N'SampleDate')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (103, N'SampleTypeID')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (104, N'HeatingValue')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (105, N'GasRelativeDensity')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (106, N'Viscosity')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (107, N'Kappa')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (108, N'Methane')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (109, N'Nitrogen')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (110, N'CarbonDioxide')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (111, N'Ethane')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (112, N'Propane')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (113, N'Water')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (114, N'HydrogenSulfide')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (115, N'Hydrogen')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (116, N'CarbonMonoxide')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (117, N'Oxygen')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (118, N'iButane')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (119, N'nButane')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (120, N'iPentane')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (121, N'nPentane')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (122, N'Hexane')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (123, N'Heptane')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (124, N'Octane')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (125, N'Nonane')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (126, N'Decane')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (127, N'Helium')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (128, N'Argon')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (129, N'Ethylene')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (130, N'Propylene')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (131, N'WaterContent')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (132, N'HydrogenSulfideContent')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (133, N'DifferentialPressureUnit')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (134, N'StaticPressureUnit')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (135, N'TemperatureUnit')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (136, N'RawVolumeUnit')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (137, N'MeasuredVolumeUnit')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (138, N'EnergyUnit')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (139, N'TemperatureBaseUnitID')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (140, N'GasPressureBaseUnitID')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (141, N'AtmosphericPressureUnitID')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (142, N'GasVolumeKFactorUnitID')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (143, N'LiquidVolumeKFactorUnitID')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (144, N'MassKFactorUnitID')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (145, N'BoreReferenceTemperatureUnitID')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (146, N'PipeReferenceTemperatureUnitID')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (147, N'BoreDiameterUnitID')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (148, N'PipeDiameterUnitID')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (149, N'VolumetricHeatingValueUnitID')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (150, N'ViscosityUnitID')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (151, N'MassHeatingValueUnitID')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (152, N'PipeLengthUnitID')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (153, N'MassUnitID')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (154, N'ObservedDensityUnitID')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (155, N'IndicatedVolumeUnitID')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (156, N'GrossVolumeUnitID')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (157, N'GrossStandardVolumeUnitID')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (158, N'NetStandardVolumeUnitID')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (159, N'UserCharacteristic01')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (160, N'UserCharacteristic02')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (161, N'UserCharacteristic03')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (162, N'UserCharacteristic04')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (163, N'UserCharacteristic05')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (164, N'UserCharacteristic06')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (165, N'UserCharacteristic07')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (166, N'UserCharacteristic08')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (167, N'UserCharacteristic09')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (168, N'UserCharacteristic10')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (169, N'UserCharacteristic11')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (170, N'UserCharacteristic12')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (171, N'UserCharacteristic13')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (172, N'UserCharacteristic14')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (173, N'UserCharacteristic15')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (174, N'UserCharacteristic16')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (175, N'UserCharacteristic17')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (176, N'UserCharacteristic18')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (177, N'UserCharacteristic19')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (178, N'UserCharacteristic20')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (179, N'UserCharacteristic21')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (180, N'UserCharacteristic22')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (181, N'UserCharacteristic23')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (182, N'UserCharacteristic24')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (183, N'UserCharacteristic25')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (184, N'UserCharacteristic26')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (185, N'UserCharacteristic27')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (186, N'UserCharacteristic28')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (187, N'UserCharacteristic29')
GO
INSERT [dbo].[MeterEventTypes] ([ID], [Name]) VALUES (188, N'UserCharacteristic30')
GO
INSERT [dbo].[MeterExceptionResolutionTypes] ([ID], [Name]) VALUES (1, N'Resolved By Late Data')
GO
INSERT [dbo].[MeterExceptionResolutionTypes] ([ID], [Name]) VALUES (2, N'Resolved By User')
GO
INSERT [dbo].[MeterExceptionResolutionTypes] ([ID], [Name]) VALUES (3, N'Resolved Be System')
GO
INSERT [dbo].[MeterExceptionResolutionTypes] ([ID], [Name]) VALUES (4, N'Ignored')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (5000, N'Volume Corrlation Factor Calculation Failure')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (20000, N'Elevation Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (20001, N'Latitude Degrees Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (20002, N'Latitude Minutes Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (20003, N'Latitude Seconds Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (20004, N'Atmospheric Pressure Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (20005, N'Acceleration Of Gravity Out Of Range ')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (20006, N'Base Pressure Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (20007, N'Base Temperature Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (31004, N'Natural Gas Two Phase Calculation Failure ')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (31010, N'Methane Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (31011, N'Nitrogen Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (31012, N'Carbon Dioxide Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (31013, N'Ethane Our Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (31014, N'Propane Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (31015, N'Water Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (31016, N'Hydrogen Sulfide Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (31017, N'Hydrogen Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (31018, N'Carbon Monoxide Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (31019, N'Oxygen Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (31020, N'iButane Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (31021, N'Butane Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (31022, N'iPentane Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (31023, N'Pentane Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (31024, N'Hexane Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (31025, N'Heptane Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (31026, N'Octane Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (31027, N'Nonane Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (31028, N'Decane Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (31029, N'Helium Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (31030, N'Argon Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (31100, N'User Specific Gravity Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (31101, N'Specific Gravity Reference Pressure Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (31102, N'Specific Gravity Reference Temperature Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (31103, N'Gross Heating Value Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (31104, N'Gross Heating Value Reference Pressure Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (31105, N'Gross Heating Value Reference Temperature Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (31106, N'Molar Density Reference Pressure Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (31107, N'Molar Density Reference Temperature Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (32003, N'Observed Density Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (32004, N'Base Density Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (32005, N'Flowing Density Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (32009, N'Observed Temperature Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (32010, N'Observed Pressure Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (40000, N'Meter Factor Smaller Than Minimum Allowed Value')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (40001, N'Flowing Pressure Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (40002, N'Flowing Tempurature Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (40003, N'Flowing Duration Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (40004, N'Isentropic Exponent Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (40005, N'Vapor Viscosity Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (40006, N'Liquid Viscosity Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (40007, N'Vapor Pressure Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (40008, N'Pipe Diameter Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (40009, N'Pipe Diamer Reference Temperature')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (41000, N'Differential Pressure Out Of Range')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (41001, N'Differential Pressure >= Upstream Pressure')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (41002, N'Bore Diameter >= Pipe Diameter')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (41100, N'Corner Taps Are Not Supported In AGA-3 (1985)')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (41101, N'Only Flange Taps Are Supported In AGA-3 (1990)')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (41102, N'Only Flange Taps Are Supported In AGA-3 (2012)')
GO
INSERT [dbo].[MeterExceptionTypes] ([ID], [Name]) VALUES (41700, N'Downstream Taps Are Not Supported By Restriction Orifice')
GO
INSERT [dbo].[MeterExportTypes] ([ID], [Name]) VALUES (1, N'CFX')
GO
INSERT [dbo].[MeterExportTypes] ([ID], [Name]) VALUES (2, N'CSV')
GO
INSERT [dbo].[MeterExportTypes] ([ID], [Name]) VALUES (3, N'JSON')
GO
INSERT [dbo].[MeterExportTypes] ([ID], [Name]) VALUES (4, N'XML')
GO
INSERT [dbo].[MeterPurposes] ([ID], [Name]) VALUES (1, N'Inlet')
GO
INSERT [dbo].[MeterPurposes] ([ID], [Name]) VALUES (2, N'Sales')
GO
INSERT [dbo].[MeterPurposes] ([ID], [Name]) VALUES (3, N'Fuel')
GO
INSERT [dbo].[MeterPurposes] ([ID], [Name]) VALUES (4, N'Flare')
GO
SET IDENTITY_INSERT [dbo].[MeterRuns] ON 
GO
INSERT [dbo].[MeterRuns] ([ID], [HierarchyID], [MeterTag], [MeterDescription], [LastPollDateTime], [LastExportDateTime], [MeterRunNumber], [CollectHourlyHistory], [CollectAlarms], [CollectEvents], [LastHourlyIndex], [LastEventIndex], [LastAlarmIndex], [AutoPollIsEnabled], [AutoPollOffsetDateTime], [AutoPollIntervalSeconds], [AutoPollLastRunDateTime], [MeterExportTypeID], [ExportIsEnabled], [ExportOffsetDateTime], [ExportIntervalSeconds], [ExportPrimaryFolder], [ExportArchiveFolder], [ExportLastRunDateTime], [DateTimeCreated]) VALUES (1, 76, NULL, NULL, CAST(N'2024-09-30T18:58:10.607' AS DateTime), CAST(N'2024-09-30T18:58:10.607' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-09-30T18:58:10.607' AS DateTime), NULL, CAST(N'2024-09-30T18:58:10.607' AS DateTime), NULL, NULL, CAST(N'2024-09-30T18:58:10.607' AS DateTime), NULL, NULL, NULL, CAST(N'2024-09-30T18:58:10.607' AS DateTime), CAST(N'2024-09-30T18:58:12.407' AS DateTime))
GO
INSERT [dbo].[MeterRuns] ([ID], [HierarchyID], [MeterTag], [MeterDescription], [LastPollDateTime], [LastExportDateTime], [MeterRunNumber], [CollectHourlyHistory], [CollectAlarms], [CollectEvents], [LastHourlyIndex], [LastEventIndex], [LastAlarmIndex], [AutoPollIsEnabled], [AutoPollOffsetDateTime], [AutoPollIntervalSeconds], [AutoPollLastRunDateTime], [MeterExportTypeID], [ExportIsEnabled], [ExportOffsetDateTime], [ExportIntervalSeconds], [ExportPrimaryFolder], [ExportArchiveFolder], [ExportLastRunDateTime], [DateTimeCreated]) VALUES (2, 77, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-09-30T19:00:59.743' AS DateTime))
GO
INSERT [dbo].[MeterRuns] ([ID], [HierarchyID], [MeterTag], [MeterDescription], [LastPollDateTime], [LastExportDateTime], [MeterRunNumber], [CollectHourlyHistory], [CollectAlarms], [CollectEvents], [LastHourlyIndex], [LastEventIndex], [LastAlarmIndex], [AutoPollIsEnabled], [AutoPollOffsetDateTime], [AutoPollIntervalSeconds], [AutoPollLastRunDateTime], [MeterExportTypeID], [ExportIsEnabled], [ExportOffsetDateTime], [ExportIntervalSeconds], [ExportPrimaryFolder], [ExportArchiveFolder], [ExportLastRunDateTime], [DateTimeCreated]) VALUES (3, 78, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-09-30T19:03:27.027' AS DateTime))
GO
INSERT [dbo].[MeterRuns] ([ID], [HierarchyID], [MeterTag], [MeterDescription], [LastPollDateTime], [LastExportDateTime], [MeterRunNumber], [CollectHourlyHistory], [CollectAlarms], [CollectEvents], [LastHourlyIndex], [LastEventIndex], [LastAlarmIndex], [AutoPollIsEnabled], [AutoPollOffsetDateTime], [AutoPollIntervalSeconds], [AutoPollLastRunDateTime], [MeterExportTypeID], [ExportIsEnabled], [ExportOffsetDateTime], [ExportIntervalSeconds], [ExportPrimaryFolder], [ExportArchiveFolder], [ExportLastRunDateTime], [DateTimeCreated]) VALUES (4, 79, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-09-30T19:33:47.510' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[MeterRuns] OFF
GO
INSERT [dbo].[MeterStandards] ([ID], [Name]) VALUES (5000, N'AGA-3 (1985)')
GO
INSERT [dbo].[MeterStandards] ([ID], [Name]) VALUES (5001, N'AGA-3 (1990)')
GO
INSERT [dbo].[MeterStandards] ([ID], [Name]) VALUES (5002, N'AGA-3 (2003)')
GO
INSERT [dbo].[MeterStandards] ([ID], [Name]) VALUES (5003, N'AGA-3 (2012)')
GO
INSERT [dbo].[MeterStandards] ([ID], [Name]) VALUES (5004, N'ISO5167 (1991)')
GO
INSERT [dbo].[MeterStandards] ([ID], [Name]) VALUES (5005, N'ISO5167 (1998)')
GO
INSERT [dbo].[MeterStandards] ([ID], [Name]) VALUES (5006, N'ISO 5167-2 (2003)')
GO
INSERT [dbo].[MeterStandards] ([ID], [Name]) VALUES (5007, N'ASME MFC-3M (1989)')
GO
INSERT [dbo].[MeterStandards] ([ID], [Name]) VALUES (5008, N'ASME MFC-3M (2004)')
GO
INSERT [dbo].[MeterStandards] ([ID], [Name]) VALUES (5009, N'Restriction Orifice ')
GO
INSERT [dbo].[MeterStandards] ([ID], [Name]) VALUES (5010, N'Nozzle Venturi ')
GO
INSERT [dbo].[MeterStandards] ([ID], [Name]) VALUES (5011, N'Cone ')
GO
INSERT [dbo].[MeterStandards] ([ID], [Name]) VALUES (5012, N'Coriolis ')
GO
INSERT [dbo].[MeterStandards] ([ID], [Name]) VALUES (5013, N'Magnetic ')
GO
INSERT [dbo].[MeterStandards] ([ID], [Name]) VALUES (5014, N'Positive Displacement ')
GO
INSERT [dbo].[MeterStandards] ([ID], [Name]) VALUES (5015, N'Turbine ')
GO
INSERT [dbo].[MeterStandards] ([ID], [Name]) VALUES (5016, N'Ultrasonic ')
GO
INSERT [dbo].[MeterStandards] ([ID], [Name]) VALUES (5099, N'Unknown')
GO
INSERT [dbo].[NodeTypes] ([ID], [Name]) VALUES (1, N'System')
GO
INSERT [dbo].[NodeTypes] ([ID], [Name]) VALUES (2, N'Company')
GO
INSERT [dbo].[NodeTypes] ([ID], [Name]) VALUES (3, N'District')
GO
INSERT [dbo].[NodeTypes] ([ID], [Name]) VALUES (4, N'Area')
GO
INSERT [dbo].[NodeTypes] ([ID], [Name]) VALUES (5, N'Field')
GO
INSERT [dbo].[NodeTypes] ([ID], [Name]) VALUES (6, N'Facility')
GO
INSERT [dbo].[NodeTypes] ([ID], [Name]) VALUES (7, N'Well')
GO
INSERT [dbo].[NodeTypes] ([ID], [Name]) VALUES (8, N'Equipment')
GO
INSERT [dbo].[NodeTypes] ([ID], [Name]) VALUES (9, N'Meter')
GO
INSERT [dbo].[NodeTypes] ([ID], [Name]) VALUES (10, N'Pump')
GO
INSERT [dbo].[NodeTypes] ([ID], [Name]) VALUES (11, N'Tank')
GO
INSERT [dbo].[NodeTypes] ([ID], [Name]) VALUES (12, N'Vessel')
GO
INSERT [dbo].[NodeTypes] ([ID], [Name]) VALUES (13, N'RunSheet')
GO
INSERT [dbo].[NodeTypes] ([ID], [Name]) VALUES (14, N'SerialPortChannel')
GO
INSERT [dbo].[NodeTypes] ([ID], [Name]) VALUES (15, N'IpChannel')
GO
INSERT [dbo].[NodeTypes] ([ID], [Name]) VALUES (16, N'Device')
GO
INSERT [dbo].[NodeTypes] ([ID], [Name]) VALUES (17, N'DigitalIoTag')
GO
INSERT [dbo].[NodeTypes] ([ID], [Name]) VALUES (18, N'AnalogIoTag')
GO
INSERT [dbo].[NodeTypes] ([ID], [Name]) VALUES (19, N'StringIoTag')
GO
INSERT [dbo].[NodeTypes] ([ID], [Name]) VALUES (20, N'ContextTag')
GO
INSERT [dbo].[NodeTypes] ([ID], [Name]) VALUES (21, N'MeterRun')
GO
INSERT [dbo].[NodeTypes] ([ID], [Name]) VALUES (22, N'Screen')
GO
INSERT [dbo].[NodeTypes] ([ID], [Name]) VALUES (23, N'Diagram')
GO
INSERT [dbo].[NodeTypes] ([ID], [Name]) VALUES (24, N'Document')
GO
INSERT [dbo].[NodeTypes] ([ID], [Name]) VALUES (25, N'Folder')
GO
INSERT [dbo].[NozzleTypes] ([ID], [Name]) VALUES (700, N'Cylindrical')
GO
INSERT [dbo].[NozzleTypes] ([ID], [Name]) VALUES (701, N'Long Radius Nozzle')
GO
INSERT [dbo].[NozzleTypes] ([ID], [Name]) VALUES (702, N'ISA 1932 Nozzle')
GO
INSERT [dbo].[NozzleTypes] ([ID], [Name]) VALUES (703, N'Venturi')
GO
INSERT [dbo].[NozzleTypes] ([ID], [Name]) VALUES (704, N'Toroidal')
GO
INSERT [dbo].[NozzleTypes] ([ID], [Name]) VALUES (705, N'Cast ')
GO
INSERT [dbo].[NozzleTypes] ([ID], [Name]) VALUES (706, N'Machined ')
GO
INSERT [dbo].[NozzleTypes] ([ID], [Name]) VALUES (707, N'Rough Welded ')
GO
INSERT [dbo].[NozzleTypes] ([ID], [Name]) VALUES (799, N'Unknown')
GO
INSERT [dbo].[PowerSources] ([ID], [Code], [Name]) VALUES (1, N'A', N'AC')
GO
INSERT [dbo].[PowerSources] ([ID], [Code], [Name]) VALUES (2, N'B', N'Battery')
GO
INSERT [dbo].[PowerSources] ([ID], [Code], [Name]) VALUES (3, N'S', N'Solar')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (1, N'OIL ', N'Crude Oil, Crude Bitumen ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (2, N'COND ', N'Condensate ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (3, N'GAS ', N'Gas ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (4, N'WATER ', N'Water ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (5, N'FSHWTR ', N'Fresh Water ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (6, N'C2-SP ', N'Ethane Spec ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (7, N'C3-SP ', N'Propane Spec  ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (8, N'C4-SP ', N'Butane Spec ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (9, N'NC4-SP ', N'Normal Butane Spec ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (10, N'IC4-SP ', N'Iso-Butane Spec ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (11, N'C5-SP ', N'Pentane Spec ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (12, N'NC5-SP ', N'Normal Pentane Spec ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (13, N'IC5-SP ', N'Iso-Pentane Spec ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (14, N'C6-SP ', N'Hexane Spec ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (15, N'C1-MX ', N'Methane Mix ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (16, N'C2-MX ', N'Ethane Mix ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (17, N'C3-MX ', N'Propane Mix ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (18, N'C4-MX ', N'Butane Mix ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (19, N'NC4-MX ', N'Normal Butane Mix ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (20, N'IC4-MX ', N'Iso-Butane Mix ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (21, N'C5-MX ', N'Pentane Mix ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (22, N'NC5-MX ', N'Normal Pentane Mix ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (23, N'IC5-MX ', N'Iso-Pentane Mix ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (24, N'C6-MX ', N'Hexane Mix ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (25, N'LITEMX ', N'Lite Mix ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (26, N'SUL ', N'Sulphur ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (27, N'SPRILL ', N'Sulphur – Prilled ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (28, N'SMOLT ', N'Sulphur – Molten ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (29, N'SBASE ', N'Sulphur – Basepad ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (30, N'SBLOC ', N'Sulphur – Block ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (31, N'SFORM ', N'Sulphur – Formed ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (32, N'SLATE ', N'Sulphur – Slate ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (33, N'SYNCRD ', N'Synthetic – Crude Oil ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (34, N'AIR ', N'Air ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (35, N'DIESEL ', N'Diesel Oil ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (36, N'O2 ', N'Oxygen ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (37, N'CO2 ', N'Carbon Dioxide ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (38, N'CO2-MX ', N'Carbon Dioxide Mix ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (39, N'N2 ', N'Nitrogen ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (40, N'ACGAS ', N'Acid Gas ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (41, N'SOLV ', N'Solvent ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (42, N'ENTGAS ', N'Entrained Gas ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (43, N'SAND ', N'Sand ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (44, N'STEAM ', N'Steam ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (45, N'BRKWTR ', N'Brackish Water  ')
GO
INSERT [dbo].[ProductTypes] ([ID], [Code], [Name]) VALUES (46, N'WASTE ', N'Waste ')
GO
INSERT [dbo].[PulseTypes] ([ID], [Name]) VALUES (900, N'Frequency ')
GO
INSERT [dbo].[PulseTypes] ([ID], [Name]) VALUES (901, N'Counts ')
GO
INSERT [dbo].[PulseTypes] ([ID], [Name]) VALUES (999, N'Unknown')
GO
INSERT [dbo].[PumpTypes] ([ID], [Name]) VALUES (1, N'Pumpjack')
GO
INSERT [dbo].[PumpTypes] ([ID], [Name]) VALUES (2, N'Injection Pump')
GO
INSERT [dbo].[PumpTypes] ([ID], [Name]) VALUES (3, N'Chemical Pump')
GO
INSERT [dbo].[PumpTypes] ([ID], [Name]) VALUES (4, N'Transfer Pump')
GO
INSERT [dbo].[ReferenceEquations] ([ID], [Name]) VALUES (3100, N'AGA-3 (2012)')
GO
INSERT [dbo].[ReferenceEquations] ([ID], [Name]) VALUES (3101, N'SOR 86131')
GO
INSERT [dbo].[ReferenceEquations] ([ID], [Name]) VALUES (3999, N'Unknown')
GO
INSERT [dbo].[SampleTypes] ([ID], [Code], [Name]) VALUES (1, N'C', N'Composite')
GO
INSERT [dbo].[SampleTypes] ([ID], [Code], [Name]) VALUES (2, N'O', N'Online')
GO
INSERT [dbo].[SampleTypes] ([ID], [Code], [Name]) VALUES (3, N'S', N'Spot')
GO
INSERT [dbo].[SaturationConditions] ([ID], [Code], [Name]) VALUES (1, N'A', N'As Delivered')
GO
INSERT [dbo].[SaturationConditions] ([ID], [Code], [Name]) VALUES (2, N'D', N'Dry')
GO
INSERT [dbo].[SaturationConditions] ([ID], [Code], [Name]) VALUES (3, N'W', N'Wet')
GO
SET IDENTITY_INSERT [dbo].[SerialPortChannels] ON 
GO
INSERT [dbo].[SerialPortChannels] ([ID], [HierarchyID], [Name], [PortName], [BaudRate], [DataBits], [Parity], [StopBits], [ReadTimeout], [WriteTimeout], [SerialChannelDisabled]) VALUES (2, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[SerialPortChannels] OFF
GO
INSERT [dbo].[SignalTypes] ([ID], [Name]) VALUES (1200, N'Milliamps ')
GO
INSERT [dbo].[SignalTypes] ([ID], [Name]) VALUES (1201, N'Volts ')
GO
INSERT [dbo].[SignalTypes] ([ID], [Name]) VALUES (1299, N'Unknown')
GO
INSERT [dbo].[StaticPressureMeasurements] ([ID], [Code], [Name]) VALUES (1, N'G', N'Gauge')
GO
INSERT [dbo].[StaticPressureMeasurements] ([ID], [Code], [Name]) VALUES (2, N'A', N'Absolute')
GO
INSERT [dbo].[StaticTapTypes] ([ID], [Name]) VALUES (600, N'Upstream ')
GO
INSERT [dbo].[StaticTapTypes] ([ID], [Name]) VALUES (601, N'Downstream ')
GO
INSERT [dbo].[StaticTapTypes] ([ID], [Name]) VALUES (699, N'Unknown ')
GO
SET IDENTITY_INSERT [dbo].[StringIoTags] ON 
GO
INSERT [dbo].[StringIoTags] ([ID], [HierarchyID], [ReadAddress], [ReadAddressScanInterval], [Length], [PaddingCharacter], [WriteAddress], [DateTimeCreated]) VALUES (1, 61, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-09-30T16:25:11.353' AS DateTime))
GO
INSERT [dbo].[StringIoTags] ([ID], [HierarchyID], [ReadAddress], [ReadAddressScanInterval], [Length], [PaddingCharacter], [WriteAddress], [DateTimeCreated]) VALUES (2, 62, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-09-30T16:25:17.507' AS DateTime))
GO
INSERT [dbo].[StringIoTags] ([ID], [HierarchyID], [ReadAddress], [ReadAddressScanInterval], [Length], [PaddingCharacter], [WriteAddress], [DateTimeCreated]) VALUES (3, 66, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-09-30T16:25:59.520' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[StringIoTags] OFF
GO
INSERT [dbo].[TankTypes] ([ID], [Name]) VALUES (0, N'Unknown')
GO
INSERT [dbo].[TankTypes] ([ID], [Name]) VALUES (1, N'Upright Cylindrical Lease Tank (Open,Close,Transferred Quantity)')
GO
INSERT [dbo].[TankTypes] ([ID], [Name]) VALUES (2, N'Upright Cylindrical Storage Tank (Inventory Level Only)')
GO
INSERT [dbo].[TankTypes] ([ID], [Name]) VALUES (3, N'Rail Car')
GO
INSERT [dbo].[TankTypes] ([ID], [Name]) VALUES (4, N'Marine Vessel')
GO
INSERT [dbo].[TankTypes] ([ID], [Name]) VALUES (5, N'Horizontal (bullet)')
GO
INSERT [dbo].[TankTypes] ([ID], [Name]) VALUES (6, N'Sphere')
GO
INSERT [dbo].[TapTypes] ([ID], [Name]) VALUES (500, N'Corner')
GO
INSERT [dbo].[TapTypes] ([ID], [Name]) VALUES (501, N'Flange')
GO
INSERT [dbo].[TapTypes] ([ID], [Name]) VALUES (502, N'Radius ')
GO
INSERT [dbo].[TapTypes] ([ID], [Name]) VALUES (599, N'Unknown ')
GO
INSERT [dbo].[TicketComponentBases] ([ID], [Code], [Name]) VALUES (1, N'M', N'Mole')
GO
INSERT [dbo].[TicketComponentBases] ([ID], [Code], [Name]) VALUES (2, N'W', N'Weight')
GO
INSERT [dbo].[TicketComponentBases] ([ID], [Code], [Name]) VALUES (3, N'V', N'Liquid Volume')
GO
INSERT [dbo].[TicketDeviceTypes] ([ID], [Code], [Name], [Description]) VALUES (1, N'M', N'Meter', N'Not used, will treat as standalone')
GO
INSERT [dbo].[TicketDeviceTypes] ([ID], [Code], [Name], [Description]) VALUES (2, N'L', N'Location', NULL)
GO
INSERT [dbo].[TicketDeviceTypes] ([ID], [Code], [Name], [Description]) VALUES (3, N'S', N'Scale', N'Not used, will treat as standalone')
GO
INSERT [dbo].[TicketDeviceTypes] ([ID], [Code], [Name], [Description]) VALUES (4, N'T', N'Tank', N'Open, Close, Transferred Quanitity')
GO
INSERT [dbo].[TicketDeviceTypes] ([ID], [Code], [Name], [Description]) VALUES (5, N'V', N'Inventory', N'Tank inventory level only')
GO
INSERT [dbo].[TicketMeterCalculationMethods] ([ID], [Code], [Name]) VALUES (1, N'A', N'Linear Volumetric (API 12.2)')
GO
INSERT [dbo].[TicketMeterCalculationMethods] ([ID], [Code], [Name]) VALUES (2, N'B', N'Linear Inferred Mass (API 14.7)')
GO
INSERT [dbo].[TicketMeterCalculationMethods] ([ID], [Code], [Name]) VALUES (3, N'D', N'Linear Direct Mass')
GO
INSERT [dbo].[TicketMeterCalculationMethods] ([ID], [Code], [Name]) VALUES (4, N'E', N'Data Only')
GO
INSERT [dbo].[TicketTankCalculationStandards] ([ID], [Code], [Name]) VALUES (1, N'A', N'API 12.1.1 (2001)')
GO
INSERT [dbo].[TicketTankCalculationStandards] ([ID], [Code], [Name]) VALUES (2, N'B', N'API 12.1.1 (2011)')
GO
INSERT [dbo].[TicketTankCustodyTransferCalculationMethods] ([ID], [Name]) VALUES (1, N'A-1 Tank with Automatic Sampler')
GO
INSERT [dbo].[TicketTankCustodyTransferCalculationMethods] ([ID], [Name]) VALUES (2, N'A-2 Tank with Individual Tank Samples')
GO
INSERT [dbo].[TicketTankLevelTypes] ([ID], [Name]) VALUES (1, N'Innage; The depth of the liquid from the bottom or reference point')
GO
INSERT [dbo].[TicketTankLevelTypes] ([ID], [Name]) VALUES (2, N'Ullage (Outage); The height from the liquid surface to the top of the tank or reference point')
GO
INSERT [dbo].[TicketTankShellMaterials] ([ID], [Code], [Name]) VALUES (1, N'D', N'Mild Carbon')
GO
INSERT [dbo].[TicketTankShellMaterials] ([ID], [Code], [Name]) VALUES (2, N'4', N'304 Stainless Steel')
GO
INSERT [dbo].[TicketTankShellMaterials] ([ID], [Code], [Name]) VALUES (3, N'6', N'316 Stainless Steel')
GO
INSERT [dbo].[TicketTankShellMaterials] ([ID], [Code], [Name]) VALUES (4, N'7', N'17-4PH Stainless')
GO
INSERT [dbo].[TurbineRotorModes] ([ID], [Name]) VALUES (1300, N'Main Rotor Only ')
GO
INSERT [dbo].[TurbineRotorModes] ([ID], [Name]) VALUES (1301, N'With Sensing Rotor ')
GO
INSERT [dbo].[TurbineRotorModes] ([ID], [Name]) VALUES (1399, N'Unknown')
GO
INSERT [dbo].[UnitClasses] ([ID], [Name]) VALUES (1, N'Absorbed Dose')
GO
INSERT [dbo].[UnitClasses] ([ID], [Name]) VALUES (2, N'Acceleration')
GO
INSERT [dbo].[UnitClasses] ([ID], [Name]) VALUES (3, N'Angle')
GO
INSERT [dbo].[UnitClasses] ([ID], [Name]) VALUES (4, N'Angular Velocity')
GO
INSERT [dbo].[UnitClasses] ([ID], [Name]) VALUES (5, N'Area')
GO
INSERT [dbo].[UnitClasses] ([ID], [Name]) VALUES (6, N'Capacitance')
GO
INSERT [dbo].[UnitClasses] ([ID], [Name]) VALUES (7, N'Charge')
GO
INSERT [dbo].[UnitClasses] ([ID], [Name]) VALUES (8, N'Concentration Molar')
GO
INSERT [dbo].[UnitClasses] ([ID], [Name]) VALUES (9, N'Current')
GO
INSERT [dbo].[UnitClasses] ([ID], [Name]) VALUES (10, N'Data')
GO
INSERT [dbo].[UnitClasses] ([ID], [Name]) VALUES (11, N'Data Transfer')
GO
INSERT [dbo].[UnitClasses] ([ID], [Name]) VALUES (12, N'Density')
GO
INSERT [dbo].[UnitClasses] ([ID], [Name]) VALUES (13, N'Digital Image Resolution')
GO
INSERT [dbo].[UnitClasses] ([ID], [Name]) VALUES (14, N'Energy')
GO
INSERT [dbo].[UnitClasses] ([ID], [Name]) VALUES (15, N'EU Currency')
GO
INSERT [dbo].[UnitClasses] ([ID], [Name]) VALUES (16, N'Flow Mass')
GO
INSERT [dbo].[UnitClasses] ([ID], [Name]) VALUES (17, N'Flow Molar')
GO
INSERT [dbo].[UnitClasses] ([ID], [Name]) VALUES (18, N'Flow Volumetric')
GO
INSERT [dbo].[UnitClasses] ([ID], [Name]) VALUES (19, N'Force')
GO
INSERT [dbo].[UnitClasses] ([ID], [Name]) VALUES (20, N'Frequency Wavelength')
GO
INSERT [dbo].[UnitClasses] ([ID], [Name]) VALUES (21, N'Fuel Consumption')
GO
INSERT [dbo].[UnitClasses] ([ID], [Name]) VALUES (22, N'Illumination')
GO
INSERT [dbo].[UnitClasses] ([ID], [Name]) VALUES (23, N'Inductance')
GO
INSERT [dbo].[UnitClasses] ([ID], [Name]) VALUES (24, N'Length')
GO
INSERT [dbo].[UnitClasses] ([ID], [Name]) VALUES (25, N'Lumber Volume')
GO
INSERT [dbo].[UnitClasses] ([ID], [Name]) VALUES (26, N'Mass')
GO
INSERT [dbo].[UnitClasses] ([ID], [Name]) VALUES (27, N'Permeability')
GO
INSERT [dbo].[UnitClasses] ([ID], [Name]) VALUES (28, N'Power')
GO
INSERT [dbo].[UnitClasses] ([ID], [Name]) VALUES (29, N'Pressure')
GO
INSERT [dbo].[UnitClasses] ([ID], [Name]) VALUES (30, N'Radiation')
GO
INSERT [dbo].[UnitClasses] ([ID], [Name]) VALUES (31, N'Telecommunications')
GO
INSERT [dbo].[UnitClasses] ([ID], [Name]) VALUES (32, N'Temperature')
GO
INSERT [dbo].[UnitClasses] ([ID], [Name]) VALUES (33, N'Time')
GO
INSERT [dbo].[UnitClasses] ([ID], [Name]) VALUES (34, N'Torque')
GO
INSERT [dbo].[UnitClasses] ([ID], [Name]) VALUES (35, N'Typography')
GO
INSERT [dbo].[UnitClasses] ([ID], [Name]) VALUES (36, N'Velocity')
GO
INSERT [dbo].[UnitClasses] ([ID], [Name]) VALUES (37, N'Viscosity Dynamic')
GO
INSERT [dbo].[UnitClasses] ([ID], [Name]) VALUES (38, N'Viscosity Kinematic')
GO
INSERT [dbo].[UnitClasses] ([ID], [Name]) VALUES (39, N'Volume')
GO
INSERT [dbo].[UnitFormulaTypes] ([ID], [Name]) VALUES (0, N'factor')
GO
INSERT [dbo].[UnitFormulaTypes] ([ID], [Name]) VALUES (1, N'formula')
GO
INSERT [dbo].[UnitFormulaTypes] ([ID], [Name]) VALUES (2, N'add')
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (1000, N'Gray', N'Gy', N'1.0', NULL, NULL, 0, 1)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (1001, N'yottagray', N'YGy', N'1E24', NULL, 1000, 0, 1)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (1002, N'zettagray', N'ZGy', N'1E21', NULL, 1000, 0, 1)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (1003, N'exagray', N'EGy', N'1E18', NULL, 1000, 0, 1)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (1004, N'petagray', N'PGy', N'1E15', NULL, 1000, 0, 1)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (1005, N'teragray', N'TGy', N'1E12', NULL, 1000, 0, 1)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (1006, N'gigagray', N'GGy', N'1E9', NULL, 1000, 0, 1)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (1007, N'megagray', N'MGy', N'1E6', NULL, 1000, 0, 1)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (1008, N'kilogray', N'kGy', N'1E3', NULL, 1000, 0, 1)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (1009, N'hectogray', N'hGy', N'100.0', NULL, 1000, 0, 1)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (1010, N'dekagray', N'daGy', N'10.0', NULL, 1000, 0, 1)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (1011, N'decigray', N'dGy', N'0.1', NULL, 1000, 0, 1)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (1012, N'centigray', N'cGy', N'0.01', NULL, 1000, 0, 1)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (1013, N'milligray', N'mGy', N'0.001', NULL, 1000, 0, 1)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (1014, N'microgray', N'µGy', N'1E-6', NULL, 1000, 0, 1)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (1015, N'nanogray', N'nGy', N'1E-9', NULL, 1000, 0, 1)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (1016, N'picogray', N'pGy', N'1E-12', NULL, 1000, 0, 1)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (1017, N'femtogray', N'fGy', N'1E-15', NULL, 1000, 0, 1)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (1018, N'attogray', N'aGy', N'1E-18', NULL, 1000, 0, 1)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (1019, N'zeptogray', N'zGy', N'1E-21', NULL, 1000, 0, 1)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (1020, N'yoctogray', N'yGy', N'1E-24', NULL, 1000, 0, 1)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (1021, N'rad', N'rd', N'0.01', NULL, 1000, 0, 1)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (1022, N'joule per kilogram', N'J/kg', N'1.0', NULL, 1000, 0, 1)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (1023, N'joule per gram', N'J/g', N'1000.0', NULL, 1000, 0, 1)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (1024, N'joule per centigram', N'J/cm', N'100000.0', NULL, 1000, 0, 1)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (1025, N'joule per milligram', N'J/mg', N'1000000.0', NULL, 1000, 0, 1)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (2000, N'meters per second squared', N'm/s²', N'1.0', NULL, NULL, 0, 2)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (2001, N'yottametres per second squared', N'Ym/s²', N'1E24', NULL, 2000, 0, 2)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (2002, N'zettametres per second squared', N'Zm/s²', N'1E21', NULL, 2000, 0, 2)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (2003, N'exametres per second squared', N'Em/s²', N'1E18', NULL, 2000, 0, 2)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (2004, N'petametres per second squared', N'Pm/s²', N'1E15', NULL, 2000, 0, 2)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (2005, N'terametres per second squared', N'Tm/s²', N'1E12', NULL, 2000, 0, 2)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (2006, N'gigametres per second squared', N'Gm/s²', N'1E9', NULL, 2000, 0, 2)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (2007, N'megametres per second squared', N'Mm/s²', N'1E6', NULL, 2000, 0, 2)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (2008, N'kilometres per second squared', N'km/s²', N'1E3', NULL, 2000, 0, 2)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (2009, N'hectmetres per second squared', N'hm/s²', N'1E2', NULL, 2000, 0, 2)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (2010, N'dekametres per second squared', N'dam/s²', N'10.0', NULL, 2000, 0, 2)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (2011, N'decimetres per second squared', N'dm/s²', N'0.1', NULL, 2000, 0, 2)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (2012, N'centimetres per second squared', N'cm/s²', N'0.01', NULL, 2000, 0, 2)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (2013, N'millimetres per second squared', N'mm/s²', N'0.001', NULL, 2000, 0, 2)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (2014, N'micrometres per second squared', N'µm/s²', N'1E-6', NULL, 2000, 0, 2)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (2015, N'nanometres per second squared', N'nm/s²', N'1E-9', NULL, 2000, 0, 2)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (2016, N'picometres per second squared', N'pm/s²', N'1E-12', NULL, 2000, 0, 2)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (2017, N'femtometres per second squared', N'fm/s²', N'1E-15', NULL, 2000, 0, 2)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (2018, N'attometres per second squared', N'am/s²', N'1E-18', NULL, 2000, 0, 2)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (2019, N'zeptometres per second squared', N'zm/s²', N'1E-21', NULL, 2000, 0, 2)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (2020, N'yoctometres per second squared', N'ym/s²', N'1E-24', NULL, 2000, 0, 2)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (2021, N'galileo', N'gal', N'0.01', NULL, 2000, 0, 2)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (2022, N'gravity', N'g', N'9.80665', NULL, 2000, 0, 2)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (2023, N'inches per second squared', N'in/s²', N'0.0254', NULL, 2000, 0, 2)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (2024, N'feet per second squared', N'ft/s²', N'0.3048', NULL, 2000, 0, 2)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (2025, N'yards per second squared', N'yd/s²', N'0.9144', NULL, 2000, 0, 2)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (2026, N'miles per second squared', N'mi/s²', N'1609.344', NULL, 2000, 0, 2)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (3000, N'degrees', N'°', N'1.0', NULL, NULL, 0, 3)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (3001, N'radians', N'rad', N'57.29577951', NULL, 3000, 0, 3)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (3002, N'gradians', N'grad', N'0.9', NULL, 3000, 0, 3)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (3003, N'revolution', N'rev', N'360.0', NULL, 3000, 0, 3)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (3004, N'minute', N'min', N'0.0166666666666667', NULL, 3000, 0, 3)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (3005, N'second', N'sec', N'0.000277777777777778', NULL, 3000, 0, 3)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (3006, N'mil', N'mil', N'0.05625', NULL, 3000, 0, 3)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (4000, N'radians per second', N'rad/s', N'1.0', NULL, NULL, 0, 4)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (4001, N'radians per minute', N'rad/min', N'0.0166666666666667', NULL, 4000, 0, 4)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (4002, N'radians per hour', N'rad/h', N'0.0002777777777778', NULL, 4000, 0, 4)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (4003, N'radians per day', N'rad/d', N'1.15740740740741E-5', NULL, 4000, 0, 4)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (4004, N'degrees per second', N'deg/s', N'0.01745329252', NULL, 4000, 0, 4)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (4005, N'degrees per minute', N'deg/min', N'0.000290888208666667', NULL, 4000, 0, 4)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (4006, N'degrees per hour', N'deg/h', N'4.84813681111111E-6', NULL, 4000, 0, 4)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (4007, N'degrees per day', N'deg/d', N'2.02005700462963E-7', NULL, 4000, 0, 4)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (4008, N'revolutions per second', N'rps', N'6.283185307', NULL, 4000, 0, 4)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (4009, N'revolutions per minute', N'rpm', N'0.104719755116667', NULL, 4000, 0, 4)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (4010, N'revolutions per hour', N'rph', N'0.00174532925194444', NULL, 4000, 0, 4)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (4011, N'revolutions per day', N'rpd', N'7.27220521643519E-5', NULL, 4000, 0, 4)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (5000, N'square meters', N'm²', N'1.0', NULL, NULL, 0, 5)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (5001, N'square nanometre', N'nm²', N'1E-18', NULL, 5000, 0, 5)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (5002, N'square micrometre', N'µm²', N'1E-12', NULL, 5000, 0, 5)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (5003, N'square millimetre', N'mm²', N'1E-6', NULL, 5000, 0, 5)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (5004, N'square centimetre', N'cm²', N'0.0001', NULL, 5000, 0, 5)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (5005, N'square decimetre', N'dm²', N'0.01', NULL, 5000, 0, 5)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (5006, N'square decametre', N'dam²', N'100', NULL, 5000, 0, 5)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (5007, N'square hectometre', N'hm²', N'1E4', NULL, 5000, 0, 5)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (5008, N'square kilometre', N'km²', N'1E6', NULL, 5000, 0, 5)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (5009, N'are', N'A', N'100.0', NULL, 5000, 0, 5)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (5010, N'hectares', N'ha', N'10000.0', NULL, 5000, 0, 5)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (5011, N'square yard', N'yd²', N'0.83612736', NULL, 5000, 0, 5)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (5012, N'square foot', N'ft²', N'0.09290304', NULL, 5000, 0, 5)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (5013, N'square inch', N'in²', N'0.00064516', NULL, 5000, 0, 5)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (5014, N'square mile', N'mi²', N'2589988.11', NULL, 5000, 0, 5)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (5015, N'acre', N'acre', N'4046.856422', NULL, 5000, 0, 5)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (5016, N'cuerda', N'cda', N'3930.395625', NULL, 5000, 0, 5)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (5017, N'varas castellanas cuad', N'-', N'0.698737', NULL, 5000, 0, 5)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (5018, N'varas conuqueras cuad', N'-', N'6.288633', NULL, 5000, 0, 5)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (5019, N'barn', N'barn', N'1E-28', NULL, 5000, 0, 5)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (5020, N'square chain', N'ch²', N'404.6856422', NULL, 5000, 0, 5)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (5021, N'square perch', N'perch²', N'25.29285264', NULL, 5000, 0, 5)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (5022, N'square pole', N'pole²', N'25.29285264', NULL, 5000, 0, 5)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (5023, N'square rod', N'rd²', N'25.29285264', NULL, 5000, 0, 5)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (5024, N'rood', N'rood', N'1011.714106', NULL, 5000, 0, 5)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (5025, N'section', N'sec', N'2589988.11', NULL, 5000, 0, 5)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (5026, N'township', N'twn', N'93239571.97', NULL, 5000, 0, 5)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (5027, N'plaza', N'-', N'6400.0', NULL, 5000, 0, 5)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (6000, N'Farad', N'F', N'1.0', NULL, NULL, 0, 6)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (6001, N'yottafarad', N'YF', N'1E24', NULL, 6000, 0, 6)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (6002, N'zettafarad', N'ZF', N'1E21', NULL, 6000, 0, 6)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (6003, N'exafarad', N'EF', N'1E18', NULL, 6000, 0, 6)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (6004, N'petafarad', N'PF', N'1E15', NULL, 6000, 0, 6)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (6005, N'terafarad', N'TF', N'1E12', NULL, 6000, 0, 6)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (6006, N'gigafarad', N'GF', N'1E9', NULL, 6000, 0, 6)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (6007, N'megafarad', N'MF', N'1E6', NULL, 6000, 0, 6)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (6008, N'kilofarad', N'kF', N'1000.0', NULL, 6000, 0, 6)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (6009, N'hectofarad', N'hF', N'100.0', NULL, 6000, 0, 6)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (6010, N'dekafarad', N'daF', N'10.0', NULL, 6000, 0, 6)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (6011, N'decifarad', N'dF', N'0.1', NULL, 6000, 0, 6)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (6012, N'centifarad', N'cF', N'0.01', NULL, 6000, 0, 6)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (6013, N'millifarad', N'mF', N'0.001', NULL, 6000, 0, 6)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (6014, N'microfarad', N'µF', N'1E-6', NULL, 6000, 0, 6)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (6015, N'nanofarad', N'nF', N'1E-9', NULL, 6000, 0, 6)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (6016, N'picofarad', N'pF', N'1E-12', NULL, 6000, 0, 6)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (6017, N'femtofarad', N'fF', N'1E-15', NULL, 6000, 0, 6)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (6018, N'attofarad', N'aF', N'1E-18', NULL, 6000, 0, 6)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (6019, N'zeptofarad', N'zF', N'1E-21', NULL, 6000, 0, 6)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (6020, N'yoctofarad', N'yF', N'1E-24', NULL, 6000, 0, 6)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (7000, N'Coulomb', N'Cb', N'1.0', NULL, NULL, 0, 7)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (7001, N'yottacoulomb', N'YC', N'1E24', NULL, 7000, 0, 7)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (7002, N'zettacoulomb', N'ZC', N'1E21', NULL, 7000, 0, 7)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (7003, N'exacoulomb', N'EC', N'1E18', NULL, 7000, 0, 7)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (7004, N'petacoulomb', N'PC', N'1E15', NULL, 7000, 0, 7)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (7005, N'teracoulomb', N'TC', N'1E12', NULL, 7000, 0, 7)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (7006, N'gigacoulomb', N'GC', N'1E9', NULL, 7000, 0, 7)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (7007, N'megacoulomb', N'MC', N'1E6', NULL, 7000, 0, 7)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (7008, N'kilocoulomb', N'kC', N'1000.0', NULL, 7000, 0, 7)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (7009, N'millicoulomb', N'mC', N'1E-3', NULL, 7000, 0, 7)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (7010, N'microcoulomb', N'µC', N'1E-6', NULL, 7000, 0, 7)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (7011, N'nanocoulomb', N'nC', N'1E-9', NULL, 7000, 0, 7)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (7012, N'picocoulomb', N'pC', N'1E-12', NULL, 7000, 0, 7)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (7013, N'femtocoulomb', N'fC', N'1E-15', NULL, 7000, 0, 7)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (7014, N'attocoulomb', N'aC', N'1E-18', NULL, 7000, 0, 7)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (7015, N'zeptocoulomb', N'zC', N'1E-21', NULL, 7000, 0, 7)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (7016, N'yoctocoulomb', N'yC', N'1E-24', NULL, 7000, 0, 7)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (7017, N'abcoulomb', N'abCb', N'10.0', NULL, 7000, 0, 7)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (7018, N'Ampere hour', N'A·h', N'3600.0', NULL, 7000, 0, 7)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (7019, N'Ampere minute', N'A·min', N'60.0', NULL, 7000, 0, 7)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (7020, N'Ampere second', N'A·s', N'1.0', NULL, 7000, 0, 7)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (7021, N'Faraday (carbon 12 based)', N'F', N'96485.31', NULL, 7000, 0, 7)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (7022, N'millifaraday (carbon 12 based)', N'mF', N'96.48531', NULL, 7000, 0, 7)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (7023, N'microfaraday (carbon 12 based)', N'µF', N'0.09648531', NULL, 7000, 0, 7)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (7024, N'nanofaraday (carbon 12 based)', N'nF', N'9.648531E-5', NULL, 7000, 0, 7)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (7025, N'picofaraday (carbon 12 based)', N'pF', N'9.648531E-8', NULL, 7000, 0, 7)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (7026, N'Franklin', N'fr', N'3.335641E-10', NULL, 7000, 0, 7)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (7027, N'statcoulomb', N'sCb', N'3.335641E-10', NULL, 7000, 0, 7)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (8000, N'moles per litre', N'mol/l', N'1.0', NULL, NULL, 0, 8)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (8001, N'moles per metre cubed', N'mol/m³', N'0.001', NULL, 8000, 0, 8)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (8002, N'moles per centimetre cubed', N'mol/cm³', N'1E-5', NULL, 8000, 0, 8)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (8003, N'moles per milimetre cubed', N'mol/mm³', N'1E-6', NULL, 8000, 0, 8)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (8004, N'kilomoles per litre', N'kmol/l', N'1000.0', NULL, 8000, 0, 8)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (8005, N'kilomoles per metre cubed', N'kmol/m³', N'1.0', NULL, 8000, 0, 8)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (8006, N'kilomoles per centimetre cubed', N'kmol/cm³', N'0.01', NULL, 8000, 0, 8)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (8007, N'kilomoles per milimetre cubed', N'kmol/mm³', N'0.001', NULL, 8000, 0, 8)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (8008, N'millimoles per litre', N'mmol/l', N'0.001', NULL, 8000, 0, 8)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (8009, N'millimoles per metre cubed', N'mmol/m³', N'1E-6', NULL, 8000, 0, 8)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (8010, N'millimoles per centimetre cubed', N'mmol/cm³', N'1E-8', NULL, 8000, 0, 8)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (8011, N'millimoles per milimetre cubed', N'mmol/mm³', N'1E-9', NULL, 8000, 0, 8)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (9000, N'Ampere', N'A', N'1.0', NULL, NULL, 0, 9)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (9001, N'kiloampere', N'kA', N'1000.0', NULL, 9000, 0, 9)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (9002, N'miliampere', N'mA', N'0.001', NULL, 9000, 0, 9)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (9003, N'biot', N'Bi', N'10.0', NULL, 9000, 0, 9)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (9004, N'gilbert', N'Gi', N'0.7957747', NULL, 9000, 0, 9)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (9005, N'ESU of current (statampere)', N'-', N'3.335641E-10', NULL, 9000, 0, 9)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (9006, N'EMU of current (abampere)', N'-', N'10.0', NULL, 9000, 0, 9)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (9007, N'statampere', N'-', N'3.335641E-10', NULL, 9000, 0, 9)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (9008, N'abampere', N'-', N'10.0', NULL, 9000, 0, 9)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (10000, N'Bit', N'b', N'1.0', NULL, NULL, 0, 10)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (10001, N'nibble', N'nb', N'4.0', NULL, 10000, 0, 10)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (10002, N'Byte', N'B', N'8.0', NULL, 10000, 0, 10)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (10003, N'double word', N'dword', N'32.0', NULL, 10000, 0, 10)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (10004, N'word', N'w', N'16.0', NULL, 10000, 0, 10)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (10005, N'block', N'blk', N'4096.0', NULL, 10000, 0, 10)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (10006, N'kilobit', N'kb', N'1024.0', NULL, 10000, 0, 10)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (10007, N'kilobit (by SI def.)', N'kb(SI)', N'1E3', NULL, 10000, 0, 10)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (10008, N'megabit', N'Mb', N'1048576.0', NULL, 10000, 0, 10)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (10009, N'megabit (by SI def.)', N'Mb(SI)', N'1E6', NULL, 10000, 0, 10)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (10010, N'gigabit', N'Gb', N'1073741824.0', NULL, 10000, 0, 10)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (10011, N'gigabit (by SI def.)', N'Gb(SI)', N'1E9', NULL, 10000, 0, 10)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (10012, N'terabit', N'Tb', N'1099511627776.0', NULL, 10000, 0, 10)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (10013, N'terabit (by SI def.)', N'Tb(SI)', N'1E12', NULL, 10000, 0, 10)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (10014, N'kilobyte', N'kB', N'8192.0', NULL, 10000, 0, 10)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (10015, N'kilobyte (by SI def.)', N'kB(SI)', N'8E3', NULL, 10000, 0, 10)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (10016, N'megabyte', N'MB', N'8388608.0', NULL, 10000, 0, 10)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (10017, N'megabyte (by SI def.)', N'MB(SI)', N'8E6', NULL, 10000, 0, 10)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (10018, N'gigabyte', N'GB', N'8589934592.0', NULL, 10000, 0, 10)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (10019, N'gigabyte (by SI def.)', N'GB(SI)', N'8E9', NULL, 10000, 0, 10)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (10020, N'terabyte', N'TB', N'8796093022208.0', NULL, 10000, 0, 10)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (10021, N'terabyte (by SI def.)', N'TB(SI)', N'8E12', NULL, 10000, 0, 10)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (11000, N'bits per second', N'bps', N'1.0', NULL, NULL, 0, 11)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (11001, N'kilobits per second (by SI def.)', N'kbps(SI)', N'1E3', NULL, 11000, 0, 11)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (11002, N'kilobits per second', N'kbps', N'1024.0', NULL, 11000, 0, 11)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (11003, N'megabits per second (by SI def.)', N'Mbps(SI)', N'1E6', NULL, 11000, 0, 11)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (11004, N'megabits per second', N'Mbps', N'1048576.0', NULL, 11000, 0, 11)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (11005, N'gigabits per second (by SI def.)', N'Gbps(SI)', N'1E9', NULL, 11000, 0, 11)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (11006, N'gigabits per second', N'Gbps', N'1073741824.0', NULL, 11000, 0, 11)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (11007, N'terabits per second (by SI def.)', N'Tbps(SI)', N'1E12', NULL, 11000, 0, 11)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (11008, N'terabits per second', N'Tbps', N'1099511627776.0', NULL, 11000, 0, 11)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (11009, N'bytes per second', N'Bps', N'8.0', NULL, 11000, 0, 11)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (11010, N'kilobytes per second (by SI def.)', N'kBps(SI)', N'8000.0', NULL, 11000, 0, 11)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (11011, N'kilobytes per second', N'kB', N'8192.0', NULL, 11000, 0, 11)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (11012, N'megabytes per second (by SI def.)', N'MBps(SI)', N'8000000.0', NULL, 11000, 0, 11)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (11013, N'megabytes per second', N'MB', N'8388608.0', NULL, 11000, 0, 11)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (11014, N'gigabytes per second (by SI def.)', N'GBps(SI)', N'8000000000.0', NULL, 11000, 0, 11)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (11015, N'gigabytes per second', N'GBps', N'8589934592.0', NULL, 11000, 0, 11)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (11016, N'terabytes per second (by SI def.)', N'TBps(SI)', N'8000000000000.0', NULL, 11000, 0, 11)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (11017, N'terabytes per second', N'TBps', N'8796093022208.0', NULL, 11000, 0, 11)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (12000, N'grams per litre', N'g/l', N'1.0', NULL, NULL, 0, 12)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (12001, N'grams per metre cubed', N'g/m³', N'0.0010', NULL, 12000, 0, 12)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (12002, N'grams per centimetre cubed', N'g/cm³', N'1E-5', NULL, 12000, 0, 12)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (12003, N'grams per milimetre cubed', N'g/mm³', N'1E-6', NULL, 12000, 0, 12)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (12004, N'kilograms per metre cubed', N'kg/m³', N'1.0', NULL, 12000, 0, 12)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (12005, N'kilograms per centimetre cubed', N'kg/cm³', N'0.01', NULL, 12000, 0, 12)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (12006, N'kilograms per millimetre cubed', N'kg/mm³', N'0.001', NULL, 12000, 0, 12)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (12007, N'milligrams per metre cubed', N'mg/m³', N'1E-6', NULL, 12000, 0, 12)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (12008, N'milligrams per centimetre cubed', N'mg/cm³', N'1E-8', NULL, 12000, 0, 12)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (12009, N'milligrams per milimetre cubed', N'mg/mm³', N'1E-9', NULL, 12000, 0, 12)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (12010, N'yottagrams per litre', N'Yg/l', N'1E24', NULL, 12000, 0, 12)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (12011, N'zettagrams per litre', N'Zg/l', N'1E21', NULL, 12000, 0, 12)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (12012, N'exagrams per litre', N'Eg/l', N'1E18', NULL, 12000, 0, 12)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (12013, N'petagrams per litre', N'Pg/l', N'1E15', NULL, 12000, 0, 12)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (12014, N'teragrams per litre', N'Tg/l', N'1E12', NULL, 12000, 0, 12)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (12015, N'gigagrams per litre', N'Gg/l', N'1E9', NULL, 12000, 0, 12)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (12016, N'megagrams per litre', N'Mg/l', N'1E6', NULL, 12000, 0, 12)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (12017, N'kilograms per litre', N'kg/l', N'1000.0', NULL, 12000, 0, 12)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (12018, N'hectograms per litre', N'hg/l', N'100.0', NULL, 12000, 0, 12)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (12019, N'dekagrams per litre', N'dag/l', N'10.0', NULL, 12000, 0, 12)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (12020, N'decigrams per litre', N'dg/l', N'0.1', NULL, 12000, 0, 12)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (12021, N'centigrams per litre', N'cg/l', N'0.01', NULL, 12000, 0, 12)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (12022, N'milligrams per litre', N'mg/l', N'0.001', NULL, 12000, 0, 12)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (12023, N'micrograms per litre', N'µg/l', N'1E-6', NULL, 12000, 0, 12)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (12024, N'nanograms per litre', N'ng/l', N'1E-9', NULL, 12000, 0, 12)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (12025, N'picograms per litre', N'pg/l', N'1E-12', NULL, 12000, 0, 12)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (12026, N'femtograms per litre', N'fg/l', N'1E-15', NULL, 12000, 0, 12)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (12027, N'attograms per litre', N'ag/l', N'1E-18', NULL, 12000, 0, 12)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (12028, N'zeptograms per litre', N'zg/l', N'1E-21', NULL, 12000, 0, 12)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (12029, N'yoctograms per litre', N'yg/l', N'1E-24', NULL, 12000, 0, 12)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (12030, N'ounces (US) per gallon(US)', N'oz/gal', N'7.489152', NULL, 12000, 0, 12)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (12031, N'pounds per foot cubed', N'lb/ft³', N'16.01846', NULL, 12000, 0, 12)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (12032, N'pounds per inch cubed', N'lb/in³', N'27679.9', NULL, 12000, 0, 12)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (12033, N'tons per yard cubed', N'ton/yard³', N'693.5925', NULL, 12000, 0, 12)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (12034, N'API (60F)', N'°API (60F)', N'(141.5/(X+131.5))* 999.016', N'(-263.0 * X/2.0+141360.764)/X', 12000, 1, 12)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (13000, N'dots per inch', N'dpi', N'1.0', NULL, NULL, 0, 13)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (13001, N'pixels per inch', N'ppi', N'1.0', NULL, 13000, 0, 13)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (13002, N'dots per milimetre', N'dpmm', N'25.4', NULL, 13000, 0, 13)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (13003, N'dots per metre', N'dpm', N'0.0254', NULL, 13000, 0, 13)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14000, N'Joule', N'J', N'1.0', NULL, NULL, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14001, N'yottajoule', N'YJ', N'1E24', NULL, 14000, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14002, N'zettajoule', N'ZJ', N'1E21', NULL, 14000, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14003, N'exajoule', N'EJ', N'1E18', NULL, 14000, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14004, N'petajoule', N'PJ', N'1E15', NULL, 14000, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14005, N'terajoule', N'TJ', N'1E12', NULL, 14000, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14006, N'gigajoule', N'GJ', N'1E9', NULL, 14000, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14007, N'megajoule', N'MJ', N'1E6', NULL, 14000, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14008, N'kilojoule', N'kJ', N'1000.0', NULL, 14000, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14009, N'hectojoule', N'hJ', N'100.0', NULL, 14000, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14010, N'dekajoule', N'daJ', N'10.0', NULL, 14000, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14011, N'decijoule', N'dJ', N'0.1', NULL, 14000, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14012, N'centijoule', N'cJ', N'0.01', NULL, 14000, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14013, N'millijoule', N'mJ', N'0.001', NULL, 14000, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14014, N'microjoule', N'µJ', N'1E-6', NULL, 14000, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14015, N'nanojoule', N'nJ', N'1E-9', NULL, 14000, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14016, N'picojoule', N'pJ', N'1E-12', NULL, 14000, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14017, N'femtojoule', N'fJ', N'1E-15', NULL, 14000, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14018, N'attojoule', N'aJ', N'1E-18', NULL, 14000, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14019, N'zeptojoule', N'zJ', N'1E-21', NULL, 14000, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14020, N'yoctojoule', N'yJ', N'1E-24', NULL, 14000, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14021, N'British thermal unit', N'BTU', N'1055.056', NULL, 14000, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14022, N'calorie', N'cal', N'4.1868', NULL, 14000, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14023, N'calorie (mean)', N'cal', N'4.19002', NULL, 14000, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14024, N'electron Volt', N'eV', N'1.602177E-19', NULL, 14000, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14025, N'erg', N'erg', N'1E-7', NULL, 14000, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14026, N'Watt second', N'Ws', N'1.0', NULL, 14000, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14027, N'Watt hour', N'Wh', N'3600.0', NULL, 14000, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14028, N'kilowatt second', N'kWs', N'1000.0', NULL, 14000, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14029, N'kilowatt hour', N'kWh', N'3600000.0', NULL, 14000, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14030, N'gigawatt hour', N'GWh', N'3600000000000.0', NULL, 14000, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14031, N'therm (EC)', N'th', N'105505600.0', NULL, 14000, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14032, N'therm (US)', N'th', N'105480400.0', NULL, 14000, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14033, N'dyne centimetre', N'dyncm', N'1E-7', NULL, 14000, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14034, N'foot poundal', N'-', N'0.042140110', NULL, 14000, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14035, N'foot pound fource', N'ft·lbf', N'1.3558179480', NULL, 14000, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14036, N'horsepower hour', N'hph', N'2684519.537', NULL, 14000, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14037, N'ounce force inch', N'ozin', N'0.007061551814', NULL, 14000, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14038, N'pound force inch', N'lbin', N'0.112984829', NULL, 14000, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14039, N'ton of TNT (energy equivalent)', N'-', N'4184000000.0', NULL, 14000, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14040, N'quad (10^15 BTU)', N'quad', N'1.055056E18', NULL, 14000, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (14041, N'MMBTU', N'MMBTU', N'1055056000.0', NULL, 14000, 0, 14)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (15000, N'Euro', N'EUR', N'1.0', NULL, NULL, 0, 15)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (15001, N'Belgian Franc', N'BEF', N'0.0247893524773239', NULL, 15000, 0, 15)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (15002, N'Deutsch Mark', N'DEM', N'0.511291881196218', NULL, 15000, 0, 15)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (15003, N'Spanish Pesetas', N'ESP', N'0.00601012104383782', NULL, 15000, 0, 15)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (15004, N'French Francs', N'FRF', N'0.15244901723741', NULL, 15000, 0, 15)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (15005, N'Greek drachma', N'GDM', N'0.0029347028613352898019075568598679', NULL, 15000, 0, 15)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (15006, N'Irish Pounds', N'IEP', N'1.26973807842918', NULL, 15000, 0, 15)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (15007, N'Italian Lire', N'ITL', N'0.000516456899089486', NULL, 15000, 0, 15)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (15008, N'Luxembourg Francs', N'LUF', N'0.0247893524773239', NULL, 15000, 0, 15)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (15009, N'Dutch Guilders', N'NLG', N'0.453780216090139', NULL, 15000, 0, 15)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (15010, N'Austrian Schillings', N'ATS', N'0.0726728341678597', NULL, 15000, 0, 15)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (15011, N'Portuguese Escudos', N'PTE', N'0.00498797897068066', NULL, 15000, 0, 15)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (15012, N'Finnish Marks', N'FIM', N'0.168187926461511', NULL, 15000, 0, 15)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (16000, N'grams per second', N'g/s', N'1.0', NULL, NULL, 0, 16)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (16001, N'grams per minute', N'g/min', N'0.0166666666666667', NULL, 16000, 0, 16)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (16002, N'grams per hour', N'g/h', N'0.000277777777777778', NULL, 16000, 0, 16)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (16003, N'grams per day', N'g/d', N'1.15740740740741E-5', NULL, 16000, 0, 16)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (16004, N'milligrams per minute', N'mg/min', N'1.66666666666667E-5', NULL, 16000, 0, 16)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (16005, N'milligrams per hour', N'mg/h', N'2.77777777777778E-7', NULL, 16000, 0, 16)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (16006, N'milligrams per day', N'mg/d', N'1.15740740740741E-8', NULL, 16000, 0, 16)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (16007, N'kilograms per minute', N'kg/min', N'16.6666666666667', NULL, 16000, 0, 16)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (16008, N'kilograms per hour', N'kg/h', N'0.277777777777778', NULL, 16000, 0, 16)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (16009, N'kilograms per day', N'kg/d', N'0.0115740740740741', NULL, 16000, 0, 16)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (16010, N'yottagram per second', N'Yg/s', N'1E24', NULL, 16000, 0, 16)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (16011, N'zettagram per second', N'Zg/s', N'1E21', NULL, 16000, 0, 16)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (16012, N'exagram per second', N'Eg/s', N'1E18', NULL, 16000, 0, 16)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (16013, N'petagram per second', N'Pg/s', N'1E15', NULL, 16000, 0, 16)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (16014, N'teragram per second', N'Tg/s', N'1E12', NULL, 16000, 0, 16)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (16015, N'gigagram per second', N'Gg/s', N'1E9', NULL, 16000, 0, 16)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (16016, N'megagram per second', N'Mg/s', N'1E6', NULL, 16000, 0, 16)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (16017, N'kilogram per second', N'kg/s', N'1000.0', NULL, 16000, 0, 16)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (16018, N'hectogram per second', N'hg/s', N'100.0', NULL, 16000, 0, 16)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (16019, N'dekagram per second', N'dag/s', N'10.0', NULL, 16000, 0, 16)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (16020, N'decigram per second', N'dg/s', N'0.1', NULL, 16000, 0, 16)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (16021, N'centigram per second', N'cg/s', N'0.01', NULL, 16000, 0, 16)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (16022, N'milligram per second', N'mg/s', N'0.001', NULL, 16000, 0, 16)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (16023, N'microgram per second', N'µg/s', N'1E-6', NULL, 16000, 0, 16)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (16024, N'nanogram per second', N'ng/s', N'1E-9', NULL, 16000, 0, 16)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (16025, N'picogram per second', N'pg/s', N'1E-12', NULL, 16000, 0, 16)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (16026, N'femtogram per second', N'fg/s', N'1E-15', NULL, 16000, 0, 16)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (16027, N'attogram per second', N'ag/s', N'1E-18', NULL, 16000, 0, 16)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (16028, N'zeptogram per second', N'zg/s', N'1E-21', NULL, 16000, 0, 16)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (16029, N'yoctogram per second', N'yg/s', N'1E-24', NULL, 16000, 0, 16)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (16030, N'pounds per second', N'lb/s', N'453.59237', NULL, 16000, 0, 16)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (16031, N'pounds per minute', N'lb/min', N'7.55987283333333', NULL, 16000, 0, 16)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (16032, N'pounds per hour', N'lb/h', N'0.125997880555556', NULL, 16000, 0, 16)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (16033, N'pounds per day', N'lb/d', N'0.00524991168981481', NULL, 16000, 0, 16)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (17000, N'moles per second', N'mol/s', N'1.0', NULL, NULL, 0, 17)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (17001, N'yottamoles per second', N'Ymol/s', N'1E24', NULL, 17000, 0, 17)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (17002, N'zettamoles per second', N'Zmol/s', N'1E21', NULL, 17000, 0, 17)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (17003, N'examoles per second', N'Emol/s', N'1E18', NULL, 17000, 0, 17)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (17004, N'petamoles per second', N'Pmol/s', N'1E15', NULL, 17000, 0, 17)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (17005, N'teramoles per second', N'Tmol/s', N'1E12', NULL, 17000, 0, 17)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (17006, N'gigamoles per second', N'Gmol/s', N'1E9', NULL, 17000, 0, 17)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (17007, N'megamoles per second', N'Mmol/s', N'1E6', NULL, 17000, 0, 17)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (17008, N'kilomoles per second', N'kmol/s', N'1000.0', NULL, 17000, 0, 17)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (17009, N'hectomoles per second', N'hmol/s', N'100.0', NULL, 17000, 0, 17)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (17010, N'dekamoles per second', N'damol/s', N'10.0', NULL, 17000, 0, 17)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (17011, N'decimoles per second', N'dmol/s', N'0.1', NULL, 17000, 0, 17)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (17012, N'centimoles per second', N'cmol/s', N'0.01', NULL, 17000, 0, 17)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (17013, N'millimoles per second', N'mmol/s', N'0.001', NULL, 17000, 0, 17)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (17014, N'micromoles per second', N'µmol/s', N'1E-6', NULL, 17000, 0, 17)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (17015, N'nanomoles per second', N'nmol/s', N'1E-9', NULL, 17000, 0, 17)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (17016, N'picomoles per second', N'pmol/s', N'1E-12', NULL, 17000, 0, 17)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (17017, N'femtomoles per second', N'fmol/s', N'1E-15', NULL, 17000, 0, 17)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (17018, N'attomoles per second', N'amol/s', N'1E-18', NULL, 17000, 0, 17)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (17019, N'zeptomoles per second', N'zmol/s', N'1E-21', NULL, 17000, 0, 17)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (17020, N'yoctomoles per second', N'ymol/s', N'1E-24', NULL, 17000, 0, 17)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (17021, N'moles per minute', N'mol/min', N'0.0166666666666667', NULL, 17000, 0, 17)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (17022, N'moles per hour', N'mol/h', N'0.000277777777777778', NULL, 17000, 0, 17)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (17023, N'moles per day', N'mol/d', N'1.15740740740741E-5', NULL, 17000, 0, 17)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (17024, N'millimoles per minute', N'mmol/min', N'1.66666666666667E-5', NULL, 17000, 0, 17)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (17025, N'millimoles per hour', N'mmol/h', N'2.77777777777778E-7', NULL, 17000, 0, 17)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (17026, N'millimoles per day', N'mmol/d', N'1.15740740740741E-8', NULL, 17000, 0, 17)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (17027, N'kilomoles per minute', N'kmol/min', N'16.6666666666667', NULL, 17000, 0, 17)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (17028, N'kilomoles per hour', N'kmol/h', N'0.277777777777778', NULL, 17000, 0, 17)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (17029, N'kilomoles per day', N'kmol/d', N'0.0115740740740741', NULL, 17000, 0, 17)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18000, N'litres per second', N'L/s', N'1.0', NULL, NULL, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18001, N'litres per minute', N'L/min', N'0.0166666666666667', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18002, N'litres per hour', N'L/h', N'0.000277777777777778', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18003, N'litres per day', N'L/d', N'1.15740740740741E-5', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18004, N'millilitres per second', N'mL/s', N'0.001', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18005, N'millilitres per minute', N'mL/min', N'1.66666666666667E-5', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18006, N'millilitres per hour', N'mL/h', N'2.77777777777778E-7', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18007, N'millilitres per day', N'mL/d', N'1.15740740740741E-8', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18008, N'kilolitres per minute', N'kL/min', N'16.6666666666667', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18009, N'kilolitres per hour', N'kL/h', N'0.277777777777778', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18010, N'kilolitres per day', N'kL/d', N'0.0115740740740741', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18011, N'cubic metres per second', N'm³/s', N'1000', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18012, N'cubic metre per minute', N'm³/min', N'16.6666666666667', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18013, N'cubic metre per hour', N'm³/h', N'0.277777777777778', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18014, N'cubic metre per day', N'm³/d', N'0.0115740740740741', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18015, N'cubic centimetre per second', N'cm³/s', N'0.001', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18016, N'cubic centimetre per minute', N'cm³/min', N'1.66666666666667E-5', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18017, N'cubic centimetre per hour', N'cm³/h', N'2.77777777777778E-7', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18018, N'cubic centimetre per day', N'cm³/d', N'1.15740740740741E-8', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18019, N'cubic inches per second', N'in³/s', N'0.016387064', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18020, N'cubic inches per minute', N'in³/min', N'0.0002731177333', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18021, N'cubic inches per hour', N'in³/h', N'4.551962222E-6', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18022, N'cubic inches per day', N'in³/d', N'1.896650925E-7', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18023, N'cubic feet per second', N'ft³/s', N'28.31684659', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18024, N'cubic feet per minute', N'ft³/min', N'0.4719474432', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18025, N'cubic feet per hour', N'ft³/h', N'0.00786579072', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18026, N'cubic yards per second', N'y³/s', N'764.554858', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18027, N'cubic yards per minute', N'y³/m', N'12.74258097', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18028, N'cubic yards per hour', N'y³/h', N'0.2123763495', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18029, N'ounces per second', N'oz/s', N'0.02957352956', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18030, N'ounces per minute', N'oz/min', N'0.0004928921594', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18031, N'ounces per hour', N'oz/h', N'8.214869323E-6', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18032, N'ounces (UK) per second', N'oz/s', N'0.02841312059', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18033, N'ounces (UK) per minute', N'oz/min', N'0.0004735520099', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18034, N'ounces (UK) per hour', N'oz/h', N'7.892533498E-6', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18035, N'gallons per second', N'gps', N'3.785411784', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18036, N'gallons per minute', N'gpm', N'0.0630901964', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18037, N'gallons per hour', N'gph', N'0.001051503273', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18038, N'gallons per day', N'gpd', N'4.381263639E-5', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18039, N'gallons (UK) per second', N'gps', N'4.546099295', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18040, N'gallons (UK) per minute', N'gpm', N'0.07576832158', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18041, N'gallons (UK) per hour', N'gph', N'0.00126280536', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18042, N'gallons (UK) per day', N'gpd', N'5.261688998E-5', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18043, N'barrels per second', N'brl/s', N'158.9872949', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18044, N'barrels per minute', N'brl/min', N'2.649788249', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18045, N'barrels per hour', N'brl/h', N'0.04416313748', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18046, N'barrels per day', N'brl/d', N'0.001840130728', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18047, N'pounds per second (Gasoline at 15.5°C)', N'lb/s', N'0.613518927714749', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18048, N'pounds per minute (Gasoline at 15.5°C)', N'lb/min', N'0.0102253154619125', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18049, N'pounds per hour (Gasoline at 15.5°C)', N'lb/h', N'0.000170421924365208', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18050, N'pounds per day (Gasoline at 15.5°C)', N'lb/d', N'7.100913515217E-6', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18051, N'kilograms per second (Gasoline at 15.5°C)', N'kg/s', N'1.35257770706512', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18052, N'kilograms per minute (Gasoline at 15.5°C)', N'kg/min', N'0.0225429617844186', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18053, N'kilograms per hour (Gasoline at 15.5°C)', N'kg/h', N'0.000375716029740311', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (18054, N'kilograms per day (Gasoline at 15.5°C)', N'kg/d', N'1.56548345725129E-5', NULL, 18000, 0, 18)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (19000, N'newton', N'N', N'1.0', NULL, NULL, 0, 19)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (19001, N'yottanewton', N'YN', N'1E24', NULL, 19000, 0, 19)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (19002, N'zettanewton', N'ZN', N'1E21', NULL, 19000, 0, 19)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (19003, N'exanewton', N'EN', N'1E18', NULL, 19000, 0, 19)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (19004, N'petanewton', N'PN', N'1E15', NULL, 19000, 0, 19)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (19005, N'teranewton', N'TN', N'1E12', NULL, 19000, 0, 19)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (19006, N'giganewton', N'GN', N'1E9', NULL, 19000, 0, 19)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (19007, N'meganewton', N'MN', N'1E6', NULL, 19000, 0, 19)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (19008, N'kilonewton', N'kN', N'1000.0', NULL, 19000, 0, 19)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (19009, N'hectonewton', N'hN', N'100.0', NULL, 19000, 0, 19)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (19010, N'dekanewton', N'daN', N'10.0', NULL, 19000, 0, 19)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (19011, N'decinewton', N'dN', N'0.1', NULL, 19000, 0, 19)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (19012, N'centinewton', N'cN', N'0.01', NULL, 19000, 0, 19)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (19013, N'millinewton', N'mN', N'0.001', NULL, 19000, 0, 19)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (19014, N'micronewton', N'µN', N'1E-6', NULL, 19000, 0, 19)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (19015, N'nanonewton', N'nN', N'1E-9', NULL, 19000, 0, 19)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (19016, N'piconewton', N'pN', N'1E-12', NULL, 19000, 0, 19)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (19017, N'femtonewton', N'fN', N'1E-15', NULL, 19000, 0, 19)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (19018, N'attonewton', N'aN', N'1E-18', NULL, 19000, 0, 19)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (19019, N'zeptonewton', N'zN', N'1E-21', NULL, 19000, 0, 19)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (19020, N'yoctonewton', N'yN', N'1E-24', NULL, 19000, 0, 19)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (19021, N'dyne', N'dyn', N'1E-5', NULL, 19000, 0, 19)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (19022, N'gram force', N'gf', N'0.00980665', NULL, 19000, 0, 19)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (19023, N'Kilogram force', N'kgf', N'9.80665', NULL, 19000, 0, 19)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (19024, N'Joule/centimetre', N'J/cm', N'0.01', NULL, 19000, 0, 19)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (19025, N'Joule/metre', N'J/m', N'1.0', NULL, 19000, 0, 19)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (19026, N'kip force', N'kip', N'4448.221615', NULL, 19000, 0, 19)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (19027, N'ounce force', N'ozf', N'0.278013851', NULL, 19000, 0, 19)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (19028, N'pound force', N'lbf', N'4.4482216152605', NULL, 19000, 0, 19)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (19029, N'poundal', N'pdl', N'0.1382549544', NULL, 19000, 0, 19)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (20000, N'Hertz', N'Hz', N'1.0', NULL, NULL, 0, 20)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (20001, N'yottahertz', N'YHz', N'1E24', NULL, 20000, 0, 20)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (20002, N'zettahertz', N'ZHz', N'1E21', NULL, 20000, 0, 20)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (20003, N'exahertz', N'EHz', N'1E18', NULL, 20000, 0, 20)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (20004, N'petahertz', N'PHz', N'1E15', NULL, 20000, 0, 20)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (20005, N'terahertz', N'THz', N'1E12', NULL, 20000, 0, 20)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (20006, N'gigahertz', N'GHz', N'1E9', NULL, 20000, 0, 20)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (20007, N'megahertz', N'MHz', N'1E6', NULL, 20000, 0, 20)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (20008, N'kilohertz', N'kHz', N'1000.0', NULL, 20000, 0, 20)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (20009, N'hectohertz', N'hHz', N'100.0', NULL, 20000, 0, 20)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (20010, N'dekahertz', N'daHz', N'10.0', NULL, 20000, 0, 20)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (20011, N'decihertz', N'dHz', N'0.1', NULL, 20000, 0, 20)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (20012, N'centihertz', N'cHz', N'0.01', NULL, 20000, 0, 20)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (20013, N'millihertz', N'mHz', N'0.001', NULL, 20000, 0, 20)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (20014, N'microhertz', N'µHz', N'1E-6', NULL, 20000, 0, 20)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (20015, N'nanohertz', N'nHz', N'1E-9', NULL, 20000, 0, 20)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (20016, N'picohertz', N'pHz', N'1E-12', NULL, 20000, 0, 20)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (20017, N'femtohertz', N'fHz', N'1E-15', NULL, 20000, 0, 20)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (20018, N'attohertz', N'aHz', N'1E-18', NULL, 20000, 0, 20)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (20019, N'zeptohertz', N'zHz', N'1E-21', NULL, 20000, 0, 20)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (20020, N'yoctohertz', N'yHz', N'1E-24', NULL, 20000, 0, 20)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (20021, N'cycles per second', N'cps', N'1.0', NULL, 20000, 0, 20)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (20022, N'Wavelength in exametres', N'Em', N'299792458.0/X/1.0E18', N'299792458.0/X*1.0E18', 20000, 1, 20)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (20023, N'Wavelength in petametres', N'Pm', N'299792458.0/X/1.0E15', N'299792458.0/X/1.0E15', 20000, 1, 20)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (20024, N'Wavelength in terametres', N'Tm', N'299792458.0/X/1.0E12', N'299792458.0/X/1.0E12', 20000, 1, 20)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (20025, N'Wavelength in gigametres', N'Gm', N'299792458.0/X/1.0E9', N'299792458.0/X/1.0E9', 20000, 1, 20)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (20026, N'Wavelength in megametres', N'Mm', N'299792458.0/X/1.0E6', N'299792458.0/X/1.0E6', 20000, 1, 20)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (20027, N'Wavelength in kilometres', N'km', N'299792458.0/X/1.0E3', N'299792458.0/X/1.0E3', 20000, 1, 20)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (20028, N'Wavelength in hectometres', N'hm', N'299792458.0/X/1.0E2', N'299792458.0/X/1.0E2', 20000, 1, 20)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (20029, N'Wavelength in decametres', N'dam', N'299792458.0/X/1.0E1', N'299792458.0/X/1.0E1', 20000, 1, 20)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (20030, N'Wavelength in metres', N'm', N'299792458.0/X', N'299792458.0/X', 20000, 1, 20)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (20031, N'Wavelength in Decimetres', N'dm', N'299792458.0/X/1.0E-1', N'299792458.0/X/1.0E-1', 20000, 1, 20)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (20032, N'Wavelength in centimetres', N'cm', N'299792458.0/X/1.0E-2', N'299792458.0/X/1.0E-2', 20000, 1, 20)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (20033, N'Wavelength in millimetres', N'mm', N'299792458.0/X/1.0E-3', N'299792458.0/X/1.0E-3', 20000, 1, 20)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (20034, N'Wavelength in micrometres', N'µm', N'299792458.0/X/1.0E-6', N'299792458.0/X/1.0E-6', 20000, 1, 20)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21000, N'metres per litre', N'm/l', N'1.0', NULL, NULL, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21001, N'yottametre per litre', N'Ym/L', N'1E24', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21002, N'zettametre per litre', N'Zm/L', N'1E21', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21003, N'exametre per litre', N'Em/L', N'1E18', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21004, N'petametre per litre', N'Pm/L', N'1E15', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21005, N'terametre per litre', N'Tm/L', N'1E12', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21006, N'gigametre per litre', N'Gm/L', N'1E9', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21007, N'megametre per litre', N'Mm/L', N'1E6', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21008, N'kilometre per litre', N'km/L', N'1000.0', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21009, N'hectometre per litre', N'hm/L', N'100.0', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21010, N'dekametre per litre', N'dam/L', N'10.0', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21011, N'decimetre per litre', N'dm/L', N'1E-1', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21012, N'centimetre per litre', N'cm/L', N'1E-2', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21013, N'millimetre per litre', N'mm/L', N'1E-3', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21014, N'micrometre per litre', N'µm/L', N'1E-6', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21015, N'nanometre per litre', N'nm/L', N'1E-9', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21016, N'picometre per litre', N'pm/L', N'1E-12', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21017, N'femtometre per litre', N'fm/L', N'1E-15', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21018, N'attometre per litre', N'am/L', N'1E-18', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21019, N'zeptometre per litre', N'zm/L', N'1E-21', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21020, N'yoctometre per litre', N'ym/L', N'1E-24', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21021, N'litres per metre', N'L/m', N'1.0/X', N'1.0/X', 21000, 1, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21022, N'litres per 100Km', N'L/100Km', N'100000.0/X', N'100000.0/X', 21000, 1, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21023, N'gallons (US) per mile', N'gal/mi', N'425.1437074976256/X', N'425.1437074976256/X', 21000, 1, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21024, N'gallons (UK) per mile', N'gal/mi', N'354.00618995591696104221163795369/X', N'354.00618995591696104221163795369/X', 21000, 1, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21025, N'gallons (US) per 100mi', N'gal/100mi', N'42514.370749762560/X', N'42514.370749762560/X', 21000, 1, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21026, N'gallons (UK) per 100mi', N'gal/100mi', N'35400.618995591696104221163795369/X', N'35400.618995591696104221163795369/X', 21000, 1, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21027, N'mile (US) per litre', N'mi/L', N'1609.344', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21028, N'nautical mile per litre', N'kn/L', N'1853.24496', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21029, N'kilometres per gallon (US)', N'km/gal', N'264.1720524', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21030, N'metres per gallon (US)', N'm/gal', N'0.2641720524', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21031, N'metres per gallon (UK)', N'm/gal', N'0.219969248299088', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21032, N'miles per gallon (US)', N'mi/gal', N'425.143707497626', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21033, N'miles per gallon (UK)', N'mi/gal', N'354.006189955917', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21034, N'nautical mile per gallon (US)', N'kn/gal', N'489.575524683156', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21035, N'metres per cubic metres', N'm/m³', N'0.001', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21036, N'metres per cubic centimetre', N'm/cm³', N'1000.0', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21038, N'metres per cubic yards', N'm/yd³', N'0.00130795061928702', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21039, N'metres per cubic feet', N'm/ft³', N'0.0353146667239828', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21040, N'metres per cubic inches', N'm/in³', N'61.0237440947323', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21042, N'metres per gallon', N'm/gal', N'0.264172052358148', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21043, N'metres per quart', N'm/qt', N'1.05668820943259', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21044, N'metres per quart (UK)', N'm/qt', N'0.879875194771703', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21045, N'metres per Pint', N'm/pt', N'2.11337641886519', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21046, N'metres per Pint (UK)', N'm/pt', N'1.75975038892406', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21047, N'metres per cup', N'm/cup', N'4.22675283773037', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21048, N'metres per cup (UK)', N'm/cup', N'3.51950077722878', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21049, N'metres per fluid ounces', N'm/oz', N'33.8140227047015', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (21050, N'metres per fluid ounces (UK)', N'm/oz', N'35.1950077722878', NULL, 21000, 0, 21)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (22000, N'Lux', N'lux', N'1.0', NULL, NULL, 0, 22)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (22001, N'flame', N'-', N'43.05564167', NULL, 22000, 0, 22)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (22002, N'foot candle', N'-', N'10.76391042', NULL, 22000, 0, 22)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (22003, N'centimetre candle', N'-', N'10000.0', NULL, 22000, 0, 22)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (22004, N'metre candle', N'-', N'1.0', NULL, 22000, 0, 22)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (22005, N'nox', N'-', N'0.001', NULL, 22000, 0, 22)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (22006, N'phot', N'-', N'10000', NULL, 22000, 0, 22)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (22007, N'lumen per centimetre squared', N'l/cm²', N'10000', NULL, 22000, 0, 22)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (22008, N'lumen per metre squared', N'l/m²', N'1.0', NULL, 22000, 0, 22)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (22009, N'lumen per foot squared', N'l/ft²', N'10.76391042', NULL, 22000, 0, 22)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (23000, N'Henry', N'H', N'1.0', NULL, NULL, 0, 23)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (23001, N'yottahenry', N'YH', N'1E24', NULL, 23000, 0, 23)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (23002, N'zettahenry', N'ZH', N'1E21', NULL, 23000, 0, 23)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (23003, N'exahenry', N'EH', N'1E18', NULL, 23000, 0, 23)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (23004, N'petahenry', N'PH', N'1E15', NULL, 23000, 0, 23)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (23005, N'terahenry', N'TH', N'1E12', NULL, 23000, 0, 23)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (23006, N'gigahenry', N'GH', N'1E9', NULL, 23000, 0, 23)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (23007, N'megahenry', N'MH', N'1E6', NULL, 23000, 0, 23)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (23008, N'kilohenry', N'kH', N'1000.0', NULL, 23000, 0, 23)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (23009, N'hectohenry', N'hH', N'100.0', NULL, 23000, 0, 23)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (23010, N'dekahenry', N'daH', N'10.0', NULL, 23000, 0, 23)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (23011, N'decihenry', N'dH', N'0.1', NULL, 23000, 0, 23)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (23012, N'centihenry', N'cH', N'0.01', NULL, 23000, 0, 23)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (23013, N'millihenry', N'mH', N'0.001', NULL, 23000, 0, 23)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (23014, N'microhenry', N'µH', N'1E-6', NULL, 23000, 0, 23)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (23015, N'nanohenry', N'nH', N'1E-9', NULL, 23000, 0, 23)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (23016, N'picohenry', N'pH', N'1E-12', NULL, 23000, 0, 23)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (23017, N'femtohenry', N'fH', N'1E-15', NULL, 23000, 0, 23)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (23018, N'attohenry', N'aH', N'1E-18', NULL, 23000, 0, 23)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (23019, N'zeptohenry', N'zH', N'1E-21', NULL, 23000, 0, 23)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (23020, N'yoctohenry', N'yH', N'1E-24', NULL, 23000, 0, 23)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (23021, N'abhenry', N'-', N'1E-9', NULL, 23000, 0, 23)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (23022, N'stathenry', N'-', N'898755200000.0', NULL, 23000, 0, 23)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (23023, N'EMU of inductance (abhenry)', N'-', N'1E-9', NULL, 23000, 0, 23)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (23024, N'ESU of inductance (stathenry)', N'-', N'898755200000.0', NULL, 23000, 0, 23)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24000, N'metre', N'm', N'1.0', NULL, NULL, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24001, N'yottametre', N'Ym', N'1E24', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24002, N'zettametre', N'Zm', N'1E21', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24003, N'exametre', N'Em', N'1E18', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24004, N'petametre', N'Pm', N'1E15', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24005, N'terametre', N'Tm', N'1E12', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24006, N'gigametre', N'Gm', N'1E9', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24007, N'megametre', N'Mm', N'1E6', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24008, N'kilometre', N'km', N'1000.0', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24009, N'hectometre', N'hm', N'100.0', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24010, N'dekametre', N'dam', N'10.0', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24011, N'decimetre', N'dm', N'1E-1', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24012, N'centimetre', N'cm', N'1E-2', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24013, N'millimetre', N'mm', N'1E-3', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24014, N'micrometre', N'µm', N'1E-6', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24015, N'nanometre', N'nm', N'1E-9', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24016, N'picometre', N'pm', N'1E-12', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24017, N'femtometre', N'fm', N'1E-15', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24018, N'attometre', N'am', N'1E-18', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24019, N'zeptometre', N'zm', N'1E-21', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24020, N'yoctometre', N'ym', N'1E-24', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24021, N'mile (US)', N'mi', N'1609.344', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24022, N'mile (US survey foot)', N'mi', N'1609.347', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24023, N'mile (Roman)', N'mi', N'1479.804', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24024, N'yard', N'yd', N'0.9144', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24025, N'foot', N'ft', N'0.3048', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24026, N'inch', N'in', N'0.0254', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24027, N'Astronomical Unit', N'au', N'149600000000.0', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24028, N'light year', N'lyr', N'9.460528405E15', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24029, N'parsec', N'psec', N'3.085729264E16', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24030, N'Kiloparsec', N'kpsec', N'3.085729264E19', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24031, N'Megaparsec', N'Mpsec', N'3.085729264E22', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24032, N'furlong', N'fr', N'201.168', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24033, N'vara castellana', N'-', N'0.835152', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24034, N'vara conuquera', N'-', N'2.505456', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24035, N'vara de tarea', N'-', N'2.505456', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24036, N'perch', N'perch', N'5.0292', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24037, N'pole', N'pole', N'5.0292', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24038, N'rod', N'rd', N'5.0292', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24039, N'Nautical Mile', N'kn', N'1853.24496', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24040, N'League', N'lg', N'4828.032', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24041, N'Fathom', N'fth', N'1.8288', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24042, N'chain', N'ch', N'20.1168', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24043, N'link', N'lk', N'0.201168', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24044, N'mil', N'mil', N'2.54E-5', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24045, N'caliber', N'cal', N'0.000254', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24046, N'MIL~', N'-', N'10000.0', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24047, N'famn', N'-', N'1.7813333', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24048, N'aln', N'-', N'0.5937778', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24049, N'Angstroms', N'A', N'1E-10', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24050, N'fermi', N'fermi', N'1E-15', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24051, N'cloth span', N'span', N'0.2286', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24052, N'cloth nail', N'nail', N'0.05715', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24053, N'Roman actus', N'-', N'35.47872', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24054, N'Russian archin', N'-', N'0.7112', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24055, N'arpentlin', N'-', N'58.471308', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24056, N'barleycorn', N'-', N'0.00846666666666667', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24057, N'ken', N'-', N'2.11836', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24058, N'cubit (biblical)', N'-', N'0.4572', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (24059, N'cubit (Greek)', N'-', N'0.462788', NULL, 24000, 0, 24)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (25000, N'cubic metres', N'm³', N'1.0', NULL, NULL, 0, 25)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (25001, N'board feet (aprox)', N'bf', N'0.000393289536', NULL, 25000, 0, 25)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (25002, N'1000 board feet', N'mbf', N'5.181982926', NULL, 25000, 0, 25)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (25003, N'standard cord', N'ch', N'3.624556364', NULL, 25000, 0, 25)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (25004, N'cord of softwood (aprox)', N'-', N'0.1632151574', NULL, 25000, 0, 25)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (25005, N'cord of hardwood (aprox)', N'-', N'0.1651816051', NULL, 25000, 0, 25)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (25006, N'solid contant cord', N'-', N'2.265347727', NULL, 25000, 0, 25)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (25007, N'cunit', N'-', N'2.831684659', NULL, 25000, 0, 25)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (25008, N'switch ties (aprox)', N'st', N'0.02359737216', NULL, 25000, 0, 25)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (25009, N'cubic yards', N'yd³', N'0.764554858', NULL, 25000, 0, 25)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (25010, N'cubic feet', N'ft³', N'0.02831684659', NULL, 25000, 0, 25)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (25011, N'handle blank (aprox)', N'hb', N'0.0007079211648', NULL, 25000, 0, 25)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (25012, N'skids (aprox)', N'skid', N'0.02753026752', NULL, 25000, 0, 25)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (25013, N'mine', N'-', N'0.01769802912', NULL, 25000, 0, 25)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (25014, N'cross tie', N'-', N'0.01769802912', NULL, 25000, 0, 25)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (25015, N'pole', N'-', N'0.05702698272', NULL, 25000, 0, 25)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (25016, N'pallet', N'-', N'0.00786579072', NULL, 25000, 0, 25)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (26000, N'gram', N'g', N'1.0', NULL, NULL, 0, 26)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (26001, N'yottagram', N'Yg', N'1E24', NULL, 26000, 0, 26)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (26002, N'zettagram', N'Zg', N'1E21', NULL, 26000, 0, 26)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (26003, N'exagram', N'Eg', N'1E18', NULL, 26000, 0, 26)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (26004, N'petagram', N'Pg', N'1E15', NULL, 26000, 0, 26)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (26005, N'teragram', N'Tg', N'1E12', NULL, 26000, 0, 26)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (26006, N'gigagram', N'Gg', N'1E9', NULL, 26000, 0, 26)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (26007, N'megagram', N'Mg', N'1E6', NULL, 26000, 0, 26)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (26008, N'kilogram', N'kg', N'1000.0', NULL, 26000, 0, 26)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (26009, N'hectogram', N'hg', N'100.0', NULL, 26000, 0, 26)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (26010, N'dekagram', N'dag', N'10.0', NULL, 26000, 0, 26)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (26011, N'decigram', N'dg', N'1E-1', NULL, 26000, 0, 26)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (26012, N'centigram', N'cg', N'1E-2', NULL, 26000, 0, 26)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (26013, N'milligram', N'mg', N'1E-3', NULL, 26000, 0, 26)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (26014, N'microgram', N'µg', N'1E-6', NULL, 26000, 0, 26)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (26015, N'nanogram', N'ng', N'1E-9', NULL, 26000, 0, 26)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (26016, N'picogram', N'pg', N'1E-12', NULL, 26000, 0, 26)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (26017, N'femtogram', N'fg', N'1E-15', NULL, 26000, 0, 26)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (26018, N'attogram', N'ag', N'1E-18', NULL, 26000, 0, 26)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (26019, N'zeptogram', N'zg', N'1E-21', NULL, 26000, 0, 26)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (26020, N'yoctogram', N'yg', N'1E-24', NULL, 26000, 0, 26)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (26021, N'pound mass', N'lbm', N'453.59237', NULL, 26000, 0, 26)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (26022, N'carat', N'ct', N'0.2', NULL, 26000, 0, 26)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (26023, N'dalton', N'dalton', N'1.66053E-24', NULL, 26000, 0, 26)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (26024, N'grain', N'grain', N'0.06479891', NULL, 26000, 0, 26)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (26025, N'ounce', N'oz', N'28.34952313', NULL, 26000, 0, 26)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (26026, N'slug', N'slug', N'14593.90294', NULL, 26000, 0, 26)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (26027, N'Ton', N'ton', N'907184.74', NULL, 26000, 0, 26)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (26028, N'Long Ton', N'ton', N'1016046.909', NULL, 26000, 0, 26)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (26029, N'Metric Tonne', N'tonne', N'1000000.0', NULL, 26000, 0, 26)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (26030, N'Troy ounce', N'ozt', N'31.103475', NULL, 26000, 0, 26)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (26031, N'Troy pound', N'lbt', N'373.2417', NULL, 26000, 0, 26)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (26033, N'stone', N'st', N'5669.904625', NULL, 26000, 0, 26)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (26034, N'Stone UK', N'stu', N'6350.29318', NULL, 26000, 0, 26)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (26035, N'Pennyweight', N'pw', N'1.55517384', NULL, 26000, 0, 26)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (26036, N'kip', N'kip', N'453592.37', NULL, 26000, 0, 26)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (26037, N'Hundredweight', N'hw', N'45359.237', NULL, 26000, 0, 26)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (26038, N'Hunderdweight (UK)', N'hwu', N'50802.34544', NULL, 26000, 0, 26)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (26039, N'scruple', N'-', N'1.2959782', NULL, 26000, 0, 26)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (26040, N'poundal', N'-', N'14.08671957', NULL, 26000, 0, 26)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (27000, N'kilogram per pascal second square meter', N'kg/(Pa·s·m²)', N'1.0', NULL, NULL, 0, 27)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (27001, N'permeability (0°C)', N'perm', N'5.72135E-11', NULL, 27000, 0, 27)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (27002, N'permeability (23°C)', N'perm', N'5.74525E-11', NULL, 27000, 0, 27)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (27003, N'permeability inches (0°C)', N'perm inch', N'1.45322E-12', NULL, 27000, 0, 27)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (27004, N'permeability inches (23°C)', N'perm inch', N'1.45929E-12', NULL, 27000, 0, 27)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28000, N'Watt', N'W', N'1.0', NULL, NULL, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28001, N'yottajoule per second', N'YJ/s', N'1E24', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28002, N'zeptajoule per second', N'ZJ/s', N'1E21', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28003, N'exajoule per second', N'EJ/s', N'1E18', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28004, N'petajoule per second', N'PJ/s', N'1E15', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28005, N'terajoule per second', N'TJ/s', N'1E12', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28006, N'gigajoule per second', N'GJ/s', N'1E9', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28007, N'megajoule per second', N'MJ/s', N'1E6', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28008, N'kilojoule per second', N'kJ/s', N'1000.0', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28009, N'hectojoule per second', N'hJ/s', N'100.0', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28010, N'dekajoule per second', N'daJ/s', N'10.0', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28011, N'joule per second', N'J/s', N'1.0', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28012, N'decijoule per second', N'dJ/s', N'1E-1', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28013, N'centijoule per second', N'cJ/s', N'1E-2', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28014, N'millijoule per second', N'mJ/s', N'1E-3', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28015, N'microjoule per second', N'µJ/s', N'1E-6', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28016, N'nanojoule per second', N'nJ/s', N'1E-9', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28017, N'picojoule per second', N'pJ/s', N'1E-12', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28018, N'femtojoule per second', N'fJ/s', N'1E-15', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28019, N'attojoule per second', N'aJ/s', N'1E-18', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28020, N'zeptojoule per second', N'zJ/s', N'1E-21', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28021, N'yoctojoule per second', N'yJ/s', N'1E-24', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28022, N'Joule per minute', N'J/min', N'0.0166666666666667', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28023, N'Joule per hour', N'J/h', N'0.000277777777777778', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28024, N'kilojoule per minute', N'kJ/min', N'16.6666666666667', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28025, N'kilojoule per hour', N'kJ/h', N'0.277777777777778', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28026, N'BTU per Hour', N'BTU/h', N'0.2930749725', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28027, N'BTU per minute', N'BTU/min', N'17.58449835', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28028, N'BTU per second', N'BTU/s', N'1055.069901', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28029, N'calories per hour', N'cal/h', N'0.001163', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28030, N'calories per minute', N'cal/min', N'0.06978', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28031, N'calories per second', N'cal/s', N'4.1868', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28032, N'kilocalorie per hour', N'Kcal/h', N'1.163', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28033, N'kilocalorie per minute', N'Kcal/min', N'69.78', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28034, N'kilocalorie per second', N'Kcal/s', N'4186.8', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28035, N'pound foot per hour', N'ft·lbf/h', N'0.0003766160968', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28036, N'pound foot per minute', N'ft·lbf/min', N'0.02259696581', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28037, N'pound foot per second', N'ft·lbf/s', N'1.355817948', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28038, N'erg per second', N'erg/s', N'1E-7', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28039, N'yottawatt', N'YW', N'1E24', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28040, N'zettawatt', N'ZW', N'1E21', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28041, N'exawatt', N'EW', N'1E18', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28042, N'petawatt', N'PW', N'1E15', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28043, N'terawatt', N'TW', N'1E12', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28044, N'gigawatt', N'GW', N'1E9', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28045, N'megawatt', N'MW', N'1E6', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28046, N'kilowatt', N'kW', N'1000.0', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28047, N'hectowatt', N'hW', N'100.0', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28048, N'dekawatt', N'daW', N'10.0', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28049, N'Deciwatt', N'dW', N'1E-1', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28050, N'centiwatt', N'cW', N'1E-2', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28051, N'milliwatt', N'mW', N'1E-3', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28052, N'microwatt', N'µW', N'1E-6', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28053, N'nanowatt', N'nW', N'1E-9', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28054, N'picowatt', N'pW', N'1E-12', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28055, N'femtowatt', N'fW', N'1E-15', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28056, N'attowatt', N'aW', N'1E-18', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28057, N'zeptowatt', N'zW', N'1E-21', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28058, N'yoctowatt', N'yW', N'1E-24', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28059, N'pherdestärke', N'ps', N'753.4987499', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28060, N'horsepower (550 ft*lbf/s)', N'hp', N'745.6998716', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28061, N'horsepower (boiler)', N'hp', N'9809.5', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28062, N'horsepower (electric)', N'hp', N'746.0', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28063, N'horsepower (metric)', N'hp', N'735.4988', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28064, N'horsepower (U.K.)', N'hp', N'745.7', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28065, N'horsepower (water)', N'hp', N'746.043', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28066, N'horsepower (bioler)', N'hpb', N'9803.0', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (28067, N'refrigerative ton', N'ton', N'3513.725022', NULL, 28000, 0, 28)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29000, N'Pascal', N'Pa', N'1.0', NULL, NULL, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29001, N'yottapascal', N'YPa', N'1E24', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29002, N'zettapascal', N'ZPa', N'1E21', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29003, N'exapascal', N'EPa', N'1E18', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29004, N'petapascal', N'PPa', N'1E15', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29005, N'terapascal', N'TPa', N'1E12', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29006, N'gigapascal', N'GPa', N'1E9', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29007, N'megapascal', N'MPa', N'1E6', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29008, N'kilopascal', N'kPa', N'1000.0', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29009, N'hectopascal', N'hPa', N'100.0', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29010, N'dekapascal', N'daPa', N'10.0', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29011, N'decipascal', N'dPa', N'1E-1', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29012, N'centipascal', N'cPa', N'1E-2', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29013, N'millipascal', N'mPa', N'1E-3', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29014, N'micropascal', N'µPa', N'1E-6', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29015, N'nanopascal', N'nPa', N'1E-9', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29016, N'picopascal', N'pPa', N'1E-12', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29017, N'femtopascal', N'fPa', N'1E-15', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29018, N'attopascal', N'aPa', N'1E-18', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29019, N'zeptopascal', N'zPa', N'1E-21', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29020, N'yoctopascal', N'yPa', N'1E-24', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29021, N'bar', N'bar', N'100000.0', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29022, N'milibar', N'mbar', N'100.0', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29023, N'microbar', N'µbar', N'0.1', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29024, N'atmosphere', N'atm', N'101325.0', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29025, N'inch of mercury (0°C)', N'-', N'3386.38', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29026, N'inch of mercury (15.5°C)', N'-', N'3376.85', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29027, N'inch of mercury, conventional', N'inHg', N'3386.389', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29028, N'millimetres of mercury (0°C)', N'mmHg', N'133.322', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29029, N'milllimeter of mercury, conventional', N'mmHg', N'133.3224', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29030, N'centimeter of mercury (0°C)', N'cmHg', N'1333.22', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29031, N'centimeter of mercury, conventional', N'cmHg', N'1333.224', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29032, N'inch of water (4°C)', N'-', N'249.082', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29033, N'inch of water (15.5°C)', N'-', N'248.84', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29034, N'inch of water, conventional', N'inH2O', N'249.0889', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29035, N'foot of water (4°C)', N'-', N'20.75683333', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29036, N'foot of water (15.5°C)', N'-', N'20.73666667', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29037, N'foot of water, conventional', N'ftH2O', N'2989.067', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29038, N'millimetre of water (4°C)', N'-', N'6326.6828', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29039, N'millimetre of water (15.5°C)', N'-', N'6320.536', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29040, N'millimetre of water, conventional', N'mmH2O', N'9.80665', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29041, N'pounds per square inch', N'psi', N'6894.757293', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29042, N'kilograms per square inch', N'kg/in²', N'15200.3379013473', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29043, N'kilograms per centimetre squared', N'kg/cm²', N'98066.5000043321', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29044, N'kilograms per metre squared', N'kg/m²', N'9.80665000043321', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29045, N'grams per metre squared', N'g/m²', N'0.00980665000043321', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29046, N'Newtons per metre squared', N'N/m²', N'1.0', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29047, N'Dynes per centemetre squared', N'dyn/cm²', N'0.1', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29048, N'torr', N'torr', N'133.3223684', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29049, N'pounds per square foot', N'lb/ft²', N'47.88025898', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29050, N'tons per square foot', N'ton/ft²', N'95760.51796', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (29051, N'tons per square inch', N'ton/in²', N'13789514.59', NULL, 29000, 0, 29)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (30000, N'Gray per second', N'Gy/s', N'1.0', NULL, NULL, 0, 30)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (30001, N'yottagray per second', N'YGy/s', N'1E24', NULL, 30000, 0, 30)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (30002, N'zettagray per second', N'ZGy/s', N'1E21', NULL, 30000, 0, 30)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (30003, N'exagray per second', N'EGy/s', N'1E18', NULL, 30000, 0, 30)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (30004, N'petagray per second', N'PGy/s', N'1E15', NULL, 30000, 0, 30)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (30005, N'teragray per second', N'TGy/s', N'1E12', NULL, 30000, 0, 30)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (30006, N'gigagray per second', N'GGy/s', N'1E9', NULL, 30000, 0, 30)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (30007, N'megagray per second', N'MGy/s', N'1E6', NULL, 30000, 0, 30)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (30008, N'kilogray per second', N'kGy/s', N'1000.0', NULL, 30000, 0, 30)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (30009, N'hectogray per second', N'hGy/s', N'100.0', NULL, 30000, 0, 30)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (30010, N'dekagray per second', N'daGy/s', N'10.0', NULL, 30000, 0, 30)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (30011, N'decigray per second', N'dGy/s', N'1E-1', NULL, 30000, 0, 30)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (30012, N'centigray per second', N'cGy/s', N'1E-2', NULL, 30000, 0, 30)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (30013, N'milligray per second', N'mGy/s', N'1E-3', NULL, 30000, 0, 30)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (30014, N'microgray per second', N'µGy/s', N'1E-6', NULL, 30000, 0, 30)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (30015, N'nanogray per second', N'nGy/s', N'1E-9', NULL, 30000, 0, 30)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (30016, N'picogray per second', N'pGy/s', N'1E-12', NULL, 30000, 0, 30)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (30017, N'femtogray per second', N'fGy/s', N'1E-15', NULL, 30000, 0, 30)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (30018, N'attogray per second', N'aGy/s', N'1E-18', NULL, 30000, 0, 30)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (30019, N'zeptogray per second', N'zGy/s', N'1E-21', NULL, 30000, 0, 30)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (30020, N'yoctogray per second', N'yGy/s', N'1E-24', NULL, 30000, 0, 30)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (30021, N'rad per second', N'rd/s', N'0.01', NULL, 30000, 0, 30)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (30022, N'joule per kilogram per second', N'J/kg/s', N'1.0', NULL, 30000, 0, 30)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31000, N'bits per second', N'bps', N'1.0', NULL, NULL, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31001, N'T0: Digital Signal Zero (payload)', N'T0', N'56000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31002, N'T0: Digital Signal Zero (B8ZS payload)', N'T0', N'64000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31003, N'T1: Digital Signal 1 (signal)', N'T1', N'1544000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31004, N'T1: Digital Signal 1 (payload)', N'T1', N'1344000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31005, N'T1Z: B8ZS Digital Signal 1 (payload)', N'T1Z', N'1544000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31006, N'T1C: Digital Signal 1C (signal)', N'T1C', N'3152000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31007, N'T1C: Digital Signal 1C (payload)', N'T1C', N'2688000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31008, N'T2: Digital Signal 2 (signal)', N'T2', N'6312000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31009, N'T3: Digital Signal 3 (signal)', N'T3', N'44736000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31010, N'T3: Digital Signal 3 (payload)', N'T3', N'37632000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31011, N'T3Z: B8ZS Digital Signal 3 (payload)', N'T3Z', N'43008000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31012, N'T4: Digital Signal 4 (signal)', N'T4', N'274176000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31013, N'E1: E.P.T.A. signal 1 (signal)', N'E1', N'2048000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31014, N'E1: E.P.T.A. signal 1 (payload)', N'E1', N'1920000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31015, N'E2: E.P.T.A. signal 2 (signal)', N'E2', N'8448000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31016, N'E2: E.P.T.A. signal 2 (payload)', N'E2', N'7680000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31017, N'E3: E.P.T.A. signal 3 (signal)', N'E3', N'34368000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31018, N'E3: E.P.T.A. signal 3 (payload)', N'E3', N'30720000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31019, N'H0: Digital Broadband Channel', N'H0', N'384000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31020, N'H4: Digital Broadband Channel', N'H4', N'15000000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31021, N'H11: Digital Broadband Channel', N'H11', N'1536000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31022, N'H12: Digital Broadband Channel', N'H12', N'1920000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31023, N'Virtual Tributary 1 (signal)', N'VT1.5', N'1728000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31024, N'Virtual Tributary 1 (payload)', N'VT1.5', N'1544000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31025, N'Virtual Tributary 2 (signal)', N'VT2', N'2304000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31026, N'Virtual Tributary 2 (payload)', N'VT2', N'2048000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31027, N'Virtual Tributary 3 (signal)', N'VT3', N'3000000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31028, N'Virtual Tributary 3 (payload)', N'VT3', N'3000000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31029, N'Virtual Tributary 6 (signal)', N'VT6', N'6312000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31030, N'Virtual Tributary 6 (payload)', N'VT6', N'6000000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31031, N'STS1: Synchronous Transmission Signal level 1 (signal)', N'STS1', N'51840000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31032, N'STS1: Synchronous Transmission Signal level 1 (payload)', N'STS1', N'49500000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31033, N'STS3: Synchronous Transmission Signal level 2 (signal)', N'STS3', N'155520000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31034, N'STS3: Synchronous Transmission Signal level 2 (payload)', N'STS3', N'150336000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31035, N'STS3c: Concatenated Synchronous Transmission Signal level 2 (signal)', N'STS3c', N'155520000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31036, N'STS3c: Concatenated Synchronous Transmission Signal level 2 (payload)', N'STS3c', N'150336000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31037, N'STS12: Synchronous Transmission Signal 12 (signal)', N'STS12', N'622080000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31038, N'STS24: Synchronous Transmission Signal 24 (signal)', N'STS24', N'1244160000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31039, N'STS48: Synchronous Transmission Signal 48 (signal)', N'STS48', N'2488320000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31040, N'STS192: Synchronous Transmission Signal 192 (signal)', N'STS192', N'9953280000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31041, N'STM-1: Synchronous Transport Module 1 (signal)', N'STM-1', N'155520000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31042, N'STM-4: Synchronous Transport Module 4 (signal)', N'STM-4', N'622080000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31043, N'STM-16: Synchronous Transport Module 16 (signal)', N'STM-16', N'2488320000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31044, N'STM-64: Synchronous Transport Module 64 (signal)', N'STM-64', N'9953280000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31045, N'OC1: Optical Carrier 1 (signal)', N'OC1', N'51840000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31046, N'OC3: Optical Carrier 3 (signal)', N'OC3', N'155520000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31047, N'OC12: Optical Carrier 12 (signal)', N'OC12', N'622080000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31048, N'OC24: Optical Carrier 24 (signal)', N'OC24', N'1244160000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31049, N'OC48: Optical Carrier 48 (signal)', N'OC48', N'2488320000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31050, N'OC192: Optical Carrier 192 (signal)', N'OC192', N'9953280000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31051, N'OC768: Optical Carrier 768 (signal)', N'OC768', N'39813120000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31052, N'kilobits per second (by SI def.)', N'kbps(SI)', N'1000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31053, N'kilobits per second', N'kbps', N'1024.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31054, N'megabits per second (by SI def.)', N'Mbps(SI)', N'1000000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31055, N'megabits per second', N'Mbps', N'1048576.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31056, N'gigabits per second (by SI def.)', N'Gbps(SI)', N'1000000000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31057, N'gigabits per second', N'Gbps', N'1073741824.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31058, N'terabits per second (by SI def.)', N'Tbps(SI)', N'1E12', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31059, N'terabits per second', N'Tbps', N'1099511627776.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31060, N'bytes per second', N'Bps', N'8.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31061, N'kilobytes per second (by SI def.)', N'kBps(SI)', N'8000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31062, N'kilobytes per second', N'kB', N'8192.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31063, N'megabytes per second (by SI def.)', N'MBps(SI)', N'8000000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31064, N'megabytes per second', N'MB', N'8388608.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31065, N'gigabytes per second (by SI def.)', N'GBps(SI)', N'8000000000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31066, N'gigabytes per second', N'GBps', N'8589934592.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31067, N'terabytes per second (by SI def.)', N'TBps(SI)', N'8000000000000.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (31068, N'terabytes per second', N'TBps', N'8796093022208.0', NULL, 31000, 0, 31)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (32000, N'Kelvin', N'K', N'1.0', NULL, NULL, 0, 32)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (32001, N'Celsius', N'°C', N'273.15', NULL, 32000, 2, 32)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (32002, N'Fahrenheit', N'°F', N'((X-273.15)*(9.0/5.0))+32.0', N'(((X-32.0)*5.0)/9.0)+273.15', 32000, 1, 32)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (32003, N'Rankine', N'°Rank', N'(((X-273.15)*(9.0/5.0))+32.0)+459.67', N'((((X-459.67)-32.0)*5.0)/9.0)+273.15', 32000, 1, 32)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (32004, N'Reaumur', N'-', N'(0.8)*(X-273.15)', N'(X/0.8)+273.15', 32000, 1, 32)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (33000, N'second', N's', N'1.0', NULL, NULL, 0, 33)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (33001, N'minute', N'min', N'60.0', NULL, 33000, 0, 33)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (33002, N'hour', N'h', N'3600.0', NULL, 33000, 0, 33)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (33003, N'day', N'd', N'86400.0', NULL, 33000, 0, 33)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (33004, N'week', N'wk', N'604800.0', NULL, 33000, 0, 33)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (33005, N'month', N'm', N'2592000.0', NULL, 33000, 0, 33)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (33006, N'year', N'yr', N'31536000.0', NULL, 33000, 0, 33)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (33007, N'year (mean)', N'yr', N'31557600.0', NULL, 33000, 0, 33)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (33008, N'year (tropical)', N'yr', N'31556930.0', NULL, 33000, 0, 33)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (33009, N'leap year', N'Lyr', N'31622400.0', NULL, 33000, 0, 33)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (33010, N'century', N'cn', N'3155692597.5456', NULL, 33000, 0, 33)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (33011, N'novennial', N'-', N'283824000.0', NULL, 33000, 0, 33)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (33012, N'octennial', N'-', N'252288000.0', NULL, 33000, 0, 33)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (33013, N'septennial', N'-', N'220752000.0', NULL, 33000, 0, 33)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (33014, N'quinquennial', N'-', N'157680000.0', NULL, 33000, 0, 33)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (33015, N'quindecennial', N'-', N'473040000.0', NULL, 33000, 0, 33)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (33016, N'sidereal hour', N'shr', N'3590.17', NULL, 33000, 0, 33)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (33017, N'sidereal day', N'shd', N'86164.091', NULL, 33000, 0, 33)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (33018, N'sidereal year', N'sdy', N'31558149.5', NULL, 33000, 0, 33)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (33019, N'shake', N'shake', N'1E-8', NULL, 33000, 0, 33)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (33020, N'synodic month', N'sm', N'2551443.84', NULL, 33000, 0, 33)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (33021, N'fortnight', N'fn', N'1209600.0', NULL, 33000, 0, 33)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (34000, N'Newton metre', N'N·m', N'1.0', NULL, NULL, 0, 34)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (34001, N'kilonewton metres', N'kN·m', N'1000.0', NULL, 34000, 0, 34)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (34002, N'Netwon centimetre', N'N·cm', N'0.01', NULL, 34000, 0, 34)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (34003, N'Netwon melimetre', N'N·mm', N'0.001', NULL, 34000, 0, 34)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (34004, N'dyne metre', N'dyn·m', N'1E-5', NULL, 34000, 0, 34)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (34005, N'dyne centemetre', N'dyn·cm', N'1E-7', NULL, 34000, 0, 34)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (34006, N'dyne millimetre', N'dyn·mm', N'1E-8', NULL, 34000, 0, 34)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (34007, N'kilogram force metre', N'kgf·m', N'9.80665', NULL, 34000, 0, 34)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (34008, N'gram force metre', N'gf·m', N'0.00980665', NULL, 34000, 0, 34)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (34009, N'kilogram force centimetre', N'kgf·cm', N'0.0980665', NULL, 34000, 0, 34)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (34010, N'gram force centimetre', N'gf·cm', N'9.80665E-5', NULL, 34000, 0, 34)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (34011, N'kilogram force millimetre', N'kgf·mm', N'0.00980665', NULL, 34000, 0, 34)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (34012, N'gram force millimetre', N'gf·mm', N'9.80665E-6', NULL, 34000, 0, 34)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (34013, N'ounce fource foot (avoirdupois)', N'ozf·ft', N'0.084738624', NULL, 34000, 0, 34)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (34014, N'ounce force inch (avoirdupois)', N'ozf·in', N'0.007061552', NULL, 34000, 0, 34)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (34015, N'pound-force foot', N'lbf·ft', N'1.355818', NULL, 34000, 0, 34)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (34016, N'pound-force inch', N'lbf·in', N'0.112984833333333', NULL, 34000, 0, 34)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (35000, N'printer points', N'pt', N'1.0', NULL, NULL, 0, 35)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (35001, N'PostScript points', N'pt', N'1.00375', NULL, 35000, 0, 35)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (35002, N'ceros', N'c', N'12.857143', NULL, 35000, 0, 35)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (35003, N'centimetres', N'cm', N'28.5714285714286', NULL, 35000, 0, 35)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (35004, N'millimetres', N'mm', N'2.85714285714286', NULL, 35000, 0, 35)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (35005, N'inches', N'in', N'72.27', NULL, 35000, 0, 35)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (35006, N'pica (computer 1/6")', N'p', N'12.0952371428571', NULL, 35000, 0, 35)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (35007, N'pica (printer’s)', N'p', N'12.0500514285714', NULL, 35000, 0, 35)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (35008, N'en', N'en', N'0.5', NULL, 35000, 0, 35)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (36000, N'meters per second', N'm/s', N'1.0', NULL, NULL, 0, 36)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (36001, N'light speed', N'c', N'299792458.0', NULL, 36000, 0, 36)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (36002, N'mach (sea level)', N'-', N'340.5337614', NULL, 36000, 0, 36)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (36003, N'mach (10,000 ft)', N'-', N'328.5906272', NULL, 36000, 0, 36)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (36004, N'mach (20,000 ft)', N'-', N'316.2356608', NULL, 36000, 0, 36)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (36005, N'mach (30,000 ft)', N'-', N'303.3659042', NULL, 36000, 0, 36)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (36006, N'mach (36,089 ft)', N'-', N'295.283697', NULL, 36000, 0, 36)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (36007, N'centimetre per hour', N'cm/h', N'2.777777778E-6', NULL, 36000, 0, 36)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (36008, N'centimetre per minute', N'cm/m', N'0.0001666666667', NULL, 36000, 0, 36)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (36009, N'centimetre per second', N'cm/s', N'0.01', NULL, 36000, 0, 36)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (36010, N'metre per hour', N'm/h', N'0.0002777777778', NULL, 36000, 0, 36)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (36011, N'metre per minute', N'm/m', N'0.01666666667', NULL, 36000, 0, 36)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (36012, N'kilometer per hour', N'kph', N'0.2777777778', NULL, 36000, 0, 36)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (36013, N'kilometer per minute', N'k/m', N'16.66666667', NULL, 36000, 0, 36)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (36014, N'kilometer per second', N'k/s', N'1000.0', NULL, 36000, 0, 36)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (36015, N'Knots', N'kn', N'0.5147902667', NULL, 36000, 0, 36)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (36016, N'foot per hour', N'ft/h', N'8.466666667E-5', NULL, 36000, 0, 36)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (36017, N'foot per minute', N'ft/m', N'0.00508', NULL, 36000, 0, 36)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (36018, N'foot per second', N'ft/s', N'0.3048', NULL, 36000, 0, 36)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (36019, N'yard per hour', N'yd/h', N'0.000254', NULL, 36000, 0, 36)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (36020, N'yard per minute', N'yd/m', N'0.01524', NULL, 36000, 0, 36)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (36021, N'yard per second', N'yd/s', N'0.9144', NULL, 36000, 0, 36)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (36022, N'mile per hour', N'mph', N'0.44704', NULL, 36000, 0, 36)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (36023, N'mile per minute', N'mi/m', N'26.8224', NULL, 36000, 0, 36)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (36024, N'mile per second', N'mi/s', N'1609.344', NULL, 36000, 0, 36)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (37000, N'pascal second', N'Pa·s', N'1.0', NULL, NULL, 0, 37)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (37001, N'yottapoise', N'YP', N'1E23', NULL, 37000, 0, 37)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (37002, N'zettapoise', N'ZP', N'1E20', NULL, 37000, 0, 37)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (37003, N'exapoise', N'EP', N'1E17', NULL, 37000, 0, 37)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (37004, N'petapoise', N'PP', N'1E14', NULL, 37000, 0, 37)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (37005, N'terapoise', N'TP', N'1E11', NULL, 37000, 0, 37)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (37006, N'gigapoise', N'GP', N'1E8', NULL, 37000, 0, 37)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (37007, N'megapoise', N'MP', N'1E5', NULL, 37000, 0, 37)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (37008, N'kilopoise', N'kP', N'100.0', NULL, 37000, 0, 37)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (37009, N'hectopoise', N'hP', N'10.0', NULL, 37000, 0, 37)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (37010, N'dekapoise', N'daP', N'1.0', NULL, 37000, 0, 37)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (37011, N'poise', N'P', N'0.1', NULL, 37000, 0, 37)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (37012, N'decipoise', N'dP', N'0.01', NULL, 37000, 0, 37)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (37013, N'centipoise', N'cP', N'0.001', NULL, 37000, 0, 37)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (37014, N'millipoise', N'mP', N'1E-4', NULL, 37000, 0, 37)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (37015, N'micropoise', N'µP', N'1E-7', NULL, 37000, 0, 37)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (37016, N'nanopoise', N'nP', N'1E-10', NULL, 37000, 0, 37)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (37017, N'picopoise', N'pP', N'1E-13', NULL, 37000, 0, 37)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (37018, N'femtopoise', N'fP', N'1E-16', NULL, 37000, 0, 37)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (37019, N'attopoise', N'aP', N'1E-19', NULL, 37000, 0, 37)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (37020, N'zeptopoise', N'zP', N'1E-22', NULL, 37000, 0, 37)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (37021, N'yoctopoise', N'yP', N'1E-25', NULL, 37000, 0, 37)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (37022, N'poundal second per square foot', N'-', N'1.488164', NULL, 37000, 0, 37)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (37023, N'pound-force second per square foot', N'lbf·s/ft²', N'47.88026', NULL, 37000, 0, 37)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (37024, N'pound-force second per square inch', N'lbf·s/in²', N'6894.757', NULL, 37000, 0, 37)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (37025, N'pound per foot hour', N'lb/(ft·h)', N'0.0004133789', NULL, 37000, 0, 37)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (37026, N'pound per foot second', N'lb/(ft·s)', N'1.488164', NULL, 37000, 0, 37)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (37027, N'slug per foot second', N'slug/(ft·s)', N'47.88026', NULL, 37000, 0, 37)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (38000, N'metre squared per second', N'm²/s', N'1.0', NULL, NULL, 0, 38)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (38001, N'yottastokes', N'YSt', N'1E20', NULL, 38000, 0, 38)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (38002, N'zettastokes', N'ZSt', N'1E17', NULL, 38000, 0, 38)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (38003, N'exastokes', N'ESt', N'1E14', NULL, 38000, 0, 38)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (38004, N'petastokes', N'PSt', N'1E11', NULL, 38000, 0, 38)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (38005, N'terastokes', N'TSt', N'1E8', NULL, 38000, 0, 38)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (38006, N'gigastokes', N'GSt', N'1E5', NULL, 38000, 0, 38)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (38007, N'megastokes', N'MSt', N'1E2', NULL, 38000, 0, 38)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (38008, N'kilostokes', N'kSt', N'1.0E-1', NULL, 38000, 0, 38)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (38009, N'hectostokes', N'hSt', N'1.0E-2', NULL, 38000, 0, 38)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (38010, N'dekastokes', N'daSt', N'1.0E-3', NULL, 38000, 0, 38)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (38011, N'stokes', N'St', N'1.0E-4', NULL, 38000, 0, 38)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (38012, N'decistokes', N'dSt', N'1E-5', NULL, 38000, 0, 38)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (38013, N'centistokes', N'cSt', N'1E-6', NULL, 38000, 0, 38)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (38014, N'millistokes', N'mSt', N'1E-7', NULL, 38000, 0, 38)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (38015, N'microstokes', N'µSt', N'1E-10', NULL, 38000, 0, 38)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (38016, N'nanostokes', N'nSt', N'1E-13', NULL, 38000, 0, 38)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (38017, N'picostokes', N'pSt', N'1E-15', NULL, 38000, 0, 38)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (38018, N'femtostokes', N'fSt', N'1E-19', NULL, 38000, 0, 38)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (38019, N'attostokes', N'aSt', N'1E-22', NULL, 38000, 0, 38)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (38020, N'zeptostokes', N'zSt', N'1E-25', NULL, 38000, 0, 38)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (38021, N'yoctostokes', N'ySt', N'1E-28', NULL, 38000, 0, 38)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (38022, N'square foot per second', N'ft²/s', N'0.09290304', NULL, 38000, 0, 38)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39000, N'litre', N'L', N'1.0', NULL, NULL, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39001, N'yottalitre', N'YL', N'1E24', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39002, N'zettalitre', N'ZL', N'1E21', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39003, N'exalitre', N'EL', N'1E18', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39004, N'petalitre', N'PL', N'1E15', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39005, N'teralitre', N'TL', N'1E12', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39006, N'gigalitre', N'GL', N'1E9', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39007, N'megalitre', N'ML', N'1E6', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39008, N'kilolitre', N'kL', N'1000.0', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39009, N'hectolitre', N'hL', N'100.0', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39010, N'dekalitre', N'daL', N'10.0', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39011, N'decilitre', N'dL', N'0.1', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39012, N'centilitre', N'cL', N'0.01', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39013, N'millilitre', N'mL', N'0.001', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39014, N'microlitre', N'µL', N'1E-6', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39015, N'nanolitre', N'nL', N'1E-9', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39016, N'picolitre', N'pL', N'1E-12', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39017, N'femtolitre', N'fL', N'1E-15', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39018, N'attolitre', N'aL', N'1E-18', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39019, N'zeptolitre', N'zL', N'1E-21', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39020, N'yoctolitre', N'yL', N'1E-24', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39021, N'cubic metres', N'm³', N'1000.0', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39022, N'cubic centimetre', N'cm³', N'0.001', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39024, N'cubic yards', N'yd³', N'764.554858', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39025, N'cubic feet', N'ft³', N'28.31684659', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39026, N'cubic inches', N'in³', N'0.016387064', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39027, N'gill (UK)', N'gi', N'0.1420653125', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39028, N'gill (US)', N'gi', N'0.1182941', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39029, N'gallon (UK)', N'gal', N'4.546099294', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39030, N'gallon (US)', N'gal', N'3.785411784', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39031, N'quart (US)', N'qt', N'0.946352946', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39032, N'quart (UK)', N'qt', N'1.136524823', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39033, N'Pint (US)', N'pt', N'0.473176473', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39034, N'Pint (UK)', N'pt', N'0.56826125', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39035, N'cup (US)', N'cup', N'0.2365882365', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39036, N'cup (UK)', N'cup', N'0.2841312059', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39037, N'minim (US)', N'-', N'6.161152E-5', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39038, N'minim (UK)', N'-', N'5.91939E-5', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39039, N'dram', N'-', N'0.003696716', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39040, N'fluid ounces (US)', N'oz', N'0.02957352956', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39041, N'fluid ounces (UK)', N'oz', N'0.0284130625', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39042, N'Tablespoon', N'Tbsp', N'0.01478676478', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39043, N'Tablespoon (Australia)', N'Tbsp', N'0.019715686376', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39044, N'Metric Tablespoon', N'Tbsp', N'0.015', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39045, N'Teaspoon', N'tsp', N'0.005', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39046, N'Metric Teaspoon', N'tsp', N'0.004928921594', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39047, N'Taza (Español)', N'taza', N'0.2365882365', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39048, N'acre-foot', N'acre·ft', N'1233481.83745', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39049, N'bushel (US)', N'bu', N'35.23907', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39050, N'bushel (UK)', N'bu', N'36.3687', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39051, N'barrel (US dry)', N'-', N'115.6271', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39052, N'barrel (petroleum)', N'-', N'158.987', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39053, N'peck (US)', N'-', N'8.809768', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39054, N'peck (UK)', N'-', N'9.092175', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39055, N'dry pint', N'pt', N'0.5506105', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39056, N'dry quart', N'qt', N'1.101221', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39057, N'Hogshead', N'-', N'238.480942392', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39058, N'dash', N'-', N'0.0006161151993', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39059, N'pinch', N'-', N'0.00030805759965', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39060, N'smidgen', N'-', N'0.000154028799825', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39061, N'Thousand Cubic Feet', N'Mcf', N'283168.4659', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39062, N'Million Cubic Feet', N'MMcf', N'283168465.9', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39063, N'Billion Cubic Feet', N'Bcf', N'283168465900.0', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39064, N'Thousand Cubic Meters', N'E3M3', N'1000.0', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39065, N'Million Cubic Meters', N'E6M3', N'1000000', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39066, N'Hundred Cubic Meters', N'102m3', N'100', NULL, 39000, 0, 39)
GO
INSERT [dbo].[Units] ([ID], [Name], [Symbol], [ConvertFrom], [ConvertTo], [BaseUnitID], [FormulaTypeID], [UnitClassID]) VALUES (39067, N'Hundred Cubic Feet', N'Ccf', N'28316.84659', NULL, 39000, 0, 39)
GO
INSERT [dbo].[UnitSets] ([ID], [Name], [SystemDefaultUnitID]) VALUES (1, N'Differential Pressure Units', NULL)
GO
INSERT [dbo].[UnitSets] ([ID], [Name], [SystemDefaultUnitID]) VALUES (2, N'Static Pressure Units', NULL)
GO
INSERT [dbo].[UnitSets] ([ID], [Name], [SystemDefaultUnitID]) VALUES (3, N'Temperature Units', NULL)
GO
INSERT [dbo].[UnitSets] ([ID], [Name], [SystemDefaultUnitID]) VALUES (4, N'Raw Volume Units', NULL)
GO
INSERT [dbo].[UnitSets] ([ID], [Name], [SystemDefaultUnitID]) VALUES (5, N'Measured Volume Units', NULL)
GO
INSERT [dbo].[UnitSets] ([ID], [Name], [SystemDefaultUnitID]) VALUES (6, N'Energy Units', NULL)
GO
INSERT [dbo].[UnitSets] ([ID], [Name], [SystemDefaultUnitID]) VALUES (7, N'Temperature Base Units', NULL)
GO
INSERT [dbo].[UnitSets] ([ID], [Name], [SystemDefaultUnitID]) VALUES (8, N'Gas Pressure Base Units', NULL)
GO
INSERT [dbo].[UnitSets] ([ID], [Name], [SystemDefaultUnitID]) VALUES (9, N'Atmospheric Pressure Units', NULL)
GO
INSERT [dbo].[UnitSets] ([ID], [Name], [SystemDefaultUnitID]) VALUES (10, N'Gas Volume K-Factor Units', NULL)
GO
INSERT [dbo].[UnitSets] ([ID], [Name], [SystemDefaultUnitID]) VALUES (11, N'Liquid Volume K-Factor Units', NULL)
GO
INSERT [dbo].[UnitSets] ([ID], [Name], [SystemDefaultUnitID]) VALUES (12, N'Mass K-Factor Units', NULL)
GO
INSERT [dbo].[UnitSets] ([ID], [Name], [SystemDefaultUnitID]) VALUES (13, N'Orifice / Cone Temperature Units', NULL)
GO
INSERT [dbo].[UnitSets] ([ID], [Name], [SystemDefaultUnitID]) VALUES (14, N'Pipe Reference Temperature Units', NULL)
GO
INSERT [dbo].[UnitSets] ([ID], [Name], [SystemDefaultUnitID]) VALUES (15, N'Orifice / Cone Diameter Units', NULL)
GO
INSERT [dbo].[UnitSets] ([ID], [Name], [SystemDefaultUnitID]) VALUES (16, N'Pipe Diameter Units', NULL)
GO
INSERT [dbo].[UnitSets] ([ID], [Name], [SystemDefaultUnitID]) VALUES (17, N'Viscosity Units', NULL)
GO
INSERT [dbo].[UnitSets] ([ID], [Name], [SystemDefaultUnitID]) VALUES (18, N'Mass Units', NULL)
GO
INSERT [dbo].[UnitSets] ([ID], [Name], [SystemDefaultUnitID]) VALUES (19, N'Observed Density Units', NULL)
GO
INSERT [dbo].[UnitSets] ([ID], [Name], [SystemDefaultUnitID]) VALUES (20, N'Indicated Volume Units', NULL)
GO
INSERT [dbo].[UnitSets] ([ID], [Name], [SystemDefaultUnitID]) VALUES (21, N'Gross Volume Units', NULL)
GO
INSERT [dbo].[UnitSets] ([ID], [Name], [SystemDefaultUnitID]) VALUES (22, N'Gross Standard Volume Units', NULL)
GO
INSERT [dbo].[UnitSets] ([ID], [Name], [SystemDefaultUnitID]) VALUES (23, N'Net Standard Volume Units', NULL)
GO
INSERT [dbo].[UnitSets] ([ID], [Name], [SystemDefaultUnitID]) VALUES (24, N'Density Units', NULL)
GO
INSERT [dbo].[UnitSets] ([ID], [Name], [SystemDefaultUnitID]) VALUES (25, N'Equilibrium Vapor Pressure Units', NULL)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (1, 29008)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (1, 29022)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (1, 29033)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (2, 29008)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (2, 29021)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (2, 29041)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (3, 32001)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (3, 32002)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (4, 39021)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (4, 39025)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (4, 39061)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (4, 39062)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (4, 39064)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (5, 39021)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (5, 39025)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (5, 39061)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (5, 39062)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (5, 39064)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (6, 14006)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (6, 14032)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (6, 14041)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (7, 32001)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (7, 32002)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (8, 29008)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (8, 29021)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (8, 29041)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (9, 29008)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (9, 29021)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (9, 29041)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (10, 39021)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (10, 39025)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (10, 39061)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (10, 39062)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (10, 39064)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (11, 39000)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (11, 39021)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (11, 39030)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (11, 39052)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (12, 26008)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (12, 26021)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (13, 32001)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (13, 32002)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (14, 32001)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (14, 32002)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (15, 24013)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (15, 24026)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (16, 24013)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (16, 24026)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (17, 37013)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (17, 37026)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (18, 26008)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (18, 26021)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (19, 12002)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (19, 12004)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (19, 12031)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (19, 12034)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (20, 39000)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (20, 39021)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (20, 39030)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (20, 39052)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (21, 39000)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (21, 39021)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (21, 39030)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (21, 39052)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (22, 39000)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (22, 39021)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (22, 39030)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (22, 39052)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (23, 39000)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (23, 39021)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (23, 39030)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (23, 39052)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (24, 12002)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (24, 12004)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (24, 12031)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (24, 12034)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (25, 29008)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (25, 29021)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (25, 29041)
GO
INSERT [dbo].[UnitSetUnits] ([UnitSetID], [UnitID]) VALUES (25, 29043)
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([ID], [UserName], [FullName], [AccountDisabled], [IsSystemAdministrator], [DateTimeCreated]) VALUES (1, N'Jason', N'Jason Craig', 0, 1, CAST(N'2024-09-23T16:29:12.837' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
INSERT [dbo].[VesselTypes] ([ID], [Name]) VALUES (1, N'Horizontal Bullet (Above Ground)')
GO
INSERT [dbo].[VesselTypes] ([ID], [Name]) VALUES (2, N'Horizontal Bullet (Below Ground)')
GO
INSERT [dbo].[ViscosityEquations] ([ID], [Name]) VALUES (6100, N'Chung, Lee, and Starling Equation')
GO
INSERT [dbo].[ViscosityEquations] ([ID], [Name]) VALUES (6101, N'Lee-Gonzalez-Eakin ')
GO
INSERT [dbo].[ViscosityEquations] ([ID], [Name]) VALUES (6999, N'Unknown')
GO
INSERT [dbo].[VolumetricHeatingValueUnits] ([ID], [Name], [Symbol], [VolumeUnitID], [EnergyUnitID]) VALUES (1, N'Megajoules per cubic meter', N'MJ/m3', 39021, 14007)
GO
INSERT [dbo].[VolumetricHeatingValueUnits] ([ID], [Name], [Symbol], [VolumeUnitID], [EnergyUnitID]) VALUES (2, N'Btu per standard cubic foot', N'Btu/scf', 39025, 14021)
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (1, N'ACID', N'Acid Solutions (un-neutralized)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (2, N'ACTCRB', N'Activated Carbon')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (3, N'ADDMAT', N'Additives used in WP Processing')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (4, N'ASBEST', N'Asbestos')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (5, N'BATT', N'Batteries (wet and dry cell)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (6, N'BLBDWT', N'Boiler Blowdown Water')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (7, N'CATNS', N'Catalyst (non-sulphur)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (8, N'CATSU', N'Catalyst (sulphur)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (9, N'CAUS', N'Caustic Solutions (un-neutralized, spent)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (10, N'CEMENT', N'Cement (returns dry)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (11, N'COEMUL', N'Crude Oil/Condensate Emulsions (residuals after treatment)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (12, N'CONMAT', N'Construction and Demolition Material')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (13, N'CORINH', N'Corrosion Inhibitor/Oxygen Scavenger Solutions')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (14, N'CWATER', N'Waters Contaminated (leachate, collected surface waters)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (15, N'DESICT', N'Desiccant')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (16, N'DMDS', N'Dimethyl Disulphide Solutions')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (17, N'DOMWST', N'Garbage/Domestic Waste')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (18, N'DRWSHC', N'Drilling Waste Hydrocarbon')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (19, N'DRWSGC', N'Drilling Waste Gel Chemical')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (20, N'DRWSAC', N'Drilling Waste Advanced Gel Chemical')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (21, N'EMTCON', N'Aerosol Cans; Barrels, Pails; Crude Oil Sample Bottles; Cutting Oil Tubes; Grease Cartridges; Mud Sacks – Drilling; Paint Cans, Brushes; Pipe Dope Containers, Brushes')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (22, N'FILAPC', N'Filters - Air Pollution Control')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (23, N'FILFWT', N'Filters - Raw/Fresh Water')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (24, N'FILGLY', N'Filters - Glycol')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (25, N'FILLUB', N'Filters - Lube Oil ')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (26, N'FILMTH', N'Filters - Methanol')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (27, N'FILOTH', N'Filters - Other (raw/fuel gas, NGLs)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (28, N'FILPWT', N'Filters - Produced/Process Water')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (29, N'FILSWT', N'Filters - Gas Sweetening (MEA, DEA, MDEA, sulphinol)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (30, N'FILWTT', N'Filters (Media) - Water Treatment')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (31, N'FLBWSW', N'Filter Backwash Liquids (gas sweetening)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (32, N'FLBWWT', N'Filter Backwash Liquids (water treatment)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (33, N'FRCSND', N'Frac Sand - Non-Radioactive')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (34, N'FRFLDW', N'Frac Fluid (water based)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (35, N'FRFLDH', N'Frac Fluid (hydrocarbon based)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (36, N'FRFLDR', N'Frac Fluid Radioactive')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (37, N'FRMFNS', N'Residual formation fines after treatment and settlement')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (38, N'FRSDR', N'Frac Sand - Radioactive (plus other radioactive diagnostic materials)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (39, N'GLYC', N'Glycol Solutions (no heavy metals)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (40, N'GLYCHM', N'Glycol Solutions (containing lead or other heavy metals) ')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (41, N'HSPWTR', N'High Solids Produced Water')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (42, N'HYDOIL', N'Hydraulic and Transmission Oil')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (43, N'HYDVCH', N'Hydrovac Material (chemical/solvents impacted)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (44, N'HYDVCO', N'Hydrovac Material (crude oil/condensate impacted)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (45, N'HYDVHM', N'Hydrovac Material (mercury/heavy metals impacted)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (46, N'HYDVPT', N'Hydrovac Material (pesticide/herbicide impacted)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (47, N'HYDVPW', N'Hydrovac Material (produced/salt water impacted)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (48, N'HYDVRO', N'Hydrovac Material (refined fuels/oils impacted)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (49, N'HYDVSU', N'Hydrovac Material (sulphur impacted)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (50, N'HYDVEM', N'Hydrovac Material (emulsion impacted)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (51, N'IEXLIQ', N'Ion Exchange Resin Regenerant Liquids')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (52, N'IEXRES', N'Ion Exchange Resin')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (53, N'INCASH', N'Incinerator Ash')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (54, N'INOCHM', N'Chemicals (inorganic)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (55, N'IRNSPG', N'Iron Sponge')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (56, N'LDDOPE', N'Lead Based Products (pipe dope/greases)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (57, N'LDTAPE', N'Lead Based Products (H2S sensing tape)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (58, N'LUBOIL', N'Lubricating Oil (hydrocarbon and synthetic)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (59, N'METHNL', N'Hydrotest Fluids - Methanol')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (60, N'NORM', N'Naturally Occurring Radioactive Materials - NORMs')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (61, N'OILABS', N'Absorbants')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (62, N'OILRAG', N'Rags')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (63, N'ORGCHM', N'Chemicals (organic)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (64, N'PCBBAL', N'Polychlorinated Biphenyls (PCBs) - Fluorescent Light Ballasts')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (65, N'PCBLIQ', N'Polychlorinated Biphenyls (PCBs) Askarel Liquids')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (66, N'PCBSLI', N'Polychlorinated Biphenyls (PCBs) - Contaminated Solids > 50 ppm < 1000 ppm')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (67, N'PCBSGI', N'Polychlorinated Biphenyls (PCBs) - Contaminated Solids > 1000 ppm')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (68, N'PCBSLF', N'Polychlorinated Biphenyls (PCBs) - Contaminated Solids < 50 ppm')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (69, N'PIGWST', N'Pigging Waste (liquid and wax)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (70, N'PSTCON', N'Pesticide/Herbicide Containers')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (71, N'PSTHRB', N'Pesticides/Herbicides')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (72, N'PWTRHM', N'Water - Process (with heavy metals)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (73, N'PWTROR', N'Water Process (with organic chemicals)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (74, N'SALT', N'Salt Heat Medium')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (75, N'SAND', N'Sand - Produced')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (76, N'SLGCTW', N'Sludge - Cooling Tower')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (77, N'SLGEML', N'Sludge – Emulsion')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (78, N'SLGGLY', N'Sludge - Glycol/Gas Drying')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (79, N'SLGHYD', N'Sludge - Hydrocarbon')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (80, N'SLGLIM', N'Sludge - Lime')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (81, N'SLGPIT', N'Sludge - Flare Pit')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (82, N'SLGPRO', N'Sludge - Process')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (83, N'SLGSUL', N'Sludge - Sulphur')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (84, N'SLGSWT', N'Sludge - Gas Sweetening Systems')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (85, N'SMETAL', N'Metal (scrap)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (86, N'SOILCH', N'Contaminated Debris and Soil (chemical/solvent)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (87, N'SOILCO', N'Contaminated Debris and Soil (crude oil/condensate)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (88, N'SOILEM', N'Contaminated Debris and Soil (emulsion)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (89, N'SOILHM', N'Contaminated Debris and Soil (mercury/metals)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (90, N'SOILPT', N'Contaminated Debris and Soil (pesticide/herbicide)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (91, N'SOILPW', N'Contaminated Debris and Soil (produced/salt water)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (92, N'SOILRO', N'Contaminated Debris and Soil (refined fuels/oils)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (93, N'SOILSU', N'Contaminated Debris and Soil (sulphur)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (94, N'SOLALP', N'Solvents/Residues (non-halogenated aliphatic)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (95, N'SOLARO', N'Solvents/Residues (non-halogenated aromatic)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (96, N'SOLHAL', N'Solvents/Residues (halogenated)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (97, N'SWTLIQ', N'Sweetening Agents (liquids)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (98, N'SWTSOL', N'Sweetening Agents (solids)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (99, N'THPROT', N'Thread Protectors - Casing/Tubing')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (100, N'TRTHAY', N'Treater Hay')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (101, N'WATER', N'Water - Produced (including brine solutions)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (102, N'WOODCT', N'Wood (chemically treated/cooling tower)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (103, N'WPAINT', N'Paints')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (104, N'WSHORG', N'Wash Fluids - Organic')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (105, N'WSHWTR', N'Wash Fluids - Water')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (106, N'WSTCGS', N'Waste Compressed or Liquefied Gases')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (107, N'CODE ', N'Descriptions ')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (108, N'WSTCLQ', N'Waste Corrosive Liquid')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (109, N'WSTCSO', N'Waste Corrosive Solid')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (110, N'WSTFLQ', N'Waste Flammable Liquid')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (111, N'WSTFSD', N'Waste Flammable Solid')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (112, N'WSTMIS', N'Waste - Miscellaneous')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (113, N'WSTOLQ', N'Waste Oxidizing Liquid')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (114, N'WSTOSD', N'Waste Oxidizing Solid')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (115, N'WSTPLQ', N'Waste Poisonous Liquid')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (116, N'WSTPSD', N'Waste Poisonous Solid')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (117, N'WSTRDM', N'Waste Radioactive Material')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (118, N'WWOFLD', N'Well Workover Fluids')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (119, N'BUFFOIL', N'Buffer Oil used in Cavern Operations')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (120, N'BRKWTR', N'Saline Water/Brackish Water – Brackish water is not recognized in Saskatchewan and should only be used for cross-border transactions ')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (121, N'FSHWTR', N'Non-Saline Water/Fresh water - TDS < 4000 ppm or water received from a fresh water source facility - WS ( subtype 905) or WT (subtypes 907)')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (122, N'MNFCTR', N'Manufacture')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (123, N'NONOFD', N'Non-Oilfield Waste')
GO
INSERT [dbo].[WasteCodes] ([ID], [Code], [Description]) VALUES (124, N'WASTE', N'Special waste code for a waste plant disposing to/receiving from another waste plant or injection facility.')
GO
INSERT [dbo].[WasteLocationTypes] ([ID], [IsReciever], [Name]) VALUES (0, 0, N'None')
GO
INSERT [dbo].[WasteLocationTypes] ([ID], [IsReciever], [Name]) VALUES (1, 0, N'Car Wash Sump Waste Generator')
GO
INSERT [dbo].[WasteLocationTypes] ([ID], [IsReciever], [Name]) VALUES (2, 0, N'Exploration and Production Waste Generator')
GO
INSERT [dbo].[WasteLocationTypes] ([ID], [IsReciever], [Name]) VALUES (3, 0, N'Gas/Service Station Waste Generator')
GO
INSERT [dbo].[WasteLocationTypes] ([ID], [IsReciever], [Name]) VALUES (4, 0, N'Industrial/Commerical Waste Generator')
GO
INSERT [dbo].[WasteLocationTypes] ([ID], [IsReciever], [Name]) VALUES (5, 0, N'Landfill Waste Generator')
GO
INSERT [dbo].[WasteLocationTypes] ([ID], [IsReciever], [Name]) VALUES (6, 0, N'Manufacture Waste Generator')
GO
INSERT [dbo].[WasteLocationTypes] ([ID], [IsReciever], [Name]) VALUES (7, 0, N'Oil/Gas Service Company Waste Generator')
GO
INSERT [dbo].[WasteLocationTypes] ([ID], [IsReciever], [Name]) VALUES (8, 0, N'Oilfield Waste Processing Facility Generator')
GO
INSERT [dbo].[WasteLocationTypes] ([ID], [IsReciever], [Name]) VALUES (9, 0, N'Recycling Facility Waste Generator')
GO
INSERT [dbo].[WasteLocationTypes] ([ID], [IsReciever], [Name]) VALUES (10, 0, N'Refinery Waste Generator')
GO
INSERT [dbo].[WasteLocationTypes] ([ID], [IsReciever], [Name]) VALUES (11, 0, N'Storage Facility Waste Generator')
GO
INSERT [dbo].[WasteLocationTypes] ([ID], [IsReciever], [Name]) VALUES (12, 0, N'Tank/Truck Wash Waste Generator')
GO
INSERT [dbo].[WasteLocationTypes] ([ID], [IsReciever], [Name]) VALUES (13, 0, N'Transfer Station Waste Generator')
GO
INSERT [dbo].[WasteLocationTypes] ([ID], [IsReciever], [Name]) VALUES (14, 0, N'Used Oil Recycler Waste Generator')
GO
INSERT [dbo].[WasteLocationTypes] ([ID], [IsReciever], [Name]) VALUES (15, 0, N'Utility Waste Generator')
GO
INSERT [dbo].[WasteLocationTypes] ([ID], [IsReciever], [Name]) VALUES (16, 0, N'Waste Location (Generator Type) ')
GO
INSERT [dbo].[WasteLocationTypes] ([ID], [IsReciever], [Name]) VALUES (17, 1, N'Biodegradeable Facility Waste Receiver')
GO
INSERT [dbo].[WasteLocationTypes] ([ID], [IsReciever], [Name]) VALUES (18, 1, N'Cavern Waste Receiver')
GO
INSERT [dbo].[WasteLocationTypes] ([ID], [IsReciever], [Name]) VALUES (19, 1, N'Disposal Well Waste Receiver')
GO
INSERT [dbo].[WasteLocationTypes] ([ID], [IsReciever], [Name]) VALUES (20, 1, N'Landfill Waste Receiver')
GO
INSERT [dbo].[WasteLocationTypes] ([ID], [IsReciever], [Name]) VALUES (21, 1, N'Manufacture Waste Receiver')
GO
INSERT [dbo].[WasteLocationTypes] ([ID], [IsReciever], [Name]) VALUES (22, 1, N'Oilfield Waste Processing Facility Waste Receiver')
GO
INSERT [dbo].[WasteLocationTypes] ([ID], [IsReciever], [Name]) VALUES (23, 1, N'Recycling Facility Waste Receiver')
GO
INSERT [dbo].[WasteLocationTypes] ([ID], [IsReciever], [Name]) VALUES (24, 1, N'Refinery Waste Receiver')
GO
INSERT [dbo].[WasteLocationTypes] ([ID], [IsReciever], [Name]) VALUES (25, 1, N'Storage Facility Waste Receiver')
GO
INSERT [dbo].[WasteLocationTypes] ([ID], [IsReciever], [Name]) VALUES (26, 1, N'Thermal Treatment Waste Receiver')
GO
INSERT [dbo].[WasteLocationTypes] ([ID], [IsReciever], [Name]) VALUES (27, 1, N'Transfer Station Waste Receiver')
GO
INSERT [dbo].[WasteLocationTypes] ([ID], [IsReciever], [Name]) VALUES (28, 1, N'Used Oil Recycler Waste Receiver')
GO
INSERT [dbo].[WasteLocationTypes] ([ID], [IsReciever], [Name]) VALUES (29, 1, N'Waste Location (Receiver Type) ')
GO
INSERT [dbo].[WaterRegions] ([ID], [Name]) VALUES (300, N'Region 1')
GO
INSERT [dbo].[WaterRegions] ([ID], [Name]) VALUES (301, N'Region 2')
GO
INSERT [dbo].[WaterRegions] ([ID], [Name]) VALUES (302, N'Region 3')
GO
INSERT [dbo].[WaterRegions] ([ID], [Name]) VALUES (303, N'Region 4')
GO
INSERT [dbo].[WaterRegions] ([ID], [Name]) VALUES (399, N'Unknown')
GO
INSERT [dbo].[WellComminglingProcesses] ([ID], [Code], [Name]) VALUES (1, N'DE1', N'Development Entity (DE) No. 1')
GO
INSERT [dbo].[WellComminglingProcesses] ([ID], [Code], [Name]) VALUES (2, N'DE2', N'Development Entity (DE) No. 2')
GO
INSERT [dbo].[WellComminglingProcesses] ([ID], [Code], [Name]) VALUES (3, N'MU', N'MU Commingling Order')
GO
INSERT [dbo].[WellComminglingProcesses] ([ID], [Code], [Name]) VALUES (4, N'SD_OIL', N'Self-declared (SD) oil')
GO
INSERT [dbo].[WellComminglingProcesses] ([ID], [Code], [Name]) VALUES (5, N'SD_GAS', N'Self-declared (SD) gas')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (0, N'N/A', N'Not Applicable')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (1, N'CR-OIL', N'Crude Oil')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (2, N'GAS', N'Gas')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (3, N'OIL', N'Oil')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (4, N'G-W', N'Gas-Water')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (5, N'UND', N'Undesignated')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (6, N'WATER', N'Water')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (7, N'BRINE', N'Brine')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (8, N'WASTE', N'Waste')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (9, N'SOLV', N'Solvent')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (10, N'STEAM', N'Steam')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (11, N'AIR', N'Air')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (12, N'SYN-CR', N'Synthetic Crude')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (13, N'CO2', N'Carbon Dioxide')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (14, N'POLYM', N'Polymer')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (15, N'N2', N'Nitrogen')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (16, N'LPG', N'Liquid Petroleum Gas')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (17, N'CR-BIT', N'Crude Bitumen')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (18, N'COND', N'Condensate')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (19, N'OXYGEN', N'Oxygen')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (20, N'ACID-G', N'Acid Gas')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (22, N'CBMOT', N'Coalbed Methane-coals & oth lith')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (23, N'CBMCLS', N'Coalbed Methane-coals only')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (24, N'SHGOT', N'Shale Gas & other sources')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (25, N'SHG', N'Shale Gas only')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (26, N'CBMSOT', N'CBM & Shale & other sources')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (50, N'AN AMM', N'Anhydrous Ammonia')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (51, N'CR O/B', N'Crude Oil / Bitumen')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (52, N'NAPHTH', N'Naphtha')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (53, N'PROPNE', N'Propane')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (54, N'BUTANE', N'Butanes')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (55, N'ETHANE', N'Ethane')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (56, N'ETH +', N'Ethane plus')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (57, N'PENT +', N'Pentanes plus')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (58, N'DIESEL', N'Diesel Oil')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (59, N'ALKH2O', N'Alkaline Water')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (60, N'MICLAR', N'Micellar')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (61, N'SKIM O', N'Skim Oil')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (62, N'SK EM', N'Skim Emulsion')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (63, N'AMMNIT', N'Ammonium Nitrate')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (64, N'SRCWTE', N'Source Water')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (65, N'SAND', N'Sand')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (66, N'ENTGAS', N'Entrained Gas')
GO
INSERT [dbo].[WellFluids] ([ID], [Code], [Name]) VALUES (98, N'MISC', N'Miscellaneous')
GO
INSERT [dbo].[WellModes] ([ID], [Code], [Name]) VALUES (0, N'N/A', N'Not Applicable')
GO
INSERT [dbo].[WellModes] ([ID], [Code], [Name]) VALUES (1, N'SUSP', N'Suspended')
GO
INSERT [dbo].[WellModes] ([ID], [Code], [Name]) VALUES (2, N'ABD', N'Abandoned')
GO
INSERT [dbo].[WellModes] ([ID], [Code], [Name]) VALUES (3, N'ABZONE', N'Abandoned Zone')
GO
INSERT [dbo].[WellModes] ([ID], [Code], [Name]) VALUES (4, N'ABRENT', N'Abandoned & Re-Entered')
GO
INSERT [dbo].[WellModes] ([ID], [Code], [Name]) VALUES (5, N'CAPPED', N'Capped')
GO
INSERT [dbo].[WellModes] ([ID], [Code], [Name]) VALUES (6, N'POT', N'Potential')
GO
INSERT [dbo].[WellModes] ([ID], [Code], [Name]) VALUES (7, N'DRL&C', N'Drilled and Cased')
GO
INSERT [dbo].[WellModes] ([ID], [Code], [Name]) VALUES (8, N'J&A', N'Junked & Abandoned')
GO
INSERT [dbo].[WellModes] ([ID], [Code], [Name]) VALUES (9, N'CLOSED', N'Closed')
GO
INSERT [dbo].[WellModes] ([ID], [Code], [Name]) VALUES (10, N'FLOW', N'Flowing')
GO
INSERT [dbo].[WellModes] ([ID], [Code], [Name]) VALUES (11, N'PUMP', N'Pumping')
GO
INSERT [dbo].[WellModes] ([ID], [Code], [Name]) VALUES (12, N'GASLFT', N'Gas Lift')
GO
INSERT [dbo].[WellModes] ([ID], [Code], [Name]) VALUES (13, N'TEST', N'Testing')
GO
INSERT [dbo].[WellModes] ([ID], [Code], [Name]) VALUES (14, N'ABDWHP', N'Abandoned & Whipstocked')
GO
INSERT [dbo].[WellModes] ([ID], [Code], [Name]) VALUES (15, N'D&COMP', N'Drilling and completing')
GO
INSERT [dbo].[WellModes] ([ID], [Code], [Name]) VALUES (16, N'TSTCMP', N'Test Completed')
GO
INSERT [dbo].[WellModes] ([ID], [Code], [Name]) VALUES (17, N'PRESET', N'Preset')
GO
SET IDENTITY_INSERT [dbo].[Wells] ON 
GO
INSERT [dbo].[Wells] ([ID], [HierarchyID], [FormattedUwi], [UnformattedUwi], [SurfaceLocation], [DownholeLocation], [FieldCode], [PoolCode], [LicenseNumber], [LicenseeCode], [AgentCode], [OperatorCode], [DateTimeCreated]) VALUES (6, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-09-29T21:49:43.510' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Wells] OFF
GO
INSERT [dbo].[WellStatusTypes] ([ID], [Code], [Name]) VALUES (1, N'PROD', N'Producing')
GO
INSERT [dbo].[WellStatusTypes] ([ID], [Code], [Name]) VALUES (2, N'ROYALTY', N'Royalty')
GO
INSERT [dbo].[WellStatusTypes] ([ID], [Code], [Name]) VALUES (3, N'SHUTIN', N'Shut In')
GO
INSERT [dbo].[WellStructures] ([ID], [Code], [Name]) VALUES (0, N'N/A', N'Not Applicable')
GO
INSERT [dbo].[WellStructures] ([ID], [Code], [Name]) VALUES (2, N'2Z', N'Dual Zone')
GO
INSERT [dbo].[WellStructures] ([ID], [Code], [Name]) VALUES (3, N'3Z', N'Triple Zone')
GO
INSERT [dbo].[WellStructures] ([ID], [Code], [Name]) VALUES (4, N'4Z', N'Four Zone')
GO
INSERT [dbo].[WellStructures] ([ID], [Code], [Name]) VALUES (5, N'COMMIN', N'Commingled')
GO
INSERT [dbo].[WellStructures] ([ID], [Code], [Name]) VALUES (6, N'DRAIN', N'Drain')
GO
INSERT [dbo].[WellTypes] ([ID], [Code], [Name]) VALUES (0, N'N/A', N'Not Applicable')
GO
INSERT [dbo].[WellTypes] ([ID], [Code], [Name]) VALUES (1, N'REPRO.', N'Reproducer')
GO
INSERT [dbo].[WellTypes] ([ID], [Code], [Name]) VALUES (2, N'STORG', N'Storage')
GO
INSERT [dbo].[WellTypes] ([ID], [Code], [Name]) VALUES (3, N'INJ', N'Injection')
GO
INSERT [dbo].[WellTypes] ([ID], [Code], [Name]) VALUES (4, N'DISP', N'Disposal')
GO
INSERT [dbo].[WellTypes] ([ID], [Code], [Name]) VALUES (5, N'OBSERV', N'Observation')
GO
INSERT [dbo].[WellTypes] ([ID], [Code], [Name]) VALUES (6, N'TRAING', N'Training')
GO
INSERT [dbo].[WellTypes] ([ID], [Code], [Name]) VALUES (7, N'EX.', N'Experimental')
GO
INSERT [dbo].[WellTypes] ([ID], [Code], [Name]) VALUES (8, N'FARM', N'Farm')
GO
INSERT [dbo].[WellTypes] ([ID], [Code], [Name]) VALUES (9, N'INDUS', N'Industrial')
GO
INSERT [dbo].[WellTypes] ([ID], [Code], [Name]) VALUES (10, N'CYCL', N'Cyclical')
GO
INSERT [dbo].[WellTypes] ([ID], [Code], [Name]) VALUES (11, N'SOURCE', N'Source')
GO
INSERT [dbo].[WellTypes] ([ID], [Code], [Name]) VALUES (12, N'SAGD', N'Steam Assisted Gravity Drain')
GO
INSERT [dbo].[WellTypes] ([ID], [Code], [Name]) VALUES (14, N'CAVERN', N'Linked to a cavern')
GO
/****** Object:  Index [PK_FacilityStatuses]    Script Date: 2024-09-30 11:44:25 PM ******/
ALTER TABLE [dbo].[FacilityStatuses] ADD  CONSTRAINT [PK_FacilityStatuses] UNIQUE NONCLUSTERED 
(
	[FacilityID] ASC,
	[TimeStamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Hierarchy]    Script Date: 2024-09-30 11:44:26 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Hierarchy] ON [dbo].[Hierarchy]
(
	[Node] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RunSheetItemCapturePoints]    Script Date: 2024-09-30 11:44:26 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RunSheetItemCapturePoints] ON [dbo].[RunSheetItemCapturePoints]
(
	[RunSheetID] ASC,
	[HierarchyID] ASC,
	[NodeTypeDailyLogPropertyID] ASC,
	[Ordinal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RunSheetItems]    Script Date: 2024-09-30 11:44:26 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RunSheetItems] ON [dbo].[RunSheetItems]
(
	[RunSheetID] ASC,
	[HierarchyID] ASC,
	[Ordinal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TagValueEnumerationConstants]    Script Date: 2024-09-30 11:44:26 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TagValueEnumerationConstants] ON [dbo].[TagValueEnumerationConstants]
(
	[TagValueEnumerationID] ASC,
	[Name] ASC,
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TagValueEnumerations]    Script Date: 2024-09-30 11:44:26 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TagValueEnumerations] ON [dbo].[TagValueEnumerations]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [PK_DailyWastePlantActivity]    Script Date: 2024-09-30 11:44:26 PM ******/
ALTER TABLE [dbo].[WastePlantDailyActivity] ADD  CONSTRAINT [PK_DailyWastePlantActivity] UNIQUE NONCLUSTERED 
(
	[FacilityID] ASC,
	[ProductionDate] ASC,
	[ActivityFacilityID] ASC,
	[ActivityWellID] ASC,
	[FacilityActivityTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [PK_WellComminglingStatuses]    Script Date: 2024-09-30 11:44:26 PM ******/
ALTER TABLE [dbo].[WellComminglingStatuses] ADD  CONSTRAINT [PK_WellComminglingStatuses] UNIQUE NONCLUSTERED 
(
	[CommingledWellID] ASC,
	[TimeStamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [PK_MonthlyWellProduction]    Script Date: 2024-09-30 11:44:26 PM ******/
ALTER TABLE [dbo].[WellMonthlyProduction] ADD  CONSTRAINT [PK_MonthlyWellProduction] UNIQUE NONCLUSTERED 
(
	[WellID] ASC,
	[ProductionDate] ASC,
	[ProductTypeID] ASC,
	[WellStatusTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AnalogIoTags] ADD  CONSTRAINT [DF_AnalogIoTags_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[AnalogIoTagValueHistory] ADD  CONSTRAINT [DF_AnalogIoTagValueHistory_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[ContextTagProperties] ADD  CONSTRAINT [DF_ContextTagProperties_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[ContextTags] ADD  CONSTRAINT [DF_ContextTags_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[DailyGasFlowRecords] ADD  CONSTRAINT [DF_DailyGasFlowRecords_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[DailyLiquidFlowRecords] ADD  CONSTRAINT [DF_DailyLiquidFlowRecords_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[Diagrams] ADD  CONSTRAINT [DF_Diagrams_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[DigitalIoTags] ADD  CONSTRAINT [DF_DigitalIoTags_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[DigitalIoTagValueHistory] ADD  CONSTRAINT [DF_DigitalIoTagHistory_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[Documents] ADD  CONSTRAINT [DF_Documents_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[EquipmentSubTypes] ADD  CONSTRAINT [DF_EquipmentSubTypes_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[Facilities] ADD  CONSTRAINT [DF_Facilities_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[FacilityDailyActivity] ADD  CONSTRAINT [DF_FacilityDailyActivity_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[FacilityDailyFugitiveEmissions] ADD  CONSTRAINT [DF_FacilityDailyFugitiveEmissions_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[FacilityDailyTransactions] ADD  CONSTRAINT [DF_FacilityDailyTransactions_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[FacilityMonthlyActivity] ADD  CONSTRAINT [DF_FacilityMonthlyActivity_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[FacilityMonthlyFugitiveEmissions] ADD  CONSTRAINT [DF_FacilityMonthlyFugitiveEmissions_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[Folder] ADD  CONSTRAINT [DF_Folder_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[GasBatchRecords] ADD  CONSTRAINT [DF_GasBatchRecords_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[Hierarchy] ADD  CONSTRAINT [DF_Hierarchy_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[HourlyGasFlowRecords] ADD  CONSTRAINT [DF_HourlyGasFlowRecords_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[HourlyLiquidFlowRecords] ADD  CONSTRAINT [DF_HourlyLiquidFlowRecords_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[LiquidBatchRecords] ADD  CONSTRAINT [DF_LiquidBatchRecords_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[MaintenanceRecords] ADD  CONSTRAINT [DF_MaintenanceRecords_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[MaintenanceRecords] ADD  CONSTRAINT [DF_MaintenanceRecords_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[MeterAlarms] ADD  CONSTRAINT [DF_MeterAlarms_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[MeterConfigurations] ADD  CONSTRAINT [DF_MeterConfigurations_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[MeterEvents] ADD  CONSTRAINT [DF_MeterEvents_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[MeterExceptions] ADD  CONSTRAINT [DF_MeterExceptions_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[MeterRuns] ADD  CONSTRAINT [DF_MeterRuns_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[Meters] ADD  CONSTRAINT [DF_Meters_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[Observations] ADD  CONSTRAINT [DF_Observations_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[Observations] ADD  CONSTRAINT [DF_Observations_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[PeriodicGasFlowRecords] ADD  CONSTRAINT [DF_PeriodicGasFlowRecords_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[PeriodicLiquidFlowRecords] ADD  CONSTRAINT [DF_PeriodicLiquidFlowRecords_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[PumpDailyTransactions] ADD  CONSTRAINT [DF_PumpDailyTransactions_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[Pumps] ADD  CONSTRAINT [DF_Pumps_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[RunSheetDailyLogEntries] ADD  CONSTRAINT [DF_RunSheetDailyLogEntries_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[RunSheetDailyLogs] ADD  CONSTRAINT [DF_RunSheetDailyLogs_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[RunSheets] ADD  CONSTRAINT [DF_RunSheets_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[Screens] ADD  CONSTRAINT [DF_Screens_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[StringIoTags] ADD  CONSTRAINT [DF_StringTags_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[StringTagValueHistory] ADD  CONSTRAINT [DF_StringTagHistory_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[TagValueEnumerationConstants] ADD  CONSTRAINT [DF_TagValueEnumerationConstants_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[TagValueEnumerations] ADD  CONSTRAINT [DF_TagValueEnumerations_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[TankDailyTransactions] ADD  CONSTRAINT [DF_TankDailyTransactions_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[Tanks] ADD  CONSTRAINT [DF_Tanks_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[TicketMeterRecords] ADD  CONSTRAINT [DF_TicketMeterRecords_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[Tickets] ADD  CONSTRAINT [DF_Tickets_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[TicketTankRecords] ADD  CONSTRAINT [DF_TicketTankRecords_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[Vessels] ADD  CONSTRAINT [DF_Vessels_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[WellComminglingStatuses] ADD  CONSTRAINT [DF_WellComminglingStatuses_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[WellDailyProduction] ADD  CONSTRAINT [DF_WellDailyProduction_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[WellMonthlyProduction] ADD  CONSTRAINT [DF_WellMonthlyProduction_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[Wells] ADD  CONSTRAINT [DF_Wells_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[WellStatuses] ADD  CONSTRAINT [DF_WellStatuses_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[WellTests] ADD  CONSTRAINT [DF_WellTests_DateTimeCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[AlarmNotes]  WITH CHECK ADD  CONSTRAINT [FK_AlarmNotes_Alarms] FOREIGN KEY([AlarmID])
REFERENCES [dbo].[Alarms] ([ID])
GO
ALTER TABLE [dbo].[AlarmNotes] CHECK CONSTRAINT [FK_AlarmNotes_Alarms]
GO
ALTER TABLE [dbo].[Alarms]  WITH CHECK ADD  CONSTRAINT [FK_Alarms_AlarmPriorities] FOREIGN KEY([AlarmPriority])
REFERENCES [dbo].[AlarmPriorities] ([ID])
GO
ALTER TABLE [dbo].[Alarms] CHECK CONSTRAINT [FK_Alarms_AlarmPriorities]
GO
ALTER TABLE [dbo].[Alarms]  WITH CHECK ADD  CONSTRAINT [FK_Alarms_AlarmStatuses] FOREIGN KEY([AlarmStatusID])
REFERENCES [dbo].[AlarmStatuses] ([ID])
GO
ALTER TABLE [dbo].[Alarms] CHECK CONSTRAINT [FK_Alarms_AlarmStatuses]
GO
ALTER TABLE [dbo].[Alarms]  WITH CHECK ADD  CONSTRAINT [FK_Alarms_AlarmTypes] FOREIGN KEY([AlarmType])
REFERENCES [dbo].[AlarmTypes] ([ID])
GO
ALTER TABLE [dbo].[Alarms] CHECK CONSTRAINT [FK_Alarms_AlarmTypes]
GO
ALTER TABLE [dbo].[Alarms]  WITH CHECK ADD  CONSTRAINT [FK_Alarms_AnalogIoTags] FOREIGN KEY([AnalogIoTagID])
REFERENCES [dbo].[AnalogIoTags] ([ID])
GO
ALTER TABLE [dbo].[Alarms] CHECK CONSTRAINT [FK_Alarms_AnalogIoTags]
GO
ALTER TABLE [dbo].[Alarms]  WITH CHECK ADD  CONSTRAINT [FK_Alarms_DigitalIoTags] FOREIGN KEY([DigitalIoTagID])
REFERENCES [dbo].[DigitalIoTags] ([ID])
GO
ALTER TABLE [dbo].[Alarms] CHECK CONSTRAINT [FK_Alarms_DigitalIoTags]
GO
ALTER TABLE [dbo].[Alarms]  WITH CHECK ADD  CONSTRAINT [FK_Alarms_Units] FOREIGN KEY([UnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[Alarms] CHECK CONSTRAINT [FK_Alarms_Units]
GO
ALTER TABLE [dbo].[Alarms]  WITH CHECK ADD  CONSTRAINT [FK_Alarms_Users] FOREIGN KEY([AcknowledgedByUser])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Alarms] CHECK CONSTRAINT [FK_Alarms_Users]
GO
ALTER TABLE [dbo].[AnalogIoTags]  WITH CHECK ADD  CONSTRAINT [FK_AnalogIoTags_Hierarchy] FOREIGN KEY([HierarchyID])
REFERENCES [dbo].[Hierarchy] ([ID])
GO
ALTER TABLE [dbo].[AnalogIoTags] CHECK CONSTRAINT [FK_AnalogIoTags_Hierarchy]
GO
ALTER TABLE [dbo].[AnalogIoTags]  WITH CHECK ADD  CONSTRAINT [FK_AnalogIoTags_HighAlarmPriorities] FOREIGN KEY([HighAlarmPriorityID])
REFERENCES [dbo].[AlarmPriorities] ([ID])
GO
ALTER TABLE [dbo].[AnalogIoTags] CHECK CONSTRAINT [FK_AnalogIoTags_HighAlarmPriorities]
GO
ALTER TABLE [dbo].[AnalogIoTags]  WITH CHECK ADD  CONSTRAINT [FK_AnalogIoTags_HighHighAlarmPriorities] FOREIGN KEY([HighHighAlarmPriorityID])
REFERENCES [dbo].[AlarmPriorities] ([ID])
GO
ALTER TABLE [dbo].[AnalogIoTags] CHECK CONSTRAINT [FK_AnalogIoTags_HighHighAlarmPriorities]
GO
ALTER TABLE [dbo].[AnalogIoTags]  WITH CHECK ADD  CONSTRAINT [FK_AnalogIoTags_LowAlarmPriorities] FOREIGN KEY([LowAlarmPriorityID])
REFERENCES [dbo].[AlarmPriorities] ([ID])
GO
ALTER TABLE [dbo].[AnalogIoTags] CHECK CONSTRAINT [FK_AnalogIoTags_LowAlarmPriorities]
GO
ALTER TABLE [dbo].[AnalogIoTags]  WITH CHECK ADD  CONSTRAINT [FK_AnalogIoTags_LowLowAlarmPriorities] FOREIGN KEY([LowLowAlarmPriorityID])
REFERENCES [dbo].[AlarmPriorities] ([ID])
GO
ALTER TABLE [dbo].[AnalogIoTags] CHECK CONSTRAINT [FK_AnalogIoTags_LowLowAlarmPriorities]
GO
ALTER TABLE [dbo].[AnalogIoTags]  WITH CHECK ADD  CONSTRAINT [FK_AnalogIoTags_TagValueEnumerations] FOREIGN KEY([TagValueEnumerationID])
REFERENCES [dbo].[TagValueEnumerations] ([ID])
GO
ALTER TABLE [dbo].[AnalogIoTags] CHECK CONSTRAINT [FK_AnalogIoTags_TagValueEnumerations]
GO
ALTER TABLE [dbo].[AnalogIoTags]  WITH CHECK ADD  CONSTRAINT [FK_AnalogIoTags_Units] FOREIGN KEY([UnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[AnalogIoTags] CHECK CONSTRAINT [FK_AnalogIoTags_Units]
GO
ALTER TABLE [dbo].[AnalogIoTagValueHistory]  WITH CHECK ADD  CONSTRAINT [FK_AnalogIoTagValueHistory_AnalogIoTags] FOREIGN KEY([AnalogIoTagID])
REFERENCES [dbo].[AnalogIoTags] ([ID])
GO
ALTER TABLE [dbo].[AnalogIoTagValueHistory] CHECK CONSTRAINT [FK_AnalogIoTagValueHistory_AnalogIoTags]
GO
ALTER TABLE [dbo].[Calculations]  WITH CHECK ADD  CONSTRAINT [FK_Calculations_BaseFluidPhases] FOREIGN KEY([BaseFluidPhaseID])
REFERENCES [dbo].[FluidPhases] ([ID])
GO
ALTER TABLE [dbo].[Calculations] CHECK CONSTRAINT [FK_Calculations_BaseFluidPhases]
GO
ALTER TABLE [dbo].[Calculations]  WITH CHECK ADD  CONSTRAINT [FK_Calculations_BoreMaterials] FOREIGN KEY([BoreMaterialID])
REFERENCES [dbo].[Materials] ([ID])
GO
ALTER TABLE [dbo].[Calculations] CHECK CONSTRAINT [FK_Calculations_BoreMaterials]
GO
ALTER TABLE [dbo].[Calculations]  WITH CHECK ADD  CONSTRAINT [FK_Calculations_CalculationErrorMessageTypes] FOREIGN KEY([ErrorMessageTypeID])
REFERENCES [dbo].[CalculationErrorMessageTypes] ([ID])
GO
ALTER TABLE [dbo].[Calculations] CHECK CONSTRAINT [FK_Calculations_CalculationErrorMessageTypes]
GO
ALTER TABLE [dbo].[Calculations]  WITH CHECK ADD  CONSTRAINT [FK_Calculations_ConeTypes] FOREIGN KEY([ConeTypeID])
REFERENCES [dbo].[ConeTypes] ([ID])
GO
ALTER TABLE [dbo].[Calculations] CHECK CONSTRAINT [FK_Calculations_ConeTypes]
GO
ALTER TABLE [dbo].[Calculations]  WITH CHECK ADD  CONSTRAINT [FK_Calculations_FlowingFluidPhases] FOREIGN KEY([FlowingFluidPhaseID])
REFERENCES [dbo].[FluidPhases] ([ID])
GO
ALTER TABLE [dbo].[Calculations] CHECK CONSTRAINT [FK_Calculations_FlowingFluidPhases]
GO
ALTER TABLE [dbo].[Calculations]  WITH CHECK ADD  CONSTRAINT [FK_Calculations_FluidStandards] FOREIGN KEY([FluidStandardID])
REFERENCES [dbo].[FluidStandards] ([ID])
GO
ALTER TABLE [dbo].[Calculations] CHECK CONSTRAINT [FK_Calculations_FluidStandards]
GO
ALTER TABLE [dbo].[Calculations]  WITH CHECK ADD  CONSTRAINT [FK_Calculations_FluidStates] FOREIGN KEY([FluidStateID])
REFERENCES [dbo].[FluidStates] ([ID])
GO
ALTER TABLE [dbo].[Calculations] CHECK CONSTRAINT [FK_Calculations_FluidStates]
GO
ALTER TABLE [dbo].[Calculations]  WITH CHECK ADD  CONSTRAINT [FK_Calculations_FluidTypes] FOREIGN KEY([FluidTypeID])
REFERENCES [dbo].[FluidTypes] ([ID])
GO
ALTER TABLE [dbo].[Calculations] CHECK CONSTRAINT [FK_Calculations_FluidTypes]
GO
ALTER TABLE [dbo].[Calculations]  WITH CHECK ADD  CONSTRAINT [FK_Calculations_HeatingValueStandards] FOREIGN KEY([HeatingValueStandardID])
REFERENCES [dbo].[HeatingValueStandards] ([ID])
GO
ALTER TABLE [dbo].[Calculations] CHECK CONSTRAINT [FK_Calculations_HeatingValueStandards]
GO
ALTER TABLE [dbo].[Calculations]  WITH CHECK ADD  CONSTRAINT [FK_Calculations_LinearMeterCalculationModes] FOREIGN KEY([LinearMeterCalculationModeID])
REFERENCES [dbo].[LinearMeterCalculationModes] ([ID])
GO
ALTER TABLE [dbo].[Calculations] CHECK CONSTRAINT [FK_Calculations_LinearMeterCalculationModes]
GO
ALTER TABLE [dbo].[Calculations]  WITH CHECK ADD  CONSTRAINT [FK_Calculations_LinearMeterCalculationUnitTypes] FOREIGN KEY([LinearMeterCalculationUnitTypeID])
REFERENCES [dbo].[LinearMeterCalculationUnitTypes] ([ID])
GO
ALTER TABLE [dbo].[Calculations] CHECK CONSTRAINT [FK_Calculations_LinearMeterCalculationUnitTypes]
GO
ALTER TABLE [dbo].[Calculations]  WITH CHECK ADD  CONSTRAINT [FK_Calculations_MeterStandards] FOREIGN KEY([MeterStandardID])
REFERENCES [dbo].[MeterStandards] ([ID])
GO
ALTER TABLE [dbo].[Calculations] CHECK CONSTRAINT [FK_Calculations_MeterStandards]
GO
ALTER TABLE [dbo].[Calculations]  WITH CHECK ADD  CONSTRAINT [FK_Calculations_NozzleTypes] FOREIGN KEY([NozzleTypeID])
REFERENCES [dbo].[NozzleTypes] ([ID])
GO
ALTER TABLE [dbo].[Calculations] CHECK CONSTRAINT [FK_Calculations_NozzleTypes]
GO
ALTER TABLE [dbo].[Calculations]  WITH CHECK ADD  CONSTRAINT [FK_Calculations_PipeMaterials] FOREIGN KEY([PipeMaterialID])
REFERENCES [dbo].[Materials] ([ID])
GO
ALTER TABLE [dbo].[Calculations] CHECK CONSTRAINT [FK_Calculations_PipeMaterials]
GO
ALTER TABLE [dbo].[Calculations]  WITH CHECK ADD  CONSTRAINT [FK_Calculations_PulseTypes] FOREIGN KEY([PulseTypeID])
REFERENCES [dbo].[PulseTypes] ([ID])
GO
ALTER TABLE [dbo].[Calculations] CHECK CONSTRAINT [FK_Calculations_PulseTypes]
GO
ALTER TABLE [dbo].[Calculations]  WITH CHECK ADD  CONSTRAINT [FK_Calculations_ReferenceEquations] FOREIGN KEY([ReferenceEquationID])
REFERENCES [dbo].[ReferenceEquations] ([ID])
GO
ALTER TABLE [dbo].[Calculations] CHECK CONSTRAINT [FK_Calculations_ReferenceEquations]
GO
ALTER TABLE [dbo].[Calculations]  WITH CHECK ADD  CONSTRAINT [FK_Calculations_SignalTypes] FOREIGN KEY([SignalTypeID])
REFERENCES [dbo].[SignalTypes] ([ID])
GO
ALTER TABLE [dbo].[Calculations] CHECK CONSTRAINT [FK_Calculations_SignalTypes]
GO
ALTER TABLE [dbo].[Calculations]  WITH CHECK ADD  CONSTRAINT [FK_Calculations_StaticTapTypes] FOREIGN KEY([StaticTapID])
REFERENCES [dbo].[StaticTapTypes] ([ID])
GO
ALTER TABLE [dbo].[Calculations] CHECK CONSTRAINT [FK_Calculations_StaticTapTypes]
GO
ALTER TABLE [dbo].[Calculations]  WITH CHECK ADD  CONSTRAINT [FK_Calculations_TapTypes] FOREIGN KEY([TapTypeID])
REFERENCES [dbo].[TapTypes] ([ID])
GO
ALTER TABLE [dbo].[Calculations] CHECK CONSTRAINT [FK_Calculations_TapTypes]
GO
ALTER TABLE [dbo].[Calculations]  WITH CHECK ADD  CONSTRAINT [FK_Calculations_TurbineRotorModes] FOREIGN KEY([TurbineRotorModeID])
REFERENCES [dbo].[TurbineRotorModes] ([ID])
GO
ALTER TABLE [dbo].[Calculations] CHECK CONSTRAINT [FK_Calculations_TurbineRotorModes]
GO
ALTER TABLE [dbo].[Calculations]  WITH CHECK ADD  CONSTRAINT [FK_Calculations_ViscosityEquations] FOREIGN KEY([ViscosityEquationID])
REFERENCES [dbo].[ViscosityEquations] ([ID])
GO
ALTER TABLE [dbo].[Calculations] CHECK CONSTRAINT [FK_Calculations_ViscosityEquations]
GO
ALTER TABLE [dbo].[Calculations]  WITH CHECK ADD  CONSTRAINT [FK_Calculations_WaterRegions] FOREIGN KEY([WaterRegionID])
REFERENCES [dbo].[WaterRegions] ([ID])
GO
ALTER TABLE [dbo].[Calculations] CHECK CONSTRAINT [FK_Calculations_WaterRegions]
GO
ALTER TABLE [dbo].[ContextTagProperties]  WITH CHECK ADD  CONSTRAINT [FK_ContextTagProperties_ContextTags] FOREIGN KEY([ContextTagID])
REFERENCES [dbo].[ContextTags] ([ID])
GO
ALTER TABLE [dbo].[ContextTagProperties] CHECK CONSTRAINT [FK_ContextTagProperties_ContextTags]
GO
ALTER TABLE [dbo].[ContextTags]  WITH CHECK ADD  CONSTRAINT [FK_ContextTags_Hierarchy] FOREIGN KEY([HierarchyID])
REFERENCES [dbo].[Hierarchy] ([ID])
GO
ALTER TABLE [dbo].[ContextTags] CHECK CONSTRAINT [FK_ContextTags_Hierarchy]
GO
ALTER TABLE [dbo].[DailyGasFlowRecords]  WITH CHECK ADD  CONSTRAINT [FK_DailyGasFlowRecords_Meters] FOREIGN KEY([MeterID])
REFERENCES [dbo].[Meters] ([ID])
GO
ALTER TABLE [dbo].[DailyGasFlowRecords] CHECK CONSTRAINT [FK_DailyGasFlowRecords_Meters]
GO
ALTER TABLE [dbo].[DailyLiquidFlowRecords]  WITH CHECK ADD  CONSTRAINT [FK_DailyLiquidFlowRecords_Meters] FOREIGN KEY([MeterID])
REFERENCES [dbo].[Meters] ([ID])
GO
ALTER TABLE [dbo].[DailyLiquidFlowRecords] CHECK CONSTRAINT [FK_DailyLiquidFlowRecords_Meters]
GO
ALTER TABLE [dbo].[DeviceCommandParameters]  WITH CHECK ADD  CONSTRAINT [FK_DeviceCommandParameters_DeviceCommandParameterDataTypes1] FOREIGN KEY([DeviceCommandParameterDataTypeID])
REFERENCES [dbo].[DeviceCommandParameterDataTypes] ([ID])
GO
ALTER TABLE [dbo].[DeviceCommandParameters] CHECK CONSTRAINT [FK_DeviceCommandParameters_DeviceCommandParameterDataTypes1]
GO
ALTER TABLE [dbo].[DeviceCommandParameters]  WITH CHECK ADD  CONSTRAINT [FK_DeviceCommandParameters_DeviceCommands1] FOREIGN KEY([DeviceCommandID])
REFERENCES [dbo].[DeviceCommands] ([ID])
GO
ALTER TABLE [dbo].[DeviceCommandParameters] CHECK CONSTRAINT [FK_DeviceCommandParameters_DeviceCommands1]
GO
ALTER TABLE [dbo].[Devices]  WITH CHECK ADD  CONSTRAINT [FK_Devices_DeviceTypes] FOREIGN KEY([DeviceTypeID])
REFERENCES [dbo].[DeviceTypes] ([ID])
GO
ALTER TABLE [dbo].[Devices] CHECK CONSTRAINT [FK_Devices_DeviceTypes]
GO
ALTER TABLE [dbo].[Devices]  WITH CHECK ADD  CONSTRAINT [FK_Devices_Hierarchy] FOREIGN KEY([HierarchyID])
REFERENCES [dbo].[Hierarchy] ([ID])
GO
ALTER TABLE [dbo].[Devices] CHECK CONSTRAINT [FK_Devices_Hierarchy]
GO
ALTER TABLE [dbo].[Diagrams]  WITH CHECK ADD  CONSTRAINT [FK_Diagrams_Hierarchy] FOREIGN KEY([HierarchyID])
REFERENCES [dbo].[Hierarchy] ([ID])
GO
ALTER TABLE [dbo].[Diagrams] CHECK CONSTRAINT [FK_Diagrams_Hierarchy]
GO
ALTER TABLE [dbo].[DigitalIoTags]  WITH CHECK ADD  CONSTRAINT [FK_DigitalIoTags_Hierarchy] FOREIGN KEY([HierarchyID])
REFERENCES [dbo].[Hierarchy] ([ID])
GO
ALTER TABLE [dbo].[DigitalIoTags] CHECK CONSTRAINT [FK_DigitalIoTags_Hierarchy]
GO
ALTER TABLE [dbo].[DigitalIoTagValueHistory]  WITH CHECK ADD  CONSTRAINT [FK_DigitalIoTagValueHistory_DigitalIoTags] FOREIGN KEY([DigitalIoTagID])
REFERENCES [dbo].[DigitalIoTags] ([ID])
GO
ALTER TABLE [dbo].[DigitalIoTagValueHistory] CHECK CONSTRAINT [FK_DigitalIoTagValueHistory_DigitalIoTags]
GO
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD  CONSTRAINT [FK_Documents_Hierarchy] FOREIGN KEY([HierarchyID])
REFERENCES [dbo].[Hierarchy] ([ID])
GO
ALTER TABLE [dbo].[Documents] CHECK CONSTRAINT [FK_Documents_Hierarchy]
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_EquipmentSubTypes] FOREIGN KEY([EquipmentSubTypeID])
REFERENCES [dbo].[EquipmentSubTypes] ([ID])
GO
ALTER TABLE [dbo].[Equipment] CHECK CONSTRAINT [FK_Equipment_EquipmentSubTypes]
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_Hierarchy] FOREIGN KEY([HierarchyID])
REFERENCES [dbo].[Hierarchy] ([ID])
GO
ALTER TABLE [dbo].[Equipment] CHECK CONSTRAINT [FK_Equipment_Hierarchy]
GO
ALTER TABLE [dbo].[EquipmentSubTypes]  WITH CHECK ADD  CONSTRAINT [FK_EquipmentSubTypes_EquipmentTypes] FOREIGN KEY([EquipmentTypeID])
REFERENCES [dbo].[EquipmentTypes] ([ID])
GO
ALTER TABLE [dbo].[EquipmentSubTypes] CHECK CONSTRAINT [FK_EquipmentSubTypes_EquipmentTypes]
GO
ALTER TABLE [dbo].[Facilities]  WITH CHECK ADD  CONSTRAINT [FK_Facilities_EnergyDevelopmentCategoryTypes] FOREIGN KEY([EnergyDevelopmentCategoryTypeID])
REFERENCES [dbo].[EnergyDevelopmentCategoryTypes] ([ID])
GO
ALTER TABLE [dbo].[Facilities] CHECK CONSTRAINT [FK_Facilities_EnergyDevelopmentCategoryTypes]
GO
ALTER TABLE [dbo].[Facilities]  WITH CHECK ADD  CONSTRAINT [FK_Facilities_FacilitySubTypes] FOREIGN KEY([FacilitySubTypeID])
REFERENCES [dbo].[FacilitySubTypes] ([ID])
GO
ALTER TABLE [dbo].[Facilities] CHECK CONSTRAINT [FK_Facilities_FacilitySubTypes]
GO
ALTER TABLE [dbo].[Facilities]  WITH CHECK ADD  CONSTRAINT [FK_Facilities_Hierarchy] FOREIGN KEY([HierarchyID])
REFERENCES [dbo].[Hierarchy] ([ID])
GO
ALTER TABLE [dbo].[Facilities] CHECK CONSTRAINT [FK_Facilities_Hierarchy]
GO
ALTER TABLE [dbo].[Facilities]  WITH CHECK ADD  CONSTRAINT [FK_Facilities_WasteLocationTypes] FOREIGN KEY([WasteLocationTypeID])
REFERENCES [dbo].[WasteLocationTypes] ([ID])
GO
ALTER TABLE [dbo].[Facilities] CHECK CONSTRAINT [FK_Facilities_WasteLocationTypes]
GO
ALTER TABLE [dbo].[FacilityDailyActivity]  WITH CHECK ADD  CONSTRAINT [FK_DailyFacilityActivity_ActivityFacilities] FOREIGN KEY([ActivityFacilityID])
REFERENCES [dbo].[Facilities] ([ID])
GO
ALTER TABLE [dbo].[FacilityDailyActivity] CHECK CONSTRAINT [FK_DailyFacilityActivity_ActivityFacilities]
GO
ALTER TABLE [dbo].[FacilityDailyActivity]  WITH CHECK ADD  CONSTRAINT [FK_DailyFacilityActivity_Facilities] FOREIGN KEY([FacilityID])
REFERENCES [dbo].[Facilities] ([ID])
GO
ALTER TABLE [dbo].[FacilityDailyActivity] CHECK CONSTRAINT [FK_DailyFacilityActivity_Facilities]
GO
ALTER TABLE [dbo].[FacilityDailyActivity]  WITH CHECK ADD  CONSTRAINT [FK_DailyFacilityActivity_FacilityActivityTypes] FOREIGN KEY([FacilityActivityTypeID])
REFERENCES [dbo].[FacilityActivityTypes] ([ID])
GO
ALTER TABLE [dbo].[FacilityDailyActivity] CHECK CONSTRAINT [FK_DailyFacilityActivity_FacilityActivityTypes]
GO
ALTER TABLE [dbo].[FacilityDailyFugitiveEmissions]  WITH CHECK ADD  CONSTRAINT [FK_FacilityDailyFugitiveEmissions_Facilities] FOREIGN KEY([FacilityID])
REFERENCES [dbo].[Facilities] ([ID])
GO
ALTER TABLE [dbo].[FacilityDailyFugitiveEmissions] CHECK CONSTRAINT [FK_FacilityDailyFugitiveEmissions_Facilities]
GO
ALTER TABLE [dbo].[FacilityDailyTransactions]  WITH CHECK ADD  CONSTRAINT [FK_FacilityDailyTransactions_Facilities] FOREIGN KEY([FacilityID])
REFERENCES [dbo].[Facilities] ([ID])
GO
ALTER TABLE [dbo].[FacilityDailyTransactions] CHECK CONSTRAINT [FK_FacilityDailyTransactions_Facilities]
GO
ALTER TABLE [dbo].[FacilityMonthlyActivity]  WITH CHECK ADD  CONSTRAINT [FK_MonthlyFacilityActivity_ActivityFacilities] FOREIGN KEY([ActivityFacilityID])
REFERENCES [dbo].[Facilities] ([ID])
GO
ALTER TABLE [dbo].[FacilityMonthlyActivity] CHECK CONSTRAINT [FK_MonthlyFacilityActivity_ActivityFacilities]
GO
ALTER TABLE [dbo].[FacilityMonthlyActivity]  WITH CHECK ADD  CONSTRAINT [FK_MonthlyFacilityActivity_Facilities] FOREIGN KEY([FacilityID])
REFERENCES [dbo].[Facilities] ([ID])
GO
ALTER TABLE [dbo].[FacilityMonthlyActivity] CHECK CONSTRAINT [FK_MonthlyFacilityActivity_Facilities]
GO
ALTER TABLE [dbo].[FacilityMonthlyActivity]  WITH CHECK ADD  CONSTRAINT [FK_MonthlyFacilityActivity_FacilityActivityTypes] FOREIGN KEY([FacilityActivityTypeID])
REFERENCES [dbo].[FacilityActivityTypes] ([ID])
GO
ALTER TABLE [dbo].[FacilityMonthlyActivity] CHECK CONSTRAINT [FK_MonthlyFacilityActivity_FacilityActivityTypes]
GO
ALTER TABLE [dbo].[FacilityMonthlyFugitiveEmissions]  WITH CHECK ADD  CONSTRAINT [FK_FacilityMonthlyFugitiveEmissions_Facilities] FOREIGN KEY([FacilityID])
REFERENCES [dbo].[Facilities] ([ID])
GO
ALTER TABLE [dbo].[FacilityMonthlyFugitiveEmissions] CHECK CONSTRAINT [FK_FacilityMonthlyFugitiveEmissions_Facilities]
GO
ALTER TABLE [dbo].[FacilityStatuses]  WITH CHECK ADD  CONSTRAINT [FK_FacilityStatuses_Facilities] FOREIGN KEY([FacilityID])
REFERENCES [dbo].[Facilities] ([ID])
GO
ALTER TABLE [dbo].[FacilityStatuses] CHECK CONSTRAINT [FK_FacilityStatuses_Facilities]
GO
ALTER TABLE [dbo].[FacilityStatuses]  WITH CHECK ADD  CONSTRAINT [FK_FacilityStatuses_FacilityStatusTypes] FOREIGN KEY([FacilityStatusTypeID])
REFERENCES [dbo].[FacilityStatusTypes] ([ID])
GO
ALTER TABLE [dbo].[FacilityStatuses] CHECK CONSTRAINT [FK_FacilityStatuses_FacilityStatusTypes]
GO
ALTER TABLE [dbo].[FacilitySubTypes]  WITH CHECK ADD  CONSTRAINT [FK_FacilitySubTypes_FacilityTypes] FOREIGN KEY([FacilityTypeID])
REFERENCES [dbo].[FacilityTypes] ([ID])
GO
ALTER TABLE [dbo].[FacilitySubTypes] CHECK CONSTRAINT [FK_FacilitySubTypes_FacilityTypes]
GO
ALTER TABLE [dbo].[Folder]  WITH CHECK ADD  CONSTRAINT [FK_Folder_Hierarchy] FOREIGN KEY([HierarchyID])
REFERENCES [dbo].[Hierarchy] ([ID])
GO
ALTER TABLE [dbo].[Folder] CHECK CONSTRAINT [FK_Folder_Hierarchy]
GO
ALTER TABLE [dbo].[GasBatchRecords]  WITH CHECK ADD  CONSTRAINT [FK_GasBatchRecords_Facilities] FOREIGN KEY([FacilityID])
REFERENCES [dbo].[Facilities] ([ID])
GO
ALTER TABLE [dbo].[GasBatchRecords] CHECK CONSTRAINT [FK_GasBatchRecords_Facilities]
GO
ALTER TABLE [dbo].[Hierarchy]  WITH CHECK ADD  CONSTRAINT [FK_Hierarchy_NodeTypes] FOREIGN KEY([NodeTypeID])
REFERENCES [dbo].[NodeTypes] ([ID])
GO
ALTER TABLE [dbo].[Hierarchy] CHECK CONSTRAINT [FK_Hierarchy_NodeTypes]
GO
ALTER TABLE [dbo].[HourlyGasFlowRecords]  WITH CHECK ADD  CONSTRAINT [FK_HourlyGasFlowRecords_Meters] FOREIGN KEY([MeterID])
REFERENCES [dbo].[Meters] ([ID])
GO
ALTER TABLE [dbo].[HourlyGasFlowRecords] CHECK CONSTRAINT [FK_HourlyGasFlowRecords_Meters]
GO
ALTER TABLE [dbo].[HourlyLiquidFlowRecords]  WITH CHECK ADD  CONSTRAINT [FK_HourlyLiquidFlowRecords_Meters] FOREIGN KEY([MeterID])
REFERENCES [dbo].[Meters] ([ID])
GO
ALTER TABLE [dbo].[HourlyLiquidFlowRecords] CHECK CONSTRAINT [FK_HourlyLiquidFlowRecords_Meters]
GO
ALTER TABLE [dbo].[IpChannels]  WITH CHECK ADD  CONSTRAINT [FK_TcpIpChannels_Hierarchy] FOREIGN KEY([HierarchyID])
REFERENCES [dbo].[Hierarchy] ([ID])
GO
ALTER TABLE [dbo].[IpChannels] CHECK CONSTRAINT [FK_TcpIpChannels_Hierarchy]
GO
ALTER TABLE [dbo].[LiquidBatchRecords]  WITH CHECK ADD  CONSTRAINT [FK_BatchReports_AlphaUnits] FOREIGN KEY([AlphaUnitID])
REFERENCES [dbo].[AlphaUnits] ([ID])
GO
ALTER TABLE [dbo].[LiquidBatchRecords] CHECK CONSTRAINT [FK_BatchReports_AlphaUnits]
GO
ALTER TABLE [dbo].[LiquidBatchRecords]  WITH CHECK ADD  CONSTRAINT [FK_BatchReports_BatchTypes] FOREIGN KEY([BatchTypeID])
REFERENCES [dbo].[BatchTypes] ([ID])
GO
ALTER TABLE [dbo].[LiquidBatchRecords] CHECK CONSTRAINT [FK_BatchReports_BatchTypes]
GO
ALTER TABLE [dbo].[LiquidBatchRecords]  WITH CHECK ADD  CONSTRAINT [FK_BatchReports_CompressibilityFactorUnits] FOREIGN KEY([CompressibilityFactorUnitID])
REFERENCES [dbo].[CompressibilityFactorUnits] ([ID])
GO
ALTER TABLE [dbo].[LiquidBatchRecords] CHECK CONSTRAINT [FK_BatchReports_CompressibilityFactorUnits]
GO
ALTER TABLE [dbo].[LiquidBatchRecords]  WITH CHECK ADD  CONSTRAINT [FK_BatchReports_DensityUnits] FOREIGN KEY([DensityUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[LiquidBatchRecords] CHECK CONSTRAINT [FK_BatchReports_DensityUnits]
GO
ALTER TABLE [dbo].[LiquidBatchRecords]  WITH CHECK ADD  CONSTRAINT [FK_BatchReports_EvpUnits] FOREIGN KEY([EvpUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[LiquidBatchRecords] CHECK CONSTRAINT [FK_BatchReports_EvpUnits]
GO
ALTER TABLE [dbo].[LiquidBatchRecords]  WITH CHECK ADD  CONSTRAINT [FK_BatchReports_FluidStandards] FOREIGN KEY([FluidStandardID])
REFERENCES [dbo].[FluidStandards] ([ID])
GO
ALTER TABLE [dbo].[LiquidBatchRecords] CHECK CONSTRAINT [FK_BatchReports_FluidStandards]
GO
ALTER TABLE [dbo].[LiquidBatchRecords]  WITH CHECK ADD  CONSTRAINT [FK_BatchReports_FluidTypes] FOREIGN KEY([FluidTypeID])
REFERENCES [dbo].[FluidTypes] ([ID])
GO
ALTER TABLE [dbo].[LiquidBatchRecords] CHECK CONSTRAINT [FK_BatchReports_FluidTypes]
GO
ALTER TABLE [dbo].[LiquidBatchRecords]  WITH CHECK ADD  CONSTRAINT [FK_BatchReports_TemperatureBaseUnits] FOREIGN KEY([TemperatureBaseUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[LiquidBatchRecords] CHECK CONSTRAINT [FK_BatchReports_TemperatureBaseUnits]
GO
ALTER TABLE [dbo].[LiquidBatchRecords]  WITH CHECK ADD  CONSTRAINT [FK_LiquidBatchRecords_Facilities] FOREIGN KEY([FacilityID])
REFERENCES [dbo].[Facilities] ([ID])
GO
ALTER TABLE [dbo].[LiquidBatchRecords] CHECK CONSTRAINT [FK_LiquidBatchRecords_Facilities]
GO
ALTER TABLE [dbo].[MaintenanceRecords]  WITH CHECK ADD  CONSTRAINT [FK_MaintenanceRecords_Hierarchy] FOREIGN KEY([HierarchyID])
REFERENCES [dbo].[Hierarchy] ([ID])
GO
ALTER TABLE [dbo].[MaintenanceRecords] CHECK CONSTRAINT [FK_MaintenanceRecords_Hierarchy]
GO
ALTER TABLE [dbo].[MaintenanceRecords]  WITH CHECK ADD  CONSTRAINT [FK_MaintenanceRecords_MaintenanceTypes] FOREIGN KEY([MaintenanceTypeID])
REFERENCES [dbo].[MaintenanceTypes] ([ID])
GO
ALTER TABLE [dbo].[MaintenanceRecords] CHECK CONSTRAINT [FK_MaintenanceRecords_MaintenanceTypes]
GO
ALTER TABLE [dbo].[MassHeatingValueUnits]  WITH CHECK ADD  CONSTRAINT [FK_MassHeatingValueUnits_EnergyUnits] FOREIGN KEY([EnergyUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[MassHeatingValueUnits] CHECK CONSTRAINT [FK_MassHeatingValueUnits_EnergyUnits]
GO
ALTER TABLE [dbo].[MassHeatingValueUnits]  WITH CHECK ADD  CONSTRAINT [FK_MassHeatingValueUnits_MassUnits] FOREIGN KEY([MassUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[MassHeatingValueUnits] CHECK CONSTRAINT [FK_MassHeatingValueUnits_MassUnits]
GO
ALTER TABLE [dbo].[MeterAlarms]  WITH CHECK ADD  CONSTRAINT [FK_MeterAlarms_Meters] FOREIGN KEY([MeterID])
REFERENCES [dbo].[Meters] ([ID])
GO
ALTER TABLE [dbo].[MeterAlarms] CHECK CONSTRAINT [FK_MeterAlarms_Meters]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_AlphaUnits] FOREIGN KEY([AlphaUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_AlphaUnits]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_AlphaUnits1] FOREIGN KEY([AlphaUnitID])
REFERENCES [dbo].[AlphaUnits] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_AlphaUnits1]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_AtmosphericPressureUnits] FOREIGN KEY([AtmosphericPressureUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_AtmosphericPressureUnits]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_BoreDiameterUnits] FOREIGN KEY([BoreDiameterUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_BoreDiameterUnits]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_BoreMaterials] FOREIGN KEY([BoreMaterialID])
REFERENCES [dbo].[Materials] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_BoreMaterials]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_BoreReferenceTemperatureUnits] FOREIGN KEY([BoreReferenceTemperatureUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_BoreReferenceTemperatureUnits]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_CompressibilityFactorUnits] FOREIGN KEY([CompressibilityFactorUnitID])
REFERENCES [dbo].[CompressibilityFactorUnits] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_CompressibilityFactorUnits]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_DensityUnits] FOREIGN KEY([DensityUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_DensityUnits]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_DifferentialPressureUnits] FOREIGN KEY([DifferentialPressureUnit])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_DifferentialPressureUnits]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_EnergyUnits] FOREIGN KEY([EnergyUnit])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_EnergyUnits]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_EvpUnits] FOREIGN KEY([EquilibriumVaporPressureUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_EvpUnits]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_ExtensionDefinitions] FOREIGN KEY([ExtensionDefinitionID])
REFERENCES [dbo].[ExtensionDefinitions] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_ExtensionDefinitions]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_FittingTypes] FOREIGN KEY([FittingTypeID])
REFERENCES [dbo].[FittingTypes] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_FittingTypes]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_FluidStandards] FOREIGN KEY([FluidStandardID])
REFERENCES [dbo].[FluidStandards] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_FluidStandards]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_FluidTypes] FOREIGN KEY([FluidTypeID])
REFERENCES [dbo].[FluidTypes] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_FluidTypes]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_GasPressureBaseUnits] FOREIGN KEY([GasPressureBaseUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_GasPressureBaseUnits]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_GasVolumeKFactorUnits] FOREIGN KEY([GasVolumeKFactorUnitID])
REFERENCES [dbo].[GasVolumeKFactorUnits] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_GasVolumeKFactorUnits]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_GrossStandardVolumeUnits] FOREIGN KEY([GrossStandardVolumeUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_GrossStandardVolumeUnits]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_GrossVolumeUnits] FOREIGN KEY([GrossVolumeUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_GrossVolumeUnits]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_HeatingValueSaturationConditions] FOREIGN KEY([EfmHeatingValueSaturationConditionID])
REFERENCES [dbo].[SaturationConditions] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_HeatingValueSaturationConditions]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_IndicatedVolumeUnits] FOREIGN KEY([IndicatedVolumeUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_IndicatedVolumeUnits]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_LiquidVolumeKFactorUnits] FOREIGN KEY([LiquidVolumeKFactorUnitID])
REFERENCES [dbo].[LiquidVolumeKFactorUnits] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_LiquidVolumeKFactorUnits]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_MassHeatingValueUnits] FOREIGN KEY([MassHeatingValueUnitID])
REFERENCES [dbo].[MassHeatingValueUnits] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_MassHeatingValueUnits]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_MassKFactorUnits] FOREIGN KEY([MassKFactorUnitID])
REFERENCES [dbo].[MassKFactorUnits] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_MassKFactorUnits]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_MassUnits] FOREIGN KEY([MassUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_MassUnits]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_MeasuredVolumeUnits] FOREIGN KEY([MeasuredVolumeUnit])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_MeasuredVolumeUnits]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_MeterFactorUsages] FOREIGN KEY([MeterFactorUsageID])
REFERENCES [dbo].[MeterFactorUsages] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_MeterFactorUsages]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_MeterStandards] FOREIGN KEY([MeterStandardID])
REFERENCES [dbo].[MeterStandards] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_MeterStandards]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_NetStandardVolumeUnits] FOREIGN KEY([NetStandardVolumeUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_NetStandardVolumeUnits]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_ObservedDensityUnits] FOREIGN KEY([ObservedDensityUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_ObservedDensityUnits]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_PipeDiameterUnits] FOREIGN KEY([PipeDiameterUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_PipeDiameterUnits]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_PipeLengthUnits] FOREIGN KEY([PipeLengthUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_PipeLengthUnits]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_PipeMaterials] FOREIGN KEY([PipeMaterialID])
REFERENCES [dbo].[Materials] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_PipeMaterials]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_PipeReferenceTemperatureUnits] FOREIGN KEY([PipeReferenceTemperatureUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_PipeReferenceTemperatureUnits]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_PowerSources] FOREIGN KEY([PowerSourceID])
REFERENCES [dbo].[PowerSources] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_PowerSources]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_RawVolumeUnits] FOREIGN KEY([RawVolumeUnit])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_RawVolumeUnits]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_RelativeDensitySaturationConditions] FOREIGN KEY([EfmRelativeDensitySaturationConditionID])
REFERENCES [dbo].[SaturationConditions] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_RelativeDensitySaturationConditions]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_SampleTypes] FOREIGN KEY([SampleTypeID])
REFERENCES [dbo].[SampleTypes] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_SampleTypes]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_StaticPressureMeasurements] FOREIGN KEY([StaticPressureMeasurementID])
REFERENCES [dbo].[StaticPressureMeasurements] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_StaticPressureMeasurements]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_StaticPressureUnits] FOREIGN KEY([StaticPressureUnit])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_StaticPressureUnits]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_StaticTapTypes] FOREIGN KEY([StaticTapTypeID])
REFERENCES [dbo].[StaticTapTypes] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_StaticTapTypes]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_TapTypes] FOREIGN KEY([TapTypeID])
REFERENCES [dbo].[TapTypes] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_TapTypes]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_TemperatureBaseUnits] FOREIGN KEY([TemperatureBaseUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_TemperatureBaseUnits]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_TemperatureUnits] FOREIGN KEY([TemperatureUnit])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_TemperatureUnits]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_ViscosityUnits] FOREIGN KEY([ViscosityUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_ViscosityUnits]
GO
ALTER TABLE [dbo].[MeterConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_MeterConfigurations_VolumetricHeatingValueUnits] FOREIGN KEY([VolumetricHeatingValueUnitID])
REFERENCES [dbo].[VolumetricHeatingValueUnits] ([ID])
GO
ALTER TABLE [dbo].[MeterConfigurations] CHECK CONSTRAINT [FK_MeterConfigurations_VolumetricHeatingValueUnits]
GO
ALTER TABLE [dbo].[MeterEvents]  WITH CHECK ADD  CONSTRAINT [FK_MeterEvents_MeterEventTypes] FOREIGN KEY([MeterEventTypeID])
REFERENCES [dbo].[MeterEventTypes] ([ID])
GO
ALTER TABLE [dbo].[MeterEvents] CHECK CONSTRAINT [FK_MeterEvents_MeterEventTypes]
GO
ALTER TABLE [dbo].[MeterEvents]  WITH CHECK ADD  CONSTRAINT [FK_MeterEvents_Meters] FOREIGN KEY([MeterID])
REFERENCES [dbo].[Meters] ([ID])
GO
ALTER TABLE [dbo].[MeterEvents] CHECK CONSTRAINT [FK_MeterEvents_Meters]
GO
ALTER TABLE [dbo].[MeterExceptions]  WITH CHECK ADD  CONSTRAINT [FK_MeterExceptions_MeterExceptionResolutionTypes] FOREIGN KEY([MeterExceptionResolutionTypeID])
REFERENCES [dbo].[MeterExceptionResolutionTypes] ([ID])
GO
ALTER TABLE [dbo].[MeterExceptions] CHECK CONSTRAINT [FK_MeterExceptions_MeterExceptionResolutionTypes]
GO
ALTER TABLE [dbo].[MeterExceptions]  WITH CHECK ADD  CONSTRAINT [FK_MeterExceptions_MeterExceptionTypes] FOREIGN KEY([MeterExceptionTypeID])
REFERENCES [dbo].[MeterExceptionTypes] ([ID])
GO
ALTER TABLE [dbo].[MeterExceptions] CHECK CONSTRAINT [FK_MeterExceptions_MeterExceptionTypes]
GO
ALTER TABLE [dbo].[MeterExceptions]  WITH CHECK ADD  CONSTRAINT [FK_MeterExceptions_Meters] FOREIGN KEY([MeterID])
REFERENCES [dbo].[Meters] ([ID])
GO
ALTER TABLE [dbo].[MeterExceptions] CHECK CONSTRAINT [FK_MeterExceptions_Meters]
GO
ALTER TABLE [dbo].[MeterExceptions]  WITH CHECK ADD  CONSTRAINT [FK_MeterExceptions_Users] FOREIGN KEY([ResolvedByUserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[MeterExceptions] CHECK CONSTRAINT [FK_MeterExceptions_Users]
GO
ALTER TABLE [dbo].[MeterRuns]  WITH CHECK ADD  CONSTRAINT [FK_MeterRuns_Hierarchy] FOREIGN KEY([HierarchyID])
REFERENCES [dbo].[Hierarchy] ([ID])
GO
ALTER TABLE [dbo].[MeterRuns] CHECK CONSTRAINT [FK_MeterRuns_Hierarchy]
GO
ALTER TABLE [dbo].[MeterRuns]  WITH CHECK ADD  CONSTRAINT [FK_MeterRuns_MeterExportTypes] FOREIGN KEY([MeterExportTypeID])
REFERENCES [dbo].[MeterExportTypes] ([ID])
GO
ALTER TABLE [dbo].[MeterRuns] CHECK CONSTRAINT [FK_MeterRuns_MeterExportTypes]
GO
ALTER TABLE [dbo].[Meters]  WITH CHECK ADD  CONSTRAINT [FK_Meters_FluidTypes] FOREIGN KEY([FluidTypeID])
REFERENCES [dbo].[FluidTypes] ([ID])
GO
ALTER TABLE [dbo].[Meters] CHECK CONSTRAINT [FK_Meters_FluidTypes]
GO
ALTER TABLE [dbo].[Meters]  WITH CHECK ADD  CONSTRAINT [FK_Meters_Hierarchy] FOREIGN KEY([HierarchyID])
REFERENCES [dbo].[Hierarchy] ([ID])
GO
ALTER TABLE [dbo].[Meters] CHECK CONSTRAINT [FK_Meters_Hierarchy]
GO
ALTER TABLE [dbo].[Meters]  WITH CHECK ADD  CONSTRAINT [FK_Meters_MeterPurposes] FOREIGN KEY([MeterPurposeID])
REFERENCES [dbo].[MeterPurposes] ([ID])
GO
ALTER TABLE [dbo].[Meters] CHECK CONSTRAINT [FK_Meters_MeterPurposes]
GO
ALTER TABLE [dbo].[Meters]  WITH CHECK ADD  CONSTRAINT [FK_Meters_MeterRuns] FOREIGN KEY([MeterRunID])
REFERENCES [dbo].[MeterRuns] ([ID])
GO
ALTER TABLE [dbo].[Meters] CHECK CONSTRAINT [FK_Meters_MeterRuns]
GO
ALTER TABLE [dbo].[NodeTypeDailyLogProperties]  WITH CHECK ADD  CONSTRAINT [FK_NodeTypeDailyLogProperties_NodeTypes] FOREIGN KEY([NodeTypeID])
REFERENCES [dbo].[NodeTypes] ([ID])
GO
ALTER TABLE [dbo].[NodeTypeDailyLogProperties] CHECK CONSTRAINT [FK_NodeTypeDailyLogProperties_NodeTypes]
GO
ALTER TABLE [dbo].[NodeTypeDailyLogProperties]  WITH CHECK ADD  CONSTRAINT [FK_NodeTypeDailyLogProperties_Units] FOREIGN KEY([UnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[NodeTypeDailyLogProperties] CHECK CONSTRAINT [FK_NodeTypeDailyLogProperties_Units]
GO
ALTER TABLE [dbo].[Observations]  WITH CHECK ADD  CONSTRAINT [FK_Observations_RunSheets] FOREIGN KEY([RunSheetID])
REFERENCES [dbo].[RunSheets] ([ID])
GO
ALTER TABLE [dbo].[Observations] CHECK CONSTRAINT [FK_Observations_RunSheets]
GO
ALTER TABLE [dbo].[PeriodicGasFlowRecords]  WITH CHECK ADD  CONSTRAINT [FK_PeriodicGasFlowRecords_Meters] FOREIGN KEY([MeterID])
REFERENCES [dbo].[Meters] ([ID])
GO
ALTER TABLE [dbo].[PeriodicGasFlowRecords] CHECK CONSTRAINT [FK_PeriodicGasFlowRecords_Meters]
GO
ALTER TABLE [dbo].[PeriodicLiquidFlowRecords]  WITH CHECK ADD  CONSTRAINT [FK_PeriodicLiquidFlowRecords_AlphaUnits] FOREIGN KEY([AlphaUnitID])
REFERENCES [dbo].[AlphaUnits] ([ID])
GO
ALTER TABLE [dbo].[PeriodicLiquidFlowRecords] CHECK CONSTRAINT [FK_PeriodicLiquidFlowRecords_AlphaUnits]
GO
ALTER TABLE [dbo].[PeriodicLiquidFlowRecords]  WITH CHECK ADD  CONSTRAINT [FK_PeriodicLiquidFlowRecords_CompressibilityFactorUnits] FOREIGN KEY([CompressibilityFactorUnitID])
REFERENCES [dbo].[CompressibilityFactorUnits] ([ID])
GO
ALTER TABLE [dbo].[PeriodicLiquidFlowRecords] CHECK CONSTRAINT [FK_PeriodicLiquidFlowRecords_CompressibilityFactorUnits]
GO
ALTER TABLE [dbo].[PeriodicLiquidFlowRecords]  WITH CHECK ADD  CONSTRAINT [FK_PeriodicLiquidFlowRecords_DensityUnits] FOREIGN KEY([DensityUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[PeriodicLiquidFlowRecords] CHECK CONSTRAINT [FK_PeriodicLiquidFlowRecords_DensityUnits]
GO
ALTER TABLE [dbo].[PeriodicLiquidFlowRecords]  WITH CHECK ADD  CONSTRAINT [FK_PeriodicLiquidFlowRecords_FluidStandards] FOREIGN KEY([FluidStandardID])
REFERENCES [dbo].[FluidStandards] ([ID])
GO
ALTER TABLE [dbo].[PeriodicLiquidFlowRecords] CHECK CONSTRAINT [FK_PeriodicLiquidFlowRecords_FluidStandards]
GO
ALTER TABLE [dbo].[PeriodicLiquidFlowRecords]  WITH CHECK ADD  CONSTRAINT [FK_PeriodicLiquidFlowRecords_FluidTypes] FOREIGN KEY([FluidTypeID])
REFERENCES [dbo].[FluidTypes] ([ID])
GO
ALTER TABLE [dbo].[PeriodicLiquidFlowRecords] CHECK CONSTRAINT [FK_PeriodicLiquidFlowRecords_FluidTypes]
GO
ALTER TABLE [dbo].[PeriodicLiquidFlowRecords]  WITH CHECK ADD  CONSTRAINT [FK_PeriodicLiquidFlowRecords_Meters] FOREIGN KEY([MeterID])
REFERENCES [dbo].[Meters] ([ID])
GO
ALTER TABLE [dbo].[PeriodicLiquidFlowRecords] CHECK CONSTRAINT [FK_PeriodicLiquidFlowRecords_Meters]
GO
ALTER TABLE [dbo].[PeriodicLiquidFlowRecords]  WITH CHECK ADD  CONSTRAINT [FK_PeriodicLiquidFlowRecords_TemperatureBaseUnits] FOREIGN KEY([TemperatureBaseUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[PeriodicLiquidFlowRecords] CHECK CONSTRAINT [FK_PeriodicLiquidFlowRecords_TemperatureBaseUnits]
GO
ALTER TABLE [dbo].[PumpDailyTransactions]  WITH CHECK ADD  CONSTRAINT [FK_PumpDailyTransactions_Pumps] FOREIGN KEY([PumpID])
REFERENCES [dbo].[Pumps] ([ID])
GO
ALTER TABLE [dbo].[PumpDailyTransactions] CHECK CONSTRAINT [FK_PumpDailyTransactions_Pumps]
GO
ALTER TABLE [dbo].[Pumps]  WITH CHECK ADD  CONSTRAINT [FK_Pumps_Hierarchy] FOREIGN KEY([HierarchyID])
REFERENCES [dbo].[Hierarchy] ([ID])
GO
ALTER TABLE [dbo].[Pumps] CHECK CONSTRAINT [FK_Pumps_Hierarchy]
GO
ALTER TABLE [dbo].[Pumps]  WITH CHECK ADD  CONSTRAINT [FK_Pumps_PumpTypes] FOREIGN KEY([PumpTypeID])
REFERENCES [dbo].[PumpTypes] ([ID])
GO
ALTER TABLE [dbo].[Pumps] CHECK CONSTRAINT [FK_Pumps_PumpTypes]
GO
ALTER TABLE [dbo].[RunSheetDailyLogEntries]  WITH CHECK ADD  CONSTRAINT [FK_RunSheetDailyLogEntries_Hierarchy] FOREIGN KEY([HierarchyID])
REFERENCES [dbo].[Hierarchy] ([ID])
GO
ALTER TABLE [dbo].[RunSheetDailyLogEntries] CHECK CONSTRAINT [FK_RunSheetDailyLogEntries_Hierarchy]
GO
ALTER TABLE [dbo].[RunSheetDailyLogEntries]  WITH CHECK ADD  CONSTRAINT [FK_RunSheetDailyLogEntries_NodeTypeDailyLogProperties] FOREIGN KEY([NodeTypeDailyLogPropertyID])
REFERENCES [dbo].[NodeTypeDailyLogProperties] ([ID])
GO
ALTER TABLE [dbo].[RunSheetDailyLogEntries] CHECK CONSTRAINT [FK_RunSheetDailyLogEntries_NodeTypeDailyLogProperties]
GO
ALTER TABLE [dbo].[RunSheetDailyLogEntries]  WITH CHECK ADD  CONSTRAINT [FK_RunSheetDailyLogEntries_RunSheetDailyLogs] FOREIGN KEY([RunSheetID], [TimeStamp])
REFERENCES [dbo].[RunSheetDailyLogs] ([RunSheetID], [TimeStamp])
GO
ALTER TABLE [dbo].[RunSheetDailyLogEntries] CHECK CONSTRAINT [FK_RunSheetDailyLogEntries_RunSheetDailyLogs]
GO
ALTER TABLE [dbo].[RunSheetDailyLogs]  WITH CHECK ADD  CONSTRAINT [FK_RunSheetDailyLogs_RunSheets] FOREIGN KEY([RunSheetID])
REFERENCES [dbo].[RunSheets] ([ID])
GO
ALTER TABLE [dbo].[RunSheetDailyLogs] CHECK CONSTRAINT [FK_RunSheetDailyLogs_RunSheets]
GO
ALTER TABLE [dbo].[RunSheetItemCapturePoints]  WITH CHECK ADD  CONSTRAINT [FK_RunSheetItemCapturePoints_NodeTypeDailyLogProperties] FOREIGN KEY([NodeTypeDailyLogPropertyID])
REFERENCES [dbo].[NodeTypeDailyLogProperties] ([ID])
GO
ALTER TABLE [dbo].[RunSheetItemCapturePoints] CHECK CONSTRAINT [FK_RunSheetItemCapturePoints_NodeTypeDailyLogProperties]
GO
ALTER TABLE [dbo].[RunSheetItemCapturePoints]  WITH CHECK ADD  CONSTRAINT [FK_RunSheetItemCapturePoints_RunSheetItems] FOREIGN KEY([RunSheetID], [HierarchyID])
REFERENCES [dbo].[RunSheetItems] ([RunSheetID], [HierarchyID])
GO
ALTER TABLE [dbo].[RunSheetItemCapturePoints] CHECK CONSTRAINT [FK_RunSheetItemCapturePoints_RunSheetItems]
GO
ALTER TABLE [dbo].[RunSheetItems]  WITH CHECK ADD  CONSTRAINT [FK_RunSheetItems_Hierarchy] FOREIGN KEY([HierarchyID])
REFERENCES [dbo].[Hierarchy] ([ID])
GO
ALTER TABLE [dbo].[RunSheetItems] CHECK CONSTRAINT [FK_RunSheetItems_Hierarchy]
GO
ALTER TABLE [dbo].[RunSheetItems]  WITH CHECK ADD  CONSTRAINT [FK_RunSheetItems_RunSheets] FOREIGN KEY([RunSheetID])
REFERENCES [dbo].[RunSheets] ([ID])
GO
ALTER TABLE [dbo].[RunSheetItems] CHECK CONSTRAINT [FK_RunSheetItems_RunSheets]
GO
ALTER TABLE [dbo].[RunSheets]  WITH CHECK ADD  CONSTRAINT [FK_RunSheets_Hierarchy] FOREIGN KEY([HierarchyID])
REFERENCES [dbo].[Hierarchy] ([ID])
GO
ALTER TABLE [dbo].[RunSheets] CHECK CONSTRAINT [FK_RunSheets_Hierarchy]
GO
ALTER TABLE [dbo].[RunSheetUsers]  WITH CHECK ADD  CONSTRAINT [FK_RunSheetUsers_RunSheets] FOREIGN KEY([RunSheetID])
REFERENCES [dbo].[RunSheets] ([ID])
GO
ALTER TABLE [dbo].[RunSheetUsers] CHECK CONSTRAINT [FK_RunSheetUsers_RunSheets]
GO
ALTER TABLE [dbo].[RunSheetUsers]  WITH CHECK ADD  CONSTRAINT [FK_RunSheetUsers_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[RunSheetUsers] CHECK CONSTRAINT [FK_RunSheetUsers_Users]
GO
ALTER TABLE [dbo].[Screens]  WITH CHECK ADD  CONSTRAINT [FK_Screens_Hierarchy] FOREIGN KEY([HierarchyID])
REFERENCES [dbo].[Hierarchy] ([ID])
GO
ALTER TABLE [dbo].[Screens] CHECK CONSTRAINT [FK_Screens_Hierarchy]
GO
ALTER TABLE [dbo].[SerialPortChannels]  WITH CHECK ADD  CONSTRAINT [FK_SerialChannels_Hierarchy] FOREIGN KEY([HierarchyID])
REFERENCES [dbo].[Hierarchy] ([ID])
GO
ALTER TABLE [dbo].[SerialPortChannels] CHECK CONSTRAINT [FK_SerialChannels_Hierarchy]
GO
ALTER TABLE [dbo].[StringIoTags]  WITH CHECK ADD  CONSTRAINT [FK_StringIoTags_Hierarchy] FOREIGN KEY([HierarchyID])
REFERENCES [dbo].[Hierarchy] ([ID])
GO
ALTER TABLE [dbo].[StringIoTags] CHECK CONSTRAINT [FK_StringIoTags_Hierarchy]
GO
ALTER TABLE [dbo].[StringTagValueHistory]  WITH CHECK ADD  CONSTRAINT [FK_StringIoTagValueHistory_StringIoTags] FOREIGN KEY([StringTagID])
REFERENCES [dbo].[StringIoTags] ([ID])
GO
ALTER TABLE [dbo].[StringTagValueHistory] CHECK CONSTRAINT [FK_StringIoTagValueHistory_StringIoTags]
GO
ALTER TABLE [dbo].[TagValueEnumerationConstants]  WITH CHECK ADD  CONSTRAINT [FK_TagValueEnumerationConstants_TagValueEnumerations] FOREIGN KEY([TagValueEnumerationID])
REFERENCES [dbo].[TagValueEnumerations] ([ID])
GO
ALTER TABLE [dbo].[TagValueEnumerationConstants] CHECK CONSTRAINT [FK_TagValueEnumerationConstants_TagValueEnumerations]
GO
ALTER TABLE [dbo].[TankDailyTransactions]  WITH CHECK ADD  CONSTRAINT [FK_TankDailyTransactions_Tanks] FOREIGN KEY([TankID])
REFERENCES [dbo].[Tanks] ([ID])
GO
ALTER TABLE [dbo].[TankDailyTransactions] CHECK CONSTRAINT [FK_TankDailyTransactions_Tanks]
GO
ALTER TABLE [dbo].[Tanks]  WITH CHECK ADD  CONSTRAINT [FK_Tanks_Hierarchy] FOREIGN KEY([HierarchyID])
REFERENCES [dbo].[Hierarchy] ([ID])
GO
ALTER TABLE [dbo].[Tanks] CHECK CONSTRAINT [FK_Tanks_Hierarchy]
GO
ALTER TABLE [dbo].[Tanks]  WITH CHECK ADD  CONSTRAINT [FK_Tanks_TankTypes] FOREIGN KEY([TankTypeID])
REFERENCES [dbo].[TankTypes] ([ID])
GO
ALTER TABLE [dbo].[Tanks] CHECK CONSTRAINT [FK_Tanks_TankTypes]
GO
ALTER TABLE [dbo].[TicketMeterRecords]  WITH CHECK ADD  CONSTRAINT [FK_TicketMeterRecords_AtmosphericPressureUnits] FOREIGN KEY([AtmosphericPressureUnit])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[TicketMeterRecords] CHECK CONSTRAINT [FK_TicketMeterRecords_AtmosphericPressureUnits]
GO
ALTER TABLE [dbo].[TicketMeterRecords]  WITH CHECK ADD  CONSTRAINT [FK_TicketMeterRecords_BoreDiameterUnits] FOREIGN KEY([BoreDiameterUnit])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[TicketMeterRecords] CHECK CONSTRAINT [FK_TicketMeterRecords_BoreDiameterUnits]
GO
ALTER TABLE [dbo].[TicketMeterRecords]  WITH CHECK ADD  CONSTRAINT [FK_TicketMeterRecords_BoreMaterials] FOREIGN KEY([BoreMaterialID])
REFERENCES [dbo].[Materials] ([ID])
GO
ALTER TABLE [dbo].[TicketMeterRecords] CHECK CONSTRAINT [FK_TicketMeterRecords_BoreMaterials]
GO
ALTER TABLE [dbo].[TicketMeterRecords]  WITH CHECK ADD  CONSTRAINT [FK_TicketMeterRecords_BoreReferenceTemperatureUnits] FOREIGN KEY([BoreReferenceTemperatureUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[TicketMeterRecords] CHECK CONSTRAINT [FK_TicketMeterRecords_BoreReferenceTemperatureUnits]
GO
ALTER TABLE [dbo].[TicketMeterRecords]  WITH CHECK ADD  CONSTRAINT [FK_TicketMeterRecords_DensityUnits] FOREIGN KEY([DensityUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[TicketMeterRecords] CHECK CONSTRAINT [FK_TicketMeterRecords_DensityUnits]
GO
ALTER TABLE [dbo].[TicketMeterRecords]  WITH CHECK ADD  CONSTRAINT [FK_TicketMeterRecords_DifferentialPressureUnits] FOREIGN KEY([DifferentialPressureUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[TicketMeterRecords] CHECK CONSTRAINT [FK_TicketMeterRecords_DifferentialPressureUnits]
GO
ALTER TABLE [dbo].[TicketMeterRecords]  WITH CHECK ADD  CONSTRAINT [FK_TicketMeterRecords_ExtensionDefinitions] FOREIGN KEY([ExtensionDefinitionID])
REFERENCES [dbo].[ExtensionDefinitions] ([ID])
GO
ALTER TABLE [dbo].[TicketMeterRecords] CHECK CONSTRAINT [FK_TicketMeterRecords_ExtensionDefinitions]
GO
ALTER TABLE [dbo].[TicketMeterRecords]  WITH CHECK ADD  CONSTRAINT [FK_TicketMeterRecords_MeterStandards] FOREIGN KEY([MeterStandardID])
REFERENCES [dbo].[MeterStandards] ([ID])
GO
ALTER TABLE [dbo].[TicketMeterRecords] CHECK CONSTRAINT [FK_TicketMeterRecords_MeterStandards]
GO
ALTER TABLE [dbo].[TicketMeterRecords]  WITH CHECK ADD  CONSTRAINT [FK_TicketMeterRecords_PipeDiameterUnits] FOREIGN KEY([PipeDiameterUnit])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[TicketMeterRecords] CHECK CONSTRAINT [FK_TicketMeterRecords_PipeDiameterUnits]
GO
ALTER TABLE [dbo].[TicketMeterRecords]  WITH CHECK ADD  CONSTRAINT [FK_TicketMeterRecords_PipeLengthUnits] FOREIGN KEY([PipeLengthUnit])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[TicketMeterRecords] CHECK CONSTRAINT [FK_TicketMeterRecords_PipeLengthUnits]
GO
ALTER TABLE [dbo].[TicketMeterRecords]  WITH CHECK ADD  CONSTRAINT [FK_TicketMeterRecords_PipeMaterials] FOREIGN KEY([PipeMaterialID])
REFERENCES [dbo].[Materials] ([ID])
GO
ALTER TABLE [dbo].[TicketMeterRecords] CHECK CONSTRAINT [FK_TicketMeterRecords_PipeMaterials]
GO
ALTER TABLE [dbo].[TicketMeterRecords]  WITH CHECK ADD  CONSTRAINT [FK_TicketMeterRecords_PipeReferenceTemperatureUnits] FOREIGN KEY([PipeReferenceTemperatureUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[TicketMeterRecords] CHECK CONSTRAINT [FK_TicketMeterRecords_PipeReferenceTemperatureUnits]
GO
ALTER TABLE [dbo].[TicketMeterRecords]  WITH CHECK ADD  CONSTRAINT [FK_TicketMeterRecords_PressureUnits] FOREIGN KEY([PressureUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[TicketMeterRecords] CHECK CONSTRAINT [FK_TicketMeterRecords_PressureUnits]
GO
ALTER TABLE [dbo].[TicketMeterRecords]  WITH CHECK ADD  CONSTRAINT [FK_TicketMeterRecords_StaticPressureMeasurements] FOREIGN KEY([StaticPressureMeasurementID])
REFERENCES [dbo].[StaticPressureMeasurements] ([ID])
GO
ALTER TABLE [dbo].[TicketMeterRecords] CHECK CONSTRAINT [FK_TicketMeterRecords_StaticPressureMeasurements]
GO
ALTER TABLE [dbo].[TicketMeterRecords]  WITH CHECK ADD  CONSTRAINT [FK_TicketMeterRecords_StaticTapTypes] FOREIGN KEY([StaticTapTypeID])
REFERENCES [dbo].[StaticTapTypes] ([ID])
GO
ALTER TABLE [dbo].[TicketMeterRecords] CHECK CONSTRAINT [FK_TicketMeterRecords_StaticTapTypes]
GO
ALTER TABLE [dbo].[TicketMeterRecords]  WITH CHECK ADD  CONSTRAINT [FK_TicketMeterRecords_TapTypes] FOREIGN KEY([TapTypeID])
REFERENCES [dbo].[TapTypes] ([ID])
GO
ALTER TABLE [dbo].[TicketMeterRecords] CHECK CONSTRAINT [FK_TicketMeterRecords_TapTypes]
GO
ALTER TABLE [dbo].[TicketMeterRecords]  WITH CHECK ADD  CONSTRAINT [FK_TicketMeterRecords_TemperatureUnits] FOREIGN KEY([TemperatureUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[TicketMeterRecords] CHECK CONSTRAINT [FK_TicketMeterRecords_TemperatureUnits]
GO
ALTER TABLE [dbo].[TicketMeterRecords]  WITH CHECK ADD  CONSTRAINT [FK_TicketMeterRecords_TicketMeterCalculationMethods] FOREIGN KEY([TicketMeterCalculationMethodID])
REFERENCES [dbo].[TicketMeterCalculationMethods] ([ID])
GO
ALTER TABLE [dbo].[TicketMeterRecords] CHECK CONSTRAINT [FK_TicketMeterRecords_TicketMeterCalculationMethods]
GO
ALTER TABLE [dbo].[TicketMeterRecords]  WITH CHECK ADD  CONSTRAINT [FK_TicketMeterRecords_Tickets] FOREIGN KEY([TicketID])
REFERENCES [dbo].[Tickets] ([ID])
GO
ALTER TABLE [dbo].[TicketMeterRecords] CHECK CONSTRAINT [FK_TicketMeterRecords_Tickets]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_AlphaUnits] FOREIGN KEY([AlphaUnitID])
REFERENCES [dbo].[AlphaUnits] ([ID])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_AlphaUnits]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_CompressibilityFactorUnits] FOREIGN KEY([CompressibilityFactorUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_CompressibilityFactorUnits]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_DensityUnits] FOREIGN KEY([DensityUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_DensityUnits]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_DestinationFacilities] FOREIGN KEY([DestinationFacilityID])
REFERENCES [dbo].[Facilities] ([ID])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_DestinationFacilities]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_FluidStandards] FOREIGN KEY([FluidStandardID])
REFERENCES [dbo].[FluidStandards] ([ID])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_FluidStandards]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_FluidTypes] FOREIGN KEY([FluidTypeID])
REFERENCES [dbo].[FluidTypes] ([ID])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_FluidTypes]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_OdorantUnits] FOREIGN KEY([OdorantUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_OdorantUnits]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_OriginFacilities] FOREIGN KEY([OriginFacilityID])
REFERENCES [dbo].[Facilities] ([ID])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_OriginFacilities]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_TemperatureBaseUnits] FOREIGN KEY([TemperatureBaseUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_TemperatureBaseUnits]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_TicketComponentBases] FOREIGN KEY([TicketComponentBasisID])
REFERENCES [dbo].[TicketComponentBases] ([ID])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_TicketComponentBases]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_TicketDeviceTypes] FOREIGN KEY([TicketDeviceTypeID])
REFERENCES [dbo].[TicketDeviceTypes] ([ID])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_TicketDeviceTypes]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_TicketTransportMethods] FOREIGN KEY([TicketTransportMethodID])
REFERENCES [dbo].[TicketTransportMethods] ([ID])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_TicketTransportMethods]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_TicketTypes] FOREIGN KEY([TicketTypeID])
REFERENCES [dbo].[TicketTypes] ([ID])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_TicketTypes]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_ViscosityUnits] FOREIGN KEY([ViscosityUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_ViscosityUnits]
GO
ALTER TABLE [dbo].[TicketScaleRecords]  WITH CHECK ADD  CONSTRAINT [FK_TicketScaleRecords_DensityUnits] FOREIGN KEY([DensityUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[TicketScaleRecords] CHECK CONSTRAINT [FK_TicketScaleRecords_DensityUnits]
GO
ALTER TABLE [dbo].[TicketScaleRecords]  WITH CHECK ADD  CONSTRAINT [FK_TicketScaleRecords_StandardVolumeUnits] FOREIGN KEY([StandardVolumeUnit])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[TicketScaleRecords] CHECK CONSTRAINT [FK_TicketScaleRecords_StandardVolumeUnits]
GO
ALTER TABLE [dbo].[TicketScaleRecords]  WITH CHECK ADD  CONSTRAINT [FK_TicketScaleRecords_TemperatureUnits] FOREIGN KEY([TemperatureUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[TicketScaleRecords] CHECK CONSTRAINT [FK_TicketScaleRecords_TemperatureUnits]
GO
ALTER TABLE [dbo].[TicketScaleRecords]  WITH CHECK ADD  CONSTRAINT [FK_TicketScaleRecords_Tickets] FOREIGN KEY([TicketID])
REFERENCES [dbo].[Tickets] ([ID])
GO
ALTER TABLE [dbo].[TicketScaleRecords] CHECK CONSTRAINT [FK_TicketScaleRecords_Tickets]
GO
ALTER TABLE [dbo].[TicketScaleRecords]  WITH CHECK ADD  CONSTRAINT [FK_TicketScaleRecords_WeightUnits] FOREIGN KEY([WeightUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[TicketScaleRecords] CHECK CONSTRAINT [FK_TicketScaleRecords_WeightUnits]
GO
ALTER TABLE [dbo].[TicketTankRecords]  WITH CHECK ADD  CONSTRAINT [FK_TicketTankRecords_BaseTemperatureUnits] FOREIGN KEY([BaseTemperatureUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[TicketTankRecords] CHECK CONSTRAINT [FK_TicketTankRecords_BaseTemperatureUnits]
GO
ALTER TABLE [dbo].[TicketTankRecords]  WITH CHECK ADD  CONSTRAINT [FK_TicketTankRecords_LevelUnits] FOREIGN KEY([LevelUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[TicketTankRecords] CHECK CONSTRAINT [FK_TicketTankRecords_LevelUnits]
GO
ALTER TABLE [dbo].[TicketTankRecords]  WITH CHECK ADD  CONSTRAINT [FK_TicketTankRecords_LiquidDensityUnits] FOREIGN KEY([LiquidDensityUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[TicketTankRecords] CHECK CONSTRAINT [FK_TicketTankRecords_LiquidDensityUnits]
GO
ALTER TABLE [dbo].[TicketTankRecords]  WITH CHECK ADD  CONSTRAINT [FK_TicketTankRecords_MassUnits] FOREIGN KEY([MassUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[TicketTankRecords] CHECK CONSTRAINT [FK_TicketTankRecords_MassUnits]
GO
ALTER TABLE [dbo].[TicketTankRecords]  WITH CHECK ADD  CONSTRAINT [FK_TicketTankRecords_ObservedVolumeUnits] FOREIGN KEY([ObservedVolumeUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[TicketTankRecords] CHECK CONSTRAINT [FK_TicketTankRecords_ObservedVolumeUnits]
GO
ALTER TABLE [dbo].[TicketTankRecords]  WITH CHECK ADD  CONSTRAINT [FK_TicketTankRecords_PressureUnits] FOREIGN KEY([PressureUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[TicketTankRecords] CHECK CONSTRAINT [FK_TicketTankRecords_PressureUnits]
GO
ALTER TABLE [dbo].[TicketTankRecords]  WITH CHECK ADD  CONSTRAINT [FK_TicketTankRecords_StandardVolumeUnits] FOREIGN KEY([StandardVolumeUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[TicketTankRecords] CHECK CONSTRAINT [FK_TicketTankRecords_StandardVolumeUnits]
GO
ALTER TABLE [dbo].[TicketTankRecords]  WITH CHECK ADD  CONSTRAINT [FK_TicketTankRecords_TankTypes] FOREIGN KEY([TicketTankTypeID])
REFERENCES [dbo].[TankTypes] ([ID])
GO
ALTER TABLE [dbo].[TicketTankRecords] CHECK CONSTRAINT [FK_TicketTankRecords_TankTypes]
GO
ALTER TABLE [dbo].[TicketTankRecords]  WITH CHECK ADD  CONSTRAINT [FK_TicketTankRecords_TemperatureUnits] FOREIGN KEY([TemperatureUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[TicketTankRecords] CHECK CONSTRAINT [FK_TicketTankRecords_TemperatureUnits]
GO
ALTER TABLE [dbo].[TicketTankRecords]  WITH CHECK ADD  CONSTRAINT [FK_TicketTankRecords_Tickets] FOREIGN KEY([TicketID])
REFERENCES [dbo].[Tickets] ([ID])
GO
ALTER TABLE [dbo].[TicketTankRecords] CHECK CONSTRAINT [FK_TicketTankRecords_Tickets]
GO
ALTER TABLE [dbo].[TicketTankRecords]  WITH CHECK ADD  CONSTRAINT [FK_TicketTankRecords_TicketTankCalculationStandards] FOREIGN KEY([TicketTankCalculationStandardID])
REFERENCES [dbo].[TicketTankCalculationStandards] ([ID])
GO
ALTER TABLE [dbo].[TicketTankRecords] CHECK CONSTRAINT [FK_TicketTankRecords_TicketTankCalculationStandards]
GO
ALTER TABLE [dbo].[TicketTankRecords]  WITH CHECK ADD  CONSTRAINT [FK_TicketTankRecords_TicketTankCustodyTransferCalculationMethods] FOREIGN KEY([TicketTankCustodyTransferCalculationMethodID])
REFERENCES [dbo].[TicketTankCustodyTransferCalculationMethods] ([ID])
GO
ALTER TABLE [dbo].[TicketTankRecords] CHECK CONSTRAINT [FK_TicketTankRecords_TicketTankCustodyTransferCalculationMethods]
GO
ALTER TABLE [dbo].[TicketTankRecords]  WITH CHECK ADD  CONSTRAINT [FK_TicketTankRecords_TicketTankLevelTypes] FOREIGN KEY([TicketTankLevelTypeID])
REFERENCES [dbo].[TicketTankLevelTypes] ([ID])
GO
ALTER TABLE [dbo].[TicketTankRecords] CHECK CONSTRAINT [FK_TicketTankRecords_TicketTankLevelTypes]
GO
ALTER TABLE [dbo].[TicketTankRecords]  WITH CHECK ADD  CONSTRAINT [FK_TicketTankRecords_TicketTankShellMaterials] FOREIGN KEY([TicketTankShellMaterialID])
REFERENCES [dbo].[TicketTankShellMaterials] ([ID])
GO
ALTER TABLE [dbo].[TicketTankRecords] CHECK CONSTRAINT [FK_TicketTankRecords_TicketTankShellMaterials]
GO
ALTER TABLE [dbo].[TicketTankRecords]  WITH CHECK ADD  CONSTRAINT [FK_TicketTankRecords_VesselDraftUnits] FOREIGN KEY([VesselDraftUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[TicketTankRecords] CHECK CONSTRAINT [FK_TicketTankRecords_VesselDraftUnits]
GO
ALTER TABLE [dbo].[UltrasonicDiagnosticHistory]  WITH CHECK ADD  CONSTRAINT [FK_UltrasonicDiagnosticHistory_Meters] FOREIGN KEY([MeterID])
REFERENCES [dbo].[Meters] ([ID])
GO
ALTER TABLE [dbo].[UltrasonicDiagnosticHistory] CHECK CONSTRAINT [FK_UltrasonicDiagnosticHistory_Meters]
GO
ALTER TABLE [dbo].[Units]  WITH CHECK ADD  CONSTRAINT [FK_Units_UnitClasses] FOREIGN KEY([UnitClassID])
REFERENCES [dbo].[UnitClasses] ([ID])
GO
ALTER TABLE [dbo].[Units] CHECK CONSTRAINT [FK_Units_UnitClasses]
GO
ALTER TABLE [dbo].[Units]  WITH CHECK ADD  CONSTRAINT [FK_Units_UnitFormulaTypes] FOREIGN KEY([FormulaTypeID])
REFERENCES [dbo].[UnitFormulaTypes] ([ID])
GO
ALTER TABLE [dbo].[Units] CHECK CONSTRAINT [FK_Units_UnitFormulaTypes]
GO
ALTER TABLE [dbo].[Units]  WITH CHECK ADD  CONSTRAINT [FK_Units_Units] FOREIGN KEY([BaseUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[Units] CHECK CONSTRAINT [FK_Units_Units]
GO
ALTER TABLE [dbo].[UnitSets]  WITH CHECK ADD  CONSTRAINT [FK_UnitSets_Units] FOREIGN KEY([SystemDefaultUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[UnitSets] CHECK CONSTRAINT [FK_UnitSets_Units]
GO
ALTER TABLE [dbo].[UnitSetUnits]  WITH CHECK ADD  CONSTRAINT [FK_UnitSetUnits_Units] FOREIGN KEY([UnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[UnitSetUnits] CHECK CONSTRAINT [FK_UnitSetUnits_Units]
GO
ALTER TABLE [dbo].[UnitSetUnits]  WITH CHECK ADD  CONSTRAINT [FK_UnitSetUnits_UnitSets] FOREIGN KEY([UnitSetID])
REFERENCES [dbo].[UnitSets] ([ID])
GO
ALTER TABLE [dbo].[UnitSetUnits] CHECK CONSTRAINT [FK_UnitSetUnits_UnitSets]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([ID])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users]
GO
ALTER TABLE [dbo].[Vessels]  WITH CHECK ADD  CONSTRAINT [FK_Vessels_Hierarchy] FOREIGN KEY([HierarchyID])
REFERENCES [dbo].[Hierarchy] ([ID])
GO
ALTER TABLE [dbo].[Vessels] CHECK CONSTRAINT [FK_Vessels_Hierarchy]
GO
ALTER TABLE [dbo].[Vessels]  WITH CHECK ADD  CONSTRAINT [FK_Vessels_VesselTypes] FOREIGN KEY([VesselTypeID])
REFERENCES [dbo].[VesselTypes] ([ID])
GO
ALTER TABLE [dbo].[Vessels] CHECK CONSTRAINT [FK_Vessels_VesselTypes]
GO
ALTER TABLE [dbo].[VolumetricHeatingValueUnits]  WITH CHECK ADD  CONSTRAINT [FK_VolumetricHeatingValueUnits_EnergyUnits] FOREIGN KEY([EnergyUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[VolumetricHeatingValueUnits] CHECK CONSTRAINT [FK_VolumetricHeatingValueUnits_EnergyUnits]
GO
ALTER TABLE [dbo].[VolumetricHeatingValueUnits]  WITH CHECK ADD  CONSTRAINT [FK_VolumetricHeatingValueUnits_VolumeUnits] FOREIGN KEY([VolumeUnitID])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[VolumetricHeatingValueUnits] CHECK CONSTRAINT [FK_VolumetricHeatingValueUnits_VolumeUnits]
GO
ALTER TABLE [dbo].[WastePlantDailyActivity]  WITH CHECK ADD  CONSTRAINT [FK_DailyWastePlantActivity_ActivityFacilities] FOREIGN KEY([ActivityFacilityID])
REFERENCES [dbo].[Facilities] ([ID])
GO
ALTER TABLE [dbo].[WastePlantDailyActivity] CHECK CONSTRAINT [FK_DailyWastePlantActivity_ActivityFacilities]
GO
ALTER TABLE [dbo].[WastePlantDailyActivity]  WITH CHECK ADD  CONSTRAINT [FK_DailyWastePlantActivity_Facilities] FOREIGN KEY([FacilityID])
REFERENCES [dbo].[Facilities] ([ID])
GO
ALTER TABLE [dbo].[WastePlantDailyActivity] CHECK CONSTRAINT [FK_DailyWastePlantActivity_Facilities]
GO
ALTER TABLE [dbo].[WastePlantDailyActivity]  WITH CHECK ADD  CONSTRAINT [FK_DailyWastePlantActivity_FacilityActivityTypes] FOREIGN KEY([FacilityActivityTypeID])
REFERENCES [dbo].[FacilityActivityTypes] ([ID])
GO
ALTER TABLE [dbo].[WastePlantDailyActivity] CHECK CONSTRAINT [FK_DailyWastePlantActivity_FacilityActivityTypes]
GO
ALTER TABLE [dbo].[WastePlantDailyActivity]  WITH CHECK ADD  CONSTRAINT [FK_DailyWastePlantActivity_WasteCodes] FOREIGN KEY([WasteCodeID])
REFERENCES [dbo].[WasteCodes] ([ID])
GO
ALTER TABLE [dbo].[WastePlantDailyActivity] CHECK CONSTRAINT [FK_DailyWastePlantActivity_WasteCodes]
GO
ALTER TABLE [dbo].[WastePlantDailyActivity]  WITH CHECK ADD  CONSTRAINT [FK_DailyWastePlantActivity_Wells] FOREIGN KEY([ActivityWellID])
REFERENCES [dbo].[Wells] ([ID])
GO
ALTER TABLE [dbo].[WastePlantDailyActivity] CHECK CONSTRAINT [FK_DailyWastePlantActivity_Wells]
GO
ALTER TABLE [dbo].[WastePlantMonthlyActivity]  WITH CHECK ADD  CONSTRAINT [FK_MonthlyWastePlantActivity_ActivityFacilities] FOREIGN KEY([ActivityFacilityID])
REFERENCES [dbo].[Facilities] ([ID])
GO
ALTER TABLE [dbo].[WastePlantMonthlyActivity] CHECK CONSTRAINT [FK_MonthlyWastePlantActivity_ActivityFacilities]
GO
ALTER TABLE [dbo].[WastePlantMonthlyActivity]  WITH CHECK ADD  CONSTRAINT [FK_MonthlyWastePlantActivity_Facilities] FOREIGN KEY([FacilityID])
REFERENCES [dbo].[Facilities] ([ID])
GO
ALTER TABLE [dbo].[WastePlantMonthlyActivity] CHECK CONSTRAINT [FK_MonthlyWastePlantActivity_Facilities]
GO
ALTER TABLE [dbo].[WastePlantMonthlyActivity]  WITH CHECK ADD  CONSTRAINT [FK_MonthlyWastePlantActivity_FacilityActivityTypes] FOREIGN KEY([FacilityActivityTypeID])
REFERENCES [dbo].[FacilityActivityTypes] ([ID])
GO
ALTER TABLE [dbo].[WastePlantMonthlyActivity] CHECK CONSTRAINT [FK_MonthlyWastePlantActivity_FacilityActivityTypes]
GO
ALTER TABLE [dbo].[WastePlantMonthlyActivity]  WITH CHECK ADD  CONSTRAINT [FK_MonthlyWastePlantActivity_WasteCodes] FOREIGN KEY([WasteCodeID])
REFERENCES [dbo].[WasteCodes] ([ID])
GO
ALTER TABLE [dbo].[WastePlantMonthlyActivity] CHECK CONSTRAINT [FK_MonthlyWastePlantActivity_WasteCodes]
GO
ALTER TABLE [dbo].[WastePlantMonthlyActivity]  WITH CHECK ADD  CONSTRAINT [FK_MonthlyWastePlantActivity_Wells] FOREIGN KEY([ActivityWellID])
REFERENCES [dbo].[Wells] ([ID])
GO
ALTER TABLE [dbo].[WastePlantMonthlyActivity] CHECK CONSTRAINT [FK_MonthlyWastePlantActivity_Wells]
GO
ALTER TABLE [dbo].[WellComminglingStatuses]  WITH CHECK ADD  CONSTRAINT [FK_WellComminglingStatuses_ProductionWells] FOREIGN KEY([ProductionWellID])
REFERENCES [dbo].[Wells] ([ID])
GO
ALTER TABLE [dbo].[WellComminglingStatuses] CHECK CONSTRAINT [FK_WellComminglingStatuses_ProductionWells]
GO
ALTER TABLE [dbo].[WellComminglingStatuses]  WITH CHECK ADD  CONSTRAINT [FK_WellComminglingStatuses_WellComminglingProcesses] FOREIGN KEY([WellComminglingProcessID])
REFERENCES [dbo].[WellComminglingProcesses] ([ID])
GO
ALTER TABLE [dbo].[WellComminglingStatuses] CHECK CONSTRAINT [FK_WellComminglingStatuses_WellComminglingProcesses]
GO
ALTER TABLE [dbo].[WellComminglingStatuses]  WITH CHECK ADD  CONSTRAINT [FK_WellComminglingStatuses_Wells] FOREIGN KEY([CommingledWellID])
REFERENCES [dbo].[Wells] ([ID])
GO
ALTER TABLE [dbo].[WellComminglingStatuses] CHECK CONSTRAINT [FK_WellComminglingStatuses_Wells]
GO
ALTER TABLE [dbo].[WellDailyProduction]  WITH CHECK ADD  CONSTRAINT [FK_DailyWellProduction_ProductTypes] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[ProductTypes] ([ID])
GO
ALTER TABLE [dbo].[WellDailyProduction] CHECK CONSTRAINT [FK_DailyWellProduction_ProductTypes]
GO
ALTER TABLE [dbo].[WellDailyProduction]  WITH CHECK ADD  CONSTRAINT [FK_DailyWellProduction_Wells] FOREIGN KEY([WellID])
REFERENCES [dbo].[Wells] ([ID])
GO
ALTER TABLE [dbo].[WellDailyProduction] CHECK CONSTRAINT [FK_DailyWellProduction_Wells]
GO
ALTER TABLE [dbo].[WellDailyProduction]  WITH CHECK ADD  CONSTRAINT [FK_DailyWellProduction_WellStatusTypes] FOREIGN KEY([WellStatusTypeID])
REFERENCES [dbo].[WellStatusTypes] ([ID])
GO
ALTER TABLE [dbo].[WellDailyProduction] CHECK CONSTRAINT [FK_DailyWellProduction_WellStatusTypes]
GO
ALTER TABLE [dbo].[WellMonthlyProduction]  WITH CHECK ADD  CONSTRAINT [FK_MonthlyWellProduction_ProductTypes] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[ProductTypes] ([ID])
GO
ALTER TABLE [dbo].[WellMonthlyProduction] CHECK CONSTRAINT [FK_MonthlyWellProduction_ProductTypes]
GO
ALTER TABLE [dbo].[WellMonthlyProduction]  WITH CHECK ADD  CONSTRAINT [FK_MonthlyWellProduction_Wells] FOREIGN KEY([WellID])
REFERENCES [dbo].[Wells] ([ID])
GO
ALTER TABLE [dbo].[WellMonthlyProduction] CHECK CONSTRAINT [FK_MonthlyWellProduction_Wells]
GO
ALTER TABLE [dbo].[Wells]  WITH CHECK ADD  CONSTRAINT [FK_Wells_Hierarchy] FOREIGN KEY([HierarchyID])
REFERENCES [dbo].[Hierarchy] ([ID])
GO
ALTER TABLE [dbo].[Wells] CHECK CONSTRAINT [FK_Wells_Hierarchy]
GO
ALTER TABLE [dbo].[WellStatuses]  WITH CHECK ADD  CONSTRAINT [FK_WellStatuses_Facilities] FOREIGN KEY([PrimaryLinkedFacilityID])
REFERENCES [dbo].[Facilities] ([ID])
GO
ALTER TABLE [dbo].[WellStatuses] CHECK CONSTRAINT [FK_WellStatuses_Facilities]
GO
ALTER TABLE [dbo].[WellStatuses]  WITH CHECK ADD  CONSTRAINT [FK_WellStatuses_SecondaryFacilities] FOREIGN KEY([SecondaryLinkedFacilityID])
REFERENCES [dbo].[Facilities] ([ID])
GO
ALTER TABLE [dbo].[WellStatuses] CHECK CONSTRAINT [FK_WellStatuses_SecondaryFacilities]
GO
ALTER TABLE [dbo].[WellStatuses]  WITH CHECK ADD  CONSTRAINT [FK_WellStatuses_WellFluids] FOREIGN KEY([WellFluidID])
REFERENCES [dbo].[WellFluids] ([ID])
GO
ALTER TABLE [dbo].[WellStatuses] CHECK CONSTRAINT [FK_WellStatuses_WellFluids]
GO
ALTER TABLE [dbo].[WellStatuses]  WITH CHECK ADD  CONSTRAINT [FK_WellStatuses_WellModes] FOREIGN KEY([WellModeID])
REFERENCES [dbo].[WellModes] ([ID])
GO
ALTER TABLE [dbo].[WellStatuses] CHECK CONSTRAINT [FK_WellStatuses_WellModes]
GO
ALTER TABLE [dbo].[WellStatuses]  WITH CHECK ADD  CONSTRAINT [FK_WellStatuses_Wells] FOREIGN KEY([WellID])
REFERENCES [dbo].[Wells] ([ID])
GO
ALTER TABLE [dbo].[WellStatuses] CHECK CONSTRAINT [FK_WellStatuses_Wells]
GO
ALTER TABLE [dbo].[WellStatuses]  WITH CHECK ADD  CONSTRAINT [FK_WellStatuses_WellStructures] FOREIGN KEY([WellStructureID])
REFERENCES [dbo].[WellStructures] ([ID])
GO
ALTER TABLE [dbo].[WellStatuses] CHECK CONSTRAINT [FK_WellStatuses_WellStructures]
GO
ALTER TABLE [dbo].[WellStatuses]  WITH CHECK ADD  CONSTRAINT [FK_WellStatuses_WellTypes] FOREIGN KEY([WellTypeID])
REFERENCES [dbo].[WellTypes] ([ID])
GO
ALTER TABLE [dbo].[WellStatuses] CHECK CONSTRAINT [FK_WellStatuses_WellTypes]
GO
ALTER TABLE [dbo].[FacilityDailyActivity]  WITH CHECK ADD  CONSTRAINT [CK_FacilityDailyActivity] CHECK  ((dateadd(day,(0),datediff(day,(0),[ProductionDate]))<>[ProductionDate]))
GO
ALTER TABLE [dbo].[FacilityDailyActivity] CHECK CONSTRAINT [CK_FacilityDailyActivity]
GO
ALTER TABLE [dbo].[WellDailyProduction]  WITH CHECK ADD  CONSTRAINT [CK_WellDailyProduction] CHECK  ((dateadd(day,(0),datediff(day,(0),[ProductionDate]))<>[ProductionDate]))
GO
ALTER TABLE [dbo].[WellDailyProduction] CHECK CONSTRAINT [CK_WellDailyProduction]
GO
ALTER TABLE [dbo].[WellMonthlyProduction]  WITH CHECK ADD  CONSTRAINT [CK_WellMonthlyProduction] CHECK  ((eomonth([ProductionDate])=[ProductionDate]))
GO
ALTER TABLE [dbo].[WellMonthlyProduction] CHECK CONSTRAINT [CK_WellMonthlyProduction]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GasBatchRecords', @level2type=N'COLUMN',@level2name=N'Methane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GasBatchRecords', @level2type=N'COLUMN',@level2name=N'Nitrogen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GasBatchRecords', @level2type=N'COLUMN',@level2name=N'CarbonDioxide'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GasBatchRecords', @level2type=N'COLUMN',@level2name=N'Ethane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GasBatchRecords', @level2type=N'COLUMN',@level2name=N'Propane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GasBatchRecords', @level2type=N'COLUMN',@level2name=N'Water'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GasBatchRecords', @level2type=N'COLUMN',@level2name=N'HydrogenSulfide'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GasBatchRecords', @level2type=N'COLUMN',@level2name=N'Hydrogen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GasBatchRecords', @level2type=N'COLUMN',@level2name=N'CarbonMonoxide'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GasBatchRecords', @level2type=N'COLUMN',@level2name=N'Oxygen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GasBatchRecords', @level2type=N'COLUMN',@level2name=N'nButane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GasBatchRecords', @level2type=N'COLUMN',@level2name=N'nPentane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GasBatchRecords', @level2type=N'COLUMN',@level2name=N'Hexane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GasBatchRecords', @level2type=N'COLUMN',@level2name=N'Heptane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GasBatchRecords', @level2type=N'COLUMN',@level2name=N'Octane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GasBatchRecords', @level2type=N'COLUMN',@level2name=N'Nonane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GasBatchRecords', @level2type=N'COLUMN',@level2name=N'Decane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GasBatchRecords', @level2type=N'COLUMN',@level2name=N'Helium'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GasBatchRecords', @level2type=N'COLUMN',@level2name=N'Argon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LiquidBatchRecords', @level2type=N'COLUMN',@level2name=N'Methane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LiquidBatchRecords', @level2type=N'COLUMN',@level2name=N'Nitrogen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LiquidBatchRecords', @level2type=N'COLUMN',@level2name=N'CarbonDioxide'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LiquidBatchRecords', @level2type=N'COLUMN',@level2name=N'Ethane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LiquidBatchRecords', @level2type=N'COLUMN',@level2name=N'Propane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LiquidBatchRecords', @level2type=N'COLUMN',@level2name=N'Water'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LiquidBatchRecords', @level2type=N'COLUMN',@level2name=N'HydrogenSulfide'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LiquidBatchRecords', @level2type=N'COLUMN',@level2name=N'Hydrogen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LiquidBatchRecords', @level2type=N'COLUMN',@level2name=N'CarbonMonoxide'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LiquidBatchRecords', @level2type=N'COLUMN',@level2name=N'Oxygen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LiquidBatchRecords', @level2type=N'COLUMN',@level2name=N'nButane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LiquidBatchRecords', @level2type=N'COLUMN',@level2name=N'nPentane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LiquidBatchRecords', @level2type=N'COLUMN',@level2name=N'Hexane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LiquidBatchRecords', @level2type=N'COLUMN',@level2name=N'Heptane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LiquidBatchRecords', @level2type=N'COLUMN',@level2name=N'Octane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LiquidBatchRecords', @level2type=N'COLUMN',@level2name=N'Nonane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LiquidBatchRecords', @level2type=N'COLUMN',@level2name=N'Decane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LiquidBatchRecords', @level2type=N'COLUMN',@level2name=N'Helium'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LiquidBatchRecords', @level2type=N'COLUMN',@level2name=N'Argon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Pressure base for measured gas volume or gas equivalent volume' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'Pb'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Temperature base for measured gas volume or gas equivalent volume' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'Tb'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Densitometer Correction Factor, DCF, Pyc Factor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'DensityMeterFactor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates that water vapor correction has been calculated and
applied to the gas volume.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'FactorFwv'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates that the Full Well Stream Factor has been applied to the
gas volume.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'FactorFws'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Null and zero are treated as 1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'FullWellStreamFactor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Null and zero are treated as 1
; Coefficient of Discharge for Cone meters' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'FixedFactor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates default temperature is used in the gas volume calculation.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'HasDefaultTemperature'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Shrink factor to calculate theoretical production on liquid meters.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'ShrinkFactor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Density at stock tank conditions to calculate theoretical production on
liquid meters.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'StockTankDensity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'S&W% at stock tank conditions to calculate theoretical production on
liquid meters.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'StockTankSedimentAndWaterPercent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dials (or digits) are used to determine when an index reading has
“rolled over”.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'NumberOfDialsTotalizerDigits'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if the volume is already corrected for pressure.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'PressureCompenstated'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if the volume is already corrected for temperature.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'TemperatureCompensated'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Linear meters.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'MeterFactor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Linear meters.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'KFactor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Line Pack only.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'PipeLength'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Coriolis only.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'MeterFactorKFactorCurveIsAveraged'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Coriolis only. Indicates that the Correction for Flow Pressure Effect, Ffpe, is used in the mass calculation.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'FlowingPressureEnabled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Coriolis only. Given as a percent of rate per unit pressure' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'FlowingPressureEffect'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Coriolis only. Pressure at which Peffect was determined' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'CalibrationPressure'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates that the Factor Fa is included in the AGA-3(1985) calculation of gas volume.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'FactorFa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates that the Factor Fb is included in the AGA-3(1985) calculation of gas volume.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'FactorFb'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates that the Factor Fg is included in the AGA-3(1985) calculation of gas volume.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'FactorFg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates that the Factor Fpv is included in the AGA-3(1985) calculation of gas volume.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'FactorFpv'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates that the Factor Fr is included in the AGA-3(1985) calculation of gas volume' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'FactorFr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates that the Factor Ft is included in the AGA-3(1985) calculation of gas volume.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'FactorFt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates that the Factor Y is included in the AGA-3(1985) calculation of gas volume.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'FactorY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Flow computer Identification for product mapping' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'FlowComputerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Between 0 and 23, inclusive. If no value is provided in the file and the meter does not have a contract hour specified in FLOWCAL, then the contract hour for the system that the meter belongs to will be used as the contract hour.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'ContractHour'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Between -5and 28, inclusive. If no value is provided in the file and the meter does not have a contract day specified in FLOWCAL, then a contract day of 1 will be used. If a contract day of 0 is specified, FLOWCAL will treat this the same as a contract day of 1.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'ContractDay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates that an RTD is attached.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'HasRTD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates that an attached RTD is in use. Has RTD and Use RTD are not stored in FLOWCAL but an exception will be generated if these two fields do not match.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'UseRTD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Number of days for a chart' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'Rotation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Gas Relative Density at base conditions' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'GasRelativeDensity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'Methane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'Nitrogen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'CarbonDioxide'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'Ethane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'Propane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'Water'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'HydrogenSulfide'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'Hydrogen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'CarbonMonoxide'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'Oxygen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'nButane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'nPentane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'Hexane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'Heptane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'Octane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'Nonane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'Decane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'Helium'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'Argon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'Ethylene'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'Propylene'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Amount of water per unit volume. For example, lbs/MMscf' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'WaterContent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'H2S content in ppm' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeterConfigurations', @level2type=N'COLUMN',@level2name=N'HydrogenSulfideContent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PeriodicGasFlowRecords', @level2type=N'COLUMN',@level2name=N'Methane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PeriodicGasFlowRecords', @level2type=N'COLUMN',@level2name=N'Nitrogen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PeriodicGasFlowRecords', @level2type=N'COLUMN',@level2name=N'CarbonDioxide'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PeriodicGasFlowRecords', @level2type=N'COLUMN',@level2name=N'Ethane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PeriodicGasFlowRecords', @level2type=N'COLUMN',@level2name=N'Propane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PeriodicGasFlowRecords', @level2type=N'COLUMN',@level2name=N'Water'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PeriodicGasFlowRecords', @level2type=N'COLUMN',@level2name=N'HydrogenSulfide'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PeriodicGasFlowRecords', @level2type=N'COLUMN',@level2name=N'Hydrogen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PeriodicGasFlowRecords', @level2type=N'COLUMN',@level2name=N'CarbonMonoxide'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PeriodicGasFlowRecords', @level2type=N'COLUMN',@level2name=N'Oxygen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PeriodicGasFlowRecords', @level2type=N'COLUMN',@level2name=N'nButane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PeriodicGasFlowRecords', @level2type=N'COLUMN',@level2name=N'nPentane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PeriodicGasFlowRecords', @level2type=N'COLUMN',@level2name=N'Hexane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PeriodicGasFlowRecords', @level2type=N'COLUMN',@level2name=N'Heptane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PeriodicGasFlowRecords', @level2type=N'COLUMN',@level2name=N'Octane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PeriodicGasFlowRecords', @level2type=N'COLUMN',@level2name=N'Nonane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PeriodicGasFlowRecords', @level2type=N'COLUMN',@level2name=N'Decane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PeriodicGasFlowRecords', @level2type=N'COLUMN',@level2name=N'Helium'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PeriodicGasFlowRecords', @level2type=N'COLUMN',@level2name=N'Argon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PeriodicLiquidFlowRecords', @level2type=N'COLUMN',@level2name=N'Nitrogen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PeriodicLiquidFlowRecords', @level2type=N'COLUMN',@level2name=N'CarbonDioxide'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PeriodicLiquidFlowRecords', @level2type=N'COLUMN',@level2name=N'Ethane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PeriodicLiquidFlowRecords', @level2type=N'COLUMN',@level2name=N'Propane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PeriodicLiquidFlowRecords', @level2type=N'COLUMN',@level2name=N'Water'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PeriodicLiquidFlowRecords', @level2type=N'COLUMN',@level2name=N'HydrogenSulfide'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PeriodicLiquidFlowRecords', @level2type=N'COLUMN',@level2name=N'Hydrogen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PeriodicLiquidFlowRecords', @level2type=N'COLUMN',@level2name=N'CarbonMonoxide'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PeriodicLiquidFlowRecords', @level2type=N'COLUMN',@level2name=N'Oxygen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PeriodicLiquidFlowRecords', @level2type=N'COLUMN',@level2name=N'nButane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PeriodicLiquidFlowRecords', @level2type=N'COLUMN',@level2name=N'nPentane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PeriodicLiquidFlowRecords', @level2type=N'COLUMN',@level2name=N'Hexane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PeriodicLiquidFlowRecords', @level2type=N'COLUMN',@level2name=N'Heptane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PeriodicLiquidFlowRecords', @level2type=N'COLUMN',@level2name=N'Octane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PeriodicLiquidFlowRecords', @level2type=N'COLUMN',@level2name=N'Nonane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PeriodicLiquidFlowRecords', @level2type=N'COLUMN',@level2name=N'Decane'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PeriodicLiquidFlowRecords', @level2type=N'COLUMN',@level2name=N'Helium'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mole %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PeriodicLiquidFlowRecords', @level2type=N'COLUMN',@level2name=N'Argon'
GO
USE [master]
GO
ALTER DATABASE [EnerFlow] SET  READ_WRITE 
GO
