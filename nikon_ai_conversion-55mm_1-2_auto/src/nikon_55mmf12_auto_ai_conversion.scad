$fa = 2;
$fs = 0.25;

declicked=false; // declicking the aperture on this lens is possible! the mechanism does not use springs!
clicked_apertures_amount=8;
clicked_apertures_margin=[-1, 0, 0, 0, 0, 0, 0, 0];

grip=true;
grip_rills=false; // might be too much detail for some printers
grip_rills_amount=360;
grip_rills_width=0.2;
grip_rills_depth=0.2;

prong_holes=false; // mounting holes for rabbit ears / metering for Nikon F/F2

uppper_aperture_letters=true;
lower_aperture_letters=true; // might be too small for some printers
aperture_letters = ["1.2", "2", "2.8", "4", "5.6", "8", "11", "16"];
aperture_letters_margins = [0, 0, 2, 0, 2, 0, 0, 0];

difference() {
    group() {
        // main cylinder
        difference() {
            cylinder(r = 32, h = 13);
            cylinder(r = 29.75, h = 13);
        }

        if(grip) {
            // rotating to align with prong holes
            rotate([0, 0, -2]) {
                translate([0, 0, 5]) {
                    difference() {
                        grip_h=5;
                        grip_r=33;

                        cylinder(r = grip_r, h = grip_h);
                        cylinder(r = grip_r-1, h = grip_h);

                        // remove grip above prong holes
                        translate([-14, 28, 0]) {
                            cube(size = [28, 6, 5]);
                        }

                        grip_carve_amount=26;
                        grip_carve_r=40;

                        for (i = [0: grip_carve_amount]) {
                            rotate([0, 0, (720/grip_carve_amount)*i]) {
                                translate([0, grip_carve_r+32, 0]) {
                                    cylinder(r = grip_carve_r, h = grip_h);
                                }
                            }
                        }

                        if(grip_rills) {
                            for (i = [0: grip_rills_amount]) {
                                rotate([0, 0, i/(grip_rills_amount/360)]) {
                                    translate([0, grip_r-grip_rills_depth, 0]) {
                                        cube(size = [grip_rills_width, 5, 5]);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        // click ring
        translate([0, 0, 1.5]) {
            difference() {
                cylinder(r = 30, h = 2);
                cylinder(r = 29.6, h = 2);
            }
        }

        for (i = [0: len(aperture_letters)-1]) {
            rotate([90, 180, 148 + (8*i) + aperture_letters_margins[i]]) {
                translate([0, -4, 31.5]) {
                    rotate([0, 5, 0]) {
                        linear_extrude(height = 1) {
                            if(uppper_aperture_letters) {
                                text(aperture_letters[i], size = 2.5);
                            }

                            if(lower_aperture_letters) {
                                translate([0.9, -8.5, 0]) {
                                    text(aperture_letters[i], size = 1.5);
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    // aperture bind screw
    rotate([90, 0, -35]) {
        translate([0, 2.5, 28]) {
            cylinder(r = 0.8, h = 10);
        }
    }

    if(prong_holes) {
        group() {
            rotate([90, 0, 170]) {
                translate([0, 7, 28]) {
                    cylinder(r = 0.6, h = 10);
                }
            }

            rotate([90, 0, 186]) {
                translate([0, 7, 28]) {
                    cylinder(r = 0.6, h = 10);
                }
            }
        }
    }

    if (!declicked) {
        start=57;
        space=61;
        for (i = [0: clicked_apertures_amount-1]) {
            rotate([0, 0, clicked_apertures_margin[i]+ start + (i*(space/clicked_apertures_amount))]) {
                translate([0, 29, 1.5]) {
                    cube(size=[0.8, 1.25, 2]);
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
