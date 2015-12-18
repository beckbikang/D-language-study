import std.stdio;
class StdT{

}

class Shape{
public:
	double height,weight;
	static int objectCount = 0;
	this(){
		writeln("Shape construct ");
		objectCount++;
	}
	~this(){
		writeln("Shape desonstruct ");
	}

	void setHeight(double height){
		this.height = height;
	}

	void setweight(double weight){
		this.weight = weight;
	}

	double getArea(){
		return height*weight;
	}
	void showData(){
		writeln(show);
	}
	static int getCount(){
		return objectCount;
	}
private:
	string show="hi";
protected:
	double area;
}

class SmallShape:Shape{
public:
	this(){
		writeln("SmallShape construct ");
	}
	~this(){
		writeln("SmallShape desonstruct ");
	}
	double color;

	override double getArea(){
		return height*weight*color;
	}

}

void testclass(){
	Shape s = new Shape();
	s.height = 12;
	s.weight = 10;
	writeln(s.height,s.weight);
	writeln(s.getArea());
	s.showData();
	Shape *ps;
	ps = &s;
	ps.weight=10;
	writeln(ps.weight,s.weight);
	auto s2 = new Shape();
	s2.height = 12;
	s2.weight = 10;
	writeln(s2.height,s2.weight);
	auto small_shape = new SmallShape();
	small_shape.color = 2;
	//writeln(small_shape.getArea());
	writeln(Shape.getCount());

}

void main() {
	testclass();
}