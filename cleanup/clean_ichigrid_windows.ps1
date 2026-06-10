$ErrorActionPreference = "Stop"

Write-Host "Cleaning IchiGrid-EA repository boundary..."

if (-not (Test-Path ".git")) {
    throw "Run this script from the root of a local IchiGrid-EA git clone."
}

$BranchName = "cleanup/personal-project-boundary"
git checkout -B $BranchName

$PathsToRemove = @(
    "extra-personal-technology-lab",
    "mlops",
    "openapi",
    "proto",
    "terraform",
    "kubernetes",
    "sql",
    "data",
    "config",
    "logs",
    "tests"
)

foreach ($Path in $PathsToRemove) {
    if (Test-Path $Path) {
        Remove-Item $Path -Recurse -Force
        Write-Host "Removed $Path"
    }
}

@"
# IchiGrid-EA

Personal project repository.

This repository is unrelated to my professional training portfolio, Jedha certification evidence, Swiss Data & AI recruitment positioning, or public Data/MLOps portfolio projects.

For professional Data & AI portfolio evidence, use the dedicated repositories only.
"@ | Set-Content -Path "README.md" -Encoding UTF8

git status
Write-Host "Review changes, then run:"
Write-Host "git add ."
Write-Host "git commit -m 'Clean repository boundary and remove training portfolio artifacts'"
Write-Host "git push -u origin $BranchName"
