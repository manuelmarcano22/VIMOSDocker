FROM centos
MAINTAINER binet@cern.ch

##Basic image

RUN rpm -ivh --force http://ftp.scientificlinux.org/linux/scientific/7x/x86_64/os/Packages/sl-release-7.2-2.sl7.x86_64.rpm

ADD dot-bashrc                    /root/.bashrc
ADD dot-bash_profile              /root/.bash_profile

##Add repos. Example from slc 6
#ADD yum-repos-d-slc6-os.repo      /etc/yum.repos.d/slc6-os.repo
#ADD yum-repos-d-slc6-updates.repo /etc/yum.repos.d/slc6-updates.repo
#ADD yum-repos-d-slc6-extras.repo  /etc/yum.repos.d/slc6-extras.repo

RUN yum -y erase centos-release
RUN yum -y erase all
RUN yum -y distro-sync

ENV HOME /root

##Extra

RUN yum -y update
RUN yum -y install \
           file which


RUN yum -y install binutils-devel

RUN yum -y install gcc gcc-c++ gcc-gfortran git make patch python-devel

RUN yum -y install \
           bzip2-devel \
           libXpm-devel libXft-devel libXext-devel \
           libxml2-devel \
           libuuid-devel \
           ncurses-devel \
           texinfo \
           wget \
	   bzip2	
##TO install Anaconda with Python 3.4
#RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
#    wget --quiet https://repo.continuum.io/archive/Anaconda3-4.2.0-Linux-x86_64.sh -O ~/anaconda.sh

#RUN /bin/bash ~/anaconda.sh -b -p /opt/conda && \
#    rm ~/anaconda.sh
#ENV PATH /opt/conda/bin:$PATH
## EOF


