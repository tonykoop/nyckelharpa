<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Nyckelharpa Design Study

## Design Thesis

This concept treats the nyckelharpa as a keyed bowed fiddle where the keyboard
is not decorative hardware; it is the acoustic control surface. The hard design
problem is keeping tangent contact repeatable while the bowed strings vibrate,
the sympathetic strings remain free to ring, and the player can service the
keybox without disturbing the whole setup.

## Mechanism Overview

The player bows the melody strings while the left hand operates keys. Each key
slides in the keybox and carries a wooden tangent. When the key is pressed, the
tangent contacts a melody string from the side and defines a stopped speaking
point. The tangent must meet the string cleanly, avoid dragging during release,
and return without rattling.

Sympathetic strings are not stopped by the main key action. They are routed
below or through the keybox so they can respond to the bowed melody strings.
Their path must preserve clearance from moving keys and tangents, protect the
strings from accidental contact, and leave enough service access for tuning,
replacement, and resonance experiments.

The bridge, nut, tailpiece, keybox, pegbox, and body are coupled. A change in
keybox height, bridge crown, string path, or tangent face changes action feel
and tone. This packet therefore records named setup variables rather than
pretending a first-pass drawing is build authority.

## Subsystems

### Bowed String Core

- Melody strings are the directly bowed voices.
- Bow response depends on bridge shape, string path, bow clearance, string
  material, and setup, all pending measurement.
- No tuning, string count, string gauges, or scale length are released in this
  L1 packet.

### Keybox And Sliding Keys

- The keybox needs straight, low-friction key travel and a stable reference
  plane.
- Keys need return behavior that is quiet, repeatable, and serviceable.
- Tangents should be individually adjustable during setup.
- Key travel, key spacing, guide material, and return method are all
  `estimate_pending_measurement`.

### Tangent Contact

- The tangent face is the pitch-setting contact element.
- Contact should stop the string clearly without crushing, buzzing, or scraping.
- Tangent geometry must allow fine adjustment after the actual string path is
  measured.
- First prototypes should separate tangent-contact tests from full instrument
  body work.

### Sympathetic String Path

- Sympathetic strings need their own nut, bridge, tail, and tuning access.
- The path must pass near the resonant body while avoiding key and tangent
  interference.
- Resonance is a setup variable, not a guarantee. The first build should log
  which strings respond, which remain weak, and which cause unwanted noise.

### Body And Service Access

- The body must support bowed-string load, keybox fasteners, bridge load, and
  sympathetic-string routing.
- Removable or inspectable keybox panels are preferred for early prototypes.
- The design should keep tangent adjustment, key cleaning, and sympathetic
  string replacement possible without full disassembly.

## Parametric Intent

Future design work should use named parameters before any fabrication file is
created:

- `estimate_body_outline_pending_measurement`
- `estimate_melody_string_count_pending_measurement`
- `estimate_sympathetic_string_count_pending_measurement`
- `estimate_key_count_pending_measurement`
- `estimate_keybox_reference_height_pending_measurement`
- `estimate_key_travel_pending_measurement`
- `estimate_tangent_contact_face_pending_measurement`
- `estimate_bridge_crown_pending_measurement`
- `estimate_string_path_clearance_pending_measurement`

These names are placeholders, not values.

## First Measurement Gates

- Key action: verify smooth travel, return, and side-play on a bench keybox.
- Tangent contact: test one adjustable tangent against one melody string before
  making a full keyboard.
- Clearance: check tangent release and sympathetic-string clearance with a
  transparent or open keybox mockup.
- Bowing: confirm bridge and string path provide playable bow access before
  finalizing body layout.
- Resonance: document sympathetic response only after actual string paths,
  bridge contact, and body coupling are present.
- Serviceability: prove a key, tangent, and sympathetic string can be adjusted
  or replaced without destructive disassembly.

## L1 Boundary

This file is a concept and engineering-risk map. It does not provide CAD,
DXF, tooling instructions, dimensions, tuning, string gauges, or a measured
acoustic model.
