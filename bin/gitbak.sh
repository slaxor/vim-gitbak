#!/bin/bash
# set -ex
# exec 1<>~/tmp/gitbak.sh.log
# exec 2<>~/tmp/gitbak.sh.err

FULLNAME=$(readlink -f "$1")
DIRNAME=$(dirname "$FULLNAME")
BAKDIR="$2"
TARGETNAME="$BAKDIR$FULLNAME"
TARGETDIR="$BAKDIR$DIRNAME"

if [[ ! -e "$BAKDIR" ]] ;then
  mkdir -p "$BAKDIR"
  chmod 0700 "$BAKDIR"
fi

cd "$BAKDIR"

if [[ ! -e "$BAKDIR/.git" ]] ; then
  git init
fi

if [[ ! -e "$TARGETDIR" ]] ; then
  mkdir -p "$TARGETDIR"
fi

git config --get user.email || git config user.email "$USER@$HOSTNAME"
git config --get user.name ||  git config user.name "$USER"



cp "$FULLNAME" "$TARGETNAME"
git add .
git commit -m "\"$FULLNAME\""

