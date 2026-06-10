$ErrorActionPreference = "Stop"
Write-Host "Swiss Data & AI Engineering Lab - Windows first run" -ForegroundColor Cyan
$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $Root
Write-Host "Project root: $Root"

$RequiredFiles = @(
  "README.md",
  "setup_windows.ps1",
  "requirements.txt",
  "src\python\quality_checks.py",
  "tools\validate_formats.py",
  "tools\public_safety_check.py"
)

foreach ($File in $RequiredFiles) {
  if (-not (Test-Path $File)) {
    throw "Missing required file: $File. You are probably not in the project root or the zip was not extracted correctly."
  }
  Write-Host "OK: $File"
}

powershell -ExecutionPolicy Bypass -File "$Root\setup_windows.ps1"
Write-Host "First-run check completed. Next commands:" -ForegroundColor Green
Write-Host "python -m venv .venv"
Write-Host ".\.venv\Scripts\Activate.ps1"
Write-Host "pip install -r requirements.txt"
Write-Host "python src\python\quality_checks.py"
Write-Host "python tools\validate_formats.py"
Write-Host "python tools\public_safety_check.py"
Write-Host "pytest"
