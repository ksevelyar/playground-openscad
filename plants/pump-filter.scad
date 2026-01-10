wall = 1.2;
height = 26.1;
width = 33.3;
length = 36.5 * 2;
shift = 5;
$fn = 64;

difference() {
  cube([length + wall * 2.2, width + wall * 2, height + wall * 2]);
  translate([wall, wall, wall]) cube([length * 2, width, height]);

  for (x = [wall + shift:2.2:width - shift]) {
    translate([shift, x, shift]) cube([length / 2, 1, 90]);
  }

  for (x = [wall + shift:2.2:width - shift]) {
    translate([-shift, x, shift + wall]) cube([length / 2 + wall + shift, 1, height - shift * 2 + wall]);
  }

  for (x = [shift:2.2:height - shift]) {
    translate([shift, -wall, x + wall]) cube([length / 2, width * 2, 1]);
  }

  hull() {
    translate([length + 2, width - 11, wall]) cylinder(h=height * 2, d=13);
  }
}
