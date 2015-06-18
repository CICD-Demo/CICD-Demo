#!/bin/bash

cd $(dirname $0)/..

. environment

mkdir -p monster
pushd monster
for repo in $MONSTER_REPOS; do
  git clone $GITROOT/$repo
done
popd

mkdir -p infra
pushd infra
for repo in $INFRA_REPOS; do
  git clone $GITROOT/$repo
done
popd

if [ "$1" = "-a" ]; then
  mkdir -p dev
  pushd dev
  for repo in $DEV_REPOS; do
    git clone $GITROOT/$repo
  done
  popd
fi
