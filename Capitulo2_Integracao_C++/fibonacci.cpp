#include <iostream>

using namespace std;

extern "C" long Fibonacci(long a);

int main()
{
    long value = 13;

    cout << "O " << value << " elemento da sequência de Fibonacci: " << Fibonacci(value) << endl;
    return 0;
}