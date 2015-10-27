include <config.scad>

use <core_utils/complex primitives.scad>
use <core_utils/complex operations.scad>

thick = 1.05;

//angle dimensions
l_leg = 30;
s_leg = 17.5;

//long leg holes
d1 = 7.19;
d2 = 14.38;
d3 = 22.03;

//short leg holes
d4 = 5;
d5 = 7.5;

module slotted_steel_angle(length = 1){
	
	difference(){

		intersection(){
	
			rounded_square([l_leg + 2, s_leg + 2, length], cr = 2);
		
			cube([l_leg, s_leg, length]);
		}

		translate([thick, thick, -1])
			rounded_square([l_leg, s_leg, length + 2], cr = 2 - thick);
		
		rotate([90, 0, 0])
			_slots(length)
				cylinder(h = thick * 3, d = 3.75, center = true);
		
		rotate([90, 0, 90])
			_slots(length, s = true)
				cylinder(h = thick * 3, d = 3.75, center = true);
	}
}

module _slots(length, s = false){

	dep = 0;
	
	for(i = [0:(length + 22.5) / 7.5]){
	
		if(!s){
		
			if((i % 4) == 0){
		
				l = 7.5 - 3.75;
			
				translate([l_leg - d2 - l / 2, i * 7.5, 0])
					extrude([l, 0, 0])
						children();
			}else{
		
				l = 5 - 3.75;
			
				translate([l_leg - d1, i * 7.5 - l / 2, 0])
					extrude([0, l, 0])
						children();
			}
		
			if((i % 4) == 2){
		
				l = 20 - 3.75;
		
				translate([l_leg - d2, i * 7.5, 0])
					children();
				
				translate([l_leg - d3, i * 7.5 - l / 2, 0])
					extrude([0, l, 0])
						children();
			}
		}else{
		
			if(i % 2 == 0){
			
				l = 7.5 - 3.75;
				
				translate([s_leg - d5 - l / 2, i * 7.5, 0])
					extrude([l, 0, 0])
						children();
			}else{
			
				l = 5 - 3.75;
			
				translate([s_leg - d4, i * 7.5 - l / 2, 0])
					extrude([0, l, 0])
						children();
			}			
		}
	}
}

slotted_steel_angle(ft(1));
	