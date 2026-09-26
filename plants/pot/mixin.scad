$fn = 64;

POT_INNER_SIZE = 90;
POT_WALL_THICKNESS = 2;
POT_CORNER_RADIUS = 3;

SPACER_LENGTH = 2;
SPACER_THICKNESS = 1;

LEG_WIDTH = 6;
LEG_DEPTH = 20;
LEG_EXTENSION = 20;

PIN_WIDTH = 3;
PIN_HEIGHT = 20;
LEG_FIT_GAP = 0.4;
OVERCUT = 0.1;

FIRST_LEG_Y = POT_CORNER_RADIUS;
SECOND_LEG_Y = POT_INNER_SIZE - POT_CORNER_RADIUS - LEG_WIDTH;

SLOT_WIDTH = 3;
SLOT_STEP = 6;

module rounded_box(size = [10, 10, 5], corner_radius = POT_CORNER_RADIUS) {
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
  between_legs_span = POT_INNER_SIZE - 2 * (POT_CORNER_RADIUS + LEG_WIDTH);
  slot_count_half = floor((between_legs_span / 2 - SLOT_WIDTH / 2) / SLOT_STEP);
  for (slot_index = [-slot_count_half:slot_count_half])
    translate([POT_WALL_THICKNESS, POT_INNER_SIZE / 2 + slot_index * SLOT_STEP - SLOT_WIDTH / 2, -OVERCUT])
      cube([POT_INNER_SIZE, SLOT_WIDTH, POT_WALL_THICKNESS + OVERCUT * 2]);
}

module pot_shell() {
  rotate([0, -90, 0]) difference() {
    rounded_box([POT_INNER_SIZE, POT_INNER_SIZE, POT_INNER_SIZE]);
    translate([POT_WALL_THICKNESS, POT_WALL_THICKNESS, POT_WALL_THICKNESS])
      rounded_box([
        POT_INNER_SIZE - POT_WALL_THICKNESS * 2,
        POT_INNER_SIZE - POT_WALL_THICKNESS * 2,
        POT_INNER_SIZE + POT_WALL_THICKNESS * 2,
      ]);
    translate([POT_WALL_THICKNESS + POT_INNER_SIZE / 2, -POT_WALL_THICKNESS, -POT_WALL_THICKNESS])
      cube([POT_INNER_SIZE, POT_INNER_SIZE + POT_WALL_THICKNESS * 2, POT_INNER_SIZE * 2]);

    bottom_slots();
  }
}

module leg(leg_y) {
  leg_height = POT_INNER_SIZE / 2 + POT_WALL_THICKNESS;
  translate([0, leg_y, 0])
    cube([LEG_EXTENSION, LEG_WIDTH, leg_height]);
}

module legs() {
  leg(FIRST_LEG_Y);
  leg(SECOND_LEG_Y);
}

module leg_pin(leg_y, pin_width, pin_length) {
  translate([(LEG_DEPTH - pin_length) / 2, leg_y + (LEG_WIDTH - pin_width) / 2, 0])
    cube([pin_length, pin_width, PIN_HEIGHT]);
}

module leg_pins(pin_width, pin_length) {
  leg_pin(FIRST_LEG_Y, pin_width, pin_length);
  leg_pin(SECOND_LEG_Y, pin_width, pin_length);
}

module leg_with_socket(leg_y) {
  difference() {
    leg(leg_y);
    translate([0, 0, POT_WALL_THICKNESS])
      leg_pin(leg_y, PIN_WIDTH + LEG_FIT_GAP, LEG_DEPTH - POT_WALL_THICKNESS * 2 + LEG_FIT_GAP);
  }
}

module leg_with_pin(leg_y) {
  leg(leg_y);
  leg_pin(leg_y, PIN_WIDTH, LEG_DEPTH - POT_WALL_THICKNESS * 2);
}
