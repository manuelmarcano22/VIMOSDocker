## VIMOS docker

This includes the Dockerfile for a image with Anaconda (or miniconda)(based on Python 3.5) of Scientific Linux 7.2. The original Dockerfile is from  [hwaf-docker](https://github.com/hwaf/hwaf-docker). It builds Scientif Linux from the Centos image. The build image can be downloaded from Docker Hub from [vimosdocker](https://hub.docker.com/r/manuelmarcano22/vimosdocker/).


More information on some docker images used at the LHC can be found at [LHCb](https://twiki.cern.ch/twiki/bin/view/LHCb/LHCbSoftOnDocker). 


### To build do:

The image can be build from the docker file. Just need to clone this repo and then do:

`docker build -t vimos:tag .`

where vimos is the name you want for the image with an arbitrary tag, e.g. v1. 

### From DockerHub

Alternatively it can be downloaded from DockerHub with the command:

`docker pull manuelmarcano22/vimosdocker`

The URL is [https://hub.docker.com/r/manuelmarcano22/vimosdocker/](https://hub.docker.com/r/manuelmarcano22/vimosdocker/)


### To run

To run can use:

`docker run -ti manuelmarcano22/vimosdocker`

This will create an interactive session. 


## To do

- [ ] Docker file to install [Pyraf](http://www.stsci.edu/institute/software_hardware/pyraf)

