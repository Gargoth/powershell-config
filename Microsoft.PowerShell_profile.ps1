Import-Module -Name Terminal-Icons

function Prompt {
    $promptString = "PS " + $(Get-Location) + ">"
    Write-Host $promptString -NoNewline -ForegroundColor Yellow
    return " "
}

function Ls-Bashtype {
    Get-ChildItem $args -Exclude .* | Format-Wide -AutoSize
}

function La-Bashtype {
    Get-ChildItem $args -Force | Format-Wide -AutoSize
}

function Ldir-Bashtype {
    Get-ChildItem $args -Exclude .* -Attributes Directory -Force | Format-Wide -AutoSize
}

function Fish-Lt {
    param (
        $Directory
    )

    wsl -e fish -c "lt $Directory"
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

Set-Alias -Name ls -Value Ls-Bashtype -Option AllScope
Set-Alias -Name la -Value La-Bashtype
Set-Alias -Name ldir -Value Ldir-Bashtype
Set-Alias -Name lt -Value Fish-Lt
Set-Alias -Name .. -Value Cd-Up
Set-Alias -Name cd -Value Cd-With-Default -Option AllScope
Set-Alias -Name psconf -Value Goto-PowerShellConfig
Set-Alias -Name nvimconf -Value Goto-NvimConfig
Set-Alias -Name lnx -Value Goto-WSLHome
Set-Alias -Name fish -Value Fish-Execute
