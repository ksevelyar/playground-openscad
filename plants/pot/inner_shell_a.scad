include <mixin.scad>;

module inner_shell_a() {
  pot_shell();
  legs();
  leg_pins(PIN_WIDTH, PIN_LENGTH);
}

inner_shell_a();
