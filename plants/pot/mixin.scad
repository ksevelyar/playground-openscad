$fn = 64;

POT_EDGE = 82;
POT_HEIGHT = 82;
WALL_WIDTH = 1;
CORNER_RADIUS = 3;

LEG_ANGLE = 55;
LEG_SLOPE = 1 / tan(LEG_ANGLE);
LEG_WIDTH = 6;
LEG_LENGTH = POT_HEIGHT / 7;

PIN_LENGTH = LEG_LENGTH - WALL_WIDTH * 2;
PIN_WIDTH = 3;
PIN_HEIGHT = POT_EDGE / 2 + POT_EDGE / 8;
FIT_GAP = 0.36;
OVERCUT = 0.1;

FIRST_LEG_Y = WALL_WIDTH + FIT_GAP;
SECOND_LEG_Y = POT_EDGE - LEG_WIDTH - WALL_WIDTH - FIT_GAP;

SLOT_WIDTH = 3;
SLOT_STEP = 6;

module rounded_box(size = [10, 10, 5], corner_radius = CORNER_RADIUS) {
  translate([size[0] / 2, size[1] / 2, 0]) {
    linear_extrude(height=size[2]) {
      minkowski() {
        square([size[0] - 2 * corner_radius, size[1] - 2 * corner_radius], center=true);
        circle(r=corner_radius);
      }
    }
  }
}

function leg_profile(slope) = let(
  underside_z0 = WALL_WIDTH,
  underside_z1 = WALL_WIDTH + slope * LEG_LENGTH,
  top_z = POT_EDGE / 2 - FIT_GAP
) [
  [0, underside_z0],
  [LEG_LENGTH, underside_z1],
  [LEG_LENGTH, top_z],
  [0, top_z],
];

function pin_profile(slope, pin_length) = let(
  x0 = (LEG_LENGTH - pin_length) / 2,
  x1 = (LEG_LENGTH + pin_length) / 2,
  floor_z0 = WALL_WIDTH * 2 + slope * x0,
  floor_z1 = WALL_WIDTH * 2 + slope * x1,
  top_z = WALL_WIDTH * 2 + PIN_HEIGHT
) [
  [x0, floor_z0],
  [x1, floor_z1],
  [x1, top_z],
  [x0, top_z],
];

module extruded_profile(profile, width) {
  translate([0, width, 0]) rotate([90, 0, 0])
    linear_extrude(height=width) polygon(points=profile);
}

module leg_with_pin(slope) {
  extruded_profile(leg_profile(slope), LEG_WIDTH);
  translate([0, (LEG_WIDTH - PIN_WIDTH) / 2, 0])
    extruded_profile(pin_profile(slope, PIN_LENGTH), PIN_WIDTH);
}

module leg_with_socket(slope) {
  difference() {
    extruded_profile(leg_profile(slope), LEG_WIDTH);
    translate([0, (LEG_WIDTH - PIN_WIDTH - FIT_GAP) / 2, 0])
      extruded_profile(pin_profile(slope, PIN_LENGTH + FIT_GAP), PIN_WIDTH + FIT_GAP);
  }
}

module bottom_slots() {
  between_legs_span = POT_EDGE - 2 * (CORNER_RADIUS + LEG_WIDTH);
  slot_count_half = floor((between_legs_span / 2 - SLOT_WIDTH / 2) / SLOT_STEP);
  for (slot_index = [-slot_count_half:slot_count_half])
    translate([WALL_WIDTH, POT_EDGE / 2 + slot_index * SLOT_STEP - SLOT_WIDTH / 2, -OVERCUT])
      cube([POT_EDGE, SLOT_WIDTH, WALL_WIDTH + OVERCUT * 2]);
}

module pot_shell() {
  rotate([0, -90, 0]) difference() {
    rounded_box([POT_EDGE, POT_EDGE, POT_HEIGHT]);
    translate([WALL_WIDTH, WALL_WIDTH, WALL_WIDTH])
      rounded_box([
        POT_EDGE - WALL_WIDTH * 2,
        POT_EDGE - WALL_WIDTH * 2,
        POT_HEIGHT + WALL_WIDTH * 2,
      ]);
    translate([POT_EDGE / 2, -WALL_WIDTH, -WALL_WIDTH])
      cube([POT_EDGE, POT_EDGE + WALL_WIDTH * 2, POT_HEIGHT * 2]);

    bottom_slots();
  }

  translate([-POT_HEIGHT, WALL_WIDTH, WALL_WIDTH]) cube([WALL_WIDTH, POT_EDGE - WALL_WIDTH * 2, LEG_WIDTH]);
}
