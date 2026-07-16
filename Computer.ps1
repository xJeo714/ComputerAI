# ==========================================
# Computer AI
# Version 0.4
# ==========================================

Clear-Host

# --------------------------------------------------
# Load Modules
# --------------------------------------------------

Import-Module "$PSScriptRoot\Modules\Config.psm1" -Force
Import-Module "$PSScriptRoot\Modules\Logger.psm1" -Force
Import-Module "$PSScriptRoot\Modules\Speech.psm1" -Force
Import-Module "$PSScriptRoot\Modules\Recognition.psm1" -Force
Import-Module "$PSScriptRoot\Modules\Commands.psm1" -Force

# --------------------------------------------------
# Banner
# --------------------------------------------------

Write-Host ""
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "          Computer AI v0.4" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""

# --------------------------------------------------
# Initialize
# --------------------------------------------------

Initialize-Config

$config = Get-Config

Initialize-Speech `
    -Volume $config.Volume `
    -Rate $config.SpeechRate

Write-Log "Computer AI Started"

Speak "Computer AI is now online."

# --------------------------------------------------
# Main Loop
# --------------------------------------------------

while ($true)
{
    $command = Read-Host "Computer"

    if ([string]::IsNullOrWhiteSpace($command))
    {
        continue
    }

    Write-Log "User Command: $command"

    $result = Invoke-ComputerCommand $command

switch ($result)
{
    $false {

        Write-Log "Computer AI Stopped"
        break
    }

    "RESTART" {

        Write-Log "Restart requested."

        continue
    }
}
}