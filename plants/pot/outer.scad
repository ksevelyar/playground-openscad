include <mixin.scad>;

module outer_shell() {
  outer_h = LEG_EXTENSION;
  outer_e = (POT_INNER_SIZE + 1 + POT_CORNER_RADIUS) * 2;

  difference() {
    rounded_box([outer_e, outer_e, outer_h]);
    translate([POT_WALL_THICKNESS, POT_WALL_THICKNESS, POT_WALL_THICKNESS])
      rounded_box([outer_e - POT_WALL_THICKNESS * 2, outer_e - POT_WALL_THICKNESS * 2, outer_h + POT_WALL_THICKNESS * 2]);
  }

  difference() {
    translate([0, (outer_e + POT_WALL_THICKNESS * 2) / 2, 0]) cube([SPACER_SIZE, 1, outer_h / 2]);
    translate([4, (outer_e + POT_WALL_THICKNESS * 2) / 2 - 0.05, 1]) rotate([0, -3, 0]) cube([SPACER_SIZE, 1.1, outer_h]);
  }

  difference() {
    translate([outer_e - SPACER_SIZE, outer_e / 2, 0]) cube([SPACER_SIZE, 1, outer_h / 2]);
    translate([outer_e - SPACER_SIZE - 4, outer_e / 2 - 0.05, 1]) rotate([0, 3, 0]) cube([SPACER_SIZE, 1.1, outer_h]);
  }

  difference() {
    translate([outer_e / 2, outer_e - SPACER_SIZE, 0]) cube([1, SPACER_SIZE, outer_h / 2]);
    translate([outer_e / 2 - 0.05, outer_e - SPACER_SIZE - 4, 1]) rotate([-3, 0, 0]) cube([1.1, SPACER_SIZE, outer_h]);
  }

  difference() {
    translate([outer_e / 2, 0, 0]) cube([1, SPACER_SIZE, outer_h / 2]);
    translate([outer_e / 2 - 0.05, 4, 1]) rotate([3, 0, 0]) cube([1.1, SPACER_SIZE, outer_h]);
  }
}

outer_shell();

