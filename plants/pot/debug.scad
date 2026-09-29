include <mixin.scad>;

POT_EDGE = 30;

leg_with_socket(0);

translate([LEG_LENGTH * 2, 0, 0]) leg_with_pin(0);
