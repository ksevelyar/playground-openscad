$fn = 32;

bottom_thick = 3;
gap = 22;
height = 60;
length = 140;
pen_diameter = 19;
width = 50;

module pen_cut() {
  cylinder(h=height, d=pen_diameter, center=true);
}

module rounded_box(size = [10, 10, 5], r = 2) {
  translate([size[0] / 2, size[1] / 2, 0])
    linear_extrude(height=size[2])
      minkowski() {
        square([size[0] - 2 * r, size[1] - 2 * r], center=true);
        circle(r=r);
      }
}

difference() {
  rounded_box([width, length, height], r=pen_diameter/2);
  row_padding_x = 14;
  first_hole_center_y = length / 2 - 2.5 * gap;

  for (k = [0:5]) {
    hole_center_y = first_hole_center_y + k * gap;

    translate([row_padding_x, hole_center_y, bottom_thick])
      cylinder(h=height, d=pen_diameter);

    translate([width - row_padding_x, hole_center_y, bottom_thick])
      cylinder(h=height, d=pen_diameter);
  }
}
