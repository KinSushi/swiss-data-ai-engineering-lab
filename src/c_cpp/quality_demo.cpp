#include <iostream>
#include <vector>
#include <numeric>

int main() {
    std::vector<double> amounts{125.5, -25.0, 900.0, 42.0};
    double sum = std::accumulate(amounts.begin(), amounts.end(), 0.0);
    int negative = 0;
    for (double amount : amounts) {
        if (amount < 0) negative++;
    }
    std::cout << "average=" << sum / amounts.size() << " negative_amounts=" << negative << std::endl;
}
