#!/usr/bin/env bash

if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
    updates_arch=0
fi

if ! updates_aur=$(yay -Qum 2> /dev/null | wc -l); then
    updates_aur=0
fi

updates_count=$((updates_arch + updates_aur))
if [ "$updates_count" -gt 0 ]; then
    update_word="update"
    if [ "$updates_count" -gt 1 ]; then
        update_word="${update_word}s"
    fi
    echo "$updates_count $update_word pending"
else
    echo ""
fi
