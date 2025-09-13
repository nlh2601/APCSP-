// Nathanael Hui
// 11/22/24
// period 4
// Initials lab

#include <cs50.h>
#include <ctype.h>
#include <stdio.h>
#include <string.h>

int main(void)
{

    // Setting up variables
    string name;
    int counter = 0;
    char initials[counter];
    int nameLength = counter;

    // Asks for a name
    name = get_string("Name: ");
    nameLength = strlen(name);

    // Extracts all of the initials from the name
    for (int i = 0; i < nameLength; i++)
    {
        if ((i == 0 || name[i - 1] == ' ') && isalpha(name[i]))
        {
            initials[counter] = toupper(name[i]);
            counter++;
        }
    }

    printf("%s\n", initials);
    // Prints initials in UPPERCASE
}
