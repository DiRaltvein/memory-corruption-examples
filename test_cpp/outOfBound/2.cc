#include <iostream>
#include <vector>

int main()
{
    std::vector<int> vec = {1, 2, 3, 4, 5};
    std::cout << vec[5] << std::endl; // Out of bound access (valid indices: 0-4)
    return 0;
}