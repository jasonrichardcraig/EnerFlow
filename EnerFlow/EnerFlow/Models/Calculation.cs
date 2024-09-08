using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class Calculation
{
    public long Id { get; set; }

    public long MeterId { get; set; }

    public DateTime TimeStamp { get; set; }

    public bool AtmosphericPressureCalculated { get; set; }

    public int ReferenceEquationId { get; set; }

    public double Patm { get; set; }

    public bool AccelerationCalculated { get; set; }

    public double G { get; set; }

    public double Elevation { get; set; }

    public double Degrees { get; set; }

    public double Minutes { get; set; }

    public double Seconds { get; set; }

    public int MeterStandardId { get; set; }

    public bool IsSuccessful { get; set; }

    public int ErrorMessageTypeId { get; set; }

    public bool WarningEnabled { get; set; }

    public string WarningMessages { get; set; } = null!;

    public int FluidTypeId { get; set; }

    public int FluidStandardId { get; set; }

    public int FluidStateId { get; set; }

    public int BaseFluidPhaseId { get; set; }

    public int FlowingFluidPhaseId { get; set; }

    public int WaterRegionId { get; set; }

    public double Pb { get; set; }

    public double Tb { get; set; }

    public double Pf { get; set; }

    public double Tf { get; set; }

    public double FlowDuration { get; set; }

    public double Dp { get; set; }

    public double MeasuredBeta { get; set; }

    public double CalculatedBeta { get; set; }

    public double MeterFactor { get; set; }

    public int PipeMaterialId { get; set; }

    public double MeasuredPipeDiameter { get; set; }

    public double CalculatedPipeDiameter { get; set; }

    public double PipeReferenceTemperature { get; set; }

    public double PipeExpansionCoefficient { get; set; }

    public int BoreMaterialId { get; set; }

    public double MeasuredBoreDiameter { get; set; }

    public double CalculatedBoreDiameter { get; set; }

    public double BoreReferenceTemperature { get; set; }

    public double BoreExpansionCoefficient { get; set; }

    public double Rhob { get; set; }

    public double Rhof { get; set; }

    public double Qf { get; set; }

    public double Qv { get; set; }

    public double Qm { get; set; }

    public double Erb { get; set; }

    public double PipeVelolcity { get; set; }

    public double PipeReynoldsNumber { get; set; }

    public double OrificeReynoldsNumber { get; set; }

    public double Y { get; set; }

    public double Cd { get; set; }

    public double Mass { get; set; }

    public double UncorrectedGrossVolume { get; set; }

    public double CorrectedNetVolume { get; set; }

    public double Energy { get; set; }

    public double PressureLoss { get; set; }

    public double Fe { get; set; }

    public double Ev { get; set; }

    public int StaticTapId { get; set; }

    public int TapTypeId { get; set; }

    public double Zf1 { get; set; }

    public double Zf2 { get; set; }

    public int ConeTypeId { get; set; }

    public int NozzleTypeId { get; set; }

    public double DivAngle { get; set; }

    public bool CdCalculated { get; set; }

    public int PulseTypeId { get; set; }

    public int LinearMeterCalculationModeId { get; set; }

    public int SignalTypeId { get; set; }

    public int LinearMeterCalculationUnitTypeId { get; set; }

    public int TurbineRotorModeId { get; set; }

    public double PulseCount { get; set; }

    public double Frequency { get; set; }

    public double Kfactor { get; set; }

    public double Ql { get; set; }

    public double Qu { get; set; }

    public double Cl { get; set; }

    public double Cu { get; set; }

    public double C { get; set; }

    public double PressureLossCoefficient { get; set; }

    public double SensingPulseCount { get; set; }

    public double SensingFrequency { get; set; }

    public double SensingKfactor { get; set; }

    public double AverageVelocity { get; set; }

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

    public double MolarMass { get; set; }

    public double Pgr { get; set; }

    public double Tgr { get; set; }

    public double Phv { get; set; }

    public double Thv { get; set; }

    public double Prho { get; set; }

    public double Trho { get; set; }

    public double Zb { get; set; }

    public double Zf { get; set; }

    public double Fpv { get; set; }

    public bool KappaCalculated { get; set; }

    public double Kappa { get; set; }

    public bool ViscosityCalculated { get; set; }

    public int ViscosityEquationId { get; set; }

    public double Viscosity { get; set; }

    public double Db { get; set; }

    public double Df { get; set; }

    public double RdUser { get; set; }

    public double RdIdeal { get; set; }

    public double RdReal { get; set; }

    public double Za { get; set; }

    public int HeatingValueStandardId { get; set; }

    public double IdealHeatingValue { get; set; }

    public double HvIdealVol { get; set; }

    public double HvNet { get; set; }

    public double HvGross { get; set; }

    public double U { get; set; }

    public double H { get; set; }

    public double S { get; set; }

    public double Cp { get; set; }

    public double Cv { get; set; }

    public double W { get; set; }

    public double Jt { get; set; }

    public double Cstar { get; set; }

    public double Ho { get; set; }

    public double Cpi { get; set; }

    public double K { get; set; }

    public bool VaporPressureCalculated { get; set; }

    public double Pe { get; set; }

    public bool IsPeExisting { get; set; }

    public bool GlassHydrometer { get; set; }

    public double Rhor { get; set; }

    public double Rhoo { get; set; }

    public double To { get; set; }

    public double Po { get; set; }

    public double Cplf { get; set; }

    public double Ctlf { get; set; }

    public double Ctplf { get; set; }

    public double Cplb { get; set; }

    public double Ctlb { get; set; }

    public double Ctplb { get; set; }

    public double Cplo { get; set; }

    public double Ctlo { get; set; }

    public double Ctplo { get; set; }

    public double Csw { get; set; }

    public double Hyc { get; set; }

    public double Bsw { get; set; }

    public double Tc { get; set; }

    public double Pc { get; set; }

    public double Rhoc { get; set; }

    public double Tt { get; set; }

    public double Pt { get; set; }

    public double Omega { get; set; }

    public bool IsMeterCalcVapor { get; set; }

    public double RhofV { get; set; }

    public double ZfV { get; set; }

    public double ViscosityV { get; set; }

    public double KappaV { get; set; }

    public double Sv { get; set; }

    public double Uv { get; set; }

    public double CvV { get; set; }

    public double Hv { get; set; }

    public double CpV { get; set; }

    public double Wv { get; set; }

    public double MiuV { get; set; }

    public double RhofL { get; set; }

    public double ZfL { get; set; }

    public double ViscosityL { get; set; }

    public double KappaL { get; set; }

    public double Sl { get; set; }

    public double Ul { get; set; }

    public double CvL { get; set; }

    public double Hl { get; set; }

    public double CpL { get; set; }

    public double Wl { get; set; }

    public double MiuL { get; set; }

    public virtual FluidPhase BaseFluidPhase { get; set; } = null!;

    public virtual Material BoreMaterial { get; set; } = null!;

    public virtual ConeType ConeType { get; set; } = null!;

    public virtual CalculationErrorMessageType ErrorMessageType { get; set; } = null!;

    public virtual FluidPhase FlowingFluidPhase { get; set; } = null!;

    public virtual FluidStandard FluidStandard { get; set; } = null!;

    public virtual FluidState FluidState { get; set; } = null!;

    public virtual FluidType FluidType { get; set; } = null!;

    public virtual HeatingValueStandard HeatingValueStandard { get; set; } = null!;

    public virtual LinearMeterCalculationMode LinearMeterCalculationMode { get; set; } = null!;

    public virtual LinearMeterCalculationUnitType LinearMeterCalculationUnitType { get; set; } = null!;

    public virtual MeterStandard MeterStandard { get; set; } = null!;

    public virtual NozzleType NozzleType { get; set; } = null!;

    public virtual Material PipeMaterial { get; set; } = null!;

    public virtual PulseType PulseType { get; set; } = null!;

    public virtual ReferenceEquation ReferenceEquation { get; set; } = null!;

    public virtual SignalType SignalType { get; set; } = null!;

    public virtual StaticTapType StaticTap { get; set; } = null!;

    public virtual TapType TapType { get; set; } = null!;

    public virtual TurbineRotorMode TurbineRotorMode { get; set; } = null!;

    public virtual ViscosityEquation ViscosityEquation { get; set; } = null!;

    public virtual WaterRegion WaterRegion { get; set; } = null!;
}
