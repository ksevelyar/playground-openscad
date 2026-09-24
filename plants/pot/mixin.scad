$fn = 16;

POT_INNER_SIZE = 90;
POT_WALL_THICKNESS = 2;
POT_CORNER_RADIUS = 3;

SPACER_LENGTH = 2;
SPACER_THICKNESS = 1;

LEG_WIDTH = 6;
LEG_DEPTH = 20;
LEG_EXTENSION = 20;

PIN_WIDTH = 3;
OVERCUT = 0.1;

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

module legs() {
  leg_height = POT_INNER_SIZE / 2 + POT_WALL_THICKNESS;
  translate([0, POT_CORNER_RADIUS, 0])
    cube([LEG_EXTENSION, LEG_WIDTH, leg_height]);
  translate([0, POT_INNER_SIZE - POT_CORNER_RADIUS - LEG_WIDTH, 0])
    cube([LEG_EXTENSION, LEG_WIDTH, leg_height]);
}

module leg_pins(pin_width, pin_length) {
  pin_height = POT_INNER_SIZE / 2 + POT_WALL_THICKNESS + POT_INNER_SIZE / 4;
  for (pin_offset = [POT_CORNER_RADIUS + (LEG_WIDTH - pin_width) / 2,
                     POT_INNER_SIZE - POT_CORNER_RADIUS - (LEG_WIDTH + pin_width) / 2])
    translate([(LEG_DEPTH - pin_length) / 2, pin_offset, 0])
      cube([pin_length, pin_width, pin_height]);
}
