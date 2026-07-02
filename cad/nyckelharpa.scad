// Nyckelharpa — parametric STRUCTURAL-ENVELOPE scaffold (concept-only packet).
//
// Authority: pending_measurement. NOT fabrication authority.
// ---------------------------------------------------------------------------
// HONESTY BOUNDARY (read before using any value here):
//   This packet is deliberately NON-DIMENSIONAL. design.md, bom.csv,
//   cut-list.csv, and docs/parametric-design-table.md release NO absolute
//   dimensions — every symbol (L_melody[i], K_pitch[j], B_crown(x), ...) is
//   `pending_measurement`. Therefore EVERY numeric leaf value below is a
//   RENDER-ONLY PLACEHOLDER chosen only so the envelope draws; NONE is a
//   design, tuning, string, or fabrication authority. Placeholders are tagged
//   `// PLACEHOLDER`.
//   The DOCUMENTED content this file honestly encodes is the set of SYMBOLIC
//   RELATIONSHIPS from docs/parametric-design-table.md (key travel stack,
//   keybox reference height, key pitch rule) — expressed as formulas.
//   Mechanism detail (tangent contact face, guide-liner internals, sympathetic
//   damping) is intentionally OUT OF SCOPE — see design.md.
// ---------------------------------------------------------------------------
// Units: millimeters.

/* [Body envelope — D_body (PLACEHOLDER extents), keyed-fiddle body] */
body_length_mm     = 640;   // PLACEHOLDER body length (pending_measurement)
body_width_mm      = 210;   // PLACEHOLDER lower-bout width
body_depth_mm      = 90;    // PLACEHOLDER soundbox depth
wall_thk_mm        = 8;     // PLACEHOLDER wall thickness
neck_length_mm     = 300;   // PLACEHOLDER neck/keybox carrier length

/* [Stringing envelope — L_melody, P_sym counts; all PLACEHOLDER] */
melody_count       = 3;     // PLACEHOLDER melody course count (no tuning claim)
sympathetic_count  = 12;    // PLACEHOLDER sympathetic count (no scale claim)
string_band_frac   = 0.82;  // PLACEHOLDER speaking band as fraction of scale

/* [Keybox envelope — K_pitch[j], T_key[j], guide stack; all PLACEHOLDER] */
key_count          = 37;    // PLACEHOLDER key count (no scale authority)
key_pitch_mm       = 11;    // PLACEHOLDER K_pitch center spacing
key_travel_mm      = 14;    // PLACEHOLDER T_key useful travel
guide_side_mm      = 0.3;   // PLACEHOLDER C_guide_side
guide_vert_mm      = 0.3;   // PLACEHOLDER C_guide_vertical
finish_allow_mm    = 0.1;   // PLACEHOLDER finish_allowance
season_allow_mm    = 0.2;   // PLACEHOLDER seasonal_allowance
tangent_height_mm  = 10;    // PLACEHOLDER H_tangent contact height
keybox_width_mm    = 90;    // PLACEHOLDER keybox width

/* [Bridge envelope — B_crown; PLACEHOLDER] */
bridge_height_mm   = 30;    // PLACEHOLDER bridge height (crown pending)
bow_clear_mm       = 8;     // PLACEHOLDER bow clearance envelope

// ---------------------------------------------------------------------------
// Derived geometry — DOCUMENTED symbolic relationships as formulas
// (docs/parametric-design-table.md). Honest, source-traceable part of model.
// ---------------------------------------------------------------------------

// useful key travel = engagement + overtravel + stop compression (placeholders).
overtravel_mm = 2;              // PLACEHOLDER overtravel_allowance
stop_comp_mm  = 1;              // PLACEHOLDER stop_compression_allowance
function key_travel_stack(eng, over, comp) = eng + over + comp;
T_key_min = key_travel_stack(key_travel_mm - overtravel_mm - stop_comp_mm,
                             overtravel_mm, stop_comp_mm);

// guide clearance stack = side + vertical + finish + seasonal.
function guide_total(side, vert, fin, seas) = side + vert + fin + seas;
C_guide_total = guide_total(guide_side_mm, guide_vert_mm, finish_allow_mm, season_allow_mm);

// key pitch >= max(player access, tangent mount + guide wall).
keybox_length_mm = key_count * key_pitch_mm;

// keybox_reference_height = f(D_body, path, H_tangent, C_release, service).
keybox_ref_height_mm = tangent_height_mm + bow_clear_mm;  // envelope proxy

scale_len_mm = neck_length_mm + body_length_mm * 0.4;      // envelope proxy
string_band_len_mm = scale_len_mm * string_band_frac;

module body_shell() {
  difference() {
    hull() {
      for (x = [body_depth_mm/2, body_length_mm - body_depth_mm/2])
        translate([x, body_width_mm/2, 0])
          cylinder(h = body_depth_mm, r = body_width_mm/2, $fn = 64);
    }
    translate([wall_thk_mm, wall_thk_mm, wall_thk_mm])
      hull() {
        for (x = [body_depth_mm/2, body_length_mm - body_depth_mm/2 - 2*wall_thk_mm])
          translate([x, body_width_mm/2 - wall_thk_mm, 0])
            cylinder(h = body_depth_mm, r = body_width_mm/2 - wall_thk_mm, $fn = 64);
      }
  }
}

module keybox_carrier() {
  // Keybox cassette running along the neck carrier over the melody strings.
  translate([-neck_length_mm, body_width_mm/2 - keybox_width_mm/2, body_depth_mm])
    cube([keybox_length_mm, keybox_width_mm, keybox_ref_height_mm]);
}

module string_band() {
  // Melody + sympathetic lanes over the speaking band (envelope only).
  total = melody_count + sympathetic_count;
  for (i = [0 : total-1])
    translate([-neck_length_mm*0.9,
               body_width_mm*0.2 + (body_width_mm*0.6) * i / (total-1),
               body_depth_mm + ((i < melody_count) ? keybox_ref_height_mm : 2)])
      cube([string_band_len_mm, 1.0, 2]);   // 2 mm PLACEHOLDER string standoff
}

module bridge_blank() {
  translate([body_length_mm*0.45, body_width_mm/2 - keybox_width_mm/4, body_depth_mm])
    cube([8, keybox_width_mm/2, bridge_height_mm]);  // crown solved later
}

module nyckelharpa_assembly() {
  body_shell();
  keybox_carrier();
  string_band();
  bridge_blank();
}

nyckelharpa_assembly();

echo(str("T_key_min_mm=", T_key_min));
echo(str("C_guide_total_mm=", C_guide_total));
echo(str("keybox_length_mm=", keybox_length_mm));
echo(str("keybox_ref_height_mm=", keybox_ref_height_mm));
echo("AUTHORITY=pending_measurement; all leaf values are render-only placeholders.");
