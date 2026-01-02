$fn = 64;

difference() {
  cylinder(d=10, h=20);
  translate([0, 0, -0.1]) cylinder(d1=9.2, d2=8.6, h=21);
}

difference() {
  union() {
    translate([0, 0, 39]) sphere(d=40);
  }
  translate([0, 0, 39]) cylinder(d=50, h=50);
  translate([0, 0, -0.1]) cylinder(d1=9.2, d2=8.6, h=21);
  translate([0, 0, 39]) sphere(d=37);

  holes();
}
difference() {
translate([0, 0, 38]) cylinder(h=1, d=40);
translate([0,0,5]) holes();
}

module holes() {
  translate([-25, -25, 0])for (x = [0:2.5:50]) {
    for (y = [0:2.5:50]) {
      translate([x, y, 10])
        cylinder(d=2, h=50, center=true);
    }
  }
}
