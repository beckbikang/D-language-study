import std.stdio;
interface ShapeNew{
public:
	void setWidth(int w);
    void setHeight(int h);
    static void myfunction1(){
    	writeln("This is a static method");
    }
    final void myfunction2(){
    	writeln(" f2 ");
    }


}
// Base class
interface Shape
{
   public:
      void setWidth(int w);
      void setHeight(int h);
      static void myfunction1()
      {
         writeln("This is a static method");
      }
      final void myfunction2()
      {
         writeln("This is a final method");
      }
}

// Derived class
class Rectangle: ShapeNew
{
   int width;
   int height;
   public:
      void setWidth(int w)
      {
         width = w;
      }
      void setHeight(int h)
      {
         height = h;
      }

      int getArea()
      {
         return (width * height);
      }
}

void main()
{
   Rectangle rect = new Rectangle();

   rect.setWidth(5);
   rect.setHeight(7);

   // Print the area of the object.
   writeln("Total area: ", rect.getArea());
   rect.myfunction1();
   rect.myfunction2();
}