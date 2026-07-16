# ==========================================
# Recognition Module
# Computer AI
# ==========================================

Add-Type -AssemblyName System.Speech

$script:Recognizer = $null

function Initialize-Recognition {

    $script:Recognizer = New-Object System.Speech.Recognition.SpeechRecognitionEngine

    $grammar = New-Object System.Speech.Recognition.DictationGrammar

    $script:Recognizer.LoadGrammar($grammar)

    $script:Recognizer.SetInputToDefaultAudioDevice()
}

function Listen {

    if ($null -eq $script:Recognizer) {
        throw "Recognition engine has not been initialized."
    }

    Write-Host ""
    Write-Host "Listening..." -ForegroundColor Yellow

    $result = $script:Recognizer.Recognize()

    if ($result) {
        Write-Host "Heard: $($result.Text)" -ForegroundColor Cyan
        return $result.Text
    }

    return $null
}

Export-ModuleMember -Function Initialize-Recognition, Listen