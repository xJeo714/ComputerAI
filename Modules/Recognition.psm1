Add-Type -AssemblyName System.SpeechImport-Module "$PSScriptRoot\Modules\Recognition.psm1" -Force

$Global:Recognizer = New-Object System.Speech.Recognition.SpeechRecognitionEngine

$Global:Recognizer.LoadGrammar(
    (New-Object System.Speech.Recognition.DictationGrammar)
)

$Global:Recognizer.SetInputToDefaultAudioDevice()

function Listen {

    Write-Host ""
    Write-Host "Listening..." -ForegroundColor Yellow

    $result = $Global:Recognizer.Recognize()

    if ($result) {
        Write-Host "Heard: $($result.Text)" -ForegroundColor Cyan
        return $result.Text
    }

    return $null
}

Export-ModuleMember -Function Listen