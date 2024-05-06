$fn=256;
wall=6;
notebook_width=12;
notebook_length=147;
notebook_height=210;
count=4;

module notebook() {
  cube([12, 147, 210]);
}

module stand() {
  cube([notebook_width * count + wall * (count + 1), notebook_length + wall, notebook_height + wall]);
}

module notebooks() {
  translate([wall, -0.1, wall + 0.1]) notebook();
  translate([notebook_width + wall * 2, -0.1, wall + 0.1]) notebook();
  translate([notebook_width + wall * 5, -0.1, wall + 0.1]) notebook();
  translate([notebook_width + wall * 8, -0.1, wall + 0.1]) notebook();
}

difference() {
  stand();
  notebooks();
}
