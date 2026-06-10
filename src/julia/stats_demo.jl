using Statistics

amounts = [125.5, -25.0, 900.0, 42.0]
average = mean(amounts)
negative_amounts = count(x -> x < 0, amounts)
println((average=average, negative_amounts=negative_amounts))
