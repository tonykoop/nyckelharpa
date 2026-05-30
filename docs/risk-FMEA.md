<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Risk FMEA

Status: L3-candidate qualitative FMEA. Ratings are qualitative by design; no
numeric severity, occurrence, detection, tuning, frequency, dimension, or force
values are released. Every mitigation remains `pending_measurement` until
validated by the measurement protocol.

| subsystem | failure mode | likely causes | effect | detection method | mitigation before fabrication authority | authority |
| --- | --- | --- | --- | --- | --- | --- |
| key action | Sliding key binds. | Guide clearance too tight, finish buildup, seasonal movement, key warp. | Tangent cannot stop the string reliably; player feel is poor. | Bench keybox travel tests before and after finish trial. | Validate guide material, finish strategy, and clearance stack on a rig. | pending_measurement |
| key action | Sliding key rattles. | Guide clearance too loose, poor return damping, worn guide surfaces. | Audible mechanical noise and unstable tangent position. | Shake, actuation, and bowed-string observation in keybox rig. | Revise guide geometry, bearing material, and return method. | pending_measurement |
| tangent | Tangent drags during release. | Tangent face shape, approach angle, or return path is wrong. | Buzz, pitch smear, string wear, slow action. | One-key tangent rig with visible release checks. | Make tangent height and face adjustable; validate release clearance. | pending_measurement |
| tangent | Tangent fails to stop cleanly. | Contact face unsuitable, string action mismatched, tangent position unstable. | Weak or buzzing stopped note. | Stopped-string tests against live melody string. | Separate contact trials from full instrument build before committing layout. | pending_measurement |
| tangent | Tangent adjustment slips. | Weak mount, poor retention method, excessive adjustment range. | Setup drifts and notes become unreliable. | Repeated actuation and adjustment-retention checks. | Choose retention method after rig testing. | pending_measurement |
| bowed string core | Bow cannot isolate intended string. | Bridge crown, string spacing, or body/keybox clearance mismatched. | Instrument is difficult or impossible to play as intended. | Bowing mockup across actual string paths. | Delay bridge finalization until string layout and keybox clearance are known. | pending_measurement |
| bowed string core | Melody string buzzes against unintended surface. | Insufficient action, tangent release clearance, nut/bridge issue, keybox interference. | Noise and unreliable tone. | Open mockup under bowed excitation. | Trace buzz to a specific interface before changing geometry. | pending_measurement |
| sympathetic strings | Sympathetic string contacts moving key or tangent. | Routing too close to action envelope; service path not modeled. | Buzz, broken string, jammed action. | Transparent or open keybox full-travel sweep. | Route sympathetic paths only after key and tangent envelopes are known. | pending_measurement |
| sympathetic strings | Weak or uneven sympathetic response. | Poor coupling, support path, string choice, or body interaction. | Resonance goal is not achieved. | Physical response log during bowed-string trials. | Treat resonance as empirical; adjust support path after observation. | pending_measurement |
| body and keybox | Keybox reinstall loses datum. | Locator design inadequate, fasteners shift, body surface unstable. | Tangent setup changes after service. | Remove and reinstall, then recheck travel and clearances. | Use a locator scheme that can be measured and restored. | pending_measurement |
| body and bridge | Bridge support distorts or moves. | Poor foot fit, insufficient structural support, load path mismatch. | String path and tangent setup drift. | Structural mockup and post-tension datum checks. | Validate bridge/body interface before final body geometry. | pending_measurement |
| serviceability | A trapped part cannot be adjusted or replaced. | Covers, keybox, or sympathetic strings block tool access. | Maintenance requires destructive disassembly or datum loss. | Service rehearsal with representative tools. | Add removable access and define allowed service sequence. | pending_measurement |
| documentation | Measurement without datum is mistaken for authority. | Logs omit source, tool, datum, or reviewer. | Fabrication files inherit false confidence. | Authority-register review. | Require measurement protocol fields before promotion. | concept_only |
| integration | Fixing one subsystem breaks another. | Tangent, bridge, keybox, and sympathetic path optimized separately. | Design becomes unbuildable or unserviceable. | Interface review after each rig gate. | Use subsystem interface spec as the release checklist. | pending_measurement |

## Highest-Risk Couplings

- Tangent contact depends on string path, key travel, keybox datum, and bridge
  setup at the same time.
- Sympathetic routing depends on moving-key envelopes and service access, not
  just available empty space.
- Bridge crown affects bowing, action, tangent height, body response, and
  player ergonomics.
- Serviceability is a structural requirement because keybox removal can destroy
  setup authority if datums are not repeatable.
