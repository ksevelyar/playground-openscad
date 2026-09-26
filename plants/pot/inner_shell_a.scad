include <mixin.scad>;

module inner_shell_a() {
  pot_shell();
  legs();
  leg_pins(PIN_WIDTH, LEG_DEPTH - POT_WALL_THICKNESS * 2);
}

inner_shell_a();
