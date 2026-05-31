(* Nyckelharpa parametric acoustic and keybox model.
   Reference-only source model: all physical values are estimates pending
   measurement and are not fabrication authority. *)

ClearAll["Global`*"];

metadata = <|
   "instrument" -> "nyckelharpa",
   "packet" -> "Round 8 Wolfram build-packet model",
   "modelName" -> "Bowed melody string, tangent stop, key travel, and sympathetic coupling relationships",
   "authority" -> "reference_only",
   "wolframVersionTarget" -> "14.3"
   |>;

stringFrequencyExpression = HoldForm[
   f == (1/(2 L)) Sqrt[T/mu]
   ];

tangentLocationExpression = HoldForm[
   stoppedLength[n] == openStringLength*2^(-n/semitonesPerOctave)
   ];

keyClearanceExpression = HoldForm[
   clearanceMargin == releasedClearance - vibrationEnvelope - tangentOvertravel
   ];

sympatheticCouplingExpression = HoldForm[
   coupling == Exp[-Abs[melodyFrequency - sympatheticFrequency]/couplingBandwidth]
   ];

openMelodyLengthEstimate = 0.42; (* estimate - pending measurement, not fabrication authority *)
openMelodyLengthMinEstimate = 0.22; (* estimate - pending measurement, not fabrication authority *)
openMelodyLengthMaxEstimate = 0.78; (* estimate - pending measurement, not fabrication authority *)
melodyTensionEstimate = 48.0; (* estimate - pending measurement, not fabrication authority *)
melodyTensionMinEstimate = 8.0; (* estimate - pending measurement, not fabrication authority *)
melodyTensionMaxEstimate = 140.0; (* estimate - pending measurement, not fabrication authority *)
melodyLinearDensityEstimate = 0.0014; (* estimate - pending measurement, not fabrication authority *)
melodyLinearDensityMinEstimate = 0.00025; (* estimate - pending measurement, not fabrication authority *)
melodyLinearDensityMaxEstimate = 0.006; (* estimate - pending measurement, not fabrication authority *)
tangentIndexEstimate = 5; (* estimate - pending measurement, not fabrication authority *)
tangentIndexMinEstimate = 0; (* estimate - pending measurement, not fabrication authority *)
tangentIndexMaxEstimate = 12; (* estimate - pending measurement, not fabrication authority *)
semitonesPerOctaveEstimate = 12; (* estimate - pending measurement, not fabrication authority *)
sympatheticLengthEstimate = 0.38; (* estimate - pending measurement, not fabrication authority *)
sympatheticLengthMinEstimate = 0.18; (* estimate - pending measurement, not fabrication authority *)
sympatheticLengthMaxEstimate = 0.72; (* estimate - pending measurement, not fabrication authority *)
sympatheticTensionEstimate = 32.0; (* estimate - pending measurement, not fabrication authority *)
sympatheticTensionMinEstimate = 5.0; (* estimate - pending measurement, not fabrication authority *)
sympatheticTensionMaxEstimate = 100.0; (* estimate - pending measurement, not fabrication authority *)
sympatheticLinearDensityEstimate = 0.0008; (* estimate - pending measurement, not fabrication authority *)
sympatheticLinearDensityMinEstimate = 0.00015; (* estimate - pending measurement, not fabrication authority *)
sympatheticLinearDensityMaxEstimate = 0.004; (* estimate - pending measurement, not fabrication authority *)
couplingBandwidthEstimate = 18.0; (* estimate - pending measurement, not fabrication authority *)
couplingBandwidthMinEstimate = 2.0; (* estimate - pending measurement, not fabrication authority *)
couplingBandwidthMaxEstimate = 80.0; (* estimate - pending measurement, not fabrication authority *)
releasedClearanceEstimate = 0.003; (* estimate - pending measurement, not fabrication authority *)
releasedClearanceMinEstimate = 0.0005; (* estimate - pending measurement, not fabrication authority *)
releasedClearanceMaxEstimate = 0.012; (* estimate - pending measurement, not fabrication authority *)
vibrationEnvelopeEstimate = 0.0012; (* estimate - pending measurement, not fabrication authority *)
vibrationEnvelopeMinEstimate = 0.0001; (* estimate - pending measurement, not fabrication authority *)
vibrationEnvelopeMaxEstimate = 0.006; (* estimate - pending measurement, not fabrication authority *)
tangentOvertravelEstimate = 0.0008; (* estimate - pending measurement, not fabrication authority *)
tangentOvertravelMinEstimate = 0.0001; (* estimate - pending measurement, not fabrication authority *)
tangentOvertravelMaxEstimate = 0.006; (* estimate - pending measurement, not fabrication authority *)
keyTravelEstimate = 0.012; (* estimate - pending measurement, not fabrication authority *)
keyTravelMinEstimate = 0.002; (* estimate - pending measurement, not fabrication authority *)
keyTravelMaxEstimate = 0.035; (* estimate - pending measurement, not fabrication authority *)

stringFrequency[length_, tension_, linearDensity_] :=
  (1/(2 length)) Sqrt[tension/linearDensity];

tangentStoppedLength[openLength_, tangentIndex_, semitoneDivisions_] :=
  openLength*2^(-tangentIndex/semitoneDivisions);

clearanceMargin[releasedClearance_, vibrationEnvelope_, tangentOvertravel_] :=
  releasedClearance - vibrationEnvelope - tangentOvertravel;

sympatheticCoupling[melodyFrequency_, sympatheticFrequency_, bandwidth_] :=
  Exp[-Abs[melodyFrequency - sympatheticFrequency]/bandwidth];

travelReserve[keyTravel_, tangentOvertravel_] :=
  keyTravel - tangentOvertravel;

modelSummary = <|
   "stringLaw" -> stringFrequencyExpression,
   "tangentStop" -> tangentLocationExpression,
   "keyRelease" -> keyClearanceExpression,
   "sympatheticCoupling" -> sympatheticCouplingExpression,
   "measurementStatus" -> "All numerical inputs are estimates pending measurement; not fabrication authority."
   |>;

Manipulate[
 Module[
  {
   stoppedLength,
   melodyFrequency,
   sympatheticFrequency,
   coupling,
   releaseMargin,
   reserve
   },
  stoppedLength =
   tangentStoppedLength[openMelodyLengthM, tangentIndex, semitonesPerOctaveEstimate];
  melodyFrequency =
   stringFrequency[stoppedLength, melodyTensionN, melodyLinearDensityKgM];
  sympatheticFrequency =
   stringFrequency[sympatheticLengthM, sympatheticTensionN, sympatheticLinearDensityKgM];
  coupling =
   sympatheticCoupling[melodyFrequency, sympatheticFrequency, couplingBandwidthHz];
  releaseMargin =
   clearanceMargin[releasedClearanceM, vibrationEnvelopeM, tangentOvertravelM];
  reserve = travelReserve[keyTravelM, tangentOvertravelM];
  Column[
   {
    Style["Nyckelharpa reference-only parametric model", 16, Bold],
    metadata,
    Grid[
     {
      {"stopped melody length (m)", NumberForm[stoppedLength, {6, 4}]},
      {"computed melody relationship (Hz from estimates)", NumberForm[melodyFrequency, {7, 2}]},
      {"computed sympathetic relationship (Hz from estimates)", NumberForm[sympatheticFrequency, {7, 2}]},
      {"sympathetic coupling proxy", NumberForm[coupling, {5, 3}]},
      {"release clearance margin (m)", NumberForm[releaseMargin, {7, 5}]},
      {"key travel reserve (m)", NumberForm[reserve, {7, 5}]}
      },
     Frame -> All
     ],
    Style[
     "Every displayed value is computed from estimate placeholders only; pending measurement, not fabrication authority.",
     11,
     Darker[Red]
     ]
    }
   ]
  ],
 {{openMelodyLengthM, openMelodyLengthEstimate, "open melody string length m"},
  openMelodyLengthMinEstimate, openMelodyLengthMaxEstimate, Appearance -> "Labeled"},
 {{melodyTensionN, melodyTensionEstimate, "melody tension N"}, melodyTensionMinEstimate,
  melodyTensionMaxEstimate, Appearance -> "Labeled"},
 {{melodyLinearDensityKgM, melodyLinearDensityEstimate, "melody linear density kg/m"},
  melodyLinearDensityMinEstimate, melodyLinearDensityMaxEstimate, Appearance -> "Labeled"},
 {{tangentIndex, tangentIndexEstimate, "tangent semitone index"}, tangentIndexMinEstimate,
  tangentIndexMaxEstimate, 1, Appearance -> "Labeled"},
 Delimiter,
 {{sympatheticLengthM, sympatheticLengthEstimate, "sympathetic string length m"},
  sympatheticLengthMinEstimate, sympatheticLengthMaxEstimate, Appearance -> "Labeled"},
 {{sympatheticTensionN, sympatheticTensionEstimate, "sympathetic tension N"},
  sympatheticTensionMinEstimate, sympatheticTensionMaxEstimate, Appearance -> "Labeled"},
 {{sympatheticLinearDensityKgM, sympatheticLinearDensityEstimate,
   "sympathetic linear density kg/m"}, sympatheticLinearDensityMinEstimate,
  sympatheticLinearDensityMaxEstimate, Appearance -> "Labeled"},
 {{couplingBandwidthHz, couplingBandwidthEstimate, "coupling bandwidth Hz"},
  couplingBandwidthMinEstimate, couplingBandwidthMaxEstimate, Appearance -> "Labeled"},
 Delimiter,
 {{releasedClearanceM, releasedClearanceEstimate, "released tangent clearance m"},
  releasedClearanceMinEstimate, releasedClearanceMaxEstimate, Appearance -> "Labeled"},
 {{vibrationEnvelopeM, vibrationEnvelopeEstimate, "string vibration envelope m"},
  vibrationEnvelopeMinEstimate, vibrationEnvelopeMaxEstimate, Appearance -> "Labeled"},
 {{tangentOvertravelM, tangentOvertravelEstimate, "tangent overtravel m"},
  tangentOvertravelMinEstimate, tangentOvertravelMaxEstimate, Appearance -> "Labeled"},
 {{keyTravelM, keyTravelEstimate, "key travel m"}, keyTravelMinEstimate,
  keyTravelMaxEstimate, Appearance -> "Labeled"},
 ControlPlacement -> Left,
 SaveDefinitions -> True
 ]
