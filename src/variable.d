#!/usr/bin/dmd
import std.stdio;
enum Days { sun=1, mon, tue, wed, thu, fri, sat };

enum : string {
  enum_A = "hello",
  enum_B = "world",
}
enum : int {
  enum_a = 11,
  enum_b = 12,
}
int main (string[] argv)
{
    short a_short = 123;
    int a_int = 123;
    uint a_uint = 123;
    long a_long = 123;
    ulong a_ulong = 123;
    char a_char = 'a';
    float a_float = 1.12;
    double a_double = 1.12;
    writeln(a_int,int.sizeof);

    //enume
    Days friday = Days.fri;
    writefln("friday is %d",friday);
    writefln(" Days.fri %d",Days.fri);
    writefln("Days is %d",Days.min);
    writefln("Days is %d",Days.max);
    writefln("Days is %d",Days.sizeof);

    writefln("A %s",enum_A);
    writefln("B %s",enum_B);
    writefln("a %s",enum_a);
    writefln("b %s",enum_b);

    //writefln("Hello  World %c",'x21');
    //writefln("Have a good day %c",x21);
    auto str_str = q{int value=20;++value;};
    writeln(str_str);
    int i;
    for(i=1;i<2;i++)writef("%d,",i);
    i = 1; while(i<3){if(i == 2) {i++;continue;}writef("%d,",i);i++;}
    i = 1; do{writef("%d,",i);i++;if(i==2)break;}while(i<3);

    auto a = i> 1? i:111;
    writeln(a);
    int b = 1;
	switch(a){
		case 1:
			writefln("i is %d",i);
			break;
        case 2:
            writeln("in 2");
            switch(b){
                case 0:
                    writeln("case b=0");
                    break;
                case 1:
                    writeln("case b=1");
                    break;
                default:
                    writeln("case other");
                    break;
            }
            break;
		default:
			break;
	}






    return 0;
}
