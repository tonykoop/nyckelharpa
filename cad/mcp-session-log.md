<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# MCP Session Log

No MCP, CAD, rendering, image-generation, creative-tool, SolidWorks, DXF, or
acoustic-computation session was run for this L1 packet. No geometry was
generated. No dimensions, tuning numbers, string gauges, DXF coordinates,
G-code, or fabrication outputs are claimed.

## QMD Step 0

| session_id | tool | input_authority | outputs | role | authority_result | review_status | notes |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 2026-05-30-qmd-query | qmd CLI | `qmd query "nyckelharpa Swedish keyed fiddle - rows of keys with wooden tangents that stop melody strings, bowed; sympathetic resonance strings under the keybox; tangent geometry and key action are the engineering core"` | none | context_retrieval | concept_only | attempted | Query produced no usable output after repeated polls and was stopped as hung. |
| 2026-05-30-qmd-search | qmd CLI | `qmd search "nyckelharpa" -c instrument-builds` | none | context_retrieval | concept_only | self_checked | Command completed with `No results found.` |
| 2026-05-30-local-authoring | Codex local edit | Real nyckelharpa mechanism knowledge plus no-result QMD Step 0 | `README.md`; `design.md`; `bom.csv`; `decision-record.md`; `visual-output-register.csv`; `cad/mcp-session-log.md` | concept_packet_authoring | concept_only | self_checked | Authored an L1 concept packet only. All fabrication-relevant claims remain pending measurement. |
| 2026-05-30-r8-wolfram | Codex local edit | Existing L2 packet and Round 8 Wolfram authoring contract | `nyckelharpa-starter.wl`; `wolfram/nyckelharpa-wolfram-model.wl`; `visual-output-register.csv`; `cad/mcp-session-log.md` | wolfram_reference_model | reference_only | self_checked | Source authored by hand. No MCP, Wolfram Desktop, CAD, rendering, or fabrication-authority session was run; every physical number in the model is an estimate placeholder pending measurement. |
| fable-v5-refresh-2026-07-01 | claude-code (Fable 5) | design.md, bom.csv, cut-list.csv, docs/parametric-design-table.md | bom.csv, cut-list.csv, sourcing.csv, validation.csv, visual-output-register.csv | packet_refresh | fabrication | self_checked | V5 refresh pass; tabular packet data reviewed against design docs. Scaffolded missing baseline files (sourcing.csv, validation.csv, risks.md, drawing-brief.md) as concept-only/pending_measurement; no dimensions invented. |
| fable-v5-refresh-2026-07-01 | claude-code (Fable 5) + OpenSCAD CLI | docs/parametric-design-table.md, design.md | cad/nyckelharpa.scad, cad/README.md | cad_authoring | pending_measurement | self_checked | Parametric structural-envelope scaffold; symbolic relationships encoded as formulas, all leaf values render-only placeholders (packet is non-dimensional; register dimension_claim=render_only_scaffold / scaffold_dimensions). Mechanism internals out of scope. OpenSCAD render check: pass (openscad -o STL, exit 0). Not fabrication authority. |
