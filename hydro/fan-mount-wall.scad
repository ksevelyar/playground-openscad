$fn = 128;

hook_distance = 96;
hook_diameter = 4.7;

fan_hole_distance = 96-4;
fan_hole_diameter = 4;

hull() {
  translate([0,0,42]) rotate([0,25,0]) { translate([-9, 0, 15]) cylinder(d = hook_diameter, h = 1);  }
  cylinder(d = hook_diameter, h = 42);
  translate([hook_distance, 0, 0]) cylinder(d = hook_diameter, h = 15);
}

translate([0, 0, -8]) cylinder(d = hook_diameter, h = 9);
translate([hook_distance, 0, -8]) cylinder(d = hook_diameter, h = 9);

translate([0,0,42]) rotate([0,25,0]) {
  translate([-9, 0, 15]) cylinder(d = fan_hole_diameter, h = 26);
  translate([fan_hole_distance+4, 0, 16]) cylinder(d = fan_hole_diameter, h = 26);
}
