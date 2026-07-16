Add-Type -AssemblyName System.Speech

$Speaker = New-Object System.Speech.Synthesis.SpeechSynthesizer

function Initialize-Speech {
    param(
        [int]$Volume = 100,
        [int]$Rate = 0
    )

    $Speaker.Volume = $Volume
    $Speaker.Rate   = $Rate
}

function Speak {
    param([string]$Text)

    Write-Host ""
    Write-Host "Computer: $Text" -ForegroundColor Green

    $Speaker.Speak($Text)
}

Export-ModuleMember -Function Initialize-Speech, Speak