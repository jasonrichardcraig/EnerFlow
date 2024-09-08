using System;
using System.Collections.Generic;

namespace EnerFlow.Models;

public partial class UltrasonicDiagnosticHistory
{
    public int MeterId { get; set; }

    public DateTime TimeStamp { get; set; }

    public double? Pressure { get; set; }

    public double? Temperature { get; set; }

    public double? SpeedOfSound { get; set; }

    public double? SpeedOfSoundPath1 { get; set; }

    public double? SpeedOfSoundPath2 { get; set; }

    public double? SpeedOfSoundPath3 { get; set; }

    public double? SpeedOfSoundPath4 { get; set; }

    public double? SpeedOfSoundPath5 { get; set; }

    public double? SpeedOfSoundPath6 { get; set; }

    public double? GainPath1a { get; set; }

    public double? GainPath1b { get; set; }

    public double? GainPath2a { get; set; }

    public double? GainPath2b { get; set; }

    public double? GainPath3a { get; set; }

    public double? GainPath3b { get; set; }

    public double? GainPath4a { get; set; }

    public double? GainPath4b { get; set; }

    public double? GainPath5a { get; set; }

    public double? GainPath5b { get; set; }

    public double? GainPath6a { get; set; }

    public double? GainPath6b { get; set; }

    public double? FlowVelocity { get; set; }

    public double? FlowVelocityPath1 { get; set; }

    public double? FlowVelocityPath2 { get; set; }

    public double? FlowVelocityPath3 { get; set; }

    public double? FlowVelocityPath4 { get; set; }

    public double? FlowVelocityPath5 { get; set; }

    public double? FlowVelocityPath6 { get; set; }

    public double? StandardDeviationOfFlowVelocity1 { get; set; }

    public double? StandardDeviationOfFlowVelocity2 { get; set; }

    public double? StandardDeviationOfFlowVelocity3 { get; set; }

    public double? StandardDeviationOfFlowVelocity4 { get; set; }

    public double? StandardDeviationOfFlowVelocity5 { get; set; }

    public double? StandardDeviationOfFlowVelocity6 { get; set; }

    public double? StandardDeviationOfSpeedOfSound1 { get; set; }

    public double? StandardDeviationOfSpeedOfSound2 { get; set; }

    public double? StandardDeviationOfSpeedOfSound3 { get; set; }

    public double? StandardDeviationOfSpeedOfSound4 { get; set; }

    public double? StandardDeviationOfSpeedOfSound5 { get; set; }

    public double? StandardDeviationOfSpeedOfSound6 { get; set; }

    public virtual Meter Meter { get; set; } = null!;
}
