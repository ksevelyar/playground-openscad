module pixels() {
{
hull() {
cube([4,1,1]);
translate([-1,1,0]) cube([6,1,1]);
translate([-2,2,0]) cube([8,1,1]);
}

hull() {
translate([-3,3,0]) cube([12,1,1]); 
translate([-3,4,0]) cube([13,1,1]);
}

hull() {
translate([-5,5,0]) cube([16,1,1]);
translate([-6,6,0]) cube([17,1,1]);
translate([-7,7,0]) cube([18,1,1]);
}

translate([-7,8,0]) cube([18,1,1]);
translate([-7,9,0]) cube([17,1,1]);
translate([-7,10,0]) cube([17,1,1]);

hull() {

translate([-6,11,0]) cube([16,1,1]);
translate([-5,12,0]) cube([16,1,1]);
translate([-4,13,0]) cube([15,1,1]);
}
  
translate([-5,14,0]) cube([16,1,1]);
translate([-6,15,0]) cube([17,1,1]);
translate([-6,16,0]) cube([16,1,1]);
translate([-6,17,0]) cube([15,1,1]);
translate([-6,18,0]) cube([13,1,1]);
translate([-5,19,0]) cube([13,1,1]);
translate([-4,20,0]) cube([12,1,1]);
translate([-3,21,0]) cube([10,1,1]);

translate([-3,22,0]) cube([9,1,1]);
translate([-3,23,0]) cube([8,1,1]);
translate([-2,24,0]) cube([7,1,1]);
translate([-2,25,0]) cube([7,1,1]);
translate([-1,26,0]) cube([7,1,1]);
translate([1,27,0]) cube([6,1,1]);
};
}

pixels();