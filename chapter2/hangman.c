// Nathanael Hui
// 1/15/25
// Period 4
// Unit Project

#define _DEFAULT_SOURCE
// defines for random() function to be used in stdlib
#include <cs50.h>
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

bool hangmanChecker(char a, string b);
// declaring function

int main(void)
{
    string wordBank[] = {
        "hooked",  "insult",  "reason",       "enlighten",  "ponder",     "ratty",     "powerful",
        "certain", "alive",   "utter",        "annoyed",    "laughable",  "gold",      "squalid",
        "cope",    "shoe",    "uninterested", "glistening", "gainsay",    "spark",     "umbrella",
        "shock",   "thread",  "melted",       "scrawny",    "impartial",  "expand",    "withdraw",
        "solid",   "watery",  "things",       "structure",  "tremendous", "saponify",  "flock",
        "juice",   "kittens", "chairs",       "quill",      "abnormal",   "obscene",   "loose",
        "control", "spring",  "grass",        "gash",       "healthy",    "committee", "blue",
        "encaged"};
    // wordbank
    srandom(time(NULL));
    int randomNum = ((random() / ((double) RAND_MAX + 1)) * 49);
    // randomizer (new functions) time is used to get a random seed everytime to set the seed for
    // the random function, then the random function uses the equation "int number = (random() /
    // ((double) RAND_MAX + 1)) * N;" stated in the random() cs50 manual for getting random
    // intergers from 0 to N, and I use it to get a random word from the 50 words in the wordbank
    bool correctChecker = false;
    int wordLength = strlen(wordBank[randomNum]);
    char correctBank[wordLength + 1];
    int counter = 0;
    int wrongCounter = 0;
    char wrongBank[26];
    // setting variables
    for (int i = 0; i < wordLength; i++)
    {
        correctBank[i] = '#';
    } // replaces the letters with hashes
    correctBank[wordLength] = '\0'; // sets the last postion of the correctBank to null because some
                                    // issues were occuring where random letters were showing up
    printf("Tutorial: Enter a alphabetical character to guess the word. You have a max of 10 "
           "incorrect guesses. "
           "You can press ` to quit.\n");
    printf("The Word: ");
    printf("%s\n", correctBank);
    // prints tutorial and starts the hangman game
    do
    {

        char guess = get_char("guess: ");
        if (guess == '`')
        {
            return 0;
        } // a quitting function
        bool checker = hangmanChecker(tolower(guess), wordBank[randomNum]);
        // gets a bool whether the guess was in the word or not
        if (isalpha(guess) && checker == false)
        {
            int wrongBankChecker = 0;
            for (int q = 0; q < strlen(wrongBank); q++)
            {
                if (guess == wrongBank[q])
                {
                    wrongBankChecker++;
                }
            }
            if (wrongBankChecker == 0)
            {
                wrongBank[counter] = tolower(guess);
                counter++;
            }
            printf("Incorrect Guesses : ");
            for (int j = 0; j < strlen(wrongBank); j++)
            {
                if (isalpha(wrongBank[j]))
                {
                    printf("%c", wrongBank[j]);
                }
            } // if false, it adds to the wrongBank and checks if it has already been said. then it
              // prints out the incorrect letters
            printf("\n");
            printf("%s\n", correctBank);
        }
        else if (isalpha(guess) && checker == true)
        {
            for (int i = 0; i < wordLength; i++)
            {
                if (tolower(guess) == wordBank[randomNum][i])
                {
                    correctBank[i] = tolower(guess);
                }
            } // if true, replace the hash(es) with the letter
            printf("%s\n", correctBank);
        }
        if (strcmp(correctBank, wordBank[randomNum]) == 0)
        { // a new function to compare strings (outputs 0 for matches, outputs a non 0 number for
          // doesnt match) and if it does, it sets the checker to true which ends the do while
          // repeat
            correctChecker = true;
        }
        if (isalpha(wrongBank[9]))
        {
            printf("You Lose :(\n(o_o)\n/| |/\n / /\nThe word was: %s\n", wordBank[randomNum]);
            return 0;
        } // a lose statement
    }
    while (correctChecker == false);
    if (correctChecker == true)
    {
        printf("You Win! :) The Word Was: %s\n", wordBank[randomNum]);
    } // ends game if the word inputted and the correct word are the same
    return 0;
}

bool hangmanChecker(char a, string b)
{ // if there are more than one incorrect statements by checking each letter individually with the
  // correct word: it returns false, else it returns true.
    int amountCorrect = 0;
    for (int i = 0; i < strlen(b); i++)
    {
        if (b[i] == a)
        {
            amountCorrect += 1;
        }
        else
        {
            amountCorrect += 0;
        }
    }
    if (amountCorrect > 0)
    {
        return true;
    }
    else
    {
        return false;
    }
}
