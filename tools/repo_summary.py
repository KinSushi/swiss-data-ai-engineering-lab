from pathlib import Path
from collections import Counter

ROOT = Path(__file__).resolve().parents[1]
counts = Counter(path.suffix or path.name for path in ROOT.rglob("*") if path.is_file())
for suffix, count in sorted(counts.items()):
    print(f"{suffix}: {count}")
