// Nathanael Lane
// 2015.1.22


/*
 * -h: height of prism
 * -b: length of base
 * -d: base-to-apex distance
 * -s: side length
 * -a: angle of apex corner
 * -if more than two of b, d, s, and a are defined, the outcome is undefined
 */
module _triangle(b = 0, d = 0, s = 0, a = 0, base_origin = false){
	
	adBase = tan(a / 2) * d * 2;
	asBase = sin(a / 2) * s * 2;
	dsBase = sqrt((s * s) - (d * d));
	abHeight = (b / 2) / tan(a / 2);
	asHeight = cos(a / 2) * s;
	bsHeight = sqrt((s * s) - (b * b));

	baseLUT = [b, asBase, b, adBase, b, dsBase];
	heightLUT = [abHeight, asHeight, bsHeight, d, d, d];

	base = baseLUT[
		min((sign(b) + sign(s) * 2 + sign(d) * 4) - 1, 5)
	];
	height = heightLUT[
		min((sign(b) + sign(s) * 2 + sign(d) * 4) - 1, 5)
	];

	translate([0, base_origin ? height : 0, 0])
			polygon([
				[0, 0], 
				[base / 2, -height], 
				[-base / 2, -height]
			]);	
}

module triangle(h = 1, b = 0, d = 0, s = 0, a = 0, base_origin = false, center = false){

	translate([0, 0, center ? -h /2 : 0])
		linear_extrude(height = h)
			_triangle(b = b, d = d, s = s, a = a, base_origin = base_origin);	
}


$fa = 5;
$fs = 0.05;

triangle(h = 3, b = 10, a = 60, baseOrigin = true, center = true);