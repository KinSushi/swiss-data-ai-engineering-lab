$ErrorActionPreference = "Stop"
Write-Host "Running Python data quality checks..."
python src\python\quality_checks.py
python tools\validate_formats.py
python tools\public_safety_check.py
