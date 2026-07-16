Add-Type -AssemblyName System.Speech

$recognizer = New-Object System.Speech.Recognition.SpeechRecognitionEngine

$recognizer.LoadGrammar(
    (New-Object System.Speech.Recognition.DictationGrammar)
)

$recognizer.SetInputToDefaultAudioDevice()

Write-Host "Listening... Speak now."

$result = $recognizer.Recognize()

if ($result) {
    Write-Host "You said: $($result.Text)"
}
else {
    Write-Host "Nothing recognized."
}