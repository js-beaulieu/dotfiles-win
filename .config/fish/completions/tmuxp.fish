# all available commands
set -l cmds 'load shell import convert debug-info ls edit freeze'

# disable all file completions
complete -c tmuxp -f

# `load` command - list available profiles in `~/.tmuxp/`
for file in "$HOME/.tmuxp"/*.yaml
    complete -c tmuxp -n "__fish_seen_subcommand_from load" \
        -a "(basename $file '.yaml')"
end

