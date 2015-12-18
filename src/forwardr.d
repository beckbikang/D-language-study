import std.array;
import std.stdio;
import std.string;
import std.range;

struct FibonacciSeries
{
   int first = 0;
   int second = 1;
   enum empty = false;   //  infinite range

   @property int front() const
   {
     return first;
   }

   void popFront()
   {
     int third = first + second;
     first = second;
     second = third;
   }

   @property FibonacciSeries save() const
   {
     return this;
   }
}

void report(T)(const dchar[] title, const ref T range)
{
   writefln("%s: %s", title, range.take(5));
}

void main()
{
   auto range = FibonacciSeries();
   report("Original range", range);

   range.popFrontN(2);
   report("After removing two elements", range);

   auto theCopy = range.save;
   report("The copy", theCopy);

   range.popFrontN(3);
   report("After removing three more elements", range);
   report("The copy", theCopy);
}