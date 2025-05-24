$fa = 2;
$fs = 0.25;

width = 6;

radius = 25;
thickness = 0.7;
depth = 5;
ledge_heigth = 1;
ledge_left = 0.5;
ledge_right = 1.5;

intersection() {
   difference() {
      translate([-5, 0, 0]) {
         cube(size = [10, width, depth]);
      }
                
      translate([radius + thickness, width/2, 0]) {
        cylinder(h = depth, r1 = radius, r2 = radius);
      }
   }
   
   translate([radius - thickness, width/2, 0]) {
    cylinder(h = depth, r1 = radius, r2 = radius);
  }
}

translate([0, 0, depth]) {
  intersection() {
   difference() {
      translate([-5, 0, 0]) {
         difference() {
           cube(size = [10, width, ledge_heigth]);
         }
      }
                
      translate([radius + thickness + ledge_left, width/2, 0]) {
        cylinder(h = ledge_heigth, r1 = radius, r2 = radius);
      }
    }
   
    translate([radius - thickness - ledge_right, width/2, 0]) {
      cylinder(h = ledge_heigth, r1 = radius, r2 = radius);
    }
  }
}

