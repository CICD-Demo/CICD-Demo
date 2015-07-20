#!/bin/bash

cd $(dirname $0)/..

. environment

for proj in $INTEGRATION $PROD $INFRA $DEMOUSER; do
  oc delete project $proj
done
