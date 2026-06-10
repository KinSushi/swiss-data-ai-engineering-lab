import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def test_jsonl_files_are_valid_line_by_line():
    for suffix in ("*.jsonl", "*.ndjson"):
        for path in ROOT.rglob(suffix):
            if "artifacts" in path.parts:
                continue
            for line in path.read_text(encoding="utf-8").splitlines():
                if line.strip():
                    json.loads(line)
