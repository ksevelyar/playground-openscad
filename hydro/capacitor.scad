length = 150;
length2 = 210;
width = 25;
height = 25;
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

  for (i = [0 : 8]) {
    offset = i * 20 + hole * 2;
    translate([length2 - offset, width/2, height]) rotate([-90, 0.0]) cylinder(length2, d = hole * 1.5);
    translate([length2 - offset, width/2, hole]) rotate([-90, 0.0]) cylinder(length2, d = hole);
  }

  for (i = [0 : 5]) {
    offset = i * 20 + hole * 2;
    translate([width/2, length - offset, height]) rotate([0, 90.0]) cylinder(length, d = hole * 1.5);
    translate([width/2, length - offset, hole]) rotate([0, 90.0]) cylinder(length, d = hole);
  }

  translate([length2 - 10,width/2,-10]) cylinder(length, d = hole);
  translate([width/2,length - 10,-10]) cylinder(length, d = hole);
}
