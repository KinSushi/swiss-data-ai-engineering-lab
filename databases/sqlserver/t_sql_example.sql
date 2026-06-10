-- SQL Server / T-SQL awareness example.
SELECT
    currency,
    COUNT(*) AS transaction_count,
    SUM(amount) AS total_amount
FROM dbo.transactions
GROUP BY currency
HAVING COUNT(*) > 10;
