import std.stdio;
import std.typecons;
import std.typetuple;

void testTuple(){
	auto myTuple = tuple(1, "Tuts");
   writeln(myTuple);
   writeln(myTuple[0]);
   writeln(myTuple[1]);

   auto tt = tuple(1,"a");
   writeln(tt[1],tt[0]);
}
void tupleTemp(){
   auto myTuple = Tuple!(int, "id",string, "value")(1, "Tuts");
   writeln(myTuple);
   writeln("by index 0 : ", myTuple[0]);
   writeln("by .id : ", myTuple.id);
   writeln("by index 1 : ", myTuple[1]);
   writeln("by .value ", myTuple.value);
   auto tt = Tuple!(int,"id",string,"value")(2,"kkk");
   writeln(tt,tt[0],tt[1]);
    writeln(tt.id);
    writeln(tt.value);
}

void method1(int a, string b, float c, char d)
{
   writeln("method 1 ",a,"	",b,"	",c,"	",d);
}
void method2(int a, float b, char c)
{
   writeln("method 2 ",a,"	",b,"	",c);
}
void testExpand()
{
   auto myTuple = tuple(5, "my string", 3.3, 'r');
   writeln(myTuple[$-2..$]);

   writeln("method1 call 1");
   method1(myTuple[]);

   writeln("method1 call 2");
   method1(myTuple.expand);

   writeln("method2 call 1");
   method2(myTuple[0], myTuple[$-2..$]);
}

alias TypeTuple!(int, long) TL;

void method11(int a, string b, float c, char d)
{
   writeln("method 1 ",a,"	",b,"	",c,"	",d);
}
void method12(TL tl)
{
   writeln(tl[0],"	", tl[1] );
}

void testTalia()
{
   auto arguments = TypeTuple!(5, "my string", 3.3,'r');
   method11(arguments);
   method12(5, 6L);

}


void main()
{
	testTalia();

}