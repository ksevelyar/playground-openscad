include <mixin.scad>;

// Tapered guide ridge along the x axis: half-height straight prism
// with a tilted cutter, so the outer shell halves wedge together.
// cutter_shift moves the tilted cutter along the ridge so it leans over it.
module spacer_along_x(tilt, cutter_shift) {
  difference() {
    cube([SPACER_LENGTH, SPACER_THICKNESS, LEG_EXTENSION / 2]);
    translate([cutter_shift, -0.05, 1]) rotate([0, tilt, 0])
      cube([SPACER_LENGTH, SPACER_THICKNESS + 0.1, LEG_EXTENSION]);
  }
}

module spacer_along_y(tilt, cutter_shift) {
  difference() {
    cube([SPACER_THICKNESS, SPACER_LENGTH, LEG_EXTENSION / 2]);
    translate([-0.05, cutter_shift, 1]) rotate([tilt, 0, 0])
      cube([SPACER_THICKNESS + 0.1, SPACER_LENGTH, LEG_EXTENSION]);
  }
}

module outer_shell() {
  outer_extent = (POT_INNER_SIZE + 1 + POT_CORNER_RADIUS) * 2;

  difference() {
    rounded_box([outer_extent, outer_extent, LEG_EXTENSION]);
    translate([POT_WALL_THICKNESS, POT_WALL_THICKNESS, POT_WALL_THICKNESS])
      rounded_box([
        outer_extent - POT_WALL_THICKNESS * 2,
        outer_extent - POT_WALL_THICKNESS * 2,
        LEG_EXTENSION + POT_WALL_THICKNESS * 2,
      ]);
  }

  translate([0, (outer_extent + POT_WALL_THICKNESS * 2) / 2, 0])
    spacer_along_x(-3, 4);
  translate([outer_extent - SPACER_LENGTH, outer_extent / 2, 0])
    spacer_along_x(3, -4);
  translate([outer_extent / 2, outer_extent - SPACER_LENGTH, 0])
    spacer_along_y(-3, -4);
  translate([outer_extent / 2, 0, 0])
    spacer_along_y(3, 4);
}

outer_shell();