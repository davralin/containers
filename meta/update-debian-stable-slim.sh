#!/bin/bash
CURRENT_STABLE_SLIM=$(wget -q -O - "https://hub.docker.com/v2/namespaces/library/repositories/debian/tags?page_size=40" | grep -o '"name": *"[^"]*' | grep -o '[^"]*$' | grep stable | grep -v -e old -e unstable -e backports -e stable-slim | grep slim)

for i in $(grep -ri debian:stable- | cut -f1 -d':' | grep Dockerfile); do
    USED_STABLE_SLIM=$(grep debian:stable- $i | cut -f2 -d' '| sed 's/debian://g')
    sed 's/'$USED_STABLE_SLIM'/'$CURRENT_STABLE_SLIM'/g' -i $i
done
