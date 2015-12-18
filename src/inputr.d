import std.stdio;
import std.string;

struct Student
{
   string name;
   int number;
   string toString() const
   {
     return format("%s(%s)", name, number);
   }
}

struct School
{
   Student[] students;
}

struct StudentRange
{
   Student[] students;

   this(School school)
   {
     this.students = school.students;
   }

   @property bool empty() const
   {
     return students.length == 0;
   }

   @property ref Student front()
   {
     return students[0];
   }

   void popFront()
   {
     students = students[1 .. $];
   }
}

void main(){
   auto school = School( [ Student("Raj", 1), Student("John", 2) , Student("Ram", 3) ] );

   auto range = StudentRange(school);
   writeln(range);

   writeln(school.students.length);

   writeln(range.front);

   range.popFront;

   writeln(range.empty);
   writeln(range);
}