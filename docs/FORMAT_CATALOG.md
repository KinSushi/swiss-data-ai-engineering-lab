# Format catalog

## Data formats

| Format | Example path | Priority | Usage |
|---|---|---:|---|
| CSV | `data/raw/transactions.csv` | Core | Simple tabular exchange |
| TSV | `data/raw/transactions.tsv` | Core | Tab-separated tabular exchange |
| JSON | `data/raw/prediction_event.json` | Core | API payloads, documents, configs |
| JSONL / NDJSON | `data/raw/prediction_events.jsonl`, `.ndjson` | Core | Logs, streaming, datasets, audit trail |
| XML | `data/raw/legacy_message.xml` | Working | Legacy banking messages and enterprise integrations |
| TXT fixed-width | `data/raw/fixed_width_transactions.txt` | Working | Legacy flat files |
| LOG | `data/raw/sample_log.log` | Core | Operational diagnostics |
| Parquet | `data/processed_examples/parquet_notes.md` | Core | Columnar analytics, Spark, Databricks |
| Avro | `data/schemas/transaction.avsc` | Working | Kafka/event schemas and compact serialization |
| ORC | `data/processed_examples/orc_notes.md` | Awareness | Hive/Hadoop analytics |
| Arrow / Feather | `data/processed_examples/*arrow*`, `*feather*` | Awareness | Fast dataframe interchange |
| Delta / Iceberg | `data/processed_examples/*delta*`, `*iceberg*` | Working | Lakehouse table formats |
| HDF5 | `data/processed_examples/hdf5_notes.md` | Awareness | Scientific and tensor storage |

## Database and query files

| Format | Example path | Usage |
|---|---|---|
| SQL | `databases/postgresql/schema.sql` | DDL, checks, migrations, reconciliation |
| JSONB concept | `databases/postgresql/jsonb_examples.sql` | Semi-structured PostgreSQL payloads |
| BSON concept | `databases/mongodb/mongodb_document_examples.json` | MongoDB document model |
| Cypher | `databases/neo4j/fraud_graph.cypher` | Graph relationships |
| DuckDB SQL | `databases/duckdb/duckdb_local_analytics.sql` | Local analytics |

## API and contract files

| Format | Example path | Usage |
|---|---|---|
| OpenAPI | `api/openapi.yaml` | REST API contract |
| AsyncAPI | `api/asyncapi.yaml` | Event/message contract |
| Protobuf | `api/transaction.proto` | gRPC and typed messages |
| GraphQL | `api/graphql/schema.graphql` | Query language schema |
| Postman | `api/postman/collection.json` | API testing collection |
| WSDL/SOAP | `api/wsdl/legacy_service.wsdl` | Legacy enterprise services |

## MLOps and model files

| Format | Example path | Usage |
|---|---|---|
| MLmodel | `mlops/MLmodel` | MLflow model packaging |
| PKL / Joblib | `mlops/model_binary_formats/*.md` | scikit-learn model persistence; security caution |
| ONNX | `mlops/model_binary_formats/onnx.md` | Model interoperability |
| PT/PTH | `mlops/model_binary_formats/pytorch_pt_pth.md` | PyTorch weights |
| Safetensors | `mlops/model_binary_formats/safetensors.md` | Safer tensor storage |
| PB / SavedModel | `mlops/model_binary_formats/tensorflow_savedmodel.md` | TensorFlow serving |
| H5 / Keras | `mlops/model_binary_formats/keras_h5.md` | Keras model storage |
| UBJ | `mlops/model_binary_formats/xgboost_json_ubj.md` | XGBoost model format |

## Configuration, DevOps and cloud files

| Format | Example path | Usage |
|---|---|---|
| `.env.example` | `.env.example` | Local environment variables without real secrets |
| YAML/YML | `.github/workflows/*.yml` | CI/CD and cloud-native configs |
| TOML | `pyproject.toml` | Python project config |
| INI/CFG/CONF/properties | `config/*` | Enterprise-style configuration |
| Dockerfile | `Dockerfile` | Container image build |
| Compose YAML | `docker-compose.yml` | Local multi-service stack |
| Terraform | `devops/terraform/*.tf` | Infrastructure as code |
| Kubernetes | `devops/kubernetes/*.yaml` | Deployment and service manifests |
| Helm | `devops/helm/*` | Kubernetes packaging |
| GitHub Actions | `.github/workflows/*.yml` | CI/CD |
| GitLab CI | `devops/gitlab_ci/.gitlab-ci.yml` | Alternative CI/CD |
| Azure DevOps | `devops/azure_devops/azure-pipelines.yml` | Microsoft CI/CD |
| Jenkinsfile | `devops/jenkins/Jenkinsfile` | Enterprise CI/CD awareness |

## Documentation, BI and security formats

| Format | Example path | Usage |
|---|---|---|
| Markdown | `docs/*.md` | GitHub documentation |
| RST | `docs/restructured_text_example.rst` | Python documentation ecosystem |
| HTML | `docs/html_report_example.html` | Static reports |
| PDF/DOCX/XLSX/PPTX | `docs/document_format_notes.md` | Business documents; do not commit private files |
| IPYNB | `notebooks/01_quality_demo.ipynb` | Notebook awareness; code should not live only in notebooks |
| SVG/PNG | `docs/screenshots/*.svg` | Diagrams and screenshots |
| Mermaid | `docs/architecture.mmd` | Text-based diagrams |
| Draw.io | `docs/architecture.drawio` | Architecture diagrams |
| SARIF | `governance/sarif/static_analysis_example.sarif` | Static analysis report format |
| SPDX/CycloneDX | `governance/sbom/*` | Software bill of materials |
| Rego | `governance/opa/policy.rego` | Policy-as-code |
