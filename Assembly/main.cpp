#include <iostream>

using namespace std;

//Anything in rax c++ reads as the return value

extern "C" int SomeFunction();
extern "C" int RegTest();
extern "C" int ByteTest();
extern "C" int MovTest();
extern "C" int MathTest();

int main() {
	cout << "The result is: " << SomeFunction() << endl;
	cout << "RegTest: " << RegTest() << endl;
	cout << "ByteTest: " << ByteTest() << endl;
	cout << "MovTest: " << MovTest() << endl;
	cout << "MathTest: " << MathTest() << endl;

	return 0;
}