#----------------------------------------
# fisher
#----------------------------------------
if status is-interactive && ! functions --query fisher
    curl --silent --location https://git.io/fisher | source && fisher update
end

#----------------------------------------
# fish
#----------------------------------------
fish_vi_key_bindings
set fish_greeting

# use terminal colors
set fish_color_normal normal
set fish_color_command --bold
set fish_color_param cyan
set fish_color_redirection brblue
set fish_color_comment red
set fish_color_error brred
set fish_color_escape bryellow --bold
set fish_color_operator bryellow
set fish_color_end brmagenta
set fish_color_quote yellow
set fish_color_autosuggestion 555 brblack
set fish_color_user brgreen

#----------------------------------------
# environment variables
#----------------------------------------
set -gx FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!.git/*"'
set -gx EDITOR nvim

# pyenv
set -gx PYENV_ROOT $HOME/.pyenv

# fix for java apps in tiling WMs
set -gx _JAVA_AWT_WM_NONREPARENTING 1

# flatpak
set -l xdg_data_home $XDG_DATA_HOME "$HOME/.local/share"
set -gx --path XDG_DATA_DIRS $xdg_data_home[1]/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share

# nvm
set -gx NODE_VERSIONS $HOME/.local/share/nvm
set -gx NODE_VERSION_PREFIX ""

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"

# set browser in WSL
grep -iq Microsoft /proc/version && set -gx BROWSER wslview

#----------------------------------------
# path
#----------------------------------------
fish_add_path "$HOME/.local/bin"
fish_add_path /usr/local/go/bin
fish_add_path "$HOME/.poetry/bin"
fish_add_path "$HOME/.cargo/bin"
fish_add_path "$HOME/.local/share/flatpak/exports/bin"
fish_add_path /var/lib/flatpak/exports/bin
fish_add_path "$PYENV_ROOT/bin"
fish_add_path "$HOME/.rover/bin"
fish_add_path "$PNPM_HOME"

#----------------------------------------
# aliases & functions
#----------------------------------------
alias ls exa
abbr -a cb 'xclip -se c'
abbr -a ll 'ls -lh'
abbr -a la 'ls -lha'
abbr -a tna 'tmux new -A -s'
abbr -a gdh 'git diff HEAD'
abbr -a nr 'npm run'
abbr -a vim nvim

function cat
    set ex (command -v batcat || command -v bat || command -v cat)
    eval (printf '%s %s\n' $ex $argv)
end

function mcd -d "Create a directory and cd into it"
    mkdir -pv $argv
    cd $argv
end

function dockstop -d "Stop docker containers by name pattern"
    set -l pattern $argv[1]
    if test -z "$pattern"
        echo "Stopping all containers"
        docker stop $(docker ps -q)
    else
        echo "Stopping containers starting with '$pattern'"
        docker ps --format '{{.Names}}' | grep "$1" | awk '{print $1}' | xargs -I {} docker stop {}
    end
end

function hugo -d "Run hugo static site generator with docker"
    docker run --rm -it -v $(pwd):/src -p 1313:1313 klakegg/hugo $argv
end

function grc -d "List recently modified branches - 'git recent'"
    git for-each-ref \
      --sort=-committerdate refs/heads/ \
      --format='%(HEAD) %(color:red)%(objectname:short)%(color:reset) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'
end

function scratch -d "Create a scratch bash script in cwd" -a name
    if not test -n "$name"
        echo "File name not provided"
        return 1
    end

    set filename "./_scratch_$name.sh"
    touch "$filename"
    echo "#!/usr/bin/env bash" > "$filename"
    chmod +x "$filename"
    echo "Scratch file created at $filename"
end

#----------------------------------------
# tools
#----------------------------------------
# pyenv
status is-login && pyenv init --path | source
status is-interactive && pyenv init - | source

# direnv
direnv hook fish | source

# starship prompt
starship init fish | source
