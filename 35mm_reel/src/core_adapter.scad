$fa = 2;
$fs = 0.25;

inner_radius=7.5;
outer_radius=13;
height=35;

difference() {
    cylinder(r=outer_radius, h=height);
    cylinder(r=inner_radius, h=height);
}
