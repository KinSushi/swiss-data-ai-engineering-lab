-- Compare transaction totals by source system.
WITH ledger AS (
    SELECT account_id, SUM(amount) AS ledger_total
    FROM transactions
    GROUP BY account_id
),
external_statement AS (
    SELECT account_id, SUM(amount) AS statement_total
    FROM transactions
    GROUP BY account_id
)
SELECT
    l.account_id,
    l.ledger_total,
    e.statement_total,
    l.ledger_total - e.statement_total AS difference
FROM ledger l
JOIN external_statement e USING (account_id)
WHERE ABS(l.ledger_total - e.statement_total) > 0.01;
