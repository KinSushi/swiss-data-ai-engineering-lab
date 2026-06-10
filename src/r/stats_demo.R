amounts <- c(125.5, -25.0, 900.0, 42.0)
average <- mean(amounts)
negative_amounts <- sum(amounts < 0)
print(list(average = average, negative_amounts = negative_amounts))
