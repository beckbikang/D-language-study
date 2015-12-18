import std.stdio;
import std.string;
import std.file;

void testFile(){
   string filename = "d_test.log";
   File fp = File(filename,"w+");
   fp.writeln("hi");
   fp.writeln("tom");
   fp.close();
   fp = File(filename,"r");
   while(!fp.eof()){
      string line = chomp(file.readln());
      writeln("line -", line);
   }


   fp.close();
}





void main()
{
   File file = File("test.txt", "w");

   file.writeln("hello");
   file.writeln("world");

   file.close();

   file = File("test.txt", "r");
   
   while (!file.eof()) 
   {
      string line = chomp(file.readln());
      writeln("line -", line);
   }

}
