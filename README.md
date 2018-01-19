## VIMOS docker

This includes the Dockerfile for a image with Anaconda (or miniconda)(based on Python 2.7) and Scientific Linux 7.2. The original Dockerfile is from  [hwaf-docker](https://github.com/hwaf/hwaf-docker). It builds Scientific Linux from the Centos image. The build image can be downloaded from Docker Hub from [vimosdocker](https://hub.docker.com/r/manuelmarcano22/vimosdocker/).


More information on some docker images used at the LHC can be found at [LHCb](https://twiki.cern.ch/twiki/bin/view/LHCb/LHCbSoftOnDocker). 


By default it runs a Jupyter notebook in port 8888

### To build do:

The image can be build from the docker file. Just need to clone this repo and then do:

`docker build -f Dockerfile -t vimosred .`
`docker run --name   vimosreduce  -it  -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix   -it -p 80:80 -p 8888:8888 --net=host vimosred`

<!--`docker build -t vimos:tag .`

where vimos is the name you want for the image with an arbitrary tag, e.g. v1. -->

Can use the buid.sh file:

### From DockerHub

Alternatively it can be downloaded from DockerHub with the command:

`docker pull manuelmarcano22/vimosdocker`

The URL is [https://hub.docker.com/r/manuelmarcano22/vimosdocker/](https://hub.docker.com/r/manuelmarcano22/vimosdocker/)


### Run /bin/bash

To have a interactive bash terminal can do:

`docker run -ti --entrypoint=/bin/bash -p 8888:8888 -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --name vimosnet manuelmarcano22/vimosdocker`

This will overide the entrypoint specified in the Dockerfile

### Starting the container

After exiting the container, you can restart the Jupyter server by doing:

`docker start -i vimosreduce`


## To do

- ~~[ ] Docker file to install [Pyraf](http://www.stsci.edu/institute/software_hardware/pyraf)~~

- [ ] Use docker volumes to manage data if needed. 

- [ ]  Decrease size by not using all the stsci packages and other dependencies. 

