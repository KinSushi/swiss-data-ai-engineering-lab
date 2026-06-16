# Swiss Data & AI Engineering Lab

![CI](https://github.com/KinSushi/swiss-data-ai-engineering-lab/actions/workflows/ci.yml/badge.svg)
![Python](https://img.shields.io/badge/Python-3.11-blue)
![Tests](https://img.shields.io/badge/tests-pytest-green)
![Lint](https://img.shields.io/badge/lint-ruff-orange)
![License](https://img.shields.io/badge/license-MIT-lightgrey)
![Data](https://img.shields.io/badge/data-synthetic%20only-2EA043)

A reproducible engineering lab that demonstrates the **core skills of a junior Data / DataOps / MLOps Engineer**: data-quality checks, file-format validation, public-safety scanning and a tested Python core, all runnable in one command.

**Honest scope:** this is a *literacy and practice* lab built with **synthetic data only**. The professional core below is what I do hands-on. A broader catalog of languages and formats I have explored lives in a separate file, clearly labelled as exploration, not claimed mastery.

---

## What this proves in 30 seconds

- A **tested Python core** (`pytest` + `ruff`) for data-quality and format validation.
- A **public-safety scanner** that blocks secrets, real data and private documents from reaching a public repo.
- A **one-command demo** on Windows PowerShell and Linux / Git Bash.
- **Reproducibility discipline**: pinned dependencies, CI on every push, documented run reports.

| Signal | Evidence |
|---|---|
| Data quality | `src/python/quality_checks.py` |
| Format validation | `tools/validate_formats.py` |
| Public-safety control | `tools/public_safety_check.py` |
| Automated tests + lint | `tests/`, `ruff`, GitHub Actions |

---

## Professional core (hands-on)

**Python | SQL | PostgreSQL | Linux | Git | Bash | Docker | CI/CD | Data Quality | Monitoring | MLflow foundations | AI Governance.**

This is the narrow, credible core I build with. Everything in the demo below runs against it.

---

## Quick demo

**Linux / Git Bash**

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
python src/python/quality_checks.py
python tools/validate_formats.py
python tools/public_safety_check.py
pytest
```

**Windows PowerShell**

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
pip install -r requirements.txt
python src\python\quality_checks.py
python tools\validate_formats.py
python tools\public_safety_check.py
pytest
```

---

## Repository structure

```
swiss-data-ai-engineering-lab/
  README.md
  requirements.txt
  .github/workflows/        CI: ruff + pytest
  src/python/               data-quality core
  tools/                    format + public-safety validators
  databases/postgresql/     SQL skill evidence
  mlops/                    model card, data card, monitoring plan
  observability/            dashboards, logging notes
  governance/               AI governance checklist, controls
  docs/                     recruiter guide, catalogs, diagrams
  tests/                    pytest suite
```

---

## Recruiter reading guide

1. `README.md` — the narrative (this file).
2. `docs/RECRUITER_GUIDE.md` — the role signal.
3. `src/python/quality_checks.py` + `databases/postgresql/*.sql` — executable core-skill evidence.
4. `mlops/`, `observability/`, `governance/` — production and responsible-AI maturity.
5. `docs/LANGUAGE_CATALOG.md` + `docs/FORMAT_CATALOG.md` — broad technical *literacy* (exploration, not claimed mastery).

---

## Why a Swiss employer cares

Swiss teams hire different data profiles. The professional core stays the same; the emphasis shifts:

- **Banking / insurance / fintech:** SQL, controls, auditability, data quality, monitoring.
- **Pharma / life sciences:** traceability, validated pipelines, documentation discipline.
- **Retail / e-commerce / industry:** events, APIs, analytics, anomaly monitoring.
- **Cloud / platform teams:** Docker, CI/CD, observability, reproducibility.

---

## Public-safety boundary

This repository contains **only synthetic data, educational examples and sanitized diagrams**. It must never contain private documents, certificates, CVs, real banking/client/health data, secrets, keys or live-trading content. `public_safety_check.py` enforces this on every run.

---

## License

MIT — see `LICENSE`.
