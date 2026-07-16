# ==========================================
# Config Module
# Computer AI
# ==========================================

$script:Config = $null

function Initialize-Config {

    $configPath = Join-Path $PSScriptRoot "..\Config.json"

    if (!(Test-Path $configPath)) {
        throw "Config.json not found."
    }

    $script:Config = Get-Content $configPath -Raw | ConvertFrom-Json
}

function Get-Config {

    if ($null -eq $script:Config) {
        Initialize-Config
    }

    return $script:Config
}

Export-ModuleMember -Function Initialize-Config, Get-Config