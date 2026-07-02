<!-- SPDX-License-Identifier: CC-BY-4.0 -->

# Risks

Top-level risk summary for the nyckelharpa L2 shop-planning packet. The full
qualitative analysis lives in `docs/risk-FMEA.md`; this file is the baseline
packet summary. No numeric risk scores are assigned.

## Key action / tangents

- **Tangent mis-stops the string** — wrong pitch or buzzing. Control: measure
  tangent position/height on a one-key rig (validation.csv VAL-002).
- **Key binds or fails to return** — dead notes. Control: key travel + guide
  clearance stack trials across humidity (VAL-003, VAL-004).
- **Released tangent fouls a vibrating string** — buzz on adjacent notes.
  Control: open-keybox release test (VAL-005).

## Strings / bridge

- **Sympathetic strings foul key/tangent envelopes** — rattle or blocked keys.
  Control: full-travel clearance sweep (VAL-006).
- **Bridge crown wrong for bowing** — neighbor-string strike. Control: bowing
  mockup to solve `B_crown(x)` against bow clearance (VAL-007).
- **String load treated as decoration** — neck/tailpiece distortion. Control:
  structural review after string plan (VAL-009).

## Service / process

- **Keybox cannot be reinstalled to datum** — setup drifts after service.
  Control: removal/reinstall datum-return check (VAL-008).
- **CAD appears authoritative too early** — the parametric OpenSCAD envelope
  (`cad/nyckelharpa.scad`) carries `pending_measurement` authority and
  render-only placeholder values; it is **not** fabrication authority. Update
  the authority register before any DXF/SVG or measured geometry is accepted.

## Must-not (carried into evolution/design-intent.md)

- Do not assign a fabrication value to any symbol (L_melody, K_pitch, B_crown, …)
  or promote a `// PLACEHOLDER` without a measured/reviewed authority-register row.
- Do not release body dimensions, scale, tuning, or bridge crown from historical
  examples, images, or prose (design.md authority boundary).
