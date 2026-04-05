$fn = 64;

shift = 30;
wall = 5;
hook = 13;

difference() {
  union() {
    translate([-wall, -wall, 0]) cube([shift + hook + wall, 20, 2]);

    translate([shift + hook, -wall, 8.5]) difference() {
        rotate([-90, 0, 0]) cylinder(h=20, d=17);
        translate([0, -1, 0]) rotate([-90, 0, 0]) cylinder(h=52, d=hook);
        translate([-3.5,-1,0]) cube([7,40,10]);
      }
  }

  translate([0, 0, -1]) cylinder(h=50, d=3);
  translate([shift, 0, -1]) cylinder(h=50, d=3);
}
