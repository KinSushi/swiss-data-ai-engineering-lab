from pathlib import Path
import tomllib

ROOT = Path(__file__).resolve().parents[1]


def test_toml_files_are_valid():
    for path in ROOT.rglob("*.toml"):
        tomllib.loads(path.read_text(encoding="utf-8"))
