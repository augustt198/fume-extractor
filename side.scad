MM = 0.0393701;

total_height = 6;
base_width = 2.75;
top_width = 0.5;
sub_height = 1;

thickness = 3*MM;
tab_width = 10*MM;

$fn=50;

module base() {
    polygon([
        [0, 0],
        [0, total_height],
        [top_width, total_height],
        [base_width, sub_height],
        [base_width, 0]
    ]);
}

module tabs() {
    for (i = [0 : 2 : 10]) {
        translate([0, i * tab_width])
        square([thickness, tab_width]);
    }
}

difference() {
    minkowski() {
        base();
        circle(1*MM);
    }
    translate([0.25, 1])
        tabs();
    
    translate([base_width-0.5, 0.5])
    square([thickness, 0.5]);
}