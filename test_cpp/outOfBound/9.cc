#include <iostream>
#include <vector>

int main()
{
    std::vector<int> vec = {1, 2, 3, 4, 5};
    std::cout << vec.at(6) << std::endl; // Throws std::out_of_range exception
    return 0;
}