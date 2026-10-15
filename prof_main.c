#include <stdio.h>
#include "calc.h"
int main(void) {
    long long sum = 0;
    for (int i = 1; i <= 50000000; i++) {
        sum += add(i, 1);
        sum += multiply(i, 2) % 7;
        sum += subtract(i, 1);
    }
    printf("sum = %lld, 20/4 = %.2f\n", sum, divide(20, 4));
    return 0;
}
