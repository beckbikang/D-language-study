import std.stdio;
union Data{
	int i;
	float f;
	char str[2];
}
 
int main( )
{
   Data data;        
   writeln( "Memory size occupied by data : ", data.sizeof);
   data.i = 1;
   writeln(data.i);
   data.f = 1;
   writeln(data.f);
   data.str = "hi".dup;
   writeln(data.str);

   return 0;
}