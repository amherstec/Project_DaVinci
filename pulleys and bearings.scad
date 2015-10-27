include <config.scad>

use <core_utils/complex operations.scad>

module pulley(){

	difference(){
	
		intersection(){
	
			cylinder(d = 11, h = mm(8), center = true);
		
			reflect([0, 0, 1])
				cylinder(d1 = 10, d2 = 10 + mm(8), h = mm(4));
		}
		
		cylinder(d = mm(22), h = mm(8) + 2, center = true);
	}
}

pulley();