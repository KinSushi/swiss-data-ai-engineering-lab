-- Indexes should support actual access patterns.
CREATE INDEX IF NOT EXISTS idx_transactions_status_time
ON transactions (status, event_timestamp DESC);

CREATE INDEX IF NOT EXISTS idx_transactions_amount
ON transactions (amount);

-- Use EXPLAIN ANALYZE in real environments.
EXPLAIN
SELECT *
FROM transactions
WHERE status = 'review_required'
ORDER BY event_timestamp DESC
LIMIT 100;
