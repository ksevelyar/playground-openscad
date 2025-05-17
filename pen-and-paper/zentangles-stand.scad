edge = 90.5;
height = 60;
wall = 2;

difference() {
  cube([ edge + wall, edge + wall, height ], center = true);

  union() {
    translate([ 0, 0, wall / 2 ]) cube([ edge, edge, height ], center = true);

    translate([ 0, 0, wall / 2 ])
        cube([ edge / 3, edge * 2, height ], center = true);

    translate([ 0, 0, wall / 2 ])
        cube([ edge * 2, edge / 3, height ], center = true);
  }
}
