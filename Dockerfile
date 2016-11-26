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


## EOF
