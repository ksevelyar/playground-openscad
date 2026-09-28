include <mixin.scad>;

module inner_shell_pins() {
  pot_shell();
  legs();
  leg_pins(PIN_WIDTH, PIN_LENGTH);
  top_legs();
  top_leg_pins(PIN_WIDTH, PIN_LENGTH);
}

inner_shell_pins();
