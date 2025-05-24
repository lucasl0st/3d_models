$fa = 2;
$fs = 0.25;

difference() {
    cylinder(r = 32, h = 13);
    cylinder(r = 29.75, h = 13);
    
    rotate([90, 0, -35]) {
        translate([0, 2.5, 28]) {
            cylinder(r = 0.8, h = 5);
        }
    }
}

translate([0, 0, 9.5]) {
    difference() {
        cylinder(r = 29.75, h = 2);
        cylinder(r = 29, h = 2);
        
        translate([-5, 5, 0])  {
            cube(size = [32, 26, 5]);
        }
    }    
}

translate([0, 0, 13]) {
    difference(){
        cylinder(r = 32.5, h = 1);
        cylinder(r = 30.5, h = 1);
        
        translate([-1.5, -50, 0]){
            cube(size = [50, 100, 10]);
        }
        
        rotate([0, 0, 45]) {
            translate([-35, -50, 0]){
                cube(size = [30, 100, 10]);
            }
        }
        
        translate([-50, -50, 0]){
            cube(size = [100, 30, 10]);
        }
    }
}
