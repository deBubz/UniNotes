/*******************************************************************************
Program to calculate square root of a number and display on the terminal. Go
through functions predefined in math.h and learn to use it.
*******************************************************************************/

#include <stdio.h>      /* printf, scanf */
#include <math.h>       /* squrt */

int main(void){
    /* TODO: complete */
    double input;

    printf("input number>");
    scanf("%lf", &input);

    printf("sqrt(%lf)=%lf\n", input, sqrt(input));

    return 0;
}
