k,// Nathanael Hui
// 11/22/24
// Period 4
// Scrabble lab

#include <cs50.h>
#include <ctype.h>
#include <math.h>
#include <stdio.h>
#include <string.h>

// declaring functions
int count_letters(string a);
int count_words(string a);
int count_sentences(string a);

int main(void)
{
    // declaring varaibles
    float letterPer100Words;
    float sentencePer100Words;
    float gradeLevel;
    int gradeLevelInt;
    // getting variables
    string text = get_string("Text: ");
    // plugging text into functions
    int letterAmt = count_letters(text);
    int wordAmt = count_words(text);
    int sentenceAmt = count_sentences(text);
    // calculating the necessary valies
    letterPer100Words = (float) letterAmt / wordAmt * 100;
    sentencePer100Words = (float) sentenceAmt / wordAmt * 100;
    // plug into equation
    gradeLevel = (0.0588 * letterPer100Words) - (0.296 * sentencePer100Words) - 15.8;
    gradeLevel = round(gradeLevel);
    // round and make into int
    gradeLevelInt = gradeLevel;

    // if before 1, before grade 1, if 16 or after, print 16+, else print grade
    if (gradeLevelInt < 1)
    {
        printf("Before Grade 1\n");
    }
    else if (gradeLevelInt >= 16)
    {
        printf("Grade 16+\n");
    }
    else
    {
        printf("Grade %i\n", gradeLevelInt);
    }
}
// defining functions
int count_letters(string a)
{
    int textCount = strlen(a);
    int letters = 0;
    for (int i = 0; i < textCount; i++)
    {
        if (isalpha(a[i]))
        // if is letter then add
        {
            letters++;
        }
    }
    return letters;
}
int count_words(string a)
{
    int textCount = strlen(a);
    int words = 0;
    for (int i = 0; i < textCount; i++)
    {
        if (isspace(a[i]) || i == 0)
        // if is a space or is the first one then add
        {
            words++;
        }
    }
    return words;
}
int count_sentences(string a)
{
    int textCount = strlen(a);
    int sentences = 0;
    for (int i = 0; i < textCount; i++)
    {
        if (ispunct(a[i]) && (a[i] == '.' || a[i] == '!' || a[i] == '?'))
        // if is a punctuation and is a . or ! or ? then add
        {
            sentences++;
        }
    }
    return sentences;
}
