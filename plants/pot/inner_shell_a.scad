include <mixin.scad>;

module inner_shell_a() {
  pot_shell();
  legs();
  leg_pins(PIN_WIDTH - OVERCUT, LEG_DEPTH - POT_WALL_THICKNESS * 4 - OVERCUT * 2);
}

inner_shell_a();
