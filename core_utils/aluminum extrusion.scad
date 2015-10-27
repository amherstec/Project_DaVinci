// Nathanael Lane
// 2015.1.22

use <complex primitives.scad>
use <triangle.scad>
use <regular polygon.scad>

module aluminum_extrusion(w = 15, l = 5, subtractive = false, center = false, fit = 0.2){
	
	module draw(lw, lh, tw, th, sh, d){
	
		width = subtractive ? w + fit : w;
		
		ctr = center ? [0, 0, 0] : [width / 2, width / 2, 0];

		translate(ctr){
	
			difference(){
		
				translate([-width / 2, -width / 2, 0]){
		
					rounded_square([width, width, l], cr = width / 31);
				}
			
				for(a = [0:90:270]){
		
					rotate([0, 0, a]){
			
						translate([0, -(width / 2 + 1), -1]){
				
							if(subtractive){
						
								translate([(lw - fit) / -2, 0, 0]){
							
									cube([lw - fit, d + 1, l + 2]);
								}
							}else{
					
								t_slot(
									l = l + 2, 
									lw = lw, 
									lh = lh + 1, 
									tw = tw, 
									th = th,
									sh = sh
								);
							}
						}
					}
				}
			}
		}
	}


	if(w == 15){
	
		draw(
			l = l, 
			w = w, 
			lw = 3.4, 
			lh = 1.1, 
			tw = 5.6, 
			th = 2.5, 
			sh = 1.1, 
			d = 0.8
		);
	}else{
	
		if(w == 40){
		
			draw(
				l = l, 
				w = w, 
				lw = 10, 
				lh = 5.5, 
				tw = 20, 
				th = 2, 
				sh = 5, 
				d = 3
			);
		}else{
		
			echo(str("aluminum extrusion: value for w is NYI: ", w));
		}
	}
}


module t_slot(lw, lh, tw, th, sh, l){

	union(){
	
		//lip
		translate([lw / -2, 0, 0]){
		
			cube([lw, lh + 0.01, l]);
		}
		
		//t
		translate([tw / -2, lh, 0]){
		
			cube([tw, th + 0.01, l]);		
		}	
		
		//slope
		translate([0, lh + th, 0]){
		
			intersection(){
			
				triangle(a = 90, b = tw, h = l, base_origin = true);
				
				translate([-tw / 2, 0, 0]){
				
					cube([tw, sh, l]);
				}
			}
		}	
	}
}


/////testing/////
$fs = 0.05;
$fa = 5;

aluminum_extrusion(w = 15, l = 30);
aluminum_extrusion(w = 15, l = 29, subtractive = true);

translate([0, 35, 0]){
	aluminum_extrusion(w = 40, l = 80);
	aluminum_extrusion(w = 40, l = 79, subtractive = true);
}




