include <mixin.scad>;

module inner_shell_a() {
  rotate([0, -90, 0]) difference() {
      rounded_box([POT_INNER_SIZE, POT_INNER_SIZE, POT_INNER_SIZE]);
      translate([POT_WALL_THICKNESS, POT_WALL_THICKNESS, POT_WALL_THICKNESS])
        rounded_box([POT_INNER_SIZE - POT_WALL_THICKNESS * 2, POT_INNER_SIZE - POT_WALL_THICKNESS * 2, POT_INNER_SIZE + POT_WALL_THICKNESS * 2]);

      translate([POT_WALL_THICKNESS + POT_INNER_SIZE / 2, -POT_WALL_THICKNESS, -POT_WALL_THICKNESS])
        cube([POT_INNER_SIZE, POT_INNER_SIZE + POT_WALL_THICKNESS * 2, POT_INNER_SIZE * 2]);

      for (i = [SLOT_START:SLOT_STEP:50]) {
        translate([POT_WALL_THICKNESS, POT_WALL_THICKNESS * i, -POT_WALL_THICKNESS])
          cube([POT_INNER_SIZE, SLOT_DEPTH, POT_INNER_SIZE]);
      }
    }

  p_h = POT_INNER_SIZE / 2 + POT_WALL_THICKNESS + POT_INNER_SIZE / 4;
  p_l = LEG_DEPTH - POT_WALL_THICKNESS * 4 - 2;

  translate([0, POT_CORNER_RADIUS, 0]) cube([LEG_EXTENSION, LEG_WIDTH, POT_INNER_SIZE / 2 + POT_WALL_THICKNESS]);
  translate([(LEG_DEPTH - p_l) / 2, POT_CORNER_RADIUS + (LEG_WIDTH - PIN_WIDTH_A) / 2, 0])
    cube([p_l, PIN_WIDTH_A, p_h]);

  translate([0, POT_INNER_SIZE - POT_CORNER_RADIUS - LEG_WIDTH, 0])
    cube([LEG_EXTENSION, LEG_WIDTH, POT_INNER_SIZE / 2 + POT_WALL_THICKNESS]);
  translate(
    [
      (LEG_DEPTH - p_l) / 2,
      POT_INNER_SIZE - POT_CORNER_RADIUS - (LEG_WIDTH - PIN_WIDTH_A) / 2 - PIN_WIDTH_A,
      0,
    ]
  )
    cube([p_l, PIN_WIDTH_A, p_h]);
}

module inner_shell_b() {
  rotate([0, -90, 0]) difference() {
      rounded_box([POT_INNER_SIZE, POT_INNER_SIZE, POT_INNER_SIZE]);
      translate([POT_WALL_THICKNESS, POT_WALL_THICKNESS, POT_WALL_THICKNESS])
        rounded_box([POT_INNER_SIZE - POT_WALL_THICKNESS * 2, POT_INNER_SIZE - POT_WALL_THICKNESS * 2, POT_INNER_SIZE + POT_WALL_THICKNESS * 2]);

      translate([POT_WALL_THICKNESS + POT_INNER_SIZE / 2, -POT_WALL_THICKNESS, -POT_WALL_THICKNESS])
        cube([POT_INNER_SIZE, POT_INNER_SIZE + POT_WALL_THICKNESS * 2, POT_INNER_SIZE * 2]);

      for (i = [SLOT_START:SLOT_STEP:50]) {
        translate([POT_WALL_THICKNESS, POT_WALL_THICKNESS * i, -POT_WALL_THICKNESS])
          cube([POT_INNER_SIZE, SLOT_DEPTH, POT_INNER_SIZE]);
      }
    }

  p_h = POT_INNER_SIZE / 2 + POT_WALL_THICKNESS + POT_INNER_SIZE / 4;
  p_l = LEG_DEPTH - POT_WALL_THICKNESS * 4;

  difference() {
    translate([0, POT_CORNER_RADIUS, 0]) cube([LEG_EXTENSION, LEG_WIDTH, POT_INNER_SIZE / 2 + POT_WALL_THICKNESS]);
    translate([(LEG_DEPTH - p_l) / 2, POT_CORNER_RADIUS + (LEG_WIDTH - PIN_WIDTH_B) / 2, POT_WALL_THICKNESS])
      cube([p_l, PIN_WIDTH_B, p_h]);
  }

  difference() {
    translate([0, POT_INNER_SIZE - POT_CORNER_RADIUS - LEG_WIDTH, 0])
      cube([LEG_EXTENSION, LEG_WIDTH, POT_INNER_SIZE / 2 + POT_WALL_THICKNESS]);
    translate(
      [
        (LEG_DEPTH - p_l) / 2,
        POT_INNER_SIZE - POT_CORNER_RADIUS - (LEG_WIDTH - PIN_WIDTH_B) / 2 - PIN_WIDTH_B,
        POT_WALL_THICKNESS,
      ]
    )
      cube([p_l, PIN_WIDTH_B, p_h]);
  }
}

inner_shell_a();
translate([90, 0, 0]) inner_shell_b();

