from __future__ import annotations

import json
import sys
import tomllib
from pathlib import Path
import xml.etree.ElementTree as ET

import yaml

ROOT = Path(__file__).resolve().parents[1]


def validate_json(path: Path) -> None:
    json.loads(path.read_text(encoding="utf-8"))


def validate_jsonl(path: Path) -> None:
    for line_number, line in enumerate(path.read_text(encoding="utf-8").splitlines(), start=1):
        if line.strip():
            try:
                json.loads(line)
            except json.JSONDecodeError as exc:
                raise ValueError(f"{path}:{line_number}: {exc}") from exc


def validate_yaml(path: Path) -> None:
    yaml.safe_load(path.read_text(encoding="utf-8"))


def validate_toml(path: Path) -> None:
    tomllib.loads(path.read_text(encoding="utf-8"))


def validate_xml(path: Path) -> None:
    ET.fromstring(path.read_text(encoding="utf-8"))


def main() -> int:
    for path in ROOT.rglob("*.json"):
        if ".venv" not in path.parts and "node_modules" not in path.parts:
            validate_json(path)
    for suffix in ("*.jsonl", "*.ndjson"):
        for path in ROOT.rglob(suffix):
            validate_jsonl(path)
    for suffix in ("*.yaml", "*.yml"):
        for path in ROOT.rglob(suffix):
            if ".venv" not in path.parts and "node_modules" not in path.parts and "templates" not in path.parts:
                validate_yaml(path)
    for path in ROOT.rglob("*.toml"):
        validate_toml(path)
    for path in ROOT.rglob("*.xml"):
        validate_xml(path)
    required = [
        ROOT / "README.md",
        ROOT / "docs" / "LANGUAGE_CATALOG.md",
        ROOT / "docs" / "FORMAT_CATALOG.md",
        ROOT / "docs" / "screenshots" / "architecture.svg",
    ]
    missing = [str(path) for path in required if not path.exists()]
    if missing:
        raise FileNotFoundError(f"Missing required files: {missing}")
    print("Format validation passed")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
