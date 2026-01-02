$fn = 256;
// height = 35;
height = 10;

module connector() {
  difference() {
    cylinder(d=102.2, h=height);
    translate([0, 0, -1]) cylinder(d=99.7, h=46);
  }
}

difference() {
  union() {

    cylinder(d=120, h=1.5);
    cylinder(d=102.2, h=height);
  }

  translate([0, 0, -1]) cylinder(d=99.7, h=46);
}
