import std.stdio;

//mixin (compile_time_generated_string)
string print(string s)
{
   return `writeln("` ~ s ~ `");`;
}
void testmixin(){
	mixin(`writeln("Hello World!");`);
	mixin(print("hi"));
}

template Department(T, size_t count)
{
   T[count] names;

   void setName(size_t index, T name)
   {
      names[index] = name;
   }

   void printNames()
   {
      writeln("The names");

      foreach (i, name; names) 
      {
         writeln(i," : ", name);
      }
   }
}
//mixin a_template!(template_parameters)
struct College
{
   mixin Department!(string, 2);
}
void testCollege(){
	College c = College();

   c.setName(0, "name1");
   c.setName(1, "name2");

   c.printNames();

}
template Person()
{
   string name;
   void print()
   {
      writeln(name);
   }
}

void testTemp()
{
   string name;
   mixin Person a;

   name = "name 1";
   writeln(name);

  a.name = "name 2";
   print();
}

void main()
{
	testTemp();
   
}