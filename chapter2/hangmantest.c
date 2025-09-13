#define _DEFAULT_SOURCE
#include <cs50.h>
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

bool hangmanChecker(char a, string b);

int main(void)
{
    string wordBank[] = {
        "hook",    "insult",  "reason",       "enlighten",  "ponder",     "ratty",     "powerful",
        "certain", "alive",   "utter",        "annoyed",    "laughable",  "gold",      "squalid",
        "cope",    "shoe",    "uninterested", "glistening", "gainsay",    "spark",     "spit",
        "shock",   "thread",  "melted",       "net",        "impartial",  "expand",    "withdraw",
        "solid",   "watery",  "things",       "structure",  "tremendous", "saponify",  "flock",
        "juice",   "kittens", "chairs",       "quill",      "abnormal",   "obscene",   "loose",
        "control", "spring",  "grass",        "gash",       "healthy",    "committee", "blue",
        "hue"};
    srandom(time(NULL));
    bool correctChecker = false;
    int randomNum = ((random() / ((double) RAND_MAX + 1)) * 50);
    int wordLength = strlen(wordBank[randomNum]);
    char correctBank[wordLength + 1];
    int counter = 0;
    int wrongCounter = 0;
    char wrongBank[26];
    for (int i = 0; i < wordLength; i++)
    {
        correctBank[i] = '#';
    }
    correctBank[wordLength] = '\0';
    printf("Tutorial: Enter a character to guess the word. You have a max of 8 incorrect guesses.\n");
    printf("The Word: ");
    printf("%s\n", correctBank);
    do
    {

        char guess = get_char("guess: ");
        if (guess == '`')
        {
            return 0;
        }
        bool checker = hangmanChecker(tolower(guess), wordBank[randomNum]);
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
            }
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
            }
            printf("%s\n", correctBank);
        }
        if (strcmp(correctBank, wordBank[randomNum]) == 0)
        {
            correctChecker = true;
        }
        if (isalpha(wrongBank[7]))
        {
            printf("You Lose :(\n(o_o)\n/| |/\n / /\nThe word was: %s\n", wordBank[randomNum]);
            return 0;
        }
    }
    while (correctChecker == false);
    if (correctChecker == true)
    {
        printf("You Win! :) The Word Was: %s\n", wordBank[randomNum]);
    }
    return 0;
}

bool hangmanChecker(char a, string b)
{
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
