// Nathanael Lane
// 2015.3.17


module extrude(vec = [0, 10, 0], pos1 = [0, 0, 0], pos2 = [0, 10, 0], relative = true){
	
	p1 = relative ? [0, 0, 0] : pos1;
	p2 = relative ? vec : pos2;
	
	hull()
		for(v = [p1, p2])
			translate(v)
				children();
}


module reflect(vec = [0, 1, 0]){

	for(r = [[0, 0, 0], vec])	
		mirror(r)		
			children();
}


module select(index){

	children(index);
}


module array(max_per_line = 10, spacing = 50){

	for(n = [0:$children - 1])
		translate([(n % max_per_line) * spacing, floor(n / max_per_line) * spacing, 0])
			children(n);
}