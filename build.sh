#!/bin/bash
docker build -f Dockerfile -t vimosred .
#docker run --name vimosreduceonline -d -p 80:80 -p 8888:8888 --net=host vimosred
docker run --name   vimosreduce  -d  -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix   -it -p 80:80 -p 8888:8888 --net=host vimosred

