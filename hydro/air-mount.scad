$fn=256;
width = 150;

module base() {
difference() {
  union() {
    cube([width,180,1]); 
    //translate([(width-30)/2,160,-1]) cube([30,20,5]); 
  }
  
  translate([width/2,62,0]) translate([0,0,-1]) cylinder(d =105, h = 46);
  
 
  translate([(width-70)/2,160,-1]) cube([70,40,50]);  
  translate([(width-120)/2,150,-1]) cube([120,20,50]);
  
    translate([(width-120)/2,125,-1]) cube([120,10,50]);
}

translate([(width-10)/2-40,160,0]) cube([10,20,1]);
translate([(width-10)/2+40,160,0]) cube([10,20,1]);  
}

intersection() {
base();

union() {
translate([width/2,150,0]) cylinder(d=150, h = 1);
translate([width/2,70,0]) cylinder(d=150, h = 1);
}
}