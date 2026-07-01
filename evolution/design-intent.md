# Design Intent — nyckelharpa rev A

- Master CAD: `cad/nyckelharpa.scad` (sha256: c8904d8189c089e4b1b54e7988062284b532b1e78b4c4f5ed916888c9c94f920), a parametric structural-envelope scaffold driven by the symbolic table `docs/parametric-design-table.md` (sha256: 660412c075a39a5ab3015878a9f4f3711ae2b9769edc06698e82e36c25d5ae6e).
- Function: A keyed bowed fiddle. Bowed melody strings are stopped by wooden tangents carried on sliding keys in a keybox; sympathetic strings routed under the keybox add resonance without being bowed. Bridge, nut, tailpiece, keybox, string paths, and body stiffness form one coupled mechanical system.
- Environment: indoor bowed instrument; solid-wood plates move with humidity; string tension is a sustained structural load on neck, tailpiece, and body; keybox must remain serviceable and reinstallable to datum.
- Target qty: 1 (prototype). Deadline: TBD. Budget/unit ceiling: TBD.

## Critical dimensions (carry tolerances)

Packet is deliberately non-dimensional — every critical value is
`pending_measurement`; the table records the governing symbolic relationship
and its measurement gate, not a released number.

| Feature | Nominal | Tolerance | Why critical | Source |
| --- | --- | --- | --- | --- |
| Melody string path | TBD (nut/tangent/bridge datums + height) | measured, repeatable | intonation + tangent stop | docs/parametric-design-table.md (pending_measurement) |
| Tangent position/height | TBD (P_tangent[j], H_tangent[j]) | one-key rig | correct stop, clean contact | parametric-design-table.md (pending_measurement) |
| Useful key travel | TBD (engagement + overtravel + stop comp) | bench keybox rig | reliable stop + return | parametric-design-table.md (pending_measurement) |
| Guide clearance stack | TBD (side+vertical+finish+seasonal) | fit trials across humidity | free motion, no racking | parametric-design-table.md (pending_measurement) |
| Sympathetic clearance | TBD (C_sym_key, C_sym_tangent) | full-travel sweep | no fouling of keys/tangents | parametric-design-table.md (pending_measurement) |
| Bridge crown | TBD (B_crown(x) vs bow clearance) | bowing mockup | bow each string, no strike | parametric-design-table.md (pending_measurement) |
| Keybox reinstall repeatability | TBD (datum_return_error) | removal/reinstall check | setup survives service | parametric-design-table.md (pending_measurement) |

## Incidental (free for DFM)

- Body outline styling, scroll/pegbox carving, key-lever cosmetic shaping, non-mating surface finish, decorative purfling.

## Must-nots (DFM may never violate)

- Do not assign a fabrication value to any symbol or promote a `// PLACEHOLDER` in `cad/nyckelharpa.scad` without a measured/reviewed authority-register row (`fabrication_authority[var] = measured ∧ reviewed ∧ interfaces_valid`).
- Do not release body dimensions, scale, tuning, string gauges, or bridge crown from historical examples, images, or prose (design.md).
- String load is a structural load path: no neck/tailpiece sizing until structural review (validation.csv VAL-009).
- Keybox must remain serviceable and reinstallable to datum — never a fixed glued assembly that defeats setup access.

## Material intent

- Preferred: tonewood soundbox/soundboard, hardwood keybox/keys/tangents, bowed + sympathetic strings — all per bom.csv, all class-only / `pending_measurement`.
- Acceptable subs: per sourcing.csv (spec-first; specs pending).
- Forbidden: none recorded.

## Stage status

Stage 0 intake complete 2026-07-01. Gate A (Alpha shop compile) NOT yet run — no concessions logged, nothing presented as shippable or dimensioned.
