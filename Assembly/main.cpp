#include <iostream>

using namespace std;

//Anything in rax c++ reads as the return value

extern "C" int SomeFunction();
extern "C" int RegTest();
extern "C" int ByteTest();
extern "C" int MovTest();
extern "C" int MathTest();
extern "C" int JumpTest();
extern "C" int IntegerTest(int a);

int main() {
	cout << "The result is: " << SomeFunction() << endl;
	cout << "RegTest: " << RegTest() << endl;
	cout << "ByteTest: " << ByteTest() << endl;
	cout << "MovTest: " << MovTest() << endl;
	cout << "MathTest: " << MathTest() << endl;
	//cout << "JumpTest: " << JumpTest() << endl;
	cout << "ParamTest: " << IntegerTest(27) << endl;

	return 0;
}