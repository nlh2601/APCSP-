//Nathanael Hui
//11/4/24
//period 4
//userInput lab

#include<stdio.h>
#include<cs50.h>

int main(void){

    //declaring variables
    string firstName;
    char middleInitial;
    string lastName;
    int age;
    int water;
    int favoriteNumber1;
    int favoriteNumber2;
    int favoriteNumber3;
    int totalNumberAmount;
    float averageNumberAmount;
    int mathQuestion1;
    int mathQuestion2;
    int mathQuestion3;

    //asks for information
    firstName = get_string("What is your name? ");
    middleInitial = get_char("What is your middle initial? ");
    lastName = get_string("What is your last name? ");
    age = get_int("How old are you? ");
    water = get_int("How many bottles of water do you drink a day? ");
    favoriteNumber1 = get_int("What is your favorite number? ");
    favoriteNumber2 = get_int("What is your second favorite number? ");
    favoriteNumber3 = get_int("What is your third favorite number? ");

    //calculates total favorite number amount and average number amount
    totalNumberAmount = favoriteNumber1 + favoriteNumber2 + favoriteNumber3;
    averageNumberAmount = totalNumberAmount/3;

    //math test
    printf("Math test!\n");
    mathQuestion1 = get_int("Question one: What is 5+3? ");
    mathQuestion2 = get_int("Question two: What does your favorite numbers add up to? ");
    mathQuestion3 = get_int("Last question: What is the average of your favorite numbers? ");
    //uses get_(string or int or whatever) and saves it to that respective variable

    //prints out the information
    printf("\n"); //prints a empty line
    printf("Hello %s!\n", firstName);
    printf("Your middle initial is %c\n", middleInitial);
    printf("Your last name is %s\n", lastName);
    printf("Your full name is %s %c. %s\n",firstName, middleInitial, lastName);

    printf("\n");
    printf("You are %i years old\n", age);
    printf("You drink %i bottles of water per day\n", water);

    printf("\n");
    printf("Your favorite number is %i\n", favoriteNumber1);
    printf("Your second favorite number is %i\n", favoriteNumber2);
    printf("Your third favorite number is %i\n", favoriteNumber3);

    //checks if the answers inputted to the quiz is correct or not, and prints if its correct or not
    printf("\n");
    if(mathQuestion1 == 8){
        printf("Question 1 is correct!\n");
    }else{
        printf("Question 1 is incorrect!\n");
    }
    if(mathQuestion2 == totalNumberAmount){
        printf("Question 2 is correct!\n");
    }else{
        printf("Question 2 is incorrect!\n");
    }
    if(mathQuestion3 == averageNumberAmount){
        printf("Question 3 is correct!\n");
    }else{
        printf("Question 3 is incorrect!\n");
    }

    printf("\n");
    printf("What a coincidence! My favorite numbers are also %i, %i, and %i\n", favoriteNumber1, favoriteNumber2, favoriteNumber3);
    //prints out favorite numbers

    printf("\n");
    printf("Nice to meet you %s!\n", firstName);
    //prints out the end sentence
}
