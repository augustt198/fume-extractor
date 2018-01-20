MM = 0.0393701;

hole_offset = 105*MM;
width = 145*MM;
height = 130*MM;

slit_width =5*MM;

thickness = 3*MM;
tab_width = 10*MM;

$fn=50;

module mountingholes() {
    for (deg = [0 : 90 : 360]) {
        rotate([0, 0, deg])
        translate([hole_offset/2, hole_offset/2])
        circle(r=4.5*MM/2);
    }
}

module base() {
    difference() {
        square([width,height], center=true);
        circle(r=120*MM/2);
    }
    
    for (i = [3 : 5 : 25]) {
        translate([0, i*slit_width*1 - height/2])
        square([width, slit_width], center=true);
    }
}

module tabs() {
    for (i = [0 : 2 : 12]) {
        translate([0, i * tab_width])
        square([thickness, tab_width]);
    }
}

module tabs_right() {
    translate([width/2 - thickness, -height/2])
        tabs();
}

module tabs_left() {
    translate([-width/2, -height/2])
        tabs();
}

difference() {
    base();
    mountingholes();
    tabs_right();
    tabs_left();
}