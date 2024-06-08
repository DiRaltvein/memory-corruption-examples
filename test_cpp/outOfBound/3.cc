#include <iostream>
#include <string>

int main()
{
    std::string str = "hello";
    std::cout << str[5] << std::endl; // Out of bound access (valid indices: 0-4)
    return 0;
}