#include <stdio.h>
#include <stdlib.h>
#include "calc.h"
int main(void) {
    int *arr = malloc(10 * sizeof(int));   /* free 안 함 */
    for (int i = 0; i < 10; i++) arr[i] = add(i, i);
    printf("arr[9] = %d\n", arr[9]);
    free(arr);
    return 0;
}
