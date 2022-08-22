FROM centos:7.9.2009

RUN yum clean all
RUN yum makecache
RUN yum install deltarpm -y
RUN yum install python3
RUN yum install wget -y
RUN yum install epel-release -y
RUN yum install -y \
  wget \
  snappy snappy-devel \
  zlib zlib-devel \
  bzip2 bzip2-devel \
  lz4-devel \
  libasan


WORKDIR /opt

# https://github.com/facebook/rocksdb/releases/tag/v6.20.3
COPY . /opt/rocksdb
#RUN sh /opt/rocksdb/build_tools/setup_centos7.sh
#RUN ./configure && make && make install