"""Minimal API client pseudocode for the FastAPI scoring endpoint."""

import json

payload = {
    "transaction_id": "tx_001",
    "client_id": "C001",
    "amount": 125.5,
    "currency": "CHF",
}

print(json.dumps(payload, indent=2))
