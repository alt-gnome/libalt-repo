#!/usr/bin/bash
# HAVE TO START FROM REPO ROOT

git clone https://github.com/Rirusha/altrepo2vala.git subprojects/altrepo2vala
python3.12 subprojects/altrepo2vala/generator.py 'Vladimir Vaskov' lib
python3.12 auto-update/update_meson.py lib/meson.build
