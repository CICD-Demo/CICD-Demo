#!/bin/bash

cd $(dirname $0)/..

. bin/utils
. environment

oc project default
DOCKER_EP=$(oc get svc docker-registry -o template --template='{{.spec.portalIP}}:{{(index .spec.ports 0).port}}')

callback() {
  [ -e $1/$2/build.sh ] || return

  docker pull $DOCKER_EP/$INTEGRATION/$2:latest
  docker tag -f $DOCKER_EP/$INTEGRATION/$2:latest $DOCKER_EP/$PROD/$2:latest
  docker push $DOCKER_EP/$PROD/$2:latest
}

all_repos "$MONSTER_REPOS" monster callback
