# Incident runbook

## Scenario: data quality score drops below threshold

1. Check recent ingestion logs.
2. Validate source file schema.
3. Count missing required values and duplicates.
4. Compare with previous batch.
5. Escalate to data owner if source issue is confirmed.
6. Document incident ID, timestamp, root cause and remediation.
