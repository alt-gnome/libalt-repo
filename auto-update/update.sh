#!/usr/bin/bash
# HAVE TO START FROM REPO ROOT

set -e

rm -rf auto-update/altrepo2vala/

rm -rf lib/client.vala lib/objects/*
git clone https://github.com/Rirusha/altrepo2vala.git auto-update/altrepo2vala
echo "*" >> auto-update/altrepo2vala/.gitignore

python3.12 auto-update/altrepo2vala/generator.py 'Vladimir Vaskov' lib
python3.12 auto-update/update_meson.py lib/meson.build

git add .
git commit -m "update: regular lib update"
git pull

date = $(date +%Y.%m.%d)

git tag $(date) -a -m "Automatic update"
git push origin $(date)
