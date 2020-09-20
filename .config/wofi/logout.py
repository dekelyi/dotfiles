#!/usr/bin/env python
from pathlib import Path
import subprocess
from typing import Optional
import os

STYLE_PATH = Path('~/.config/wofi/style.css').expanduser().resolve()
WOFI_COMMAND = ['wofi', '--dmenu', '--style', STYLE_PATH]
ACTIONS = {
    'lock': ['loginctl', 'lock-session'],
    'logout': ['loginctl', 'terminate-session', os.environ['XDG_SESSION_ID']],
    'suspend': ['systemctl', 'suspend'],
    'poweroff': ['systemctl', 'poweroff'],
    'restart': ['systemctl', 'reboot'],
}


def get_choice() -> Optional[str]:
    cmd = subprocess.run(WOFI_COMMAND, input="\n".join(
        ACTIONS.keys()), capture_output=True, text=True)
    if cmd.returncode != 0:
        return None
    return cmd.stdout.strip()


def do_action(choice: str):
    action = ACTIONS[choice]
    subprocess.run(action)


if __name__ == "__main__":
    choice = get_choice()
    if choice is not None:
        do_action(choice)
