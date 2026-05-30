<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Parametric Design Table

Status: L3-candidate symbolic design table. This table intentionally contains
relationships only. It does not release fabricated absolute dimensions,
frequencies, tuning values, string gauges, or CAD coordinates.

## Symbolic Variables

| symbol | meaning | authority |
| --- | --- | --- |
| `L_melody[i]` | speaking length of melody string path `i` | pending_measurement |
| `S_melody_at_nut[i]` | melody string lateral position at nut for path `i` | pending_measurement |
| `S_melody_at_tangent[i]` | melody string lateral position at tangent plane for path `i` | pending_measurement |
| `S_melody_at_bridge[i]` | melody string lateral position at bridge for path `i` | pending_measurement |
| `H_string_at_tangent[i]` | melody string height above tangent reference plane for path `i` | pending_measurement |
| `K_pitch[j]` | key center spacing for key `j` within its row or course | pending_measurement |
| `T_key[j]` | useful sliding travel of key `j` | pending_measurement |
| `C_guide_side[j]` | side clearance between key `j` and guide | pending_measurement |
| `C_guide_vertical[j]` | vertical clearance between key `j` and guide | pending_measurement |
| `A_tangent[j]` | tangent approach angle for key `j` | pending_measurement |
| `P_tangent[j]` | tangent contact position for key `j` | pending_measurement |
| `H_tangent[j]` | tangent contact height for key `j` | pending_measurement |
| `C_release[j]` | released tangent clearance for key `j` | pending_measurement |
| `E_key[j]` | swept envelope of key `j` through full travel | pending_measurement |
| `E_tangent[j]` | swept envelope of tangent `j` through full travel | pending_measurement |
| `P_sym[k]` | sympathetic string path `k` | pending_measurement |
| `C_sym_key[k,j]` | clearance between sympathetic path `k` and key envelope `j` | pending_measurement |
| `C_sym_tangent[k,j]` | clearance between sympathetic path `k` and tangent envelope `j` | pending_measurement |
| `B_crown(x)` | bridge crown curve as a symbolic function over string position | pending_measurement |
| `B_bow_clearance[i]` | bow clearance envelope for melody path `i` | pending_measurement |
| `D_body` | body datum set including centerline, bridge datum, and keybox mount datum | pending_measurement |
| `D_keybox` | keybox datum set including guide plane and service orientation | pending_measurement |

## Relationship Table

| relationship | symbolic expression | validation dependency |
| --- | --- | --- |
| melody string path | `Path_melody[i] = curve(S_melody_at_nut[i], S_melody_at_tangent[i], S_melody_at_bridge[i], H_string_at_tangent[i])` | Measured nut, tangent-plane, and bridge datums. |
| tangent contact location | `P_tangent[j] = function(Path_melody[target_string(j)], desired_stop_relation[j])` | Actual string path and chosen musical layout, both pending. |
| tangent height | `H_tangent[j] = H_string_at_tangent[target_string(j)] + contact_allowance[j]` | One-key tangent rig; contact allowance remains pending. |
| released clearance | `C_release[j] = H_string_at_tangent[target_string(j)] - H_tangent_released[j]` | Open-keybox release test under string motion. |
| useful key travel | `T_key[j] = tangent_engagement_travel[j] + overtravel_allowance[j] + stop_compression_allowance[j]` | Bench keybox and one-key contact rig. |
| guide clearance stack | `C_guide_total[j] = C_guide_side[j] + C_guide_vertical[j] + finish_allowance[j] + seasonal_allowance[j]` | Fit trials after finish and humidity strategy are known. |
| key pitch | `K_pitch[j] = max(player_access_width[j], tangent_mount_width[j] + guide_wall_allowance[j])` | Ergonomic mockup and tangent mount trial. |
| keybox height | `keybox_reference_height = function(D_body, Path_melody, H_tangent, C_release, service_access_envelope)` | Integrated dry fit with body and string-path datums. |
| bridge crown | `B_crown(x) = function(Path_melody, B_bow_clearance, player_bow_angle_envelope)` | Bowing mockup; no crown value released. |
| sympathetic clearance to keys | `C_sym_key[k,j] = distance(P_sym[k], E_key[j])` | Transparent or open keybox mockup. |
| sympathetic clearance to tangents | `C_sym_tangent[k,j] = distance(P_sym[k], E_tangent[j])` | Full travel sweep with tangent geometry installed. |
| service access | `service_access_ok = all(tool_envelope[task] avoids E_key, E_tangent, Path_melody, P_sym)` | Service rehearsal for each task. |
| keybox reinstall repeatability | `datum_return_error = compare(D_keybox_before_service, D_keybox_after_service)` | Removal and reinstall checks; acceptable range pending. |
| authority promotion | `fabrication_authority[var] = measured(var) and reviewed(var) and interfaces_valid(var)` | Measurement protocol and interface spec. |

## Non-Goals

- No absolute body dimensions are provided.
- No string count, tuning, frequency, gauge, or scale value is provided.
- No bridge crown radius, tangent coordinate, key spacing, or clearance value is
  provided.
- No CAD or DXF geometry can be derived from this table without measured input
  rows and authority review.
