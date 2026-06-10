# Controls matrix

| Control ID | Control | Evidence |
|---|---|---|
| DQ-001 | Required field checks | `src/python/quality_checks.py` |
| DQ-002 | Duplicate transaction check | `databases/postgresql/data_quality_checks.sql` |
| OPS-001 | CI tests | `.github/workflows/ci.yml` |
| GOV-001 | Model card | `mlops/model_card.md` |
| GOV-002 | Audit trail | `mlops/audit_trail_example.jsonl` |
