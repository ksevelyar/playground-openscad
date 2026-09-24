$fn = 16;

POT_INNER_SIZE = 60;
POT_WALL_THICKNESS = 2;
POT_CORNER_RADIUS = 3;
POT_TOP_EXTRA = 20 + 2;

SPACER_SIZE = 2;

LEG_WIDTH = 6;
LEG_DEPTH = 20;
LEG_EXTENSION = 20;

PIN_WIDTH_A = 2.8;
PIN_WIDTH_B = 3;

SLOT_START = 10.5;
SLOT_STEP = 6;
SLOT_DEPTH = 3;

module rounded_box(size = [10, 10, 5], r = POT_CORNER_RADIUS) {
  translate([size[0] / 2, size[1] / 2, 0]) {
    linear_extrude(height=size[2]) {
      minkowski() {
        square([size[0] - 2 * r, size[1] - 2 * r], center=true);
        circle(r=r);
      }
    }
  }
}

module pin_socket(insert_width, insert_height, insert_length) {
  translate([insert_width, insert_width, 0])
    cube([insert_length, insert_width, insert_height]);
}

