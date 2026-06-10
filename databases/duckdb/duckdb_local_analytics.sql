-- DuckDB can query local CSV/Parquet files directly.
SELECT currency, COUNT(*) AS n, SUM(amount) AS total_amount
FROM read_csv_auto('data/raw/transactions.csv')
GROUP BY currency
ORDER BY n DESC;
