length = 80;
depth = 40.1;
saw_blade_height = 35;

height = depth + saw_blade_height;
wall = 4;
overcut = 5;
blade_cut_width = 0.8;

difference() {
  cube([depth + wall * 2, length + wall * 2, height + wall * 2]);
  translate([wall, -wall - overcut, wall]) cube([depth, length + wall * 2 + overcut * 2, height + wall * 2 + overcut]);

  translate([-overcut, (length - blade_cut_width) / 2 + wall, wall]) cube([depth + wall * 2 + overcut * 2, blade_cut_width, height + overcut]);

  rotate([0, 0, 45]) translate([-overcut - wall * 2 + 20, (length - blade_cut_width) / 2 + wall - 30, wall]) cube([depth * 2 + wall * 2 + overcut * 2, blade_cut_width, height + overcut]);
}
