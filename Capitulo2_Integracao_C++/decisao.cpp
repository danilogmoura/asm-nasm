#include <iostream>

using namespace std;

extern "C" int Teste1(int valor1, int valor2);
extern "C" int Teste2(int valor1);

int main()
{

    int valor1 = 30;
    int valor2 = 20;
    int valor3 = 1;

    cout << "Do teste1 foi retornado: " << Teste1(valor1, valor2) << endl;
    cout << "Do teste2 foi retornado: " << Teste2(valor3) << endl;

    return 0;
}