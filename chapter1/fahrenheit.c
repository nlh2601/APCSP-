//Nathanael Hui
//11/6/24
//period 4
//Fahrenheit lab


#include<stdio.h>
#include<cs50.h>


int main(void){

    //setting variables
    int converterDecider;
    float firstNum;

    //determining the converter type
    converterDecider = get_int("Enter 1 for Fahrenheit -> Celcius, Enter 2 for Celcius -> Fahrenheit, Enter other number to cancel: ");

    if (converterDecider == 1){
        //asks for fahrenheit, converts it then outputs it as celcius
        firstNum = get_float("What is your Fahrenheit value? ");
        firstNum = ((firstNum - 32) * 5/9);
        printf("This is your converted temperature: %.1f\n", firstNum);
        // F to C equation provided from google’s temperature calculator
    } else if (converterDecider == 2){
        //asks for celcius, converts it then outputs it as fahrenheit
        firstNum = get_float("What is your Celcius value? ");
        firstNum = ((firstNum * 9/5) + 32);
        printf("This is your converted temperature: %.1f\n", firstNum);
        // C to F equation provided from google’s temperature calculator
    }
    //the code stops if a different number is pressed due to there not being any code for it to go to
}
