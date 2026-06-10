fn main() {
    let amounts = vec![125.5, -25.0, 900.0, 42.0];
    let sum: f64 = amounts.iter().sum();
    let negative_amounts = amounts.iter().filter(|x| **x < 0.0).count();
    println!("average={:.2} negative_amounts={}", sum / amounts.len() as f64, negative_amounts);
}
