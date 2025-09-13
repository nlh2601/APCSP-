// Nathanael Hui
// 12/13/24
// Period 4
// Caesar lab

#include <cs50.h>
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// defining function
string caesar_converter(string a, int b);

int main(int argc, string argv[])
{
    // checks if there are 2 arguments and there are no non numerical numbers; if there is, then
    // return1
    if (argc == 2)
    {
        for (int j = 0; j < strlen(argv[1]); j++)
        {
            if (isalpha(argv[1][j]))
            {
                // shows correct formatting
                printf("Usage: ./caesar key\n");
                return 1;
            }
        }
        string caesarString = get_string("plaintext: ");
        caesar_converter(caesarString, atoi(argv[1]));
        printf("ciphertext: %s\n", caesarString);
        return 0;
    }
    else
    {
        // shows correct formatting
        printf("Usage: ./caesar key\n");
        return 1;
    }
}

// defining function
string caesar_converter(string a, int b)
{
    // for loop that sets a[i] to the 0-25 position, where a = 0, adds the shift, gets the remainder
    // of / 26 with %26 and adds it back to a or A.
    for (int i = 0; i < strlen(a); i++)
    {
        if (isalpha(a[i]))
        {
            if (isupper(a[i]))
            {
                a[i] = 65 + (a[i] - 65 + b) % 26;
            }
            else if (islower(a[i]))
            {
                a[i] = 97 + (a[i] - 97 + b) % 26;
            }
        }
    } // then returns it back to main
    return a;
}
