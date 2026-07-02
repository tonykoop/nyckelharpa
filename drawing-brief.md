<!-- SPDX-License-Identifier: CC-BY-4.0 -->

# Drawing Brief

Scope for any future dimensioned drawing of the nyckelharpa. This packet is
deliberately non-dimensional (concept-only / `pending_measurement`), so **no
dimensioned DXF/SVG exists yet** and none may be produced until the measurement
gates in `validation.csv` and the authority register are satisfied.

## What a future drawing set must show (once measured)

- **Melody string-path plan** — `L_melody[i]`, lateral positions at nut,
  tangent plane, and bridge; string height `H_string_at_tangent[i]`.
- **Keybox layout** — key pitch `K_pitch[j]`, travel `T_key[j]`, guide
  clearance stack, tangent position/height `P_tangent[j]`/`H_tangent[j]`,
  swept envelopes `E_key[j]`/`E_tangent[j]`.
- **Sympathetic routing** — paths `P_sym[k]` under the keybox with clearances
  to key/tangent envelopes.
- **Bridge** — crown curve `B_crown(x)` vs bow-clearance envelope.
- **Body + datums** — body datum set `D_body`, keybox datum `D_keybox`, service
  orientation.

## Current CAD artifact

`cad/nyckelharpa.scad` is a **parametric structural-envelope scaffold**: it
encodes the documented symbolic relationships as formulas and uses render-only
placeholder leaf values (clearly flagged, not authority).

## Drawing rules

- Every dimension on any released drawing must trace to a measured or reviewed
  authority-register row (`fabrication_authority[var] = measured ∧ reviewed ∧
  interfaces_valid`).
- Keep string-path, tangent, and bridge-crown relationships formula-driven;
  never hand-place from a lossy export.
- Treat historical nyckelharpor, photos, and diagrams as reference-only.
