from pathlib import Path
import yaml

ROOT = Path(__file__).resolve().parents[1]


def test_yaml_files_are_valid():
    for suffix in ("*.yaml", "*.yml"):
        for path in ROOT.rglob(suffix):
            if any(part in {".venv", "node_modules", "templates"} for part in path.parts):
                continue
            yaml.safe_load(path.read_text(encoding="utf-8"))
