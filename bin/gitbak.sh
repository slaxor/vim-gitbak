#!/bin/bash
set -ex
exec 1<>/tmp/gitbak.sh.log
exec 2<>/tmp/gitbak.sh.err

FULLNAME=$(readlink -f "$1")
DIRNAME=$(dirname "$FULLNAME")
BAKDIR="$2"
TARGETNAME="$BAKDIR$FULLNAME"
TARGETDIR="$BAKDIR$DIRNAME"

if [[ -e "$BAKDIR" ]] ;then
  mkdir -p "$BAKDIR"
  chmod 0700 "$BAKDIR"
fi

if [[ -e "$BAKDIR/.git" ]] ; then
  cd "$BAKDIR"
  git init
fi

mkdir -p "$TARGETDIR"
cp "$FULLNAME" "$TARGETNAME"
git add .
git commit -m "$FULLNAME"

