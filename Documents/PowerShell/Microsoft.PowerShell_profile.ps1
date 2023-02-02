# Aliases/functions
New-Alias -Name touch -Value ni

function which($cmd) {
    (Get-Command $cmd).Definition
}

function yep {
    Write-Host "Exporting scoop packages..."
    scoop export > "$(chezmoi source-path)/scoopfile"
    Write-Host "Exporting winget packages..."
    winget export -o "$(chezmoi source-path)/wingetfile"
}

# Replace scoop search by scoop-search (much faster)
Invoke-Expression (&scoop-search --hook)

# Load starship prompt
Invoke-Expression (&starship init powershell)

# Load terminal 'dir' icons module
Import-Module -Name Terminal-Icons

# Load oh-my-zsh like git aliases
Import-Module git-aliases -DisableNameChecking

