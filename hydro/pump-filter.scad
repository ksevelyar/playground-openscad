$fn=256;
width = 88;
length = 88;
height = 19;

module fillet(r, h) {
  translate([r / 2, r / 2, 0])
    difference() {
      cube([r + 0.1, r + 0.1, h], center = true);
      translate([r/2, r/2, 0]) cylinder($fn=512, r = r, h = h + 1, center = true);
    }
}

module plate(width,length,height) {

difference() {
cube([width,length,height]);

fillet(11,100);
  translate([width,0,0]) rotate([0,-180,0]) fillet(11,100);
translate([width,length,0]) rotate([180,-180,0]) fillet(11,100);
translate([0,length,0]) rotate([180,0,0]) fillet(11,100);


}

}

module bottom() {
difference() {
  difference() {
plate(88,88,9);

translate([-1,(88-60)/2,3.8]) cube([90,60,6]);
    
  
      translate([width/2,length/2,-1]) cylinder(r=4.6,h=height+2);
translate([width-7.5,7.5,-1]) cylinder(d=7.5,h=height+2);
translate([7.5,7.5,-1]) cylinder(d=7.5,h=height+2);
translate([7.5,length-7.5,-1]) cylinder(d=7.5,h=height+2);
translate([width-7.5,length-7.5,-1]) cylinder(d=7.5,h=height+2);  
    
      
      

}
translate([width/2,length/2,-1]) cylinder(r=4.6,h=height+2);

  

}
}

module top() {
translate([-100,0,0]) {
  difference() {
plate(88,88,9);

translate([-1,(88-60)/2,3.8]) cube([90,60,6]);
    
  
      translate([width/2,length/2,-1]) cylinder(r=4.6,h=height+2);
translate([width-7.5,7.5,-1]) cylinder(d=7.5,h=height+2);
translate([7.5,7.5,-1]) cylinder(d=7.5,h=height+2);
translate([7.5,length-7.5,-1]) cylinder(d=7.5,h=height+2);
translate([width-7.5,length-7.5,-1]) cylinder(d=7.5,h=height+2);   
    
      
      
translate([(88-75)/2,(88-50)/2,-0.1]) {
  plate(75,50,4);
    

  }
}
}
}

module outer_cartridge() {
translate([-100,-90,0]) {
  difference() {


translate([-1,(88-60)/2,0]) plate(90-0.2,60-0.2,9.8);
    
      
      
translate([(88-75)/2-0.1,(88-50)/2-0.1,-0.1]) {
  plate(75,50,12);
    

  }
}
}
}

module inner_cartridge() {
translate([0,-90,0]) {
  


translate([(88-75)/2-0.1,(88-50)/2-0.1,-0.1]) {
  
  difference() {
  plate(75-0.2,50-0.2,9);
    
   translate([(75-69)/2-0.1,(50-44)/2-0.1,-0.1]) plate(69-0.1,44-0.1,13);
    

  }
}
}
}

//top();
//bottom();
inner_cartridge();
//outer_cartridge();