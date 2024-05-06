$fn=256;

difference() {
  union() {
    cylinder(d = 23, h = 5);
    cylinder(d = 16, h = 10);
  }

  translate([0,0,-1]) cylinder(d = 13, h = 20);
}
