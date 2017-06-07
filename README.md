## VIMOS docker

This includes the Dockerfile for a image with Anaconda (or miniconda)(based on Python 2.7) and Scientific Linux 7.2. The original Dockerfile is from  [hwaf-docker](https://github.com/hwaf/hwaf-docker). It builds Scientific Linux from the Centos image. The build image can be downloaded from Docker Hub from [vimosdocker](https://hub.docker.com/r/manuelmarcano22/vimosdocker/).


More information on some docker images used at the LHC can be found at [LHCb](https://twiki.cern.ch/twiki/bin/view/LHCb/LHCbSoftOnDocker). 


By default it runs a Jupyter notebook in port 8888

### To build do:

The image can be build from the docker file. Just need to clone this repo and then do:

`docker build -t vimos:tag .`

where vimos is the name you want for the image with an arbitrary tag, e.g. v1. 

Can use the buid.sh file:

```bash
#!/bin/bash
docker build -f Dockerfile -t vimosred .
docker run --name vimosreduceonline -d -p 80:80 -p 8888:8888 --net=host vimosred
```

### From DockerHub

Alternatively it can be downloaded from DockerHub with the command:

`docker pull manuelmarcano22/vimosdocker`

The URL is [https://hub.docker.com/r/manuelmarcano22/vimosdocker/](https://hub.docker.com/r/manuelmarcano22/vimosdocker/)


### Run /bin/bash

To have a interactive bahs terminal can do:

`docker run -ti --entrypoint=/bin/bash -p 8888:8888 -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --name vimosnet manuelmarcano22/vimosdocker`

### To run

To run can use:

`docker run -ti -p 8888:8888 manuelmarcano22/vimosdocker`

Or as a daemon:

`docker run -d -p 8888:8888 manuelmarcano22/vimosdocker`

This will create a notebook server running in localhost:8888


## To do

- ~~[ ] Docker file to install [Pyraf](http://www.stsci.edu/institute/software_hardware/pyraf)~~

- [ ] Use docker volumes to manage data if needed. 

- [ ]  Decrease size by not using all the stsci packages and other dependencies. 

