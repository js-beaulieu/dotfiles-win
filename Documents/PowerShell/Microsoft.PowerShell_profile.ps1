# Replace scoop search by scoop-search (much faster)
Invoke-Expression (&scoop-search --hook)

# Load starship prompt
Invoke-Expression (&starship init powershell)
