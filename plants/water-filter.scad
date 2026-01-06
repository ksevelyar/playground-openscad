$fn = 64;

length = 270 / 2;
width = 160;
height = 2;
radius = 19;
hole_diameter = 10;

module rounded_box() {
  translate([radius, radius, 0]) linear_extrude(height) {
      offset(r=radius) {
        square([length - radius * 2, width - radius * 2], center=false);
      }
    }

  cube([length / 2, width, height]);
}

translate([length - radius / 3 - 1.5, radius / 3, 0]) cylinder(d=4, h=10);
translate([radius / 3, radius / 3, 0]) cylinder(d=4, h=10);
translate([radius / 3, width - radius / 3, 0]) cylinder(d=4, h=10);
translate([length - radius / 3 - 1.5, width - radius / 3, 0]) cylinder(d=4, h=10);

translate([(length - radius / 3) / 2, radius / 3, 0]) cylinder(d=4, h=10);
translate([radius / 3, (width - radius / 3) / 2, 0]) cylinder(d=4, h=10);
translate([(length - radius / 3) / 2, width - radius / 3, 0]) cylinder(d=4, h=10);
translate([(length - radius / 3) - 1.5, (width - radius / 3) / 2, 0]) cylinder(d=4, h=10);

module create_holes() {
  for (x = [radius:12:length - radius]) {
    for (y = [radius:12:width - radius]) {
      translate([x, y, -1])
        cylinder(d=hole_diameter, h=10, center=true);
    }
  }
}

difference() {
  rounded_box();
  create_holes();
}
