from __future__ import annotations

import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SKIP_PARTS = {".git", ".venv", "node_modules", "artifacts", "__pycache__"}
FORBIDDEN_FOLDERS = {
    "private",
    "school_documents",
    "certificates_private",
    "grades",
    "exam_subjects",
    "exam_answers",
    "cv",
    "resume",
    "cover-letters",
    "applications",
    "job-tracker",
}
DANGEROUS_PATTERNS = [
    re.compile(r"-----BEGIN (RSA |EC |OPENSSH |)PRIVATE KEY-----"),
    re.compile(r"gh[pousr]_[A-Za-z0-9_]{20,}"),
    re.compile(r"AKIA[0-9A-Z]{16}"),
    re.compile(r"xox[baprs]-[A-Za-z0-9-]{20,}"),
]


def should_skip(path: Path) -> bool:
    return bool(SKIP_PARTS.intersection(path.parts))


def main() -> int:
    for folder in FORBIDDEN_FOLDERS:
        if (ROOT / folder).exists():
            raise RuntimeError(f"Forbidden folder found: {folder}")
    findings: list[str] = []
    for path in ROOT.rglob("*"):
        if not path.is_file() or should_skip(path):
            continue
        try:
            text = path.read_text(encoding="utf-8")
        except UnicodeDecodeError:
            continue
        for pattern in DANGEROUS_PATTERNS:
            if pattern.search(text):
                findings.append(str(path.relative_to(ROOT)))
    if findings:
        raise RuntimeError(f"Potential secret material found: {findings}")
    print("Public-safety check passed")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
