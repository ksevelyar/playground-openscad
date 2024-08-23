$fn = 128;

width=55;
length=40;
padding=6;

difference() {
cube([width,length,3]);

   translate([padding,padding,-1]) cylinder(10, d = 4);
   translate([width - padding,length - padding,-1]) cylinder(10, d = 4);
   translate([padding,length-padding,-1]) cylinder(10, d = 4);
   translate([width - padding,padding,-1]) cylinder(10, d = 4);
}


difference() {
  union() {
translate([width/2 - 30/2,10,0]) cube([30,30,60]);
translate([width/2 - 5/2,0,3]) rotate([-20/2,0,0]) cube([5,10,58]);
translate([width/2 - 30/2,0,3]) rotate([-20/2,0,0]) cube([5,10,58]);
translate([width-30/2-5/2,0,3]) rotate([-20/2,0,0]) cube([5,10,58]);
  }

union() {
translate([width/2 - 10/2,length-24,8]) cube([10,30,61]);
translate([width/2 - 18/2,length-24,4+30]) cube([18,30,61]);
  translate([0,0,60]) cube([100,100,5]);
}
}
