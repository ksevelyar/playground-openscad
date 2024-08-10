gap = 10;
height = 60;
$fn = 128;

difference() {
  cube([20,20,height]);
  translate([3,10,-1]) cube([100,100,100]);
  //translate([gap,gap,-1]) cube([gap,100,100]);
  translate([3 + 9.5,-gap* 1.5,gap]) rotate([-90,0,0]) cylinder(100,d = 3);
  // translate([gap*1.5,-gap,gap*2.5]) rotate([-90,0,0]) cylinder(100,d = 4.1);

  //translate([gap*1.5,gap*1.5,gap*1.5]) rotate([-90,0,90]) cylinder(100,d = 4.1);
  // translate([gap*1.5,gap*1.5,gap*2.5]) rotate([-90,0,90]) cylinder(100,d = 4.1);

  //translate([gap*3,gap*3,gap]) cube([100,100,100]);
}


