// Nathanael Hui
// 12/13/24
// Period 4
// Caesar lab

#include <cs50.h>
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// declaring function
string vigenere_converter(string a, string b);

int main(int argc, string argv[])
{
    // checks if there are 2 arguments and there are no  numerical numbers; if there is, then
    // return1
    if (argc == 2)
    { // forloop to check each individual character
        for (int j = 0; j < strlen(argv[1]); j++)
        {
            if (isdigit(argv[1][j]))
            {
                // shows correct formatting
                printf("Usage: ./vigenere key\n");
                return 1;
            }
        }
        // gets string, plugs into function, then outputs function
        string plaintext = get_string("plaintext: ");
        vigenere_converter(plaintext, argv[1]);
        printf("ciphertext: %s\n", plaintext);
        return 0;
    }
    else
    {
        // shows correct formatting
        printf("Usage: ./vigenere key\n");
        return 1;
    }
}

// defining function
string vigenere_converter(string a, string b)
{ // making a counter for the position of the second string
    int counter = 0;
    for (int i = 0; i < strlen(a); i++)
    { // is a letter
        if (isalpha(a[i]))
        { // only goes up to the length of the shifter
            counter = counter % strlen(b);
            if (isupper(a[i]))
            { // basically the same equation as the cesar code, but instead of adding b, i add the
              // position of b (in lower)
                a[i] = (a[i] - 65 + ((int) tolower(b[counter]) - 97)) % 26 + 65;
            }
            else if (islower(a[i]))
            {
                a[i] = (a[i] - 97 + ((int) tolower(b[counter]) - 97)) % 26 + 97;
            }
            counter++;
        }
    }
    return a;
}
