amounts = [125.5, -25.0, 900.0, 42.0];
average = mean(amounts);
negative_amounts = sum(amounts < 0);
disp(table(average, negative_amounts));
