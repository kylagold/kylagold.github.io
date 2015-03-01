#!/usr/bin/env bash
source /etc/profile.d/rvm.sh
cd /kylagold
#jekyll build --watch &
jekyll serve -H 0.0.0.0 -P 8000 --watch --force_polling
