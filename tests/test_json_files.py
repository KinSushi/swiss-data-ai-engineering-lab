import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def test_json_files_are_valid():
    for path in ROOT.rglob("*.json"):
        if any(part in {".venv", "node_modules", "artifacts"} for part in path.parts):
            continue
        json.loads(path.read_text(encoding="utf-8"))
