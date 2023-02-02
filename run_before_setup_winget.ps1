# Install packages
winget import -i "$(chezmoi source-path)/wingetfile" --accept-source-agreements --accept-package-agreements --no-upgrade --disable-interactivity
