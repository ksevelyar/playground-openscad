include <mixin.scad>;

module inner_shell_b() {
  pot_shell();
  difference() {
    legs();
    translate([0, 0, POT_WALL_THICKNESS])
      leg_pins(PIN_WIDTH + 0.4, LEG_DEPTH - POT_WALL_THICKNESS * 2 + 0.4);
  }
}

inner_shell_b();
