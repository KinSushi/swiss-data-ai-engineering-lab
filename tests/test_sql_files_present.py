from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def test_core_sql_files_present():
    expected = [
        "databases/postgresql/schema.sql",
        "databases/postgresql/data_quality_checks.sql",
        "databases/postgresql/jsonb_examples.sql",
        "databases/postgresql/reconciliation_queries.sql",
    ]
    for rel in expected:
        assert (ROOT / rel).exists()
