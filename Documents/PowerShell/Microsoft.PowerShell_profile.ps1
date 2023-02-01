# Aliases
New-Alias -Name touch -Value ni

# Replace scoop search by scoop-search (much faster)
Invoke-Expression (&scoop-search --hook)

# Load starship prompt
Invoke-Expression (&starship init powershell)

# Load terminal 'dir' icons module
Import-Module -Name Terminal-Icons
