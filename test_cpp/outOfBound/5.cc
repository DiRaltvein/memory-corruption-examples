#include <iostream>

int main()
{
    int *arr = new int[5]{1, 2, 3, 4, 5};
    delete[] arr;
    std::cout << arr[0] << std::endl; // Undefined behavior, accessing deleted memory
    return 0;
}