# Extract risky prediction events from JSONL input
select(.risk_score >= 0.8) | {request_id, transaction_id, risk_score, decision}
