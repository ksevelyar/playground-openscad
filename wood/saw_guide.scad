length = 80;
depth = 40;
height = 50;
wall = 4;
overcut = 5;
blade_cut_width = 0.8;

difference() {
  cube([depth + wall * 2, length + wall * 2, height + wall * 2]);
  translate([wall, -wall - overcut, wall]) cube([40, length + wall * 2 + overcut * 2, height + wall * 2 + overcut]);

  translate([-overcut, (length - blade_cut_width) / 2 + wall, wall]) cube([depth + wall * 2 + overcut * 2, blade_cut_width, height + overcut]);
}
