// very minimal set of linalg functions needed by so3, se3 etc.

function cross(x,y) = [x[1]*y[2]-x[2]*y[1], x[2]*y[0]-x[0]*y[2], x[0]*y[1]-x[1]*y[0]];
function take3(v) = [v[0],v[1],v[2]];
function tail3(v) = [v[3],v[4],v[5]];
function identity3()=[[1,0,0],[0,1,0],[0,0,1]];
function identity4()=[[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]];
function rotation_part(m) = [take3(m[0]),take3(m[1]),take3(m[2])];
function norm(v) = sqrt(v*v);
function unit(v) = v/norm(v);
function rot_trace(m) = m[0][0] + m[1][1] + m[2][2];
function rot_cos_angle(m) = (rot_trace(m)-1)/2;

function rotation_part(m) = [take3(m[0]),take3(m[1]),take3(m[2])];
function translation_part(m) = [m[0][3],m[1][3],m[2][3]];
function transpose_3(m) = [[m[0][0],m[1][0],m[2][0]],[m[0][1],m[1][1],m[2][1]],[m[0][2],m[1][2],m[2][2]]];
function invert_rt(m) = construct_Rt(transpose_3(rotation_part(m)), -(transpose_3(rotation_part(m)) * translation_part(m)));
function construct_Rt(R,t) = [concat(R[0],t[0]),concat(R[1],t[1]),concat(R[2],t[2]),[0,0,0,1]];

module rot2Vec(v2, v1=[0, 0, 1]){ //https://math.stackexchange.com/questions/180418/calculate-rotation-matrix-to-align-vector-a-to-vector-b-in-3d/476311#476311
	v1=v1; //v1 assummed to be unit
	v2=unit(v2);
	
	ax=cross(v1, v2);
	c=v1 * v2;
	ssc = [
		[0, -ax[2], ax[1]],
		[ax[2], 0, -ax[0]],
		[-ax[1], ax[0], 0]
  ];
	
	m=identity3() + ssc + (ssc*ssc)*(1-c)/(ax*ax);
	//echo(m);
	multmatrix(m)
		children();
};
