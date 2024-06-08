#include <iostream>

int main()
{
    int arr[5] = {1, 2, 3, 4, 5};
    std::cout << arr[-1] << std::endl; // Out of bound access (negative index)
    return 0;
}