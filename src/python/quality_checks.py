from __future__ import annotations

import csv
import json
from collections import Counter
from dataclasses import dataclass, asdict
from decimal import Decimal, InvalidOperation
from pathlib import Path
from typing import Iterable

ROOT = Path(__file__).resolve().parents[2]
TRANSACTIONS_PATH = ROOT / "data" / "raw" / "transactions.csv"
PREDICTIONS_PATH = ROOT / "data" / "raw" / "prediction_events.jsonl"
ARTIFACTS_DIR = ROOT / "artifacts"
ALLOWED_CURRENCIES = {"CHF", "EUR", "USD", "GBP"}
REQUIRED_COLUMNS = {
    "transaction_id",
    "client_id",
    "account_id",
    "amount",
    "currency",
    "timestamp",
}


@dataclass(frozen=True)
class DataQualityReport:
    rows_checked: int
    prediction_events_checked: int
    missing_required_values: int
    duplicate_transaction_ids: int
    negative_amounts: int
    invalid_currencies: int
    quality_score: float
    status: str


def load_transactions(path: Path = TRANSACTIONS_PATH) -> list[dict[str, str]]:
    with path.open("r", encoding="utf-8", newline="") as file:
        reader = csv.DictReader(file)
        missing_columns = REQUIRED_COLUMNS - set(reader.fieldnames or [])
        if missing_columns:
            raise ValueError(f"Missing required columns: {sorted(missing_columns)}")
        return list(reader)


def load_jsonl(path: Path = PREDICTIONS_PATH) -> list[dict]:
    events: list[dict] = []
    with path.open("r", encoding="utf-8") as file:
        for line_number, line in enumerate(file, start=1):
            stripped = line.strip()
            if not stripped:
                continue
            try:
                events.append(json.loads(stripped))
            except json.JSONDecodeError as exc:
                raise ValueError(f"Invalid JSONL at line {line_number}: {exc}") from exc
    return events


def count_missing_required_values(rows: Iterable[dict[str, str]]) -> int:
    count = 0
    for row in rows:
        for column in REQUIRED_COLUMNS:
            if not str(row.get(column, "")).strip():
                count += 1
    return count


def count_duplicate_transaction_ids(rows: Iterable[dict[str, str]]) -> int:
    ids = [row["transaction_id"] for row in rows if row.get("transaction_id")]
    return sum(1 for _, value in Counter(ids).items() if value > 1)


def count_negative_amounts(rows: Iterable[dict[str, str]]) -> int:
    count = 0
    for row in rows:
        try:
            amount = Decimal(row.get("amount", "0"))
        except (InvalidOperation, TypeError):
            count += 1
            continue
        if amount < 0:
            count += 1
    return count


def count_invalid_currencies(rows: Iterable[dict[str, str]]) -> int:
    return sum(1 for row in rows if row.get("currency") not in ALLOWED_CURRENCIES)


def build_report(rows: list[dict[str, str]], events: list[dict]) -> DataQualityReport:
    missing = count_missing_required_values(rows)
    duplicates = count_duplicate_transaction_ids(rows)
    negatives = count_negative_amounts(rows)
    invalid_currencies = count_invalid_currencies(rows)
    issue_count = missing + duplicates + negatives + invalid_currencies
    denominator = max(len(rows), 1) * len(REQUIRED_COLUMNS)
    score = max(0.0, round(100 * (1 - issue_count / denominator), 2))
    status = "quality_pass" if issue_count == 0 else "quality_review_required"
    return DataQualityReport(
        rows_checked=len(rows),
        prediction_events_checked=len(events),
        missing_required_values=missing,
        duplicate_transaction_ids=duplicates,
        negative_amounts=negatives,
        invalid_currencies=invalid_currencies,
        quality_score=score,
        status=status,
    )


def write_artifacts(report: DataQualityReport) -> None:
    ARTIFACTS_DIR.mkdir(exist_ok=True)
    json_path = ARTIFACTS_DIR / "data_quality_report.json"
    md_path = ARTIFACTS_DIR / "data_quality_report.md"
    json_path.write_text(json.dumps(asdict(report), indent=2), encoding="utf-8")
    md_path.write_text(
        "\n".join(
            [
                "# Data Quality Report",
                "",
                f"- Rows checked: {report.rows_checked}",
                f"- Prediction events checked: {report.prediction_events_checked}",
                f"- Missing required values: {report.missing_required_values}",
                f"- Duplicate transaction IDs: {report.duplicate_transaction_ids}",
                f"- Negative amounts: {report.negative_amounts}",
                f"- Invalid currencies: {report.invalid_currencies}",
                f"- Quality score: {report.quality_score}",
                f"- Status: `{report.status}`",
                "",
            ]
        ),
        encoding="utf-8",
    )


def run_quality_checks() -> DataQualityReport:
    rows = load_transactions()
    events = load_jsonl()
    report = build_report(rows, events)
    write_artifacts(report)
    return report


if __name__ == "__main__":
    result = run_quality_checks()
    print(json.dumps(asdict(result), indent=2))
