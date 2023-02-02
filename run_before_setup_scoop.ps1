# Install scoop
if (Get-Command "scoop.exe" -ErrorAction SilentlyContinue) {
    Write-Host "Installing scoop"
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
    irm get.scoop.sh | iex
} else {
    Write-Host "Scoop is already installed"
}

# Install packages
$Packages = @(
    "7zip"
    "bitwarden"
    "bitwarden-cli"
    "chezmoi"
    "etcher"
    "git"
    "git-aliases"
    "micaforeveryone"
    "neovim"
    "obsidian"
    "peazip"
    "pwsh"
    "scoop-search"
    "sourcetree"
    "starship"
    "sudo"
    "terminal-icons"
    "via"
)
foreach ($Package in $Packages) {
    scoop install $Package
}

