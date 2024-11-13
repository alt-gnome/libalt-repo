#!/usr/bin/bash
# HAVE TO START FROM REPO ROOT

rm -rf lib/client.vala lib/objects/*

git clone https://github.com/Rirusha/altrepo2vala.git auto-update/altrepo2vala
echo "*" >> auto-update/altrepo2vala/.gitignore

python3.12 auto-update/altrepo2vala/generator.py 'Vladimir Vaskov' lib
python3.12 auto-update/update_meson.py lib/meson.build
