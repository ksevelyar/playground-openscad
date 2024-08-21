$fn = 128;

width=60;
length=38;
padding=5;

difference() {
cube([width,length,4]);

   translate([padding,padding,-1]) cylinder(10, d = 4);
   translate([width - padding,length - padding,-1]) cylinder(10, d = 4);
   translate([padding,length-padding,-1]) cylinder(10, d = 4);
   translate([width - padding,padding,-1]) cylinder(10, d = 4);
//    translate([length2 - offset, width/2, hole]) rotate([-90, 0.0]) cylinder(length2, d = hole);

}


difference() {
translate([width/2 - 40/2,0,0]) cube([40,38,60]);

translate([width/2 - 18/2,length-20,4+30]) cube([18,38,61]);
}
