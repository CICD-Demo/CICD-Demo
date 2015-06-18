#!/bin/bash

cd $(dirname $0)/..

. bin/utils
. environment

callback() {
  git clone $GITROOT/$2 $1/$2
}

all_repos "$MONSTER_REPOS" monster callback
all_repos "$INFRA_REPOS" infra callback
all_repos "$DEV_REPOS" dev callback
