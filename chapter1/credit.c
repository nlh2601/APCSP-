// Nathanael Hui
// 11/19/24
// period 4
// credit lab

#include <cs50.h>
#include <stdio.h>

int main(void)
{

    // TODO: Declare all variables
    long creditCardNum = 0;
    long tempCreditCardNum = 0;
    long temp = 0;
    int creditCardNumLength = 0;
    int total = 0;
    int remainder = 0;
    // Prompts for a credit card number and store as a long
    creditCardNum = get_long("Credit Card Number: ");

    temp = creditCardNum;
    tempCreditCardNum = creditCardNum;
    // seting up temporary numbers

    while (temp > 0)
    {
        temp /= 10;
        creditCardNumLength++;
    }

    // validates the checksum

    for (int i = creditCardNumLength / 2; i >= 0; i--)
    {
        remainder = tempCreditCardNum % 10;
        tempCreditCardNum /= 10;
        total += remainder;

        remainder = tempCreditCardNum % 10;
        tempCreditCardNum /= 10;
        remainder = remainder * 2;
        if (remainder > 9)
        {
            total += (remainder - 9);
        }
        else
        {
            total += remainder;
        }
    }

    // Validate the card length and starting digits(to determine CC company)
    // checks if the first digit or first two digits of the number are valid
    if (total % 10 == 0)
    {
        if (creditCardNumLength == 15)
        {
            if (creditCardNum / 10000000000000 == 34 || creditCardNum / 10000000000000 == 37)
            {
                printf("AMEX\n");
            }
            else
            {
                printf("INVALID\n");
            }
        }
        else if (creditCardNumLength == 16)
        {
            if (creditCardNum / 100000000000000 >= 51 && creditCardNum / 100000000000000 <= 55)
            {
                printf("MASTERCARD\n");
            }
            else if (creditCardNum / 1000000000000000 == 4)
            {
                printf("VISA\n");
            }
            else
            {
                printf("INVALID\n");
            }
        }
        else if (creditCardNumLength == 13)
        {
            if (creditCardNum / 1000000000000 == 4)
            {
                printf("VISA\n");
            }
            else
            {
                printf("INVALID\n");
            }
        }
        else
        {
            printf("INVALID\n");
        }
    }
    else
    {
        printf("INVALID\n");
    }
    // prints credit card company or “INVALID”
}
