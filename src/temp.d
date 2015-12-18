import std.stdio;

void myput(T)(T value){
	writeln(value);
}
void myput2(T1,T2)(T1 value,T2 value2){
	writeln(value,value2);
}
void testput(){
	myput(1);
	myput(1.1);
	myput("str");
}

void main(){
	testput();
	myput2(1,"str");

}