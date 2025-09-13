// Nathanael Hui
// 11/8/24
// Pennies Lab
// Period 4

#include <cs50.h>
#include <stdio.h>

int main(void)
{
    // setting up variables
    int monthDays;
    double startingPennies;
    double totalPennies = 0;
    double currentPennies;
    int time = 0;

    // asks for the number of days in the month: 28, 29, 30, or 31
    // do something while (condition) structure
    do30
    {
        monthDays = get_int("Days in month: ");
    }
    while (monthDays != 28 && monthDays != 29 && monthDays != 30 && monthDays != 31);

    // asks for the number of pennies on the first day
    do
    {
        startingPennies = get_int("Pennies on first day: ");
    }
    while (startingPennies < 1);

    // adds the total pennies over the days
    currentPennies = startingPennies;
    while (time < monthDays)
    {
        totalPennies += currentPennies;
        currentPennies *= 2;
        time += 1;
    } // doubles the pennies for each day by current pennies * 2

    // converts total pennies to dollars (by dividing by 100) and prints result
    printf("$%.2f\n", totalPennies / 100);
}
