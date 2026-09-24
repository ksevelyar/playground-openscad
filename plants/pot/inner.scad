include <mixin.scad>;

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
    for (slot_offset = [SLOT_START:SLOT_STEP:POT_INNER_SIZE - SLOT_START])
      translate([POT_WALL_THICKNESS, slot_offset, -POT_WALL_THICKNESS])
        cube([POT_INNER_SIZE, SLOT_DEPTH, POT_INNER_SIZE]);
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

module inner_shell_a() {
  pot_shell();
  legs();
  leg_pins(PIN_WIDTH_A, LEG_DEPTH - POT_WALL_THICKNESS * 4 - 2);
}

module inner_shell_b() {
  pot_shell();
  difference() {
    legs();
    translate([0, 0, POT_WALL_THICKNESS])
      leg_pins(PIN_WIDTH_B, LEG_DEPTH - POT_WALL_THICKNESS * 4);
  }
}

inner_shell_a();
translate([POT_INNER_SIZE + 30, 0, 0]) inner_shell_b();
