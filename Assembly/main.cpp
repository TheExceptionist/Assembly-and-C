#include <iostream>

using namespace std;

//Anything in rax c++ reads as the return value

extern "C" int SomeFunction();
extern "C" int RegTest();
extern "C" int ByteTest();

int main() {
	cout << "The result is: " << SomeFunction() << endl;
	cout << "RegTest: " << RegTest() << endl;
	cout << "ByteTest: " << ByteTest() << endl;

	return 0;
}