gap = 18.4;
height = gap * 3;
$fn = 128;

difference() {
  cube([height,height,height]);
  translate([gap,gap,gap]) cube([100,gap,100]);
  translate([gap,gap,gap]) cube([gap,100,100]);
  translate([gap*1.5,-gap,gap*1.5]) rotate([-90,0,0]) cylinder(100,d = 4.1);
  translate([gap*1.5,-gap,gap*2.5]) rotate([-90,0,0]) cylinder(100,d = 4.1);

  translate([gap*1.5,gap*1.5,gap*1.5]) rotate([-90,0,90]) cylinder(100,d = 4.1);
  translate([gap*1.5,gap*1.5,gap*2.5]) rotate([-90,0,90]) cylinder(100,d = 4.1);

  translate([gap*3,gap*3,gap]) cube([100,100,100]);
}


