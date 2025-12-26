$fn = 128;
width = 55;
length = 70;
padding = 6;

difference() {
  cube([width, length, 3]);

  translate([padding, padding, -1]) cylinder(10, d=4);
  translate([width - padding, length - padding, -1]) cylinder(10, d=4);
  translate([padding, length - padding, -1]) cylinder(10, d=4);
  translate([width - padding, padding, -1]) cylinder(10, d=4);
}

translate([0, length - 10, 0])
  difference() {
    union() {
      translate([0, 10, 0]) cube([55, 23.4, 40]);
      translate([width / 2 - 5 / 2, 0, 3]) rotate([-31 / 2, 0, 0]) cube([5, 10, 38]);
      translate([width / 2 - 30 / 2, 0, 3]) rotate([-31 / 2, 0, 0]) cube([5, 10, 38]);
      translate([width - 30 / 2 - 5 / 2, 0, 3]) rotate([-31 / 2, 0, 0]) cube([5, 10, 38]);
    }

    translate([(55 - 40.3) / 2, 13, 8]) cube([40.3, 20.5, 61]);
  }
