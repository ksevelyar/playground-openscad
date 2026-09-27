$fn = 64;

POT_SIZE = 90;
WALL_WIDTH = 2;
CORNER_RADIUS = 3;

LEG_WIDTH = 6;
LEG_LENGTH = 20;
PIN_DEPTH = 20;
PIN_LENGTH = PIN_DEPTH - WALL_WIDTH * 2;

PIN_WIDTH = 3;
PIN_HEIGHT = POT_SIZE / 2 + POT_SIZE / 4;
FIT_GAP = 0.34;
OVERCUT = 0.1;

FIRST_LEG_Y = CORNER_RADIUS;
SECOND_LEG_Y = POT_SIZE - CORNER_RADIUS - LEG_WIDTH;

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
  between_legs_span = POT_SIZE - 2 * (CORNER_RADIUS + LEG_WIDTH);
  slot_count_half = floor((between_legs_span / 2 - SLOT_WIDTH / 2) / SLOT_STEP);
  for (slot_index = [-slot_count_half:slot_count_half])
    translate([WALL_WIDTH, POT_SIZE / 2 + slot_index * SLOT_STEP - SLOT_WIDTH / 2, -OVERCUT])
      cube([POT_SIZE, SLOT_WIDTH, WALL_WIDTH + OVERCUT * 2]);
}

module pot_shell() {
  rotate([0, -90, 0]) difference() {
    rounded_box([POT_SIZE, POT_SIZE, POT_SIZE]);
    translate([WALL_WIDTH, WALL_WIDTH, WALL_WIDTH])
      rounded_box([
        POT_SIZE - WALL_WIDTH * 2,
        POT_SIZE - WALL_WIDTH * 2,
        POT_SIZE + WALL_WIDTH * 2,
      ]);
    translate([POT_SIZE / 2, -WALL_WIDTH, -WALL_WIDTH])
      cube([POT_SIZE, POT_SIZE + WALL_WIDTH * 2, POT_SIZE * 2]);

    bottom_slots();
  }
}

module angled_cut(leg_y) {
  translate([-0.1 - WALL_WIDTH, leg_y - 0.1, 0]) rotate([0, 40, 0])
    cube([LEG_LENGTH + 0.2, LEG_WIDTH + 0.2, POT_SIZE / 2]);
}

module leg(leg_y) {
  leg_height = POT_SIZE / 2;
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
    translate([(PIN_DEPTH - pin_length) / 2, leg_y + (LEG_WIDTH - pin_width) / 2, WALL_WIDTH + FIT_GAP])
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
