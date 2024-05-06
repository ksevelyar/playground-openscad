$fn=512;
border_radius = 15;
width = 155;
length = 105;

module bottom(length, width, height) {

max_length = length - 2 * border_radius;
max_width = width - 2 * border_radius;

  
translate([border_radius,border_radius,0]) hull() {
cylinder(r=border_radius, h=height);
translate([max_width,max_length]) cylinder(r=border_radius, h=height);
translate([0,max_length]) cylinder(r=border_radius, h=height);
translate([max_width,0]) cylinder(r=border_radius, h=height);
}
}

difference() {
bottom(width,length, 5);
translate([3,3,-1]) bottom(width-6,length-6,32);
}