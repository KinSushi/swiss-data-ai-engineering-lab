# Employer market map

This file explains how the same technical lab can speak to many employers, not only banks.

## Universal employer signal

```text
I can understand and document data systems, validate data quality, automate checks, read production logs, work with APIs and file formats, use Git/Docker/CI, and explain MLOps/governance concepts without overclaiming seniority.
```

## Employer families

| Employer family | Examples of what they value | Files in this repo that support the signal |
|---|---|---|
| Banks, fintechs, financial infrastructure | SQL, controls, auditability, fraud/risk, monitoring, model governance | `databases/postgresql/`, `mlops/`, `governance/`, `observability/` |
| Insurance | claims data, risk models, fraud detection, privacy, traceability | `data/`, `src/python/quality_checks.py`, `governance/data_privacy_controls.md` |
| Pharma / life sciences | validated workflows, reproducibility, lineage, documentation discipline | `governance/data_lineage.md`, `docs/FORMAT_CATALOG.md`, `tests/` |
| Retail / e-commerce | event data, APIs, JSON/JSONL, recommendation monitoring, dashboards | `api/`, `data/raw/*.jsonl`, `observability/grafana/` |
| Industry / manufacturing | sensor/event data, anomaly checks, operational monitoring | `observability/`, `data/raw/sample_log.log`, `src/python/quality_checks.py` |
| Logistics / transport / energy | operations pipelines, alerts, latency, incident response | `observability/incident_runbook.md`, `api/asyncapi.yaml` |
| Consulting / integrators | migration, reconciliation, multi-stack literacy, documentation | `databases/postgresql/reconciliation_queries.sql`, `docs/`, `devops/` |
| Cloud / platform teams | Docker, CI/CD, Kubernetes, Terraform, observability | `Dockerfile`, `.github/workflows/`, `devops/terraform/`, `devops/kubernetes/` |
| Big tech / scale-ups | software quality, data quality, ML infrastructure, tests, reproducibility | `tests/`, `tools/`, `mlops/`, `api/` |
| Public sector / research | transparent methods, reproducibility, governance, documentation | `docs/`, `governance/`, `notebooks/` |

## How to explain the repository in one sentence

For any employer:

> This is a broad Data & AI engineering literacy lab with a narrow professional core: Python, SQL, data quality, APIs, Docker/CI, monitoring, MLOps documentation and governance.

For finance:

> It shows how I think about reliable, auditable data and ML systems for regulated environments.

For non-finance employers:

> It shows transferable engineering discipline: data validation, format literacy, APIs, automation, observability, documentation and responsible AI.
