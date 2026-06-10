Write-Host "Checking Windows environment for swiss-data-ai-engineering-lab..."

$Commands = @("git", "python")
foreach ($Command in $Commands) {
    $Found = Get-Command $Command -ErrorAction SilentlyContinue
    if (-not $Found) {
        Write-Error "Missing required command: $Command"
        exit 1
    }
    Write-Host "OK: $Command -> $($Found.Source)"
}

$PythonVersion = python --version
Write-Host "Python: $PythonVersion"

$Gh = Get-Command gh -ErrorAction SilentlyContinue
if ($Gh) {
    Write-Host "Optional OK: GitHub CLI found -> $($Gh.Source)"
    gh auth status
} else {
    Write-Host "Optional: GitHub CLI not found. Manual GitHub repository creation is still possible."
}

Write-Host "Environment check completed."
