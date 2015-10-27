// Nathanael Lane
// 2015.1.22

_socketHeadD = [
	5.5, 	//m3
	13		//m8
	];
	
_socketHeadH = [
	2.4,	//m3
	8		//m8
	];
	
_socketHeadHex = [
	2.5,	//m3
	6		//m8
	];
	
_nutFlatD = [
	5.5,	//m3
	13		//m8
	];
	
_nutH = [
	2.4, 	//m3
	6.5		//m8
	];
	
_thinNutH = [
	2.4, 	//m3
	4		//m8
	];
	
_washerOD = [
	7,		//m3
	16		//m8
	];
	
_washerID = [
	3.2,	//m3
	8.4		//m8
	];
	
_washerH = [
	0.5,	//m3
	1.5		//m8
	];
	
function _lookup(m) = 
	m == 3 ? 0 :
	m == 8 ? 1 :
	-1;
	
function socketHeadD(size) = _socketHeadD[_lookup(size)];
function socketHeadH(size) = _socketHeadH[_lookup(size)];
function nutFlatD(size) = _nutFlatD[_lookup(size)];
function nutMaxD(size) = nutFlatD(size) / sqrt(3) * 2;
function nutH(size, thin = false) = thin ? _thinNutH[_lookup(size)] : _nutH[_lookup(size)];
function washerH(size) = _washerH[_lookup(size)];
function washerOD(size) = _washerOD[_lookup(size)];
function washerID(size) = _washerOD[_lookup(size)];



