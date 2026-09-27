include <mixin.scad>;

module outer_shell() {
  outer_extent = POT_SIZE + WALL_WIDTH * 2 + FIT_GAP;

  difference() {
    rounded_box([outer_extent, outer_extent, LEG_LENGTH]);
    translate([WALL_WIDTH, WALL_WIDTH, WALL_WIDTH])
      rounded_box([
        outer_extent - WALL_WIDTH * 2,
        outer_extent - WALL_WIDTH * 2,
        LEG_LENGTH + WALL_WIDTH * 2,
      ]);
  }
}

outer_shell();
