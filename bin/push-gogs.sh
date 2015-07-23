#!/bin/bash

cd $(dirname $0)/..

. bin/utils
. environment

callback() {
  [ -e $1/$2/build.sh ] || return

  pushd $1/$2 &>/dev/null
  git remote rm origin
  git remote add origin http://administrator:$DEMOPW@$SVCIP/$INTEGRATION/$(basename $(realpath .))
  GIT_SSH=../../bin/issh git push -u origin master
  popd &>/dev/null
}

SVCIP=$(oc get services gogs -o template --template='{{.spec.portalIP}}')
all_repos "$MONSTER_REPOS" monster callback
