<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Subsystem Interface Spec

Status: L3-candidate interface specification. This document defines interface
contracts and validation responsibilities without releasing fabrication
dimensions, tuning values, frequencies, string gauges, or CAD geometry.

## Interface Authority

Each interface remains `pending_measurement` until both sides of the interface
have measured variables, a named datum, and a pass/fail validation record. A
part may look complete but still fail authority if its neighboring subsystem
has not been validated.

## Interface Table

| interface | exchanged constraint | controlled variables | validation responsibility |
| --- | --- | --- | --- |
| body to keybox | Structural support, removable datum, service access. | `keybox_reference_plane`, `keybox_mount_repeatability`, `service_opening_envelope`. | Reinstall keybox and recheck key travel, tangent release, and string clearance. |
| body to bridge | Bearing support, soundboard response, string plane. | `bridge_foot_fit`, `bridge_location_datum`, `bridge_crown_profile`. | Verify bridge stands on the intended datum and supports bow access. |
| body to tail or string anchor | String load path and alignment retention. | `tail_anchor_location`, `load_path`, `melody_afterlength_relationship`, `sympathetic_afterlength_relationship`. | Recheck bridge alignment and string path after tensioning trials. |
| nut to melody strings | Speaking-length start, lateral spacing, string height. | `nut_contact_line`, `nut_slot_profile`, `melody_string_spacing_profile`. | Confirm strings seat cleanly without pinch, buzz, or sideways wander. |
| bridge to melody strings | Speaking-length end, bow access, energy transfer. | `bridge_contact_line`, `bridge_crown_profile`, `string_bearing_relationship`. | Bowing tests and visual path checks before tangent finalization. |
| keybox to sliding keys | Travel guidance, return path, rattle control. | `key_pitch`, `key_travel`, `key_guide_clearance`, `return_method`. | Bench travel and repeatability logs. |
| sliding keys to tangents | Motion transfer and adjustability. | `tangent_mount_method`, `tangent_adjustment_range`, `tangent_retention_method`. | Adjustment and retention tests after repeated key operation. |
| tangents to melody strings | Pitch-setting stop, contact tone, clean release. | `tangent_contact_position`, `tangent_face_geometry`, `tangent_release_clearance`. | One-key string rig and integrated open-keybox tests. |
| keybox to sympathetic strings | Protected resonance route and service access. | `sympathetic_string_path_clearance`, `key_motion_envelope`, `service_tool_envelope`. | Full travel sweep with visual inspection and service rehearsal. |
| sympathetic nut and bridge to body | Independent resonance path and tuning access. | `sympathetic_support_path`, `sympathetic_bearing_relationship`, `tuning_access_envelope`. | Install, tune, observe response, and replace without moving key action datum. |
| player hand to key action | Ergonomic reach, key feel, noise. | `key_spacing_relationship`, `key_front_geometry`, `return_feedback`. | Play-position mockup with observed reach and actuation behavior. |
| bow to melody strings | Playable access and adjacent-string isolation. | `bow_clearance_envelope`, `bridge_crown_profile`, `string_arc_relationship`. | Bowing mockup across the intended string layout. |

## Data Handoff Rules

- The body subsystem must publish datums, not just outlines.
- The keybox subsystem must publish travel envelopes for pressed and released
  keys.
- The tangent subsystem must publish adjustment range and contact observations.
- The bowed-string subsystem must publish actual string paths before tangent
  positions are treated as meaningful.
- The sympathetic-string subsystem must publish clearance envelopes and service
  routes, not only string-path sketches.
- The service subsystem must record what can be adjusted without losing datums.

## Integration Checks

- Tangent press creates intended melody-string contact only.
- Tangent release creates no melody-string or sympathetic-string contact.
- Keybox removal and reinstall preserve the measured relationship well enough
  for setup to resume.
- Bowing clearance remains valid after keys, tangents, and covers are installed.
- Sympathetic strings remain accessible and do not become hidden collision
  hazards.
