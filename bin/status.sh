#!/bin/bash

cd $(dirname $0)/..

. bin/utils
. environment

callback() {
  pushd $1/$2 &>/dev/null
  git status
  popd &>/dev/null
}

all_repos "$MONSTER_REPOS" monster callback
all_repos "$INFRA_REPOS" infra callback
all_repos "$DEV_REPOS" dev callback
all_repos . . callback
