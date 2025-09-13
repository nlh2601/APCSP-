// Nathanael Hui
// 11/19/24
// period 4
// credit lab

#include <cs50.h>
#include <stdio.h>

int main(void)
{

    // TODO: Declare all variables
    long creditCardNum;
    long tempCreditCardNum;
    long temp;
    int creditCardNumLength = 0;
    int total = 0;
    int remainder;
    // TODO: Prompt for a credit card number and store as a long (may assume all numeric)
    creditCardNum = get_long("Credit Card Number: ");

    temp = creditCardNum;
    tempCreditCardNum = creditCardNum;
    while (temp > 0)
    {
        temp /= 10;
        creditCardNumLength++;
    }
    // TODO: validate the checksum
    for (int i = creditCardNumLength; tempCreditCardNum > 0; i--)
    {
        remainder = tempCreditCardNum % 10;
        if (i % 2 == 1)
        {
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
        else
        {
            total += remainder;
        }
        tempCreditCardNum /= 10;
    }

    // TODO: Validate the card length and starting digits(to determine CC company)
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
            if (creditCardNum / 100000000000 == 4)
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
    // TODO: Print credit card company or “INVALID”
}
