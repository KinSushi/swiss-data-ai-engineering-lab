using System;
using System.Linq;

public class QualityDemo
{
    public static void Main()
    {
        double[] amounts = {125.5, -25.0, 900.0, 42.0};
        Console.WriteLine($"average={amounts.Average():F2} negative_amounts={amounts.Count(x => x < 0)}");
    }
}
