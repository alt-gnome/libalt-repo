#!/usr/bin/bash
# HAVE TO START FROM REPO ROOT

set -e

rm -rf auto-update/altrepo2vala/

current_api_version=$(python3 auto-update/print_api_version.py)

rm -rf lib/client.vala lib/objects/*
git clone https://github.com/Rirusha/altrepo2vala.git auto-update/altrepo2vala
echo "*" >> auto-update/altrepo2vala/.gitignore

python3.12 auto-update/altrepo2vala/generator.py 'Vladimir Vaskov' lib
python3.12 auto-update/update_meson.py lib/meson.build

git add .
if git commit -m "update: regular lib update" ; then
    python3.12 auto-update/update_main_meson.py meson.build $current_api_version

    git add .
    git commit -m "chore: bump version to $current_api_version"

    git tag "v$current_api_version"
    git push
    git push origin $current_api_version
else
    echo "Nothing to do"
fi
