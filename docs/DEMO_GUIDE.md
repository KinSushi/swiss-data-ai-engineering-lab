# Demo guide

## Run the core demo

```bash
python src/python/quality_checks.py
```

Outputs:

```text
artifacts/data_quality_report.json
artifacts/data_quality_report.md
```

## Validate file formats

```bash
python tools/validate_formats.py
```

## Run public-safety check

```bash
python tools/public_safety_check.py
```

## Run tests

```bash
pytest
```

The demo intentionally uses a small synthetic dataset with a duplicate transaction, a negative amount, one missing client identifier and an invalid currency so the quality checks have meaningful findings.
