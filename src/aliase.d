import std.stdio;
import std.conv:to;
import std.typetuple;

alias to!(string) tostring;
alias TypeTuple!(int, long) TL;
alias int myAppNumber;

void testStr(){
	int a = 10;
	string s = tostring(a);
	writeln(s);
}


void method1(TL tl)
{
   writeln(tl[0],"	", tl[1] );
}

class Shape{
	int area;
}
class AShape:Shape{
	string name() const @property{
	      return "Square";
	}
    alias Shape.area squareArea;
 
}
void testShare(){
	AShape a = new AShape();
	a.area = 11;
	writeln(a.name,a.squareArea);

}

void testNum(){
	myAppNumber i = 1;
	writeln(i);
	method1(1,1L);
}
void main(){
	testShare();

}