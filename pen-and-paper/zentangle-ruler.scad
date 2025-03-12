edge = 90;
padding = edge / 5;
height = 2;
radius = 10;

module pad(edge, height) {
  minkowski() {
    cube([edge - radius * 2, edge - radius * 2, height - 1], center = true);
    cylinder(r = radius, $fn = 128);
  }
}

difference() {
  color([0.7,0.255,0.4]) pad(edge, height);
  cube([edge - padding, edge - padding, height * 2], center = true);
}
