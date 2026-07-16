# ==========================================
# Speech Module
# Computer AI
# ==========================================

Add-Type -AssemblyName System.Speech

$script:Speaker = $null

function Initialize-Speech {

    param(
        [int]$Volume = 100,
        [int]$Rate = 0
    )

    $script:Speaker = New-Object System.Speech.Synthesis.SpeechSynthesizer

    $script:Speaker.Volume = $Volume
    $script:Speaker.Rate   = $Rate
}

function Speak {

    param(
        [Parameter(Mandatory)]
        [string]$Text
    )

    if ($null -eq $script:Speaker) {
        throw "Speech engine has not been initialized."
    }

    Write-Host "Computer: $Text" -ForegroundColor Green

    $script:Speaker.Speak($Text)
}

Export-ModuleMember -Function Initialize-Speech, Speak