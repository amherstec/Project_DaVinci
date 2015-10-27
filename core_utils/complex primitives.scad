// Nathanael Lane
// 2015.3.17

use <triangle.scad>

module _square(xyz, cr, center = false){

	hull()
		translate(center ? [0, 0, 0] : xyz / 2)
			for(x = [-1, 1])
				for(y = [-1, 1])
					translate([(xyz[0] / 2 - cr) * x, (xyz[1] / 2 - cr) * y, 0])
						children();
}


module chamfered_square(xyz = [2, 2, 2], cr = 1, center){

	_square(xyz = xyz, cr = cr, center = center)
		rotate([0, 0, 45])
			cube([cr * sqrt(2), cr * sqrt(2), xyz[2]], center = true);
}


module rounded_square(xyz = [2, 2, 2], cr = 1, center){

	_square(xyz = xyz, cr = cr, center = center)
		cylinder(r = cr, h = xyz[2], center = true);
}


module _cube(xyz, cr, center = false){

	hull()
		translate(center ? [0, 0, 0] : xyz / 2)
			for(x = [-1, 1])
				for(y = [-1, 1])
					for(z = [-1, 1])
						translate([(xyz[0] / 2 - cr) * x, (xyz[1] / 2 - cr) * y, (xyz[2] / 2 - cr) * z])
							children();

}


module chamfered_cube(xyz = [2, 2, 2], cr = 1, center){

	p = [
		[0, 0, cr],
		[0, cr, 0],
		[cr, 0, 0],
		[0, -cr, 0],
		[-cr, 0, 0],
		[0, 0, -cr]
	];

	t = [
		[0, 1, 2],
		[0, 2, 3],
		[0, 3, 4],
		[0, 4, 1],

		[5, 2, 1],
		[5, 1, 4],
		[5, 4, 3],
		[5, 3, 2]
	];

	_cube(xyz = xyz, cr = cr, center = center)
		polyhedron(points = p, faces = t, convexity = 2);
}


module rounded_cube(xyz = [2, 2, 2], cr = 1, center){

	_cube(xyz = xyz, cr = cr, center = center)
		sphere(r = cr);
}


module _cylinder(h, d, r, cr, center = false){

	_r = (d == 0) ? r : d / 2;

	hull()
		translate([0, 0, center ? 0 : h / 2])
			for(a = [0, 180])
				rotate([a, 0, 0])
					translate([0, 0, h / 2 - cr])
						rotate_extrude()
							translate([_r - cr, 0, 0])
								children();
}


module chamfered_cylinder(h = 4, d = 0, r = 2, cr = 1, center){

	

	_cylinder(h = h, cr = cr, r = r, d = d, center = center)
		rotate([0, 0, 135])
			_triangle(s = cr, a = 90);
}


module rounded_cylinder(h = 4, d = 0, r = 3, cr = 1, center){

	_cylinder(h = h, d = d, r = r, cr = cr, center = center)
		intersection(){
		
			square([cr, cr]);
		
			circle(r = cr);
		}
}


module chamfer(cr = 1, l = 3, center = false){

	
	intersection(){

		rotate([0, -45, 0])
			translate([-cr * 3, center ? -l / 2 : 0, -cr * 3])
				chamfered_square([cr * 4, l, cr * 6], cr = cr);

		translate([-cr, center ? -l / 2 : 0, -cr])
			cube([cr * 4, l, cr * 4]);
	}
}

module sexy_cube(xyz = [3, 3, 3], cr = 1, fr = 1, center = false){

	translate(!center ? xyz / 2 : [0, 0, 0])
		hull()
			for(x = [-1, 1])
				for(y = [-1, 1])
					translate([x * (xyz[0] / 2 - fr), y * (xyz[1] / 2 - fr), 0])
						chamfered_cylinder(h = xyz[2], center = true, cr = cr, r = fr);
}


*sexy_cube([20, 40, 30], cr = 3, fr = 14);

chamfer(l = 20);

*rounded_square([5, 5, 5]);

$fa = 6;
$fs = 0.1;
