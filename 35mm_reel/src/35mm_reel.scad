$fa = 2;
$fs = 0.25;
size_factor=0.7;

outer_radius=100*size_factor;
wall=2.5;

core_diameter=15;
core_height=wall+36;
core_wall=5;
core_clearance=2;

core_hole_radius=2.5;

holes=6;
hole_radius=20*size_factor;
hole_distance=60*size_factor;

difference() {
    group() {
        cylinder(r=outer_radius, h=wall);

        //core
        keyed_cylinder(od=core_diameter, id=core_diameter-core_wall, h=core_height, sector_deg=60-core_clearance, phase=0);
    }

    // core hole
    cylinder(r=core_hole_radius, h=core_height);

    // holes
    for (i = [0:1:holes]) {
        rotate([0, 0, (360/holes) * i]) {
            translate([hole_distance, 0, 0]) {
                cylinder(r=hole_radius, h=wall);
            }
        }
    }
}


module keyed_cylinder(od=40, id=34, h=30, sector_deg=30, phase=0, facets=180) {
    R = od/2;
    r = id/2;

    union() {
        for (i = [0:2]) {
            rotate([0,0, phase + i*120 - sector_deg/2])
                annular_sector(r1=r, r2=R, angle_deg=sector_deg, h=h, $fn=facets);
        }
    }
}

module annular_sector(r1, r2, angle_deg, h, $fn=180) {
    rotate_extrude(angle=angle_deg, $fn=$fn)
        translate([r1, 0, 0])
            square([r2 - r1, h], center=false);
}
