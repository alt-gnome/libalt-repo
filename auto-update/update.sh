#!/usr/bin/bash
# HAVE TO START FROM REPO ROOT

set -e

rm -rf auto-update/altrepo2vala/

current_date=$(date +%Y.%m.%d)

rm -rf lib/client.vala lib/objects/*
git clone https://github.com/Rirusha/altrepo2vala.git auto-update/altrepo2vala
echo "*" >> auto-update/altrepo2vala/.gitignore

python3.12 auto-update/altrepo2vala/generator.py 'Vladimir Vaskov' lib
python3.12 auto-update/update_meson.py lib/meson.build
python3.12 auto-update/update_main_meson.py meson.build $current_date

git add .
if git commit -m "update: regular lib update" ; then
    # git push
    # git tag $current_date -a -m "Automatic update"
    # git push origin $current_date
else
    echo "Nothing to do"
fi
