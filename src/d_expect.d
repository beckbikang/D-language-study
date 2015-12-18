import std.stdio;


void main() {
	try{
		int a =1;
		int b =0;
		if(b == 0){
			throw new Exception("divide by zero");
		}
	}catch(Exception e){
		writeln("catche exception divide by zero");
	}	

}