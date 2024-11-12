#!/usr/bin/bash
# HAVE TO START FROM REPO ROOT

git clone https://github.com/Rirusha/altrepo2vala.git subprojects/altrepo2vala
python3 subprojects/altrepo2vala/generator.py 'Vladimir Vaskov' lib
python3 auto-update/update_meson.py lib/meson.build
