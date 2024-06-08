#include <iostream>

int main()
{
    int arr[3] = {10, 20, 30};
    int *p = arr;
    std::cout << *(p + 3) << std::endl; // Out of bound access (valid range: p to p+2)
    return 0;
}