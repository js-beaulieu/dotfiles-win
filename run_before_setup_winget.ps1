# Check if winget is installed
Try {
    Get-Command winget
    Write-Host "winget is installed. proceeding..."
} Catch {
    Write-Host "winget is not installed. skipping..."
    Exit
}

# Install packages
Write-Host "installing winget packages"
winget import -i "$(chezmoi source-path)/wingetfile" --accept-source-agreements --accept-package-agreements --no-upgrade --disable-interactivity
