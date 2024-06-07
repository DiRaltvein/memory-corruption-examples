#include <iostream>

int main()
{
    int *ptr = new int;
    *ptr = 23;
    delete ptr;
    std::cout << *ptr << std::endl;
}