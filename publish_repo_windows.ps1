param(
    [string]$GitHubUser = "KinSushi",
    [string]$RepoName = "swiss-data-ai-engineering-lab",
    [switch]$UseHttps,
    [switch]$CreateWithGh
)

$ErrorActionPreference = "Stop"

if ($CreateWithGh) {
    $Gh = Get-Command gh -ErrorAction SilentlyContinue
    if (-not $Gh) { throw "GitHub CLI is not installed. Create the repo manually or install gh." }
    gh repo create "$GitHubUser/$RepoName" --public --source . --remote origin --description "Personal engineering lab for Swiss Data & AI recruitment positioning."
}

if (-not (Test-Path ".git")) {
    git init
}

git add .
$Status = git status --porcelain
if ($Status) {
    git commit -m "Add Swiss Data and AI engineering lab"
} else {
    Write-Host "No local changes to commit."
}

git branch -M main

$RemoteUrl = if ($UseHttps) { "https://github.com/$GitHubUser/$RepoName.git" } else { "git@github.com:$GitHubUser/$RepoName.git" }
$ExistingRemote = git remote get-url origin 2>$null
if ($LASTEXITCODE -ne 0) {
    git remote add origin $RemoteUrl
} else {
    git remote set-url origin $RemoteUrl
}

git push -u origin main
Write-Host "Published to $RemoteUrl"
