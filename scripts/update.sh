#!/bin/sh

filter_out_ignore(){
  for i in "$@"
  do
    [ 'scripts'  = "$i" ] && continue
    echo "$i"
  done
}

nowdir=`pwd`

cd "`dirname $0`/.."

topdir=`pwd`

git submodule deinit -f .
git submodule update --init

for workdir in `filter_out_ignore *`
do
  cd "$workdir"
  git fetch origin master
  git checkout master
  git rebase origin/master
  git submodule update --init --recursive
  cd "$topdir"
done
cd "$nowdir"
