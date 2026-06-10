#include <stdio.h>

int main(void) {
    double amounts[] = {125.5, -25.0, 900.0, 42.0};
    int n = 4;
    double sum = 0.0;
    int negative = 0;
    for (int i = 0; i < n; i++) {
        sum += amounts[i];
        if (amounts[i] < 0) negative++;
    }
    printf("average=%.2f negative_amounts=%d\n", sum / n, negative);
    return 0;
}
