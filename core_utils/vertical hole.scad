// Nathanael Lane
// 2015.1.22

module vertical_hole(r = 1, d = 0, center = false, h = 1, point = false){
	
	_r = (d == 0) ? r : d / 2;
	
	difference(){

		union(){
			//hole
			cylinder(r = _r, h = h, center = center);
			//teardrop
			translate([0, sqrt(2) * _r / 2, center ? 0 : h / 2]){

				rotate([0, 0, 45]){

					cube([_r, _r, h], center = true);
				}
			}
		}
		if(!point){
	
			translate([0, _r * 2, center ? 0 : h/2]){
	
				cube([2 * _r, 2 * _r, h + 2], center = true);
			}
		}
	}
}

$fa = 5;
$fs = 0.05;
vertical_hole(center = true, h = 30, d = 12);