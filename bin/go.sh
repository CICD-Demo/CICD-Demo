#!/bin/bash

cd $(dirname $0)/..

. environment

bin/cache.sh

htpasswd -b /etc/openshift/openshift-passwd $DEMOUSER $DEMOPW

for proj in $INTEGRATION $DEMOUSER; do
  osadm new-project $proj --admin=$DEMOUSER
  osc project $proj

  for repo in $INTEGRATION_REPOS; do
    monster/$repo/deploy.sh
    [ -e monster/$repo/build.sh ] && monster/$repo/build.sh
  done

  # hack required in beta4
  osadm policy add-role-to-user cluster-admin $DEMOUSER
done

for proj in $PROD; do
  osadm new-project $proj --admin=$DEMOUSER
  osc project $proj

  for repo in $PROD_REPOS; do
    monster/$repo/deploy.sh
  done

  # hack required in beta4
  osadm policy add-role-to-user cluster-admin $DEMOUSER
done

for proj in $INFRA; do
  osadm new-project $proj --admin=$DEMOUSER
  osc project $proj

  for repo in $INFRA_REPOS; do
    infra/$repo/deploy.sh
  done
done
