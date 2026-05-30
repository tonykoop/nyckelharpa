<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Assembly Sequence

Status: L3-candidate assembly planning. This is a build-order and jig plan, not
a fabrication release. All jig dimensions, physical dimensions, tuning values,
and setup numbers remain `estimate_pending_measurement`.

## Assembly Principles

- Build measurement rigs before committing to a full integrated instrument.
- Establish datums before fitting parts that depend on those datums.
- Keep the keybox removable until tangent, string, and service relationships
  have been proven.
- Do not glue, pin, or permanently trap any part whose position still depends
  on `pending_measurement` variables.

## Jigs And Fixtures

| jig or fixture | purpose | authority |
| --- | --- | --- |
| body centerline and bridge-datum board | Holds source tracings, body mockups, and string path references against one repeatable datum set. | pending_measurement |
| one-key tangent rig | Tests tangent contact, tangent adjustment, string stop, and clean release before full keyboard work. | pending_measurement |
| bench keybox rail rig | Tests sliding-key travel, side-play, return method, and guide materials. | pending_measurement |
| transparent or open keybox mockup | Makes sympathetic-string and tangent clearance visible during full travel sweeps. | pending_measurement |
| bridge and bow-clearance mockup | Checks bridge crown concept and bow access before body geometry is fixed. | pending_measurement |
| removable keybox locator | Tests repeatable keybox removal and reinstall without hidden datum drift. | pending_measurement |
| service-access rehearsal fixture | Confirms tool access for keys, tangents, melody strings, and sympathetic strings. | pending_measurement |

## Build Order

| phase | action | exit condition |
| --- | --- | --- |
| source selection | Choose the reference family, exemplar, or prototype target. | Reference authority is documented, and unknowns stay marked `pending_measurement`. |
| datum setup | Define centerline, string plane, bridge datum, keybox plane, and service directions. | Measurements can be compared without mixing unrelated reference frames. |
| single-string contact rig | Mount one melody string path and one adjustable tangent outside the full instrument. | Tangent stops, releases, and adjusts without buzz, scrape, or damage in observed tests. |
| keybox rail rig | Build a representative sliding-key guide with removable keys. | Keys travel and return consistently enough to proceed to clearance mockup. |
| open clearance mockup | Combine representative keys, tangents, melody path, and sympathetic path in an inspectable fixture. | Full travel sweep shows intended contact only. |
| bridge and bow mockup | Fit a temporary bridge concept to the measured or mocked string paths. | Bow access is observed across the intended played-string set. |
| body structural mockup | Test keybox support, bridge bearing, tail anchoring, and service openings. | Loads and access routes are understood before permanent body decisions. |
| integrated dry fit | Assemble body mock, keybox, keys, tangents, bridge, nut, tail, and string paths without final finish. | Setup variables can be adjusted and logged without destructive disassembly. |
| service rehearsal | Remove and reinstall keybox-related parts and replace representative strings. | Critical datums and clearances can be restored after service. |
| authority review | Compare logs against the measurement protocol and interface spec. | Only reviewed variables may move toward fabrication authority in a later packet. |

## Assembly Dependencies

- Tangent layout depends on actual melody string paths.
- Keybox height depends on body datum, bridge crown, string action, and tangent
  adjustment range.
- Sympathetic-string routing depends on key travel envelopes, tangent envelopes,
  service access, and body structure.
- Bridge work depends on bowed-string access and body response observations.
- Finish decisions depend on sliding-fit trials, not appearance alone.

## Stop Conditions

Stop the assembly path and return to measurement when any of the following
appear: key binding, tangent drag, unexplained buzz, sympathetic string contact,
poor bow access, non-repeatable keybox reinstall, trapped service item, or a
measurement that lacks a datum.
