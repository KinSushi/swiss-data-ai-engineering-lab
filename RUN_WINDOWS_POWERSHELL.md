# Windows PowerShell execution guide

This project is Windows-friendly. It does **not** require WSL and it does **not** require the Unix `unzip` command.

## What went wrong in the earlier attempt

Two common PowerShell issues:

1. This line is invalid because two commands were glued together:

```powershell
cd .\swiss-data-ai-engineering-labpowershell -ExecutionPolicy Bypass -File .\setup_windows.ps1
```

It must be two separate lines:

```powershell
cd .\swiss-data-ai-engineering-lab
powershell -ExecutionPolicy Bypass -File .\setup_windows.ps1
```

2. Running `setup_windows.ps1` from `G:\` fails if the file is inside `G:\swiss-data-ai-engineering-lab\`.

## 1. Extract the repository zip cleanly

From the directory containing the zip file:

```powershell
cd G:\
Expand-Archive -Path .\swiss-data-ai-engineering-lab.zip -DestinationPath . -Force
```

## 2. Find the extracted project folder

```powershell
Get-ChildItem -Path G:\ -Recurse -Filter RUN_THIS_ON_WINDOWS_FIRST.ps1 -ErrorAction SilentlyContinue | Select-Object FullName
```

You should see something like:

```text
G:\swiss-data-ai-engineering-lab\RUN_THIS_ON_WINDOWS_FIRST.ps1
```

Then run:

```powershell
cd G:\swiss-data-ai-engineering-lab
```

## 3. Check that you are in the right folder

```powershell
Get-ChildItem
```

You must see at least:

```text
README.md
setup_windows.ps1
requirements.txt
src
tools
docs
```

## 4. Run the Windows environment check

```powershell
powershell -ExecutionPolicy Bypass -File .\RUN_THIS_ON_WINDOWS_FIRST.ps1
```

Alternative:

```powershell
powershell -ExecutionPolicy Bypass -File .\setup_windows.ps1
```

## 5. Run the Python validation demo

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
pip install -r requirements.txt
python src\python\quality_checks.py
python tools\validate_formats.py
python tools\public_safety_check.py
pytest
```

If activating the virtual environment is blocked:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\.venv\Scripts\Activate.ps1
```

## 6. Publish to GitHub manually

Create the empty repository on GitHub first:

```text
KinSushi/swiss-data-ai-engineering-lab
```

Then run from the project root:

```powershell
powershell -ExecutionPolicy Bypass -File .\publish_repo_windows.ps1 -GitHubUser KinSushi -RepoName swiss-data-ai-engineering-lab
```

## 7. Clean IchiGrid-EA separately

This project contains cleanup scripts under `cleanup/`. Use them only inside a local clone of `IchiGrid-EA`.

```powershell
git clone git@github.com:KinSushi/IchiGrid-EA.git
cd IchiGrid-EA
powershell -ExecutionPolicy Bypass -File ..\swiss-data-ai-engineering-lab\cleanup\clean_ichigrid_windows.ps1
```

Review the diff before pushing.
