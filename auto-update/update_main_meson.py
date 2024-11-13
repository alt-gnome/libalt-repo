#!/usr/bin/python3

import sys
import os

meson_build_path = sys.argv[1]
new_version = sys.argv[2]

meson_lines:list[str] = []

with (open(meson_build_path, 'r')) as f:
    meson_lines = f.readlines()

ignore = False
with (open(meson_build_path, 'w')) as f:
    for line in meson_lines:
        if line.strip().startswith("version:"):
            f.write(f"  version: '1.{new_version}',\n")
        else:
            f.write(line)
    