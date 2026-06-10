from fastapi import FastAPI
from pydantic import BaseModel, Field

app = FastAPI(title="Synthetic Banking Risk API", version="0.1.0")


class Transaction(BaseModel):
    transaction_id: str
    client_id: str
    amount: float
    currency: str = Field(pattern="^(CHF|EUR|USD|GBP)$")


@app.get("/health")
def health() -> dict[str, str]:
    return {"status": "ok"}


@app.post("/score")
def score(transaction: Transaction) -> dict[str, object]:
    risk_score = 0.85 if transaction.amount < 0 or transaction.amount > 1000 else 0.15
    decision = "review" if risk_score >= 0.8 else "approve"
    return {
        "transaction_id": transaction.transaction_id,
        "risk_score": risk_score,
        "decision": decision,
        "model_version": "rule-demo-0.1.0",
    }
