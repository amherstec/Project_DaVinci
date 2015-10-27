//Nathanael Lane

module scaffold(xyz = [10, 10, 10], w = 0.2, g = 1, y_accordion = false, mirror = false, center = false){

	lim = y_accordion ? xyz[1] : xyz[0];
	mir = mirror ? -1 : 1;
	
	translate(center ? xyz / -2 : [0, 0, 0])
		difference(){
	
			cube(xyz);
		
			for(o = [0 : (g + w) * 2 : lim]){
		
				if(y_accordion){
		
					translate([w * mir, w + o, -1])
						cube([xyz[0], g, xyz[2] + 2]);
						
					translate([-w * mir, w * 2 + g + o, -1])
						cube([xyz[0], g, xyz[2] + 2]);
				}else{
				
					translate([w + o, w * mir, -1])
						cube([g, xyz[1], xyz[2] + 2]);
		
					translate([w * 2 + g + o, -w * mir, -1])
						cube([g, xyz[1], xyz[2] + 2]);		
				}
			}
		}
}

scaffold([15, 30, 45], g = 0.7, w = 0.1, y_accordion = true, mirror = true);