#!/bin/bash

cd $(dirname $0)/..

. environment

[ -d cache ] || mkdir cache

for i in $IMAGES; do
	if [ -e cache/$i ]; then
		sudo docker load <cache/$i
	else
		mkdir -p cache/$(dirname $i)
		sudo docker pull $i
		sudo docker save $i >cache/$i
	fi
done
