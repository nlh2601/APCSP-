// Nathanael Hui
// 11/22/24
// Period 4
// Scrabble lab

#include <cs50.h>
#include <ctype.h>
#include <stdio.h>
#include <string.h>

// declaring function
int compute_score(string a);

int main(void)
{

    // Declare variables
    string word1 = get_string("Player 1: ");
    string word2 = get_string("Player 2: ");
    // plug into function
    int player1Score = compute_score(word1);
    int player2Score = compute_score(word2);
    // check statement to see if the scores are bigger than the other; else print tie
    if (player1Score > player2Score)
    {
        printf("Player 1 Wins!\n");
    }
    else if (player2Score > player1Score)
    {
        printf("Player 2 Wins!\n");
    }
    else
    {
        printf("Tie!\n");
    }
}

// defining function
int compute_score(string a)
{
    // set point amounts
    int POINTS[] = {1, 3, 3, 2, 1, 4, 2, 4, 1, 8, 5, 1, 3, 1, 1, 3, 10, 1, 1, 1, 1, 4, 4, 8, 4, 10};
    int total = 0;

    for (int i = 0; i < strlen(a); i++)
    {
        // if the character at position i in the string array is a letter, then add the amount of
        // points (from the point array) at position (toupper)letter - 65
        if (isalpha((char) a[i]))
        {
            total += POINTS[toupper((char) a[i]) - 65];
        }
    }
    return total;
}
