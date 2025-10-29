# Activation script that activates Python venv and ensures Flutter is available
.\venv\Scripts\Activate.ps1

# Add Flutter to PATH if not already there
if ($env:Path -notlike "*C:\src\flutter\bin*") {
    $env:Path = "C:\src\flutter\bin;$env:Path"
}

Write-Host "✓ Python venv activated" -ForegroundColor Green
Write-Host "✓ Flutter available" -ForegroundColor Green
Write-Host ""
Write-Host "Python: $(python --version 2>&1 | Select-String -Pattern '\d+\.\d+')" -ForegroundColor Cyan
Write-Host "Flutter: $(flutter --version 2>&1 | Select-String -Pattern 'Flutter \d+\.\d+')" -ForegroundColor Cyan

