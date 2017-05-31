#!/bin/bash
git init
git remote add origin https://github.com/manuelmarcano22/VIMOSReduced.git
git fetch
git reset origin/master  # this is required if files in the non-empty directory are in the repo
git checkout master
./downloadfits.sh
