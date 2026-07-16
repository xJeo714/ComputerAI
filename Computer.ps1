# ==========================================
# Computer AI
# Version 0.3
# ==========================================

Clear-Host Import-Module "$PSScriptRoot\Modules\Speech.psm1" -Force
Import-Module "$PSScriptRoot\Modules\Recognition.psm1" -Force

Write-Host ""
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "          Computer AI v0.3" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""

# Load Configuration
$config = Get-Content "$PSScriptRoot\Config.json" -Raw | ConvertFrom-Json

# Initialize Speech
Initialize-Speech `
    -Volume $config.Volume `
    -Rate $config.SpeechRate

Speak "Computer AI is now online."

# Main Loop
while ($true)
{
    $command = Read-Host "Computer"

    switch ($command.ToLower())
    {
        "help" {
            Write-Host ""
            Write-Host "Commands:"
            Write-Host "  help"
            Write-Host "  time"
            Write-Host "  date"
            Write-Host "  clear"
            Write-Host "  exit"
        }

        "time" {
            Speak (Get-Date -Format "h:mm tt")
        }

        "date" {
            Speak (Get-Date -Format "D")
        }

        "clear" {
            Clear-Host
        }
"notepad" {
    Speak "Opening Notepad."
    Start-Process notepad.exe

}"calculator" {
    Speak "Opening Calculator."
    Start-Process calc.exe

}"chrome" {
    Speak "Opening Google Chrome."
    Start-Process chrome.exe
}"voice" {

    Speak "Voice mode enabled."

    while ($true)
    {
        $heard = Listen

        if (-not $heard) {
            continue
        }

        switch ($heard.ToLower())
        {
            "computer" {
                Speak "Yes?"
            }

            "time" {
                Speak (Get-Date -Format "h:mm tt")
            }

            "date" {
                Speak (Get-Date -Format "D")
            }

            "exit voice" {
                Speak "Leaving voice mode."
                break
            }

            default {
                Speak "You said $heard"
            }
        }
    }
}
        "exit" {
            Speak "Goodbye."
            break
        }

        default {
            Speak "I don't know that command."
        }
    }
}