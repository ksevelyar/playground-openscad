wall = 1;
height = 26.3;
width = 33.5;
length = 36.5 * 2;
shift = 5;
$fn = 64;

difference() {
  cube([length + wall * 2, width + wall * 2, height + wall * 2]);
  translate([wall, wall, wall]) cube([length * 2, width, height]);

  for (x = [shift:3.8:width - shift]) {
    translate([shift, x, shift]) cube([length / 2, 2, 90]);
  }

  for (x = [shift:3.8:width - shift]) {
    translate([-shift, x, shift+wall]) cube([length / 2 + wall + shift, 2, height - shift * 2 + wall]);
  }

  for (x = [shift:3.8:height - shift]) {
    translate([shift, -wall, x + wall]) cube([length / 2, width * 2, 2]);
  }

  hull() {
    translate([length + 3, width - 9, wall]) cylinder(h=height * 2, d=13);
    translate([length - 5, width - 9, wall]) cylinder(h=height * 2, d=13);
  }
}
