edge = 121;
border_radius = 8;
bottom_height = 1.5;

overlap_height = 9;
filter_height = 10;
height = overlap_height + filter_height;

$fn=64;

module base() {
  difference() {
    hull() {
      translate([border_radius,border_radius,0]) cylinder(r = 8, h = height);
      translate([edge - border_radius,border_radius,0]) cylinder(r = 8, h = height);
      translate([border_radius,edge - border_radius,0]) cylinder(r = 8, h = height);
      translate([edge - border_radius,edge - border_radius,0]) cylinder(r = 8, h = height);
    };

    hull() {
      translate([border_radius + 1,border_radius + 1, bottom_height]) cylinder(r = 8, h = height);
      translate([edge - border_radius - 1,border_radius + 1,bottom_height]) cylinder(r = 8, h = height);
      translate([border_radius + 1,edge - border_radius - 1, bottom_height]) cylinder(r = 8, h = height);
      translate([edge - border_radius - 1,edge - border_radius - 1, bottom_height]) cylinder(r = 8, h = height);
    };
  }
}

module mounts() {
  translate([7.5,7.5,0]) cylinder(r1=2,r2=1.7, h=height);
  translate([edge - 7.5,7.5,0]) cylinder(r1=2,r2=1.7, h=height);
  translate([edge - 7.5, edge - 7.5,0]) cylinder(r1=2,r2=1.7, h=height);
  translate([7.5, edge - 7.5,0]) cylinder(r1=2,r2=1.7, h=height);
}

module base_with_cutout() {
  difference() {
    base();
    translate([edge/2,edge/2, -0.1]) cylinder(r = edge / 2.1, h = 3);
  }
  mounts();
};


module mount_holes() {
  translate([7.5,7.5,0]) cylinder(r=2, h=height);
  translate([edge - 7.5,7.5,0]) cylinder(r=2, h=height);
  translate([edge - 7.5, edge - 7.5,0]) cylinder(r=2, h=height);
  translate([7.5, edge - 7.5,0]) cylinder(r=2, h=height);
}


module grid() {
  difference() {
    union() {
      hull() {
        translate([7.5,7.5,0]) cylinder(r=3.2, h=2);
        translate([edge - 7.5, edge - 7.5,0]) cylinder(r=3.2, h=2);
      }

      hull() {
        translate([edge - 7.5,7.5,0]) cylinder(r=3.2, h=2);
        translate([7.5, edge - 7.5,0]) cylinder(r=3.2, h=2);
      }
    }
    translate([0,0,-0.1]) mount_holes();
  }
}

grid();
// base_with_cutout();

