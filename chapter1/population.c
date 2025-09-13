// Nathanael Hui
// ​​11/6/24
// period 4
// population lab

#include <cs50.h>
#include <stdio.h>

int main(void)
{
    // Declaring variables
    int startAmount;
    int endAmount;
    int years = 0;

    // Prompts for population start size
    // do-while = does the action until while is satisfied
    do
    {
        startAmount = get_int("Start size: ");
    }
    while (startAmount < 9);

    // Prompts for population end size
    do
    {
        endAmount = get_int("End size: ");
    }
    while (endAmount < startAmount);

    // Calculates number of years until we reach threshold
    // eqn = n + n/3 - n/4
    if (startAmount < endAmount)
    {
        do
        {
            startAmount = startAmount + startAmount / 3 - startAmount / 4;
            years += 1;
        }
        while (startAmount < endAmount);
    }
    // Print number of years
    printf("Years: %i\n", years);
}
