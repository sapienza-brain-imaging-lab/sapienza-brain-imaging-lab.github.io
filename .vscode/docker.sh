#!/bin/bash

if [ "$1" == "start" ] ;
then
    ./.vscode/docker.sh stop
    ./.vscode/docker.sh update
    (docker run --rm -itd --name bilsite-builder -v "$PWD:/site" -p 4000:4000 -p 35729:35729 jekyll-pages && docker logs -f bilsite-builder)

elif [ "$1" == "stop" ] ;
then
    ((docker ps | grep bilsite-builder >> /dev/null) && docker rm -f bilsite-builder) || echo "No build container running"

elif [ "$1" == "update" ] ;
then
    docker build -t jekyll-pages .

fi 