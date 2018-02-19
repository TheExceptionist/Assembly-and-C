#include <iostream>

using namespace std;

//Anything in rax c++ reads as the return value

extern "C" int SomeFunction();

int main() {
	cout << "The result is: " << SomeFunction() << endl;

	return 0;
}