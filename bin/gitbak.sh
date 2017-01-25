#!/bin/bash
# set -ex
# exec 1<>/tmp/gitbak.sh.log
# exec 2<>/tmp/gitbak.sh.err

FULLNAME=$(readlink -f $1)
DIRNAME=$(dirname $FULLNAME)
BAKDIR=$2
TARGETNAME=$BAKDIR$FULLNAME
TARGETDIR=$BAKDIR$DIRNAME

[[ -e $BAKDIR ]] || mkdir -p $BAKDIR
cd $BAKDIR
[[ -e $BAKDIR/.git ]] || git init


mkdir -p $TARGETDIR
cp $FULLNAME $TARGETNAME
git add .
git commit -m "Backup from Vim"

