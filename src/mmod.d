import company.employee;
import college.employee;

import std.stdio;

void main()
{
   auto myemployee1 = new company.employee.Employee();
   myemployee1.str = "emp1";
   myemployee1.print();

   auto myemployee2 = new college.employee.Employee();
   myemployee2.str = "emp2";
   myemployee2.print();
}