# Redis examples

```text
SET session:req_001 "active" EX 300
HSET risk_score:req_001 transaction_id tx_001 score 0.12 decision approve
INCR api:score:requests
```

Redis is typically used for cache, sessions, counters, rate limiting and lightweight queues.
