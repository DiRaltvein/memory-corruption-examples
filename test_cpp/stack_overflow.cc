#include <iostream>
#include <string.h>

int main(int argc, char *argv[])
{
    int pass = 0;
    char buff[15];

    std::cout << "Enter the password :";
    std::cin >> buff;

    if (strcmp(buff, "some_password"))
    {
        std::cout << "Wrong Password" << std::endl;
    }
    else
    {
        std::cout << "Correct Password" << std::endl;
        pass = 1;
    }

    if (pass)
    {
        std::cout << "Root privileges given to the user" << std::endl;
    }
}