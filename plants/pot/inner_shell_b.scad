include <mixin.scad>;

module inner_shell_b() {
  pot_shell();
  difference() {
    legs();
    translate([0, 0, WALL_WIDTH])
      leg_pins(PIN_WIDTH + FIT_GAP, PIN_LENGTH + FIT_GAP);
  }
}

inner_shell_b();
