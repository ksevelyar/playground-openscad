cut = 55;
$fn=256;
height = 57;


module block() {

hull() {
translate([-32.5,54/2-3,-60/2+3]) rotate([0,90,0]) cylinder(d=6,h=25);
translate([-32.5,-54/2+3,-60/2+3]) rotate([0,90,0]) cylinder(d=6,h=25);
}

difference() {
translate([0,0,1.5]) cube([65,54,height], center=true);
  
//translate([0,0,8]) cube([55,50,55], center=true);

intersection() {
translate([48,0,4]) sphere(d=150);  
translate([0,0,-4]) cube([55,40.5,95], center=true);
}

translate([15,0,-1]) cube([45,60,70], center = true);
 

}

difference() {
translate([-20,0,55/2-0.5])  cube([25,100,6], center = true); 
translate([-20,38,0]) cylinder(h = 150, d = 4);
translate([-20,-38,0]) cylinder(h = 150, d = 4);
translate([-25,0,55/2]) cube([55,44,70], center = true);  
 
}

intersection() {

translate([-10,0,-1]) cube([60,90,60], center = true);
   union() {
translate([-20-12.5,27,55/2-9]) rotate([45,0,0])  cube([25,10,4]);
translate([-20-12.5,-27-7,55/2-2]) rotate([-45,0,0])  cube([25,10,4]);
   }
}
}

module right_cover() {
rotate([0,-90,0]) difference() {
block();
  translate([7,35,2.5]) rotate([90,90,0]) cylinder(h=20,d=40);
}
}

module left_cover() {
rotate([0,-90,0]) difference() {
block();
  translate([-28,0,0]) sphere(d=16.6); 

translate([-28,0,20]) cube([14,14,40], center = true); 
}
}

left_cover();