#!/usr/bin/env python
import json
import subprocess


def get_layout(s: str) -> str:
    js = json.loads(s)
    devices = [x for x in js if x['type'] == 'keyboard']
    # print(device)
    return devices[0]["xkb_active_layout_name"]


def get_list() -> bytes:
    cmd = subprocess.run(['swaymsg', '-t', 'get_inputs'], capture_output=True)
    return cmd.stdout


def main():
    layout = get_layout(get_list()).lower()
    if layout.startswith("english"):
        return "EN"
    if layout.startswith("hebrew"):
        return "HEB"


if __name__ == "__main__":
    print(main())
