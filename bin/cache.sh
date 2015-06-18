#!/bin/bash

cd $(dirname $0)/..

. environment

[ -d cache ] || mkdir cache

for i in $IMAGES; do
	if [ -e cache/$i ]; then
		docker load <cache/$i
	else
		mkdir -p cache/$(dirname $i)
		docker pull $i
		docker save $i >cache/$i
	fi
done
