import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]

single_event = json.loads((ROOT / "data/raw/prediction_event.json").read_text(encoding="utf-8"))
jsonl_events = [json.loads(line) for line in (ROOT / "data/raw/prediction_events.jsonl").read_text(encoding="utf-8").splitlines() if line]

print(single_event["request_id"])
print(len(jsonl_events))
