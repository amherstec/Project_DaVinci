// Nathanael Lane
// 2015.1.22

use <triangle.scad>

/*
 * -r: radius (measured from center to flat, not center to corner)
 * -d: diameter (if both radius and diameter are specified, the used variable is undefined)
 * -ns: desired number of sides
 * -sl: desired minimum side length
 * -h: height of resulting prism
 * -center: whether or not to center resulting prism
 */
module regular_polygon(r = 0, d = 1, ns = 6, sl = 0.01, h = 1, center = false){
	
	function vo(r, fa) = r / cos(fa / 2);
	
	function fa(ns, r) = (ns > 3) && (sqrt(pow(vo(r = r, fa = 360 / ns), 2) - r * r) < sl / 2) ? 
		fa(ns = ns - 1, r = r) : 
		360 / ns;
	
	rd = (r == 0) ? d / 2 : r;
	
	a = fa(ns = ns, r = rd);
	
	vr = vo(r = rd, fa = a);

	if(a > 72){
	
		if(a > 90){
		
			translate([0, rd * 2, 0]){
			
				triangle(a = 60, d = rd * 3, h = h, center = center);
			}
		}else{
		
			rotate([0, 0, 45]){
			
				translate([0, 0, center ? 0 : h / 2]){
				
					cube([rd * 2, rd * 2, h], center = true);
				}
			}
		}
	}else{
	
		rotate([0, 0, 90]){
		
			cylinder(r = vr, h = h, center = center, $fa = a, $fs = sl);
		}
	}
}

regular_polygon(r = 10, h = 20);