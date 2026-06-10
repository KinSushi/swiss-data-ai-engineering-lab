type Transaction = {
  transaction_id: string;
  amount: number;
  currency: "CHF" | "EUR" | "USD" | "GBP";
};

function score(transaction: Transaction): number {
  return transaction.amount > 1000 ? 0.75 : 0.15;
}

const tx: Transaction = { transaction_id: "tx_001", amount: 125.5, currency: "CHF" };
console.log({ ...tx, risk_score: score(tx) });
