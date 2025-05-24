$fa = 2;
$fs = 0.25;

// main cylinder
difference() {
    cylinder(r = 32, h = 13);
    cylinder(r = 29.75, h = 13);

    // aperture bind screw
    rotate([90, 0, -35]) {
        translate([0, 2.5, 28]) {
            cylinder(r = 0.8, h = 5);
        }
    }

    // prongs 1
    rotate([90, 0, 170]) {
        translate([0, 7, 28]) {
            cylinder(r = 0.8, h = 5);
        }
    }

    // prongs 2
    rotate([90, 0, 186]) {
        translate([0, 7, 28]) {
            cylinder(r = 0.8, h = 5);
        }
    }

    // aperture letters
    apertures = ["1.2", "2", "2.8", "4", "5.6", "8", "11", "16"];
    margins = [0, 0, 2, 0, 2, 0, 0, 0];

    for (i = [0: len(apertures)-1]) {
        rotate([90, 180, 148 + (8*i) + margins[i]]) {
            translate([0, -4, 31.5]) {
                linear_extrude(height = 1) {
                    // upper
                    text(apertures[i], size = 2.5);

                    // lower
                    translate([0.9, -8.5, 0]) {
                        text(apertures[i], size = 1.5);
                    }
                }
            }
        }
    }
}

// aperture control ring
translate([0, 0, 9.5]) {
    difference() {
        cylinder(r = 29.75, h = 2);
        cylinder(r = 29, h = 2);

        translate([-5, 5, 0])  {
            cube(size = [25, 26, 5]);

            rotate([0, 0, 45]) {
                translate([10, -17.5, 0]) {
                    cube(size = [25, 26, 5]);
                }
            }
        }
    }
}

// ai coupling
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
