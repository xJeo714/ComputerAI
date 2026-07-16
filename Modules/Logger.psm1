# ==========================================
# Logger Module
# Computer AI
# ==========================================

$LogFolder = Join-Path $PSScriptRoot "..\Logs"

if (!(Test-Path $LogFolder)) {
    New-Item -ItemType Directory -Path $LogFolder | Out-Null
}

$LogFile = Join-Path $LogFolder "$(Get-Date -Format 'yyyy-MM-dd').log"

function Write-Log {

    param(
        [string]$Message,
        [string]$Level = "INFO"
    )

    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    $entry = "[$timestamp] [$Level] $Message"

    Add-Content -Path $LogFile -Value $entry

    Write-Host $entry -ForegroundColor DarkGray
}

Export-ModuleMember -Function Write-Log