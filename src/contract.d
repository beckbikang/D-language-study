import std.stdio;
/**
*return_type function_name(function_params)
*in
*{
*   // in block
*}
*out (result)
*{
*   // in block
*}
*body
*{
*   // actual function block
*}
*
*/

double testcontract(double year,double month)
in{
	assert(month >=0);
	assert(month <=12);
}out(result){
	assert(result > year);
}
body{
	return year+month/12;
}

void main() {
	writeln(testcontract(12,10));
}