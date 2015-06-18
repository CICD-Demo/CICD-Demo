#!/bin/bash

cd $(dirname $0)/..

. environment

for proj in $INTEGRATION $PROD $INFRA $DEMOUSER; do
  osc project $proj
  osc delete all --all
done

osc project default
