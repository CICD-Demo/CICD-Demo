#!/bin/bash

cd $(dirname $0)/..

. bin/utils
. environment

callback() {
  pushd $1/$2 &>/dev/null
  git remote rm origin
  git remote add origin $GITROOT_PUSH/$(basename $(realpath .))
  git push -u origin $(git symbolic-ref --short HEAD)
  popd &>/dev/null
}

all_repos "$MONSTER_REPOS" monster callback
all_repos "$INFRA_REPOS" infra callback
all_repos "$DEV_REPOS" dev callback
all_repos . . callback
