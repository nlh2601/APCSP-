// Nathanael Hui
// 11/19/24
// period 4
// mario lab

#include <cs50.h>
#include <stdio.h>

int main(void){

    //setting up variables
    int height;
    int num;
    int spaces;
    int numLeft;

    //do while loop so the height is not 0 or greater than 8
    do{
        height = get_int("height: ");
    }while(height <= 0 || height > 8);
`
    //forloop in a forloop to make each row & prints it out
    for(int i = 1; i <= height; i++){
        spaces = height  - i;
        num = i;
        numLeft = i;
        if(spaces != 0){
            for(int j = 0; j < spaces; j++){
            printf(" ");
            }
        }
        if(num != 0){
            for(int k = 0; k < num; k++){
                printf("#");
            }
            printf("  ");
            for(int l = 0; l < numLeft; l++){
                printf("#");
            }
        }
        printf("\n");
        // prints out a new space
    }





}
