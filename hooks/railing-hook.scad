inner = 15;
outer = 20;

$fn=256;

difference() {
  hull() {
    cylinder(h = 5, d = 15 + 5, center = true);
    translate([10,18,0]) cylinder(h = 5, d = 20 + 5, center = true);
  }
hull() {
 translate([10,18,0])  cylinder(h = 10, d = 20, center = true);
translate([11,10,-3]) rotate([0,0,-80]) cube([10,10,10], center = false);
 }

 
 cylinder(h = 10, d = 15, center = true);
  
  translate([-13,1,-3]) rotate([0,0,-30]) cube([10,5,10], center = false);
}
























