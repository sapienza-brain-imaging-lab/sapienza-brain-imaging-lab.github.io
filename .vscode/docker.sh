#!/bin/bash

if [ "$1" == "start" ] ;
then
    ./.vscode/docker.sh stop
    (docker run --rm -itd --name bilsite-builder -v "$PWD:/srv/jekyll" -v jekyll-cache:/usr/gem -p 4000:4000 jekyll/jekyll jekyll serve --incremental && docker logs -f bilsite-builder)

elif [ "$1" == "stop" ] ;
then
    ((docker ps | grep bilsite-builder >> /dev/null) && docker rm -f bilsite-builder) || echo "No build container running"

elif [ "$1" == "update" ] ;
then
    docker run --rm -it -v "$PWD:/srv/jekyll" -v jekyll-cache:/usr/gem jekyll/jekyll bundle update github-pages

fi