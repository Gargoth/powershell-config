function Prompt {
    $promptString = "PS " + $(Get-Location) + ">"
    Write-Host $promptString -NoNewline -ForegroundColor Yellow
    return " "
}

function Fish-Ls {
    param (
        $Directory
    )

    wsl -e fish -c "ls $Directory"
}

function Fish-La {
    param (
        $Directory
    )

    wsl -e fish -c "la $Directory"
}

function Fish-Ll {
    param (
        $Directory
    )

    wsl -e fish -c "ll $Directory"
}

function Fish-Lt {
    param (
        $Directory
    )

    wsl -e fish -c "lt $Directory"
}

function Fish-Ldir {
    param (
        $Directory
    )

    wsl -e fish -c "ldir $Directory"
}

function Cd-Up {
    Set-Location ..
}

function Cd-With-Default {
    param (
        $Directory
    )

    if ($Directory -eq $null) {
        Set-Location ~
    } else {
        Set-Location $Directory
    }
}

function Goto-PowerShellConfig {
    Set-Location ~/Documents/WindowsPowerShell
}

function Goto-NvimConfig {
    Set-Location ~/AppData/Local/nvim
}

function Goto-WSLHome {
    Set-Location \\wsl.localhost\Ubuntu-22.04\home\gargoth
}

function Fish-Execute {
    param (
        $Command
    )

    wsl -e fish -c $Command
}

Set-Alias -Name ls -Value Fish-Ls -Option AllScope
Set-Alias -Name la -Value Fish-La
Set-Alias -Name ll -Value Fish-Ll
Set-Alias -Name lt -Value Fish-Lt
Set-Alias -Name ldir -Value Fish-Ldir
Set-Alias -Name .. -Value Cd-Up
Set-Alias -Name cd -Value Cd-With-Default -Option AllScope
Set-Alias -Name psconf -Value Goto-PowerShellConfig
Set-Alias -Name nvimconf -Value Goto-NvimConfig
Set-Alias -Name lnx -Value Goto-WSLHome
Set-Alias -Name fish -Value Fish-Execute
