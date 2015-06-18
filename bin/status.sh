#!/bin/bash

cd $(dirname $0)/..

. bin/utils
. environment

all_repos "$MONSTER_REPOS" monster git status
all_repos "$INFRA_REPOS" infra git status
all_repos "$DEV_REPOS" dev git status
all_repos . . git status
