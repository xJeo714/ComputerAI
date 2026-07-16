# ==========================================
# Commands Module
# Computer AI
# ==========================================
Import-Module "$PSScriptRoot\Logger.psm1" -Force
function Invoke-ComputerCommand {

    param(
        [Parameter(Mandatory)]
        [string]$Command
    )
Write-Log "Executing command: $Command"
    switch ($Command.ToLower())
    {
        "version" {

    Speak "Computer AI Version 0.4"

}
"system" {

    $os = Get-CimInstance Win32_OperatingSystem

    Speak "You are running $($os.Caption)"
}
"restart" {

    Speak "Restarting Computer AI."

    return "RESTART"
}
        "help" {

            Write-Host ""
            Write-Host "Available Commands"
            Write-Host "------------------"
            Write-Host "help"
            Write-Host "time"
            Write-Host "date"
            Write-Host "notepad"
            Write-Host "calculator"
            Write-Host "clear"
            Write-Host "exit"
        }

        "time" {

            Speak (Get-Date -Format "h:mm tt")
        }

        "date" {

            Speak (Get-Date -Format "D")
        }

        "notepad" {

            Speak "Opening Notepad."

            Start-Process notepad.exe
        }

        "calculator" {

            Speak "Opening Calculator."

            Start-Process calc.exe
        }

        "clear" {

            Clear-Host
        }

        "exit" {

            Speak "Goodbye."

            return $false
        }

        default {

            Speak "I don't recognize that command."
        }
    }

    return $true
}

Export-ModuleMember -Function Invoke-ComputerCommand