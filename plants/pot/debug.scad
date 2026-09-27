include <mixin.scad>;

POT_SIZE = 20;
PIN_HEIGHT = 20;

leg_with_socket(0);

translate([0, 10, 0]) leg_with_pin(0);
