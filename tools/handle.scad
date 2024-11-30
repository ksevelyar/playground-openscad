length = 50;
gap = 18.4;
wall = 2;
height = gap + wall;
width = 20;
$fn = 128;

mirror([0,0,180])  difference() {
  cube([width, length, height]);
  
  translate([-0.1,wall,-0.1]) cube([gap*2, gap, gap]);

}
