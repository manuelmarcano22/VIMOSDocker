#!/bin/bash
docker build -f Dockerfile -t vimosred .
#docker run --name vimosreduceonline -it -p 80:80 -p 8080:8080 --net=host vimosred
