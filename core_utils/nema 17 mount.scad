// Nathanael Lane
// 2015.1.22

use <fasteners.scad>
use <vertical hole.scad>

/*
 * -vertical: specifies whether or not to have a perfectly horizontal 
 * 	bridge at the top of the holes for vertical printing
 * -a: if vertical == true, specifies the angle at which to place the flat 
 * 	bridge
 * -nWD: nominal washer hole diameter, tunable based on accuracy of printer 
 * -nBD: nominal bolt hole diameter, see above
 * -wh: height at which to place washer cutouts
 */
module nema17_mount(vertical = false, a = 0, nWD = 0, nBD = 0, wh = 5.5){

	screwD = (nBD == 0) ? 3 : nBD;
	washerD = (nWD == 0) ? washerOD(3) : nWD;

	module hole(d, _a = 0){

		if(vertical){
				
			rotate([0, 0, a - _a])	
				vertical_hole(d = d, h = 100);
		}else{

			rotate([0, 0, a - _a])
				cylinder(d = d, h = 100);
		}
	}

	module bolt_slot(d, _a){

		hull()
			for(i = [-1, 1])
				translate([31 * sqrt(2) / 2 + screwD / 4 * i, 0, -1])
					hole(d = d, _a = _a);
	}
	
	//screw holes (intended for 10mm m3 screws)
	for(a = [0:90:270])
		rotate([0, 0, a + 45]){

			bolt_slot(screwD, a + 45);

			translate([0, 0, wh + 1])
				bolt_slot(washerD, a + 45);
		}

	translate([0, 0, -1])
		hole(d = 29);
}


$fa = 6;
$fs = 0.06;

difference(){

	translate([-21, -21, 0])
		cube([42, 42, 10]);
	
	nema17_mount(vertical = true, wh = 5.5);
}