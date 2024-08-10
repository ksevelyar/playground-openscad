length = 136;
length2 = 201;
width = 30;
height = 30;
wall = 1;
hole = 3;

$fn = 128;

module base() {
  cube([length2, width, height]);
  cube([width, length, height]);
}

difference() {
  translate([wall + 6, wall + 6, 0]) cylinder(height, d = 10);
  translate([wall + 4, wall + 4, 0]) cylinder(height+1, d = 10);
  translate([wall, wall, 0]) cube([5,11, height+1]);
  translate([wall, wall, 0]) cube([11,5, height+1]);
}

difference() {
  base();
  translate([wall, wall, wall]) cube([length2 - wall * 2, width - wall * 2, height * 2]);
  translate([wall, wall, wall]) cube([width - wall * 2, length - wall * 2, height * 2]);

  for (offset = [10, 30, 50, 70, 90, 110, 130]) {
    translate([length2 - offset, width/2, 25]) rotate([-90, 0.0]) cylinder(length2, d = hole);
    translate([length2 - offset, width/2, 15]) rotate([-90, 0.0]) cylinder(length2, d = hole);
  }

  for (offset = [10, 30, 50, 70]) {
    translate([width/2, length - offset, 25]) rotate([0, 90.0]) cylinder(length, d = hole);
    translate([width/2, length - offset, 15]) rotate([0, 90.0]) cylinder(length, d = hole);
  }

  translate([length2 - 10,width/2,-10]) cylinder(length, d = hole);
  translate([width/2,length - 10,-10]) cylinder(length, d = hole);
}
