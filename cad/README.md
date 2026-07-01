<!-- SPDX-License-Identifier: CC-BY-4.0 -->

# CAD Notes

`nyckelharpa.scad` is a parametric **structural-envelope scaffold** — authority
`pending_measurement`, **not** fabrication authority. See
`../visual-output-register.csv` (NH-CAD-001) and `mcp-session-log.md`.

This packet is deliberately non-dimensional: every leaf number in the `.scad`
is a render-only placeholder (tagged `// PLACEHOLDER`), chosen only so the
body / keybox-carrier / string-band / bridge envelope draws. The honest,
source-traceable content is the set of **symbolic relationships** from
`../docs/parametric-design-table.md` (key-travel stack, guide-clearance stack,
key-pitch rule, keybox reference height) encoded as formulas.

Mechanism internals (tangent contact face, guide liners, sympathetic damping)
are intentionally **out of scope** — see `../design.md`.

Render check: `openscad -o /tmp/nyckelharpa-check.stl nyckelharpa.scad`
exits 0 (manifold solid). Promote a placeholder to a real value only via a
measured/reviewed authority-register row.
