package main

import "fmt"

func main() {
    amounts := []float64{125.5, -25.0, 900.0, 42.0}
    sum := 0.0
    negative := 0
    for _, value := range amounts {
        sum += value
        if value < 0 {
            negative++
        }
    }
    fmt.Printf("average=%.2f negative_amounts=%d\n", sum/float64(len(amounts)), negative)
}
