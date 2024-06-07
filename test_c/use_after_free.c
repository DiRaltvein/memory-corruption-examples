#include <stdlib.h>
#include <stdio.h>

int main()
{
    int *value = malloc(sizeof(int));
    free(value);
    *value = 1;
}