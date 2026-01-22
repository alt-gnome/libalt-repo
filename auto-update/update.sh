#!/usr/bin/bash
# HAVE TO START FROM REPO ROOT

set -e

current_api_version=$(python3 auto-update/print_api_version.py)
tag_name="v$current_api_version"

if ! git describe --tags --abbrev=0 >/dev/null 2>&1; then
    echo "No tags found in the repository"
    exit 1
fi

if [ "$tag_name" = "$(git describe --tags --abbrev=0)" ]; then
    echo "Nothing to do"
    exit 0
fi

rm -rf auto-update/altrepo2vala/
rm -rf lib/client.vala lib/objects/*
git clone https://altlinux.space/rirusha/altrepo2vala.git auto-update/altrepo2vala
echo "*" >> auto-update/altrepo2vala/.gitignore

python3 auto-update/altrepo2vala/generator.py 'Vladimir Vaskov' lib 2
python3 auto-update/update_meson.py lib/meson.build

git add .
if git commit -m "update: regular lib update" ; then
    python3 auto-update/update_main_meson.py meson.build $current_api_version

    git add .
    if git commit -m "chore: bump version to $current_api_version" ; then
        git push
    fi
else
    python3 auto-update/update_main_meson.py meson.build $current_api_version

    git add .
    if git commit -m "chore: bump version to $current_api_version" ; then
        git push
    fi

    echo "Nothing to do"
fi

git tag $tag_name
git push origin $tag_name
