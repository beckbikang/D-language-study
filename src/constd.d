import std.stdio;
import std.random;

void main()
{
   int min = 1;
   int max = 10;

   immutable number = uniform(min, max + 1);
   // cannot modify immutable expression number
   // number = 34;
   //number =11;
   const number2 = 10;
   typeof(number2) number3 = 10;
   writeln(typeof(number2).stringof, number2);
   writeln(typeof(number3).stringof, number3);

   typeof(number) value = 100;
   writeln(typeof(min).stringof,min);
   writeln(typeof(number).stringof, number);
   writeln(typeof(value).stringof, value);
}