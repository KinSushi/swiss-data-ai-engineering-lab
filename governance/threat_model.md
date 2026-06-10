# Threat model

| Threat | Example | Mitigation |
|---|---|---|
| Secret exposure | committing real credentials | `.env.example`, public-safety check |
| Data leakage | real client data in Git | synthetic data only |
| Model misuse | automated rejection without review | human review policy |
| Dependency risk | vulnerable package | SBOM and dependency scanning awareness |
