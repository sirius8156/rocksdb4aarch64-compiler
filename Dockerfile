FROM centos:7.9.2009

RUN yum clean all
RUN yum makecache
RUN yum install deltarpm -y
RUN yum install python3 -y
RUN yum install vim -y
RUN yum install wget -y
RUN yum install epel-release -y
RUN yum install gcc-c++ -y
RUN yum install snappy snappy-devel -y
RUN yum install zlib zlib-devel -y
RUN yum install bzip2 bzip2-devel -y
RUN yum install lz4-devel -y
RUN yum install make libasan -y

WORKDIR /opt

COPY .bash_profile /opt/.bash_profile
ADD  cmake-3.11.2.tar.gz /opt
ADD  zstd-1.4.4.tar.gz /opt

# https://github.com/facebook/rocksdb/releases/tag/v6.20.3
COPY . /opt/rocksdb

# cmake 3.xx
RUN  cd /opt/cmake-3.11.2 cd && ./bootstrap --prefix=/usr/local/cmake && gmake -j8 && gmake install

# gflags support aarch64
RUN  rm -rf  /opt/rocksdb/gflags/config.sub
COPY config.sub  /opt/rocksdb/gflags/
RUN  source /opt/.bash_profile && cd /opt/rocksdb/gflags && ./configure --build=aarch64 && make -j8 && make install

WORKDIR /opt/rocksdb/build

# rocksdb static lib
#RUN  source /opt/.bash_profile && cd /opt/rocksdb/rocksdb && make static_lib -j8 && make install


