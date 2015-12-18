import std.stdio;

void myFunction()
{
	debug(1){
	  	writeln("debug 1");
	}  
	debug(2){
	  	writeln("debug 2");
	} 
	version(1){
		writeln("version 1");
	}
}
enum Days
{
   sun,
   mon,
   tue,
   wed,
   thu,
   fri,
   sat
};

void testStaticIf(T)(T mtemplate){
	static if( is(T==class)){
		writeln("This is a class type");
	}else static if(is(T==enum)){
		writeln("This is a enum type");
	}
}
class Shape{
	public :
		double area;
} 

void testIfStatic()
{
   Days day;
   testStaticIf(day);
   Shape shape = new Shape();
   testStaticIf(shape);
}

void main()
{
   testIfStatic();
}


