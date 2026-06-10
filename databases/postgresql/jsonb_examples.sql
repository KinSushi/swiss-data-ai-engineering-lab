CREATE TABLE IF NOT EXISTS prediction_events (
    id BIGSERIAL PRIMARY KEY,
    request_id TEXT NOT NULL UNIQUE,
    transaction_id TEXT NOT NULL,
    model_name TEXT NOT NULL,
    model_version TEXT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    payload JSONB NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_prediction_events_payload_gin
ON prediction_events USING GIN (payload);

-- Extract nested JSONB fields
SELECT
    request_id,
    payload->'prediction'->>'decision' AS decision,
    (payload->'prediction'->>'risk_score')::NUMERIC AS risk_score
FROM prediction_events;

-- JSONB containment query
SELECT *
FROM prediction_events
WHERE payload @> '{"prediction": {"decision": "review"}}';
