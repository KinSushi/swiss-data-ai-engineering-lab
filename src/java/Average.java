public class Average {
    public static void main(String[] args) {
        double[] amounts = {125.5, -25.0, 900.0, 42.0};
        double sum = 0.0;
        int negative = 0;
        for (double amount : amounts) {
            sum += amount;
            if (amount < 0) negative++;
        }
        System.out.printf("average=%.2f negative_amounts=%d%n", sum / amounts.length, negative);
    }
}
