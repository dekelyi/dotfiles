#!/usr/bin/env python
# Get current keyboard layout short form
import json
import subprocess


cmd = cmd = subprocess.run(
    ['swaymsg', '-t', 'get_inputs'], capture_output=True
)

js = json.loads(cmd.stdout.lower())
devices = [x for x in js if x['type'] == 'keyboard']
layout = devices[0]["xkb_active_layout_name"]
if layout.startswith("english"):
    print("EN")
if layout.startswith("hebrew"):
    print("HEB")
