#include <iostream>

int main()
{
    int arr[3][3] = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};
    std::cout << arr[3][0] << std::endl; // Out of bound access (valid indices: 0-2 for both dimensions)
    return 0;
}