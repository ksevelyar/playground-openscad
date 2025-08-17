$fn = 16;

height = 60;
radius = 50;
pen_diameter = 14;
round = 8;

module shell() {
  difference() {
    minkowski() {
      cube(size = height, center = true);
      sphere(r = 8);
    }

    translate([ 0, 0, height + 8 ]) cube(size = height + 16, center = true);
  }
}

module inner() {
  difference() {
    translate([ 0, 0, height - 14 ]) minkowski() {
      cube([ height, height, 1 ]);

      cylinder(r = 8, h = 1);
    }

    translate([ 4.5, 4.5, 2 ]) minkowski() {
      cube([ height - 9, height - 9, height ]);

      cylinder(r = 8, h = 8);
    }
  }

  translate([ 2.5, 2.5, 0 ]) difference() {
    minkowski() {
      cube([ height - 5, height - 5, height - 20 ]);

      cylinder(r = 8, h = 8);
    }

    translate([ 2, 2, 2 ]) minkowski() {
      cube([ height - 9, height - 9, height ]);

      cylinder(r = 8, h = 8);
    }
  }
}

difference() {
  shell();
  translate([ 0, 0, 4 ]) scale(v = 0.95) shell();
}

translate([ -150, 0, 0 ]) inner();
