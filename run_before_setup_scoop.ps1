# Install scoop
if (Get-Command "scoop.exe" -ErrorAction SilentlyContinue) {
    Write-Host "Installing scoop"
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
    irm get.scoop.sh | iex
} else {
    Write-Host "Scoop is already installed"
}

# Install packages
scoop import "$(chezmoi source-path)/scoopfile"

