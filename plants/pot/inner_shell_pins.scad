include <mixin.scad>;

module inner_shell_pins() {
  pot_shell();
  translate([0, FIRST_LEG_Y, 0]) leg_with_pin(LEG_SLOPE);
  translate([0, SECOND_LEG_Y, 0]) leg_with_pin(LEG_SLOPE);
  translate([-POT_HEIGHT, WALL_WIDTH, 0]) leg_with_pin(0);
  translate([-POT_HEIGHT, POT_EDGE - WALL_WIDTH - LEG_WIDTH, 0]) leg_with_pin(0);
}

inner_shell_pins();
