import std.stdio;
import std.string;


class Stack(T){
private:
	T[] elem;

public:
	void pop(){
		--elem.length;
	}
	T top() const @property{
		return elem[$-1];
	}
	void push(T e){
		elem ~= e;
	}
	size_t length() const @property{
		return elem.length;
	}
}
void main(){
	auto stack = new Stack!string;
	stack.push("n1");
	stack.push("n2");
	writeln(stack.top);
	writeln(stack.length);
	stack.pop;
	writeln(stack.top);
	writeln(stack.length);

	auto stack2 = new Stack!int;
	stack2.push(1);
	stack2.push(2);
	writeln(stack2.top);
	writeln(stack2.length);


}

