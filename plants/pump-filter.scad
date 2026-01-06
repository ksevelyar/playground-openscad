wall = 1;
height = 26.5;
width = 34;
length = 100;
shift = 9;

difference() {
  cube([length+wall*2, width+wall*2, height+wall*2]);
  translate([wall, wall, wall]) cube([length*2, width, height]);

  for (x = [wall:3.9:width-wall]) {
    translate([-wall, x, shift]) cube([length - wall * 6, 2.5, 90]);
  }

  for (x = [shift:3.9:height]) {
    translate([wall, -wall, x]) cube([length - wall * 8, width*2, 2.5]);
  }
}



