from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SCREENSHOTS = ROOT / "docs" / "screenshots"
SCREENSHOTS.mkdir(parents=True, exist_ok=True)

# Screenshots are already generated in this repository. This file documents where regeneration logic would live.
print(f"Screenshots directory: {SCREENSHOTS}")
