// Nathanael Hui
// 11/19/24
// period 4
// isbn lab

#include <cs50.h>
#include <stdio.h>

int main(void)
{
    // Declares variables
    long isbn;
    long adder;
    long total = 0;
    long remainder;

    // Asks for an ISBN-10
    isbn = get_long("isbn: ");

    // Determines if input number is a valid ISBN
    remainder = isbn % 10;
    for (int i = 9; i > 0; i--)
    {
        isbn = isbn / 10;
        adder = (isbn % 10) * i;
        total += adder;
    } // gets the remainder, multiplies it by the value i, then adds to the total
    // gets the remainder
    total %= 11;

    // Outputs “YES” or “NO” based on the result
    if (total == remainder)
    {
        printf("YES\n");
    }
    else
    {
        printf("NO\n");
    }
}
