# Model card — synthetic fraud risk scorer

## Intended use

Educational demonstration of risk-scoring documentation in a regulated Data & AI engineering portfolio.

## Out-of-scope use

This model is not a production fraud model and must not be used for real financial decisions.

## Inputs

- amount
- currency
- channel
- synthetic customer/account metadata

## Outputs

- risk score
- decision: approve or review

## Monitoring

- prediction volume
- latency
- error rate
- missing feature rate
- score distribution
- drift indicators
- manual-review rate

## Governance

High-risk predictions should be subject to human review in real systems. This repository uses synthetic examples only.
