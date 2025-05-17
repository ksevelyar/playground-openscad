length = 10;
height = 10;
gap = 1.6;
width = 4 + gap * 4;

rotate([90,0,0]) difference() {
  cube([width, length, height]);

  translate([3.5, -1, gap]) cube([0.7, length * 2, height]);
  translate([4 + gap * 2, -1, -gap]) cube([gap, length * 2, height]);
}
