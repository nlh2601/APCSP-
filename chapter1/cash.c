// Nathanael Hui
// 11/12/24
// Period 4
// cash Lab

#include <cs50.h>
#include <math.h>
#include <stdio.h>

int main(void)
{
    // Declares all variables
    int cents;
    int coins = 0;
    double startingAmount;

    // Prompts for change in dollars and cents
    do
    {
        startingAmount = get_float("Change owed: ");
    }
    while (startingAmount <= 0);
    startingAmount *= 100;
    // round rounds to the nearest interger
    cents = round(startingAmount);
    // printf("%i\n",cents);
    //  Converts dollars and cents (float) to cents (int)
    while (cents >= 25)
    {
        cents -= 25;
        coins++;
    }
    while (cents >= 10)
    {
        cents -= 10;
        coins++;
    }
    while (cents >= 5)
    {
        cents -= 5;
        coins++;
    }
    while (cents >= 1)
    {
        cents -= 1;
        coins++;
    }
    // Calculates minimum number of coins

    // Prints number of coins
    printf("%i\n", coins);
}
