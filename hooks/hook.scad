  $fn=256;
  depth = 50;
  width = 20;
  length = 40;
  wall = 5;
  height = 20;
  
  
  cube([3,19,width]);
  
  
  
  
  module shell() {
    hull() {
    translate([0,-depth,0]) {
      cube([depth,depth,height]);
      
      intersection() {
        translate([length,depth/2,0]) cylinder(d=depth*1.1,h=width);  
        cube([depth*2,depth,height]);
      }
      
  }
   }
 }
   
  
  module inner() {
    hull()  {
      translate([-50,8,1]) cube([length+50,depth-8,height*2]);
      translate([length-width/4,(depth+8)/2,0]) cylinder(d=depth*0.86,h=height*2);  
    }
  }

  
  
  
  difference() {
    shell();
    translate([7,-depth-4,-2]) inner();
    translate([13,20,height/2]) rotate([90,0,0]) cylinder(d = 5, h = 40);
  }