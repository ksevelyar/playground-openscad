$fn = 100;

hook_distance = 95;
hook_diameter = 4.9;
hole_distance = 105;
hole_diameter = 4.1;

hull() {
cylinder(d = hook_diameter, h = 47);  
translate([hook_distance, 0, 0]) cylinder(d = hook_diameter, h = 7);  
}

translate([0, 0, -7]) cylinder(d = hook_diameter, h = 8); 
translate([hook_distance, 0, -7]) cylinder(d = hook_diameter, h = 8); 



translate([0,0,100])  hull() {
cylinder(d = hook_diameter, h = 47);  
translate([hook_distance, 0, 0]) cylinder(d = hook_diameter, h = 7);  
  translate([hook_distance, 0, 0]) cylinder(d = hook_diameter, h = 7);  
  translate([hook_distance, 0, 0]) cylinder(d = hook_diameter, h = 7);  
}