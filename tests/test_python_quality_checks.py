from src.python.quality_checks import load_transactions, load_jsonl, build_report, run_quality_checks


def test_quality_report_counts_expected_synthetic_issues():
    rows = load_transactions()
    events = load_jsonl()
    report = build_report(rows, events)
    assert report.rows_checked == 6
    assert report.prediction_events_checked == 3
    assert report.missing_required_values == 1
    assert report.duplicate_transaction_ids == 1
    assert report.negative_amounts == 1
    assert report.invalid_currencies == 1
    assert report.status == "quality_review_required"


def test_run_quality_checks_writes_report():
    report = run_quality_checks()
    assert report.quality_score > 0
