$fn = 64;

_POT_EDGES = [82, 103, 130, 164];
POT_EDGE = 82;
POT_HEIGHT = 130;
WALL_WIDTH = 2;
CORNER_RADIUS = 3;

LEG_WIDTH = 6;
LEG_LENGTH = POT_HEIGHT / 5;
PIN_LENGTH = LEG_LENGTH - WALL_WIDTH * 2;

PIN_WIDTH = 3;
PIN_HEIGHT = POT_EDGE / 2 + POT_EDGE / 7;
FIT_GAP = 0.34;
OVERCUT = 0.1;

FIRST_LEG_Y = CORNER_RADIUS;
SECOND_LEG_Y = POT_EDGE - CORNER_RADIUS - LEG_WIDTH;

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

  translate([-POT_HEIGHT,WALL_WIDTH,WALL_WIDTH]) cube([WALL_WIDTH,POT_EDGE - WALL_WIDTH * 2,LEG_WIDTH]);
}

module angled_cut(leg_y) {
  translate([-OVERCUT - WALL_WIDTH, leg_y - OVERCUT, 0]) rotate([0, 45, 0])
    cube([LEG_LENGTH + 2 * OVERCUT, LEG_WIDTH + 2 * OVERCUT, POT_EDGE / 2]);
}

module leg(leg_y) {
  leg_height = POT_EDGE / 2;
  difference() {
    translate([0, leg_y, WALL_WIDTH + FIT_GAP])
      cube([LEG_LENGTH, LEG_WIDTH, leg_height - WALL_WIDTH - FIT_GAP]);

    angled_cut(leg_y);
  }
}

module legs() {
  leg(FIRST_LEG_Y);
  leg(SECOND_LEG_Y);
}

module leg_pin(leg_y, pin_width, pin_length) {
  difference() {
    translate([(LEG_LENGTH - pin_length) / 2, leg_y + (LEG_WIDTH - pin_width) / 2, WALL_WIDTH + FIT_GAP])
      cube([pin_length, pin_width, PIN_HEIGHT]);

    angled_cut(leg_y);
  }
}

module leg_pins(pin_width, pin_length) {
  leg_pin(FIRST_LEG_Y, pin_width, pin_length);
  leg_pin(SECOND_LEG_Y, pin_width, pin_length);
}

module leg_with_socket(leg_y) {
  difference() {
    leg(leg_y);
    translate([0, 0, WALL_WIDTH])
      leg_pin(leg_y, PIN_WIDTH + FIT_GAP, PIN_LENGTH + FIT_GAP);
  }
}

module leg_with_pin(leg_y) {
  leg(leg_y);
  leg_pin(leg_y, PIN_WIDTH, PIN_LENGTH);
}

module top_leg(wall_y) {
  translate([-POT_HEIGHT, wall_y, 0.2])
    cube([LEG_LENGTH, LEG_WIDTH, POT_EDGE / 2]);
}

module top_legs() {
  top_leg(WALL_WIDTH);
  top_leg(POT_EDGE - WALL_WIDTH - LEG_WIDTH);
}

module top_leg_pin(wall_y, pin_width, pin_length) {
  translate([-POT_HEIGHT + (LEG_LENGTH - pin_length) / 2, wall_y + (LEG_WIDTH - pin_width) / 2, WALL_WIDTH + FIT_GAP])
    cube([pin_length, pin_width, PIN_HEIGHT]);
}

module top_leg_pins(pin_width, pin_length) {
  top_leg_pin(WALL_WIDTH, pin_width, pin_length);
  top_leg_pin(POT_EDGE - WALL_WIDTH - LEG_WIDTH, pin_width, pin_length);
}

module top_leg_with_socket(wall_y, pin_width, pin_length) {
  difference() {
    top_leg(wall_y);
    translate([
      -POT_HEIGHT + (LEG_LENGTH - (pin_length + FIT_GAP)) / 2,
      wall_y + (LEG_WIDTH - (pin_width + FIT_GAP)) / 2,
      -OVERCUT,
    ])
      cube([pin_length + FIT_GAP, pin_width + FIT_GAP, PIN_HEIGHT + OVERCUT]);
  }
}

module top_legs_with_sockets(pin_width, pin_length) {
  top_leg_with_socket(WALL_WIDTH, pin_width, pin_length);
  top_leg_with_socket(POT_EDGE - WALL_WIDTH - LEG_WIDTH, pin_width, pin_length);
}
