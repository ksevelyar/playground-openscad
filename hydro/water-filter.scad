// Parameters
$fn=128;

length = 268 / 2; // Length of the box
width = 160; // Width of the box
height = 5; // Height of the box
radius = 19; // Radius for rounding corners

// Create the 3D model with rounded corners
module rounded_box() {
        // Extrude a rounded rectangle to create a 3D box
        translate([radius,radius,0]) linear_extrude(height) {
            offset(r=radius) {
                square([length-radius*2, width-radius*2], center=false);
            }
        }

}

// Render the model
rounded_box();
cube([length/2, width, height]);