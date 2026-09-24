$fn = 16;

POT_INNER_SIZE = 50;
POT_WALL_THICKNESS = 1;
POT_CORNER_RADIUS = 3;

SPACER_LENGTH = 2;
SPACER_THICKNESS = 1;

LEG_WIDTH = 6;
LEG_DEPTH = 20;
LEG_EXTENSION = 20;

PIN_WIDTH_A = 2.8;
PIN_WIDTH_B = 3;

SLOT_START = 10.5;
SLOT_STEP = 6;
SLOT_DEPTH = 3;

module rounded_box(size = [10, 10, 5], corner_radius = POT_CORNER_RADIUS) {
  translate([size[0] / 2, size[1] / 2, 0]) {
    linear_extrude(height=size[2]) {
      minkowski() {
        square([size[0] - 2 * corner_radius, size[1] - 2 * corner_radius], center=true);
        circle(r=corner_radius);
      }
    }
  }
}
