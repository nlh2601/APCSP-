// Nathanael Hui
// 12/2/24
// period 4
// cash lab

#include <cs50.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, string argv[])
{

    if (argc == 4) // 3 are the num, operator, num, but the fourth one is the first one (./calc)
    {
        float answer = 0.0;
        float first = atof(argv[1]);
        float third = atof(argv[3]);
        char second = argv[2][0];
        // setting up variables

        // checks what operater the second argument (the operator) is and preforms the operation
        if (second == '+')
        {
            answer = first + third;
        }
        else if (second == '-')
        {
            answer = first - third;
        }
        else if (second == 'x')
        {
            answer = first * third;
        }
        else if (second == '/')
        {
            answer = first / third;
        }
        else if (second == '%')
        {
            answer = first - (third * ((int) (first / third)));
        }
        else
        {
            printf("Invalid operator\n");
            return 1;
            // if doesnt follow any operators, prints invalid and returns invalid
        }
        printf("%f\n", answer);
        return 0;
        // prints result, returns valid
    }
    else
    {
        printf("Argument Error\n");
        return 1;
        // if doesn't have 4 arguments, then returns invalid
    }
}
