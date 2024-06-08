#include <iostream>

int main()
{
    int arr[5] = {1, 2, 3, 4, 5};
    for (int i = 0; i <= 5; ++i)
    {
        std::cout << arr[i] << std::endl; // Out of bound on last iteration (i == 5)
    }
    return 0;
}