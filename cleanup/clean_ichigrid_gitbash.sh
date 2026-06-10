#!/usr/bin/env bash
set -euo pipefail

if [ ! -d .git ]; then
  echo "Run this script from the root of a local IchiGrid-EA git clone." >&2
  exit 1
fi

BRANCH="cleanup/personal-project-boundary"
git checkout -B "$BRANCH"

rm -rf extra-personal-technology-lab mlops openapi proto terraform kubernetes sql data config logs tests

cat > README.md <<'EOF'
# IchiGrid-EA

Personal project repository.

This repository is unrelated to my professional training portfolio, Jedha certification evidence, Swiss Data & AI recruitment positioning, or public Data/MLOps portfolio projects.

For professional Data & AI portfolio evidence, use the dedicated repositories only.
EOF

git status
cat <<EOF
Review changes, then run:

git add .
git commit -m "Clean repository boundary and remove training portfolio artifacts"
git push -u origin $BRANCH
EOF
