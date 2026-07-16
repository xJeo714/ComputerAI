# ==========================================
# Computer AI Installer
# Version 0.2
# ==========================================

Clear-Host

Write-Host ""
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "        Computer AI Installer v0.2" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""

function Test-Step {
    param(
        [string]$Name,
        [scriptblock]$Test
    )

    Write-Host -NoNewline ("Checking {0,-30}" -f $Name)

    try {
        & $Test
        Write-Host "[OK]" -ForegroundColor Green
    }
    catch {
        Write-Host "[FAILED]" -ForegroundColor Red
        Write-Host "    $($_.Exception.Message)" -ForegroundColor Yellow
    }
}

# --------------------------------------------------
# PowerShell
# --------------------------------------------------

Test-Step "PowerShell Version" {

    if ($PSVersionTable.PSVersion.Major -lt 5) {
        throw "PowerShell 5 or newer is required."
    }
}

# --------------------------------------------------
# Git
# --------------------------------------------------

Test-Step "Git" {

    if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
        throw "Git is not installed."
    }
}

# --------------------------------------------------
# Ollama
# --------------------------------------------------

Test-Step "Ollama" {

    if (-not (Get-Command ollama -ErrorAction SilentlyContinue)) {
        throw "Ollama not found."
    }
}

# --------------------------------------------------
# Speech Assembly
# --------------------------------------------------

Test-Step "Windows Speech" {

    Add-Type -AssemblyName System.Speech
}

# --------------------------------------------------
# Required Files
# --------------------------------------------------

$RequiredFiles = @(
    "Computer.ps1",
    "Config.json",
    "Memory.json",
    "Conversation.json",
    "README.md"
)

foreach ($file in $RequiredFiles) {

    Test-Step $file {

        if (!(Test-Path $file)) {
            throw "$file missing."
        }
    }
}

# --------------------------------------------------
# Required Folders
# --------------------------------------------------

$RequiredFolders = @(
    "Modules",
    "Skills",
    "Plugins",
    "Assets",
    "Voices",
    "Logs"
)

foreach ($folder in $RequiredFolders) {

    Test-Step $folder {

        if (!(Test-Path $folder)) {
            throw "$folder missing."
        }
    }
}

# --------------------------------------------------
# Configuration
# --------------------------------------------------

Test-Step "Config.json" {

    Get-Content "Config.json" -Raw | ConvertFrom-Json | Out-Null
}

# --------------------------------------------------
# Memory
# --------------------------------------------------

Test-Step "Memory.json" {

    Get-Content "Memory.json" -Raw | ConvertFrom-Json | Out-Null
}

# --------------------------------------------------
# Conversation
# --------------------------------------------------

Test-Step "Conversation.json" {

    Get-Content "Conversation.json" -Raw | ConvertFrom-Json | Out-Null
}

Write-Host ""
Write-Host "==========================================" -ForegroundColor Green
Write-Host " Installation Complete" -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor Green
Write-Host ""

Write-Host "You are ready to continue building Computer AI." -ForegroundColor Cyan