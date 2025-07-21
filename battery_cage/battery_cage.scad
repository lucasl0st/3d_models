$fa = 2;
$fs = 0.25;

length = 150;
depth = 70;
height = 40;
wall_tickness = 2.5;
clamp_width = 20;

module clamp(clamp_len=30, thickness=3, angle=100, radius=20) {
    rotate([0, 0, 90])
        intersection() {
            linear_extrude(height=clamp_len) {
                difference() {
                    circle(radius + thickness);
                    circle(radius);
                }
            }

            rotate([0, 0, -angle/2]) {
                linear_extrude(height=clamp_len + 1) {
                    polygon([
                            [0,0],
                            [1000, tan(angle/2)*1000],
                            [1000, -tan(angle/2)*1000]
                        ]);
                }
            }
        }
}



// left
translate([0, 0, height/2])  {
    cube([length, wall_tickness, height/2]);
}

// right
translate([0, depth+wall_tickness, height/2])  {
    cube([length, wall_tickness, height/2]);
}

// top
translate([0, 0, height]) {
    cube([length, depth + (wall_tickness*2), wall_tickness]);
}

rotate([180, 90, 0]) {
    translate([-20, -22.5, -clamp_width]) {
        clamp(clamp_len = clamp_width, thickness = 2.5);

        translate([0, 0, (-(length-clamp_width))/2]) {
            clamp(clamp_len = clamp_width, thickness = 2.5);
        }

        translate([0, 0, -(length-clamp_width)]) {
            clamp(clamp_len = clamp_width, thickness = 2.5);
        }
    }
}

mirror([0, 1, 0]) {
    translate([0, -75, 0]) {
        rotate([180, 90, 0]) {
            translate([-20, -22.5, -clamp_width]) {
                clamp(clamp_len = clamp_width, thickness = 2.5);

                translate([0, 0, (-(length-clamp_width))/2]) {
                    clamp(clamp_len = clamp_width, thickness = 2.5);
                }

                translate([0, 0, -(length-clamp_width)]) {
                    clamp(clamp_len = clamp_width, thickness = 2.5);
                }
            }
        }
    }
}
