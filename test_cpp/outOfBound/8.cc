#include <iostream>
#include <array>

int main()
{
    std::array<int, 5> arr = {1, 2, 3, 4, 5};
    std::cout << arr.at(5) << std::endl; // Throws std::out_of_range exception
    return 0;
}