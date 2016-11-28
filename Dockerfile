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
	   bzip2 sudo passwd bc csh vim libXScrnSaver evince


#RUN yum -y install libxslt-devel libXt-devel zip

##TO install Anaconda with Python 3.4
#RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
#    wget --quiet https://repo.continuum.io/archive/Anaconda3-4.2.0-Linux-x86_64.sh -O ~/anaconda.sh
#RUN /bin/bash ~/anaconda.sh -b -p /opt/conda && \
#    rm ~/anaconda.sh
#ENV PATH /opt/conda/bin:$PATH

##To install minicoda python 3.5
RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh  -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh
RUN /opt/conda/bin/conda  install -y -c astropy python-cpl=0.7.2
ENV PATH /opt/conda/bin:$PATH


RUN wget http://ds9.si.edu/download/linux64_5/ds9.linux64_5.7.4.tar.gz  && tar -zxvf ds9.linux64_5.7.4.tar.gz && rm ds9.linux64_5.7.4.tar.gz

RUN mv ds9 /usr/local/bin


##Add user called vimos with sudo privilegies and passwd docker
RUN echo 'docker' | passwd root --stdin
RUN useradd -ms /bin/bash vimos 
RUN usermod -aG wheel vimos
RUN echo 'docker' | passwd vimos --stdin
USER vimos
WORKDIR /home/vimos
ENV HOME /home/vimos
RUN echo '#!/bin/bash' > clonerepo.sh && chmod +x clonerepo.sh
RUN echo 'git clone https://github.com/manuelmarcano22/VIMOSReduced.git' >> clonerepo.sh



#To install ds9. For some reason other version dont work so do Centos 5 and install evince.
#There must be a better way

##Astroconda http://astroconda.readthedocs.io/en/latest/installation.html#obtain-anaconda
#conda create -y -n astroconda stsci
##With iraf
RUN /opt/conda/bin/conda config --add channels http://ssb.stsci.edu/astroconda
RUN /opt/conda/bin/conda create -y -n iraf27 python=2.7 iraf pyraf stsci



## EOF
