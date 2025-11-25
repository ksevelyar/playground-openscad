$fn = 16;

module rounded_box(size = [ 10, 10, 5 ], r = 3) {
  translate([ size[0] / 2, size[1] / 2, 0 ]) {
    linear_extrude(height = size[2]) {
      minkowski() {
        square([ size[0] - 2 * r, size[1] - 2 * r ], center = true);
        circle(r = r);
      }
    }
  }
}

module inner_shell_a() {
  height = 60;
  wall = 1;
  rotate([0,-90,0]) difference() {
    rounded_box([height,height,height]);
    translate([wall, wall, wall]) rounded_box([height - wall*2, height - wall*2,height + wall*2]);

    translate([wall+height/2,-wall,-wall]) cube([height,height+wall*2,height*2]);

    for (i = [10.5 : 6 : 50]) {
      translate([wall, wall * i, -wall])
        cube([height, 3, height]);
    }
  }

  radius = 3;
  leg_width = 6;
  leg_length = 20;

  pin_width = 2.2;
  pin_height = height/2+wall+height/4;
  pin_length = leg_length-wall*2*2 - 2;

  translate([0,radius,0]) cube([20,leg_width,height/2+wall]);
  translate([(leg_length - pin_length)/2,radius + (leg_width - pin_width)/2,0]) cube([pin_length,pin_width,pin_height]);

  translate([0,height-radius-leg_width,0]) cube([20,leg_width,height/2+wall]);
  translate([
  (leg_length - pin_length)/2,
  height - radius - (leg_width - pin_width)/2-pin_width,
  0]) 
    cube([pin_length,pin_width,height/2+wall+height/4]);
}

module inner_shell_b() {
  height = 60;
  wall = 1;

  rotate([0,-90,0]) difference() {
    rounded_box([height,height,height]);
    translate([wall, wall, wall]) rounded_box([height - wall*2, height - wall*2,height + wall*2]);

    translate([wall+height/2,-wall,-wall]) cube([height,height+wall*2,height*2]);

    for (i = [10.5 : 6 : 50]) {
      translate([wall, wall * i, -wall])
        cube([height, 3, height]);
    }
  }

  radius = 3;
  leg_width = 6;
  leg_length = 20;

  pin_width = 3;
  pin_height = height/2+wall+height/4;
  pin_length = leg_length-wall*4;

  difference() {
    translate([0,radius,0]) cube([20,leg_width,height/2+wall]);
    translate([(leg_length - pin_length)/2,radius + (leg_width - pin_width)/2,wall]) cube([pin_length,pin_width,pin_height]);
  }

  difference() {
    translate([0,height-radius-leg_width,0]) cube([20,leg_width,height/2+wall]);
    translate([(leg_length - pin_length)/2,height - radius - (leg_width - pin_width)/2-pin_width,wall]) cube([pin_length,pin_width,pin_height]);
  }
}

module outer_shell() {
  height = 60 + 20 + 2;
  spacer = 4;
  edge = 60 + spacer + 3;
  wall = 1;

  difference() {
    rounded_box([edge,edge,height]);
    translate([wall, wall, wall]) rounded_box([edge - wall*2, edge - wall*2,height + wall*2]);
  }

  difference() {
   translate([0,(edge+wall*2)/2,0]) cube([spacer,1, height/2]);
   translate([4,(edge+wall*2)/2- 0.05,1]) rotate([0,-3,0]) cube([spacer,1.1, height]);
  }

  difference() {
   translate([edge-spacer,edge/2,0]) cube([spacer,1, height/2]);
   translate([edge - spacer - 4,edge/2- 0.05,1]) rotate([0,3,0]) cube([spacer,1.1, height]);
  }

  difference() {
   translate([(edge)/2,edge-spacer,0]) cube([1,spacer, height/2]);
   translate([edge/2- 0.05,edge-spacer - 4,1]) rotate([-3,0,0]) cube([1.1,spacer, height]);
  }

  difference() {
   translate([(edge)/2,0,0]) cube([1,spacer, height/2]);
   translate([edge/2-0.05,4,1]) rotate([3,0,0]) cube([1.1,spacer, height]);
  }
}


//inner_shell_a();
//translate([90, 0,0]) inner_shell_b();

translate([120,0,0]) outer_shell();


module extrusion_test_a() {
  height = 10;
  wall = 1;

  radius = 3;
  leg_width = 6;
  leg_length = 20;

  pin_width = 2;
  pin_height = 20;
  pin_length = leg_length-8;
  translate([0,radius,0]) cube([20,leg_width,height/2+wall]);
  translate([(leg_length - pin_length)/2,radius + (leg_width - pin_width)/2,0]) cube([pin_length,pin_width,pin_height]);
}

module extrusion_test_b() {
  height = 10;
  wall = 1;

  radius = 3;
  leg_width = 6;
  leg_length = 20;
  
  pin_width = 3;
  pin_height = height/2+wall+height/4;
  pin_length = leg_length-6+0.5;
  difference() {
    translate([0,radius,0]) cube([20,leg_width,height/2+wall]);
    translate([(leg_length - pin_length)/2,radius + (leg_width - pin_width)/2,wall]) cube([pin_length,pin_width,pin_height]);
  }
}

//extrusion_test_a();
//translate([0,10,0]) extrusion_test_b();
