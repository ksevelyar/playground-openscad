include <mixin.scad>;

module inner_shell_sockets() {
  pot_shell();
  translate([-POT_HEIGHT, WALL_WIDTH, 0]) leg_with_socket(0);
  translate([-POT_HEIGHT, POT_EDGE - WALL_WIDTH - LEG_WIDTH, 0]) leg_with_socket(0);
  translate([0, FIRST_LEG_Y, 0]) leg_with_socket(LEG_SLOPE);
  translate([0, SECOND_LEG_Y, 0]) leg_with_socket(LEG_SLOPE);
}

inner_shell_sockets();
