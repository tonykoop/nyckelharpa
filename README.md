<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Nyckelharpa

Status: L3-candidate V5 packet (deepened: protocols, tolerances, assembly, FMEA)...
fabrication-ready and not measured authority.

This repository is a V5 L2 shop-planning packet seed for a
nyckelharpa-inspired keyed fiddle. The design centers on a bowed string body, a
keybox with sliding keys, wooden tangents that stop the melody strings, and
sympathetic strings routed under or through the keybox so they can resonate
without being directly bowed.

This packet is intentionally conservative. It does not release body dimensions,
scale length, tuning, string gauges, bridge geometry, tangent coordinates, key
spacing, CAD, DXF, toolpaths, or acoustic predictions. Every physical value is
`estimate_pending_measurement` until a measured reference, prototype, or
reviewed design table exists.

## Packet Map

- `design.md` - mechanism, parametric intent, and measurement gates.
- `bom.csv` - estimated subsystem list with pending measurement authority.
- `cut-list.csv` - estimated shop-planning blanks and test-rig parts.
- `decision-record.md` - decisions, assumptions, and open questions.
- `visual-output-register.csv` - V5 authority register for this concept packet.
- `cad/mcp-session-log.md` - QMD and no-MCP provenance log.

## Core Mechanisms

- Bowed melody strings carry the primary played voice.
- Sliding keys translate finger motion into tangent contact against melody
  strings.
- Tangents must be adjustable in position, height, contact face, and clearance.
- Sympathetic strings add resonance and require a protected path under the
  keybox, with service access for setup.
- Bridge, nut, tailpiece, keybox, string paths, and body stiffness must be
  treated as one coupled mechanical system.

## Readiness Boundary

L2 here means the repo now separates subsystems, shop-planning parts, and
prototype gates well enough for careful review of the intended build sequence.
It still does not release fabrication dimensions, CAD, DXF, tuning, string
gauges, or acoustic predictions. L3 or stronger requires validated geometry and
measured setup evidence.
