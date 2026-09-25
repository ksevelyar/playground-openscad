include <mixin.scad>;

module inner_shell_a() {
  pot_shell();
  legs();
  leg_pins(PIN_WIDTH - 0.25, LEG_DEPTH - POT_WALL_THICKNESS * 2 - 0.25);
}

inner_shell_a();
