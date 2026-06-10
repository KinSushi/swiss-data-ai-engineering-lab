CREATE TABLE IF NOT EXISTS clients (
    client_id TEXT PRIMARY KEY,
    country CHAR(2) NOT NULL,
    segment TEXT NOT NULL DEFAULT 'retail'
);

CREATE TABLE IF NOT EXISTS accounts (
    account_id TEXT PRIMARY KEY,
    client_id TEXT NOT NULL REFERENCES clients(client_id),
    currency CHAR(3) NOT NULL CHECK (currency IN ('CHF', 'EUR', 'USD', 'GBP'))
);

CREATE TABLE IF NOT EXISTS transactions (
    transaction_id TEXT PRIMARY KEY,
    client_id TEXT NOT NULL,
    account_id TEXT NOT NULL,
    amount NUMERIC(18, 2) NOT NULL,
    currency CHAR(3) NOT NULL CHECK (currency IN ('CHF', 'EUR', 'USD', 'GBP')),
    event_timestamp TIMESTAMPTZ NOT NULL,
    channel TEXT NOT NULL,
    status TEXT NOT NULL,
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    CONSTRAINT fk_transaction_client FOREIGN KEY (client_id) REFERENCES clients(client_id),
    CONSTRAINT fk_transaction_account FOREIGN KEY (account_id) REFERENCES accounts(account_id),
    CONSTRAINT amount_not_zero CHECK (amount <> 0)
);

CREATE INDEX IF NOT EXISTS idx_transactions_client_time ON transactions (client_id, event_timestamp DESC);
CREATE INDEX IF NOT EXISTS idx_transactions_metadata_gin ON transactions USING GIN (metadata);
