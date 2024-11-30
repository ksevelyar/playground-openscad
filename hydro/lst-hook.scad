length = 15;
height = 10;
gap = 1.6;
width = 5 + gap * 4;
$fn = 128;

difference() {
  cube([width, length, height]);

  translate([5, -1, gap]) cube([gap, length * 2, height]);
  translate([5 + gap * 2, -1, -gap]) cube([gap, length * 2, height]);
}
