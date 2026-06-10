-- Missing required values
SELECT COUNT(*) AS missing_required_values
FROM transactions
WHERE transaction_id IS NULL
   OR client_id IS NULL
   OR account_id IS NULL
   OR currency IS NULL
   OR event_timestamp IS NULL;

-- Negative amounts requiring review
SELECT transaction_id, client_id, amount, currency
FROM transactions
WHERE amount < 0;

-- Daily volume by status
SELECT
    DATE_TRUNC('day', event_timestamp) AS day,
    status,
    COUNT(*) AS transaction_count,
    SUM(amount) AS total_amount
FROM transactions
GROUP BY 1, 2
ORDER BY 1, 2;

-- Window-function example: rank largest transactions per client
SELECT
    transaction_id,
    client_id,
    amount,
    RANK() OVER (PARTITION BY client_id ORDER BY amount DESC) AS client_amount_rank
FROM transactions;
