


| **ENGLISH**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | **POLSKI**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **DESCRIPTION**<br>This PowerShell script creates template files for **exercises** and **problems** along with their test files in the `Introduction-to-Algorithms-clrs-exercises` repository.<br>It is always run from:<br>`C:\GitHub\Repo\Scripts`<br><br>It creates files in:<br>`src\ChapterXX`<br>`tests\ChapterXX`<br>where `XX` is the chapter number (`01`..`35`).                                                                                                                                                               | **OPIS**<br>Ten skrypt PowerShell tworzy pliki szablonów dla **ćwiczeń** i **problemów** oraz ich testów w repozytorium `Introduction-to-Algorithms-clrs-exercises`.<br>Zawsze uruchamiany z:<br>`C:\GitHub\Repo\Scripts`<br><br>Tworzy pliki w:<br>`src\ChapterXX`<br>`tests\ChapterXX`<br>gdzie `XX` to numer rozdziału (`01`..`35`).                                                                                                                                                                                          |
| **OPTIONS**<br>- `-Chapter XX` → chapter number (required, e.g., `01`, `02`, ..., `35`)<br>- `-Name`:<br> • For exercises: `X_Y_Z` (e.g., `3_1_6`) → creates `Exercise_X_Y_Z.py` and `test_exercise_X_Y_Z.py`<br> • For problems: `X_Y` (e.g., `3_1`) → creates `Problem_X_Y.py` and `test_problem_X_Y.py`<br>- `-OnlyExercise` → create only the exercise/problem file<br>- `-OnlyTest` → create only the test file<br>- `-Sync` → list missing tests for existing exercises/problems and missing exercises/problems for existing tests | **OPCJE**<br>- `-Chapter XX` → numer rozdziału (wymagany, np. `01`, `02`, ..., `35`)<br>- `-Name`:<br> • Dla ćwiczeń: `X_Y_Z` (np. `3_1_6`) → tworzy `Exercise_X_Y_Z.py` i `test_exercise_X_Y_Z.py`<br> • Dla problemów: `X_Y` (np. `3_1`) → tworzy `Problem_X_Y.py` i `test_problem_X_Y.py`<br>- `-OnlyExercise` → utwórz tylko plik zadania/problemu<br>- `-OnlyTest` → utwórz tylko plik testu<br>- `-Sync` → pokaż brakujące testy dla istniejących ćwiczeń/problemów i brakujące ćwiczenia/problemy dla istniejących testów |
|                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
## Przykłady użycia - example of using:

1. Utwórz plik do zadania + test w np: "Chapter03" dla zadania np: "1_2_3":
```bash
.\New_Item_ExerciseOrTest.ps1 -Chapter 03 -Name 3_1_8
```

```bash
New_Item_ExerciseOrTest.ps1 -Chapter 03 -Name 3_2_1
```

2. Utwórz plik do problemu np: "Chapter03" dla zadania np: "3_4":
```bash
New_Item_ExerciseOrTest.ps1 -Chapter 03 -Name 3_4
```

3. Utwórz tylko plik zadania:
```bash
.\New_Item_ExerciseOrTest.ps1 -Chapter 03 -Name 1_2_3 -OnlyExercise
```

4. Utwórz plik tylko plik testu:
```bash
.\New_Item_ExerciseOrTest.ps1 -Chapter 03 -Name 1_2_3 -OnlyTest
```




---

```PowerShell
# New-Item-ExerciseOrTest.ps1 --> PowerShell
param(
    [Parameter(Mandatory=$true)]
    [ValidatePattern('^\d{2}$')]
    [string]$Chapter,               # e.g., 01, 02, ..., 35

    [string]$Name,                  # e.g., 3_1_6 for Exercise, 3_1 for Problem
    [switch]$OnlyExercise,          # Create only the main file
    [switch]$OnlyTest,              # Create only the test file
    [switch]$Sync                   # Sync mode
)

# Base paths
$repoRoot = "C:\GitHub\Repo\Introduction-to-Algorithms-clrs-exercises"
$srcDir   = Join-Path $repoRoot "src\Chapter$Chapter"
$testsDir = Join-Path $repoRoot "tests\Chapter$Chapter"

# Create directories if they don't exist
if (-not (Test-Path $srcDir))   { New-Item -ItemType Directory -Path $srcDir   | Out-Null }
if (-not (Test-Path $testsDir)) { New-Item -ItemType Directory -Path $testsDir | Out-Null }

# --- SYNC MODE ---
if ($Sync) {
    Write-Host "=== SYNC REPORT for Chapter$Chapter ===" -ForegroundColor Cyan
    $srcFiles = Get-ChildItem -Path $srcDir -Filter "*.py" -ErrorAction SilentlyContinue |
        ForEach-Object { $_.BaseName }
    $testFiles = Get-ChildItem -Path $testsDir -Filter "*.py" -ErrorAction SilentlyContinue |
        ForEach-Object { $_.BaseName }
    $missingTests = @()
    foreach ($src in $srcFiles) {
        $expectedTest = if ($src -like "Exercise_*") { "test_" + $src } else { "test_" + $src }
        if ($testFiles -notcontains $expectedTest) {
            $missingTests += $expectedTest
        }
    }
    
    $missingSrc = @()
    foreach ($test in $testFiles) {
        $expectedSrc = $test -replace '^test_', ''
        if ($srcFiles -notcontains $expectedSrc) {
            $missingSrc += $expectedSrc
        }
    }

    if ($missingTests.Count -gt 0) {
        Write-Host "`nMissing TESTS for existing files:" -ForegroundColor Yellow
        $missingTests | ForEach-Object { Write-Host " - $_" }
    } else {
        Write-Host "`nNo missing tests found." -ForegroundColor Green
    }

    if ($missingSrc.Count -gt 0) {
        Write-Host "`nMissing SOURCE files for existing tests:" -ForegroundColor Yellow
        $missingSrc | ForEach-Object { Write-Host " - $_" }
    } else {
        Write-Host "`nNo missing source files found." -ForegroundColor Green
    }
    exit
}

if (-not $Name) {
    Write-Error "You must provide -Name in format X_Y_Z for Exercise or X_Y for Problem"
    exit
}

# Detect type: Exercise or Problem
if ($Name -match '^\d+_\d+_\d+$') {
    $type = "Exercise"
    $exerciseFile = "${type}_${Name}.py"
    $testFile     = "test_$($type.ToLower())_${Name}.py"
}
elseif ($Name -match '^\d+_\d+$') {
    $type = "Problem"
    $exerciseFile = "${type}_${Name}.py"
    $testFile     = "test_$($type.ToLower())_${Name}.py"
}
else {
    Write-Error "Invalid -Name format. Use X_Y_Z for Exercise or X_Y for Problem."
    exit
}

# Templates
$exerciseTemplate = @"
\"\"\"
Mathematical proof or explanation (comment in English):

[Insert a proof or a description of the solution here, if applicable.]
\"\"\"

def solution_function(*args, **kwargs):
    \"\"\"
    Core solution logic for the $type.
    Replace parameters and logic with the actual implementation.
    \"\"\"
    # TODO: Implement the actual algorithm
    return None

if __name__ == "__main__":
    print("Demonstration of $type ${Name}:")
    example_result = solution_function()
    print("Example result:", example_result)
"@

$testTemplate = @"
\"\"\"
Proof or explanation (comment in English):
\"\"\"

import pytest
from src.Chapter$Chapter.${type}_${Name} import solution_function

def test_basic_case():
    assert solution_function() is None

def test_additional_case():
    assert True
"@

# Create files
if (-not $OnlyTest) {
    $exercisePath = Join-Path $srcDir $exerciseFile
    if (-not (Test-Path $exercisePath)) {
        Set-Content -Path $exercisePath -Value $exerciseTemplate -Encoding UTF8
        Write-Host "Created $type file:" $exerciseFile
    } else {
        Write-Warning "$type file already exists: $exerciseFile"
    }
}

if (-not $OnlyExercise) {
    $testPath = Join-Path $testsDir $testFile
    if (-not (Test-Path $testPath)) {
        Set-Content -Path $testPath -Value $testTemplate -Encoding UTF8
        Write-Host "Created test file:" $testFile
    } else {
        Write-Warning "Test file already exists: $testFile"
    }
}

