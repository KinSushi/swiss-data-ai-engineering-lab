# Swiss Data & AI Engineering Lab

Personal engineering lab covering the **languages, file formats, data systems, MLOps artifacts, observability files and governance practices** expected from a junior **Data & AI Engineer targeting Swiss employers across regulated, data-intensive and scale-engineering environments**.

This repository is **not** a certification archive, not a private course dump, and not a claim of senior-level mastery across every technology listed here. It is a practical literacy map: each language or file format is shown in a professional context that recruiters and technical screeners can understand.

## Positioning

**Target profile:** Junior Data / DataOps / MLOps / AI Engineer.

**Core stack:** Python · SQL · PostgreSQL · Linux · Git · Bash · Docker · CI/CD · Data Quality · Monitoring · MLflow foundations · AI Governance.

**Employer scope:** banking, insurance, fintech, pharma/life sciences, retail/e-commerce, industry/manufacturing, logistics, energy, public sector, research, consulting/integrators, cloud/platform teams and Swiss scale-ups.

## Why this project is broad

Swiss employers do not all hire the same data profile. A bank may care first about SQL, controls and auditability. A pharma team may care about traceability and validated pipelines. A retailer may care about analytics, recommendations and event data. A cloud/platform team may care about Docker, CI/CD, Kubernetes and observability. This lab therefore keeps a narrow professional core while showing broad technical literacy.

The common signal is:

```text
I build reliable data and ML systems: ingestion, SQL, data quality, APIs,
monitoring, MLflow, Docker, CI/CD, documentation, governance and security.
```

## Scenario

The lab uses a synthetic **Data & AI Monitoring Platform** scenario. The default dataset is banking-style transaction data because it is useful for regulated systems, but the architecture is intentionally reusable across sectors:

- banking / finance: transaction monitoring, risk, compliance, audit trails;
- insurance: claims quality checks, fraud triage, pricing data pipelines;
- pharma / life sciences: validated data flows, traceability, controlled documentation;
- retail / e-commerce: events, recommendations, customer analytics, product data;
- industry / IoT: sensor events, anomaly detection, quality monitoring;
- logistics / transport: operations data, route events, reliability monitoring;
- consulting / integration: migration, reconciliation, modernization, documentation;
- platform / cloud teams: CI/CD, containers, observability, infrastructure-as-code.

## What this repository demonstrates

| Area | Demonstrated items |
|---|---|
| Core languages | Python, SQL, Bash, Markdown, YAML, TOML, Regex |
| Data / AI / analytics | R, Julia, SAS, MATLAB, DAX, Power Query M |
| Backend / enterprise | JavaScript, TypeScript, Java, Scala, Go, Rust, C#, C, C++ |
| Database / query languages | PL/pgSQL, PL/SQL, T-SQL, Cypher, GraphQL, KQL, SPL, LogQL, jq |
| Infrastructure / policy | HCL/Terraform, Dockerfile, Makefile, Rego, Ansible YAML, Helm templates |
| Data formats | CSV, TSV, JSON, JSONL, NDJSON, XML, fixed-width TXT, logs, Parquet notes, ORC notes, Avro schema, Arrow/Feather notes, Delta/Iceberg notes, HDF5 notes |
| API contracts | OpenAPI, AsyncAPI, Protobuf, GraphQL, Postman, WSDL/SOAP awareness |
| Databases | PostgreSQL, Oracle, SQL Server, MongoDB, Redis, Elasticsearch/OpenSearch, Neo4j, vector DB concepts, DuckDB |
| MLOps | MLflow `MLmodel`, model card, data card, monitoring plan, drift notes, audit trail, model binary format notes |
| DevOps / cloud | Docker, Docker Compose, GitHub Actions, GitLab CI, Azure DevOps, Terraform, Kubernetes, Helm, Ansible |
| Governance | AI governance checklist, privacy controls, controls matrix, threat model, SBOM, SARIF, OPA/Rego |
| Employer alignment | finance, insurance, pharma, retail, industry, logistics, public sector, consulting, platform/cloud, AI teams |

## Repository structure

```text
swiss-data-ai-engineering-lab/
├── README.md
├── RUN_WINDOWS_POWERSHELL.md
├── RUN_THIS_ON_WINDOWS_FIRST.ps1
├── setup_windows.ps1
├── publish_repo_windows.ps1
├── .github/workflows/
├── api/
├── data/
├── databases/
├── devops/
├── docs/
├── domains/
├── governance/
├── mlops/
├── observability/
├── src/
├── tests/
├── tools/
└── cleanup/
```

## Quick demo — Windows PowerShell

Run each command on its own line:

```powershell
cd G:\swiss-data-ai-engineering-lab
powershell -ExecutionPolicy Bypass -File .\RUN_THIS_ON_WINDOWS_FIRST.ps1
python -m venv .venv
.\.venv\Scripts\Activate.ps1
pip install -r requirements.txt
python src\python\quality_checks.py
python tools\validate_formats.py
python tools\public_safety_check.py
pytest
```

If you do not know where the project was extracted:

```powershell
Get-ChildItem -Path G:\ -Recurse -Filter RUN_THIS_ON_WINDOWS_FIRST.ps1 -ErrorAction SilentlyContinue | Select-Object FullName
```

Then `cd` into the folder containing that script.

## Quick demo — Linux / Git Bash

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
python src/python/quality_checks.py
python tools/validate_formats.py
python tools/public_safety_check.py
pytest
```

## Screenshots

SVG diagrams are stored in [`docs/screenshots`](docs/screenshots):

- `architecture.svg`
- `language_map.svg`
- `format_map.svg`
- `database_map.svg`
- `mlops_lifecycle.svg`
- `data_quality_dashboard.svg`
- `observability_dashboard.svg`
- `governance_controls.svg`
- `github_recruiter_view.svg`

## Public-safety boundary

This repository must only contain synthetic data, educational examples and sanitized screenshots. It must not contain private school documents, certificates, CVs, applications, real banking data, real client data, secrets, passwords, private keys, live-trading claims or salary strategy.

## Recruiter reading guide

A recruiter or technical reviewer should read this repository as follows:

1. `README.md` for the narrative.
2. `docs/RECRUITER_GUIDE.md` for the role signal.
3. `docs/EMPLOYER_MARKET_MAP.md` for sector-by-sector employer alignment.
4. `docs/LANGUAGE_CATALOG.md` and `docs/FORMAT_CATALOG.md` for technical coverage.
5. `src/python/quality_checks.py` and `databases/postgresql/*.sql` for executable core skill evidence.
6. `mlops/`, `observability/` and `governance/` for production and responsible-AI maturity.

The repository is intentionally broad, but the professional core remains narrow and credible: **Python, SQL, PostgreSQL, Bash/Linux, Git, Docker, CI/CD, Data Quality, Monitoring, MLflow and AI Governance**.
