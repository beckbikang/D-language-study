import std.stdio;
import core.vararg;
import std.uni;
import std.string;

/**
*纯函数
*抛出异常函数
*参考函数
*自动函数
*可变参数函数
*inout函数
*属性函数
**/
int x = 10;
immutable int y = 30;
const int* p;
//纯函数是无法通过他们的论据访问全局或静态的，可变的状态保存函数。
pure int purefunc(int i,const char* q,immutable int* s)
{
   //writeln("Simple print"); //cannot call impure function 'writeln'
   debug writeln("in foo()"); // ok, impure code allowed in debug statement
   // x = i;  // error, modifying global state
   // i = x;  // error, reading mutable global state
   // i = *p; // error, reading const global state
   i = y;     // ok, reading immutable global state
   auto myvar = new int;     // Can use the new expression:
   return i;
}
//抛出异常函数不会抛出从类Exception派生的任何异常。抛出异常函数是协变与抛出。抛出异常保证函数不发出任何异常。
int add(int a, int b) nothrow
{
   //writeln("adding"); This will fail because writeln may throw
   int result;
   try {
      writeln("adding"); // compiles
      result = a + b;
   }catch (Exception error) { // catches all exceptions
   }

   return result;
}
//参考函数允许函数按引用返回。这类似于文献的功能参数。
ref int greater(ref int first, ref int second)
{
   return (first > second) ? first : second;
}
void testReferFunc(){
	int a = 1;
    int b = 2;
    greater(a, b) += 10;  
    writefln("a: %s, b: %s", a, b); 
}
//自动功能可以返回任何类型的值。没有有什么类型的要返回的任何限制。
auto add(int first, double second)
{
   double result = first + second;
   return result;
}
void testAutoFunc(){
	int a = 1;
   double b = 2.5;
   writeln("add(a,b) = ", add(a, b));
}

//可变参数函数是其中一个函数参数的数量，在运行时确定的函数。
void printargstest(int x,...){
	for(int i = 0; i < _arguments.length;i++){
		write(_arguments[i]);
		if(_arguments[i] == typeid(int)){
			int j = va_arg!(int)(_argptr);
			writefln(" %d",j);
		} 
		else if (_arguments[i] == typeid(long))
	      {
	         long j = va_arg!(long)(_argptr);
	         writefln("	%d", j);
	      }

	      else if (_arguments[i] == typeid(double))
	      {
	         double d = va_arg!(double)(_argptr);
	         writefln("	%g", d);
	      }
	}

}
void testFunc(){
	int a_str = 1;
	//double b = !(double) i;
	//writefln("%d",b);
}
//属性允许使用像成员变量成员函数。它使用@property关键字。该属性相关联函数，返回基于值联系在一起。
struct Rectangle
{
   double width;
   double height;

   double area() const @property
   { 
      return width*height; 
   }

   double areaNew() const @property
   {
   		return width*height*width*height;
   }
   void area(double newArea) @property
   { 
      auto multiplier = newArea / area;
      width *= multiplier;
      writeln("Value set!"); 
   }
}
void testPro(){
	auto rectangle = Rectangle(20,10);
   	writeln("The area is ", rectangle.area);
   	writeln("The area is ", rectangle.areaNew);
   rectangle.area(300);
   writeln("Modified width is ", rectangle.width);
}
void testUni(){
	  writeln("Is ğ lowercase? ", isLower('ğ'));
}

void useArr(){
   int n[ 10 ]; // n is an array of 10 integers
   // initialize elements of array n to 0
   for ( int i = 0; i < 10; i++ )
   {
      n[ i ] = i + 100; // set element at location i to i + 100
   }
   writeln("Element 	 Value");
   // output each array element's value
   for ( int j = 0; j < 10; j++ )
   {
      writeln(j," 	 ",n[j]);
   }
}
void testString(){
	char[6] greate = "hi wod";
	writefln("%s",greate);
	char[] greate2 = "hi word".dup;
	writefln("%s",greate2);
	string greate3 = "hi word";
	writefln("%s",greate3);
	writefln("%s","print :"~greate3~" length ");
	writefln("length :%d",greate3.length);
	writeln(greate == greate2);
	writeln(std.string.indexOf(greate,"wo"));
	writeln(std.string.lastIndexOf(greate,"O",CaseSensitive.no));
	writeln(toUpper(greate3));

}

//INOUT可以用于函数的参数和返回类型中使用。
//这就像为可变的，常量，和不变的模板。可变性属性从参数即inout的转让推导可变性属性的返回类型推断。
inout(char)[] qoutedWord(inout(char)[] phrase)
{
   return '#' ~ phrase ~ '#';
}

void testInout()
{
   char[] a = "test a".dup;

   a = qoutedWord(a);
   writeln(typeof(qoutedWord(a)).stringof," ", a);

   const(char)[] b = "test b";
   b = qoutedWord(b);
   writeln(typeof(qoutedWord(b)).stringof," ", b);

   immutable(char)[] c = "test c";
   c = qoutedWord(c);
   writeln(typeof(qoutedWord(c)).stringof," ", c);
}


void main()
{
	testInout();
	//testString();
	//testUni();
	//testPro();
	//printargstest(1,1.1,212L,1231e12,12);
	//testAutoFunc();
	//writeln("Added value is ", add(10,20));
   //writeln("Value returned from pure function : ",purefunc(x,null,null));
}