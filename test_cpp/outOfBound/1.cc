#include <iostream>

int main()
{
    int arr[5] = {1, 2, 3, 4, 5};
    std::cout << arr[5] << std::endl; // Out of bound access (valid indices: 0-4)
    return 0;
}