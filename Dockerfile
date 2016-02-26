#
# RethinkDB Dockerfile
#
# https://github.com/dockerfile/rethinkdb
#

# Pull base image.
FROM cern/cc7-base

# Install RethinkDB.
RUN yum -y update
RUN yum install wget
RUN yum install git
RUN yum install sudo
RUN yum install make
RUN yum install gcc
RUN yum install gcc-c++
RUN yum install tar
RUN yum install curl
RUN yum install bzip2
RUN yum install python
RUN yum install python-devel
RUN yum install python-pip
RUN yum install python-lxml
RUN yum install libxslt-deve
RUN wget http://download.rethinkdb.com/centos/7/`uname -m`/rethinkdb.repo \
          -O /etc/yum.repos.d/rethinkdb.repo
RUN yum -y install rethinkdb


# Install python driver for rethinkdb
RUN pip install rethinkdb

# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["rethinkdb", "--bind", "all"]

# Expose ports.
#   - 8080: web UI
#   - 28015: process
#   - 29015: cluster
EXPOSE 8080
EXPOSE 28015
EXPOSE 29015
