$fn = 16;

height = 60;
radius = 50;
pen_diameter = 14;

module base() {
  round = 8;
  minkowski() {
    cylinder(h = height - round * 2, r = radius, center = true);
    sphere(r = 8);
  }
}

difference() {
  base();

  translate([20,0,2]) cylinder(h = height, d = pen_diameter, center = true);
  translate([-20,0,2]) cylinder(h = height, d = pen_diameter, center = true);
  translate([0,0,2]) cylinder(h = height, d = pen_diameter, center = true);
  translate([-40,0,2]) cylinder(h = height, d = pen_diameter, center = true);
  translate([40,0,2]) cylinder(h = height, d = pen_diameter, center = true);

  translate([-20,20,2]) cylinder(h = height, d = pen_diameter, center = true);
  translate([20,20,2]) cylinder(h = height, d = pen_diameter, center = true);
  translate([0,20,2]) cylinder(h = height, d = pen_diameter, center = true);

  translate([-20,-20,2]) cylinder(h = height, d = pen_diameter, center = true);
  translate([20,-20,2]) cylinder(h = height, d = pen_diameter, center = true);
  translate([0,-20,2]) cylinder(h = height, d = pen_diameter, center = true);
  translate([0,-40,2]) cylinder(h = height, d = pen_diameter, center = true);
  translate([0,40,2]) cylinder(h = height, d = pen_diameter, center = true);
}
