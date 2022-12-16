import argparse
import subprocess
import sys
from typing import Literal, Any


SCRIPT_NAME = "System updates"


def notify(title: str, text: str, urgency: Literal["low", "normal", "critical"]="normal") -> None:
    subprocess.run(["notify-send", "-u", urgency, title, text])


def pluralize(count: int, singular: str, plural: str) -> str:
    return plural if count > 1 else singular


def handler_count(_: Any) -> None:
    # count pacman updates
    try:
        checkupdates = subprocess.run(["checkupdates"], stdout=subprocess.PIPE, check=True)
        pacman_updates = checkupdates.stdout.decode("utf-8").splitlines()
    except:
        pacman_updates = []

    # count AUR updates
    checkupdates = subprocess.run(["yay", "-Qum"], stdout=subprocess.PIPE, check=True)
    aur_updates = checkupdates.stdout.decode("utf-8").splitlines()

    # don't show anything if no updates
    total_updates = len(pacman_updates) + len(aur_updates)
    if total_updates < 1:
        print("")
        sys.exit(0)
    
    # output the remaining number of updates
    print(f"{total_updates} {pluralize(total_updates, 'update', 'updates')} available")


def handler_install(_: Any) -> None:
    try:
        subprocess.run(
            ["kitty", "-o", "initial_window_width=100c", "-o", "initial_window_height=30c", "--class", "jsb-pkg-updates", "yay", "-Syu"],
            check=True,
        )
    except:
        notify(SCRIPT_NAME, "Updates failed to install", "critical")
    else:
        notify(SCRIPT_NAME, "Updates installed successfully")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Check for pacman/yay updates")
    subparsers = parser.add_subparsers(required=True)

    parser_count = subparsers.add_parser(
        "count",
        help="Checks the amount of pending notification",
    )
    parser_count.set_defaults(func=handler_count)

    parser_install = subparsers.add_parser(
        "install",
        help="Install updates",
    )
    parser_install.set_defaults(func=handler_install)

    try:
        args = parser.parse_args()
    except:
        sys.exit(1)
    args.func(args)

