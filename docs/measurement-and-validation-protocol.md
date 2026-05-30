<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Measurement And Validation Protocol

Status: L3-candidate protocol; no fabrication authority. All dimensional,
tuning, frequency, force, and clearance values remain
`estimate_pending_measurement` until logged from a measured reference,
prototype, or reviewed design table.

## Authority Rule

No variable in this packet can promote from estimate to fabrication authority
until the measurement record names the source, tool, datum, repeatability
method, environmental context when relevant, and reviewer. A single convenient
measurement is not enough for release; the result must be reproducible and must
not conflict with adjacent subsystem interfaces.

## Measurement Register

| variable | current authority | required measurement or test | promotion evidence |
| --- | --- | --- | --- |
| `reference_instrument_family` | pending_measurement | Select and document the nyckelharpa family or exemplar governing this packet. | Source photos, notes, or direct measurements identify the reference and its limits. |
| `body_outline_reference` | pending_measurement | Trace or measure the body outline against a fixed centerline and bridge datum. | Dimensioned source record exists, but values stay out of fabrication files until reviewed. |
| `body_structure_variables` | pending_measurement | Record soundboard, back, rib, bracing, and keybox-support construction as separate variables. | Structural assumptions are replaced by measured or reviewed construction notes. |
| `melody_string_count` | pending_measurement | Count and label the directly bowed string paths on the chosen reference or prototype. | Count, role, and path labels are recorded without extrapolating to other variants. |
| `melody_string_scale_length` | pending_measurement | Measure speaking length from nut contact to bridge contact for each melody path. | Each path is tied to its own nut, bridge, tangent plane, and measurement datum. |
| `melody_string_spacing_profile` | pending_measurement | Measure spacing at nut, tangent contact zone, and bridge. | Spacing is verified against bow clearance and tangent access, not stored in isolation. |
| `melody_string_action_profile` | pending_measurement | Measure string height relative to tangent travel plane at representative stopped locations. | Action supports clear stop, clean release, and bowable bridge geometry in a test setup. |
| `bridge_crown_and_bow_clearance` | pending_measurement | Measure or test crown shape and bow access across melody strings. | Bowing tests show adjacent-string clearance and playable attack without claimed tuning authority. |
| `keybox_reference_plane` | pending_measurement | Establish a stable keybox datum relative to body centerline, strings, and bridge. | Datum is repeatable across removal and reinstallation trials. |
| `key_pitch_and_key_travel` | pending_measurement | Measure key spacing, travel, return behavior, and side-play on a bench keybox. | Keys move without binding, rattling, or tangent drag under repeated operation. |
| `key_guide_clearance` | pending_measurement | Measure side, top, and bottom guide clearances for each sliding key family. | Clearance is enough for humidity and finish effects while preventing audible rattle. |
| `tangent_contact_position` | pending_measurement | Locate tangent contact points from the actual string path, not from a speculative drawing. | Contact locations are adjustable and repeatable before any permanent tangent layout is released. |
| `tangent_face_geometry` | pending_measurement | Test tangent material, face shape, height, and contact angle against a live melody string. | Stopped notes speak cleanly, release cleanly, and do not damage the string in the test rig. |
| `tangent_release_clearance` | pending_measurement | Measure clearance between released tangents and vibrating strings. | Release clearance survives key return variation, string motion, and body/keybox tolerance stack. |
| `sympathetic_string_count` | pending_measurement | Count and label sympathetic string paths only after the reference style is chosen. | Count is documented as a design variable and does not imply tuning authority. |
| `sympathetic_string_path_clearance` | pending_measurement | Measure clearance from sympathetic strings to keys, tangents, keybox floor, and service openings. | Clearance allows resonance, tuning access, and replacement without moving the tangent action. |
| `sympathetic_response_log` | pending_measurement | Record which strings respond during bowed-string tests and which produce noise or weak response. | Response is logged as observed behavior, with no unmeasured frequency or tuning claims. |
| `hardware_service_access` | pending_measurement | Test access to pegs, tailpiece, tangents, keys, and sympathetic strings with the keybox installed. | A service task can be completed without destructive disassembly or hidden datum loss. |
| `assembly_repeatability` | pending_measurement | Remove and reinstall serviceable assemblies, then recheck key travel and string clearances. | Critical relationships return to their measured state within the reviewed tolerance plan. |

## Validation Sequence

| gate | purpose | required pass evidence |
| --- | --- | --- |
| provenance gate | Prevent hidden fabrication assumptions. | Every governing source is named, and every missing source is still marked `pending_measurement`. |
| datum gate | Prevent mismatched measurements. | Body, string, bridge, and keybox datums are defined before measurements are compared. |
| one-key tangent gate | Isolate tangent stopping behavior. | One adjustable tangent stops and releases one melody string cleanly in a rig. |
| keybox travel gate | Isolate sliding-key mechanics. | Representative keys travel, return, and resist rattle in a bench keybox. |
| clearance gate | Protect sympathetic and melody paths. | Open-keybox mockup confirms no moving part contacts an unintended string path. |
| bowing gate | Confirm playable access. | Bridge and string path permit controlled bowing without adjacent-path interference. |
| resonance observation gate | Keep resonance empirical. | Sympathetic behavior is logged from a physical setup without converting it into tuning authority. |
| service gate | Confirm maintainability. | A key, tangent, melody string, and sympathetic string can each be serviced while preserving datums. |
| review gate | Promote only reviewed variables. | A reviewer signs off each promoted variable and its interface dependencies. |

## Required Logs

- `measurement-log.md` should record source, tool, datum, operator, date,
  measurement condition, repeated readings summary, and unresolved questions.
- `setup-observation-log.md` should record buzzing, scraping, rattle, weak
  response, tangent drag, key return noise, and bowing interference as observed
  behaviors, not as inferred causes.
- `authority-register.csv` or the existing visual register should mark released
  drawings as `pending_measurement` until every dependent variable above has
  passed its gate.
