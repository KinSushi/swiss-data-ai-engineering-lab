const transaction = { transaction_id: "tx_001", amount: 125.5, currency: "CHF" };
const riskScore = transaction.amount > 1000 ? 0.75 : 0.15;
console.log(JSON.stringify({ ...transaction, risk_score: riskScore }, null, 2));
