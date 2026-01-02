$fn = 256;
height = 60;

difference() {
  union() {
    cylinder(d=120, h=1.5);
    cylinder(d=102.1, h=height);
  }

  translate([0, 0, -1]) cylinder(d=99.7, h=62);
}
