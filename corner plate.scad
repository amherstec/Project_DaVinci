include <config.scad>

use <core_utils/complex primitives.scad>
use <slotted steel.scad>

thick = 5;
side = 100;

difference(){

	chamfered_square([side, side, thick], cr = 4);
	
	translate([side, 12 + 17.5, 0])
	rotate([0, 0, 45])
	translate([0, -1, -1])
		cube([side, side * sqrt(2), thick + 2]);
	
	translate([5, 5, -1])
		cylinder(d = mm(8), h = thick + 2);
		
	translate([12 + 17.5 - 5, 12 + 17.5 - 5, -1])
		cylinder(d = mm(8), h = thick + 2);
}

for(z = [-30, 5]){

	translate([12 + 17.5, 12, z])
		#cube([ft(6), 17.5, 30]);
	
	
	translate([12, 12 + 17.5, z])
		#cube([17.5, ft(6), 30]);
}