/*
属性	描述
.init	静态数组返回一个数组字面量的字面即数组元素类型。初始化属性中的每个元素。
.sizeof	静态数组返回数组的长度乘以每个数组元素的字节数，而动态数组返回动态数组的引用，在32位版本大小为8，在64位版本的大小为16。
.length	静态数组返回，而动态数组是用来获取/设置数组中的元素个数数组中元素的个数。长度的类型为size_t。
.ptr	返回一个指向数组的第一个元素。
.dup	创建同样大小的动态数组及数组中的内容复制到其中。
.idup	创建同样大小的动态数组及数组中的内容复制到其中。该副本的类型为是不可变的。
.reverse	在当前位置倒转数组中的元素的顺序。返回数组。
.sort	在这里各种阵列中的元素的顺序。返回数组。
*/
import std.stdio;

void testDoubleArr(){
	// an array with 5 rows and 2 columns.
   int a[5][2] = [ [0,0], [1,2], [2,4], [3,6],[4,8]];
   // output each array element's value                      
   for ( int i = 0; i < 5; i++ )
      for ( int j = 0; j < 2; j++ )
      {
         writeln( "a[" , i , "][" , j , "]: ",a[i][j]);
      } 
}
void testarrCopy(){
	 // an array with 5 elements.
   double a[5] = [1000.0, 2.0, 3.4, 17.0, 50.0];
   double b[5];
   writeln("Array a:",a);
   writeln("Array b:",b);

   b = a;
   writeln("Array b:",b);
   b[0] = 1;
   writeln("Array a:",a);

   b[] = a;      // the 5 elements of a[5] are copied into b[5]
   writeln("Array b:",b);

   b[] = a[];   // the 5 elements of a[3] are copied into b[5]
   writeln("Array b:",b);

   b[1..2] = a[0..1]; // same as b[1] = a[0]
   writeln("Array b:",b);

   b[0..2] = a[1..3]; // same as b[0] = a[1], b[1] = a[2]
   writeln("Array b:",b);

   double aa[5];
   aa[] = 5;
   writeln("Array aa:",aa);
   double[] c;
   c = a~b;
   writeln("Array c:",c);
}

void testmyre(){
	int[string] arr;
	arr["a"] = 2;
	arr["b"] = 1;
	writeln("sizeof:",arr.sizeof,arr.length);
	writeln(arr.dup,arr.keys,arr.values);
	writeln(arr.rehash);
	foreach(key;arr.keys){
		writeln(key);
	}
	foreach(val;arr.values){
		writeln(val);
	}
	writeln(arr.get("d",11));
	arr.remove("a");
	writeln(arr);

}

void testarrRelate(){
	int[string] array1;
   array1["test"] = 3;
   array1["test2"] = 20;
   writeln("sizeof: ",array1.sizeof);
   writeln("length: ",array1.length);
   writeln("dup: ",array1.dup);


   array1.rehash;
   writeln("rehashed: ",array1);

   writeln("keys: ",array1.keys);
   writeln("values: ",array1.values);

   foreach (key; array1.byKey) {
      writeln("by key: ",key);
   }

   foreach (value; array1.byValue) {
      writeln("by value ",value);
   }

   writeln("get value for key test: ",array1.get("test",10));
   writeln("get value for key test3: ",array1.get("test3",10));

   array1.remove("test");
   writeln(array1);
}

void testarr(){
	int n[5];
	for(int i=0;i<5;i++){
		n[i] = i+1;
	}
	writeln("Initialized value:",n.init);
	writeln(n.length,",",n.sizeof,n.ptr,n.dup,n.idup,n.reverse.dup,n.sort);
	writeln(n[0..3]);
}
//(a)我们定义一个指针变量(b)分配一个变量的地址的指针(c)在指针变量中可用的地址最终进入的值。
//这是通过使用一元运算符*，返回位于其操作数指定的地址变量的值来完成。
void testPoint(){
	 int  p;
   writeln("Address of var1 variable: ",&p);

   char p2[10];
   writeln("Address of var2 variable: ",&p2);
   int *pnull = null;
   writeln("pnull",pnull);
}
void testPonitNext(){
	int arr[3] = [1,2,3];
	//int *ptr = &arr; error
	int *ptr = &arr[0];
	arr.ptr[1] = 101;
	for(int i=0;i<3;i++,ptr++){
		writeln("Address is var[",i,"] ",ptr);
		writeln("value of var[",i,"]",*ptr);
	}
	
}

double myavge(int *arr,int size){
	double avg = 0,sum = 0;
	for(int i=0;i<size;i++){
		sum += arr[i];
	}
	avg = sum/size;
	return avg;
}
void testPointParam(){
	int arr[3] = [12,2,3];
	writeln(myavge(&arr[0],3));
}


void pointToPoint(){
	int  var = 3000;
	writeln("Value of var :" , var);
	int  *ptr = &var;
	writeln("Value available at *ptr :" ,*ptr);
	int  **pptr = &ptr;
	writeln("Value available at **pptr :",**pptr);
}

void testPonitNextMore(){
	int arr[3] = [1,2,3];
	int *ptr = &arr[0];
	arr.ptr[1] = 101;
	for(int i=0;i<3;i++){
		writeln("Address is var[",i,"] ",ptr+i);
		writeln("value of var[",i,"]",*(ptr+i));
	}
}

int *getNumber(){
	static int arr[10];
	for(int i=0;i<10;i++){
		arr[i] = i;
	}
	return &arr[0];
}

void testReturnPoint(){
	int *ptr = getNumber();
	for(int i=0;i<10;i++){
		writeln("Address is var[",i,"] ",ptr+i);
		writeln("value of var[",i,"]",*(ptr+i));
	}
}

void pointToArr(){
   double balance[5] = [1000.0, 2.0, 3.4, 17.0, 50.0];
   double *p;
   p = &balance[0];
   for ( int i = 0; i < 5; i++ )
   {
      writeln( "*(p + ", i, ") : ", *(p + i));
   }
}

void main(string[] argv){
	pointToArr();
}